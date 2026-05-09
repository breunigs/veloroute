use rustler::{Term, NifResult};
use crate::TimedCoord;

/// Round-half-away-from-zero without calling the C `round()` function.
/// Avoids the libm call overhead that shows up in profiling.
#[inline(always)]
pub fn round_to_i64(x: f64) -> i64 {
    if x >= 0.0 { (x + 0.5) as i64 } else { (x - 0.5) as i64 }
}

pub fn decode_timed_vec(encoded: &str, precision: u32) -> Result<Vec<TimedCoord>, String> {
    let factor = 10_f64.powi(precision as i32);
    let bytes = encoded.as_bytes();
    let mut pos = 0;
    let mut lat: i64 = 0;
    let mut lon: i64 = 0;
    let mut time: i64 = 0;
    let mut coords = Vec::with_capacity(encoded.len() / 12);

    while pos < bytes.len() {
        let d_lat = decode_value(bytes, &mut pos).ok_or("incomplete polyline")?;
        let d_lon = decode_value(bytes, &mut pos).ok_or("incomplete polyline")?;
        let d_time = decode_value(bytes, &mut pos).ok_or("incomplete polyline")?;
        lat += d_lat;
        lon += d_lon;
        time += d_time;
        coords.push(TimedCoord {
            lat: lat as f64 / factor,
            lon: lon as f64 / factor,
            time_offset_ms: time,
        });
    }

    Ok(coords)
}

pub fn polyline_encode_coords(coords: impl Iterator<Item = (f64, f64)>, precision: u32) -> String {
    let factor = 10_f64.powi(precision as i32);
    let mut output: Vec<u8> = Vec::new();
    let mut prev_lat: i64 = 0;
    let mut prev_lon: i64 = 0;

    for (lon, lat) in coords {
        let lat_e = round_to_i64(lat * factor);
        let lon_e = round_to_i64(lon * factor);
        encode_value(lat_e - prev_lat, &mut output);
        encode_value(lon_e - prev_lon, &mut output);
        prev_lat = lat_e;
        prev_lon = lon_e;
    }
    // Safety: encode_value only pushes bytes in 63..=126, which are valid ASCII.
    unsafe { String::from_utf8_unchecked(output) }
}

fn encode_value(value: i64, output: &mut Vec<u8>) {
    let mut v = if value < 0 { !(value << 1) } else { value << 1 } as u64;
    while v >= 0x20 {
        output.push(((v & 0x1f) as u8) + 63 + 0x20);
        v >>= 5;
    }
    output.push((v as u8) + 63);
}

pub fn polyline_encode_timed(
    coords: impl Iterator<Item = (f64, f64, i64)>,
    precision: u32,
) -> String {
    let factor = 10_f64.powi(precision as i32);
    let mut output: Vec<u8> = Vec::new();
    let mut prev_lat: i64 = 0;
    let mut prev_lon: i64 = 0;
    let mut prev_time: i64 = 0;

    for (lat, lon, time_offset_ms) in coords {
        let lat_e = round_to_i64(lat * factor);
        let lon_e = round_to_i64(lon * factor);
        encode_value(lat_e - prev_lat, &mut output);
        encode_value(lon_e - prev_lon, &mut output);
        encode_value(time_offset_ms - prev_time, &mut output);
        prev_lat = lat_e;
        prev_lon = lon_e;
        prev_time = time_offset_ms;
    }
    unsafe { String::from_utf8_unchecked(output) }
}

#[rustler::nif]
fn nif_polyline_encode_timed(coords_term: Term, precision: u32) -> NifResult<String> {
    let coords = coords_term.decode::<Vec<TimedCoord>>()?;
    let iter = coords.iter().map(|c| (c.lat, c.lon, c.time_offset_ms));
    Ok(polyline_encode_timed(iter, precision))
}

fn decode_value(input: &[u8], pos: &mut usize) -> Option<i64> {
    let mut result: u64 = 0;
    let mut shift = 0;
    loop {
        if *pos >= input.len() {
            return None;
        }
        let byte = input[*pos] - 63;
        *pos += 1;
        result |= ((byte & 0x1f) as u64) << shift;
        shift += 5;
        if byte < 0x20 {
            break;
        }
    }
    if result & 1 != 0 {
        Some(!(result >> 1) as i64)
    } else {
        Some((result >> 1) as i64)
    }
}

#[rustler::nif]
fn nif_polyline_decode_timed(encoded: String, precision: u32) -> NifResult<Vec<TimedCoord>> {
    let factor = 10_f64.powi(precision as i32);
    let bytes = encoded.as_bytes();
    let mut pos = 0;
    let mut lat: i64 = 0;
    let mut lon: i64 = 0;
    let mut time: i64 = 0;
    let mut coords = Vec::new();

    while pos < bytes.len() {
        let d_lat = decode_value(bytes, &mut pos)
            .ok_or(rustler::Error::Term(Box::new("incomplete polyline")))?;
        let d_lon = decode_value(bytes, &mut pos)
            .ok_or(rustler::Error::Term(Box::new("incomplete polyline")))?;
        let d_time = decode_value(bytes, &mut pos)
            .ok_or(rustler::Error::Term(Box::new("incomplete polyline")))?;
        lat += d_lat;
        lon += d_lon;
        time += d_time;
        coords.push(TimedCoord {
            lat: lat as f64 / factor,
            lon: lon as f64 / factor,
            time_offset_ms: time,
        });
    }

    Ok(coords)
}

/// Combines equi_time_interval + polyline_encode in a single NIF call,
/// avoiding intermediate Elixir term allocation.
#[rustler::nif]
fn nif_equi_time_interval_encode(
    coords_term: Term,
    interval_in_ms: f64,
    precision: u32,
) -> NifResult<String> {
    let coords = coords_term.decode::<Vec<TimedCoord>>()?;
    let n = coords.len();
    if n < 2 {
        return Ok(String::new());
    }

    let iter = EquiTimeIter::new(&coords, interval_in_ms);

    Ok(polyline_encode_coords(iter, precision))
}

pub struct EquiTimeIter<'a> {
    coords: &'a [crate::TimedCoord],
    offset: f64,
    seg: usize,
    done: bool,
    interval: f64,
    // Cached per-segment values so the hot path avoids re-indexing coords
    // and recomputing the duration on every output point.
    seg_prev_time: f64,
    seg_dt_inv: f64,   // 1 / segment_duration — multiply instead of divide
    seg_prev_lon: f64,
    seg_prev_lat: f64,
    seg_d_lon: f64,
    seg_d_lat: f64,
}

impl<'a> EquiTimeIter<'a> {
    pub fn new(coords: &'a [crate::TimedCoord], interval: f64) -> Self {
        let mut iter = EquiTimeIter {
            coords,
            offset: 0.0,
            seg: 0,
            done: coords.len() < 2,
            interval,
            seg_prev_time: 0.0,
            seg_dt_inv: 0.0,
            seg_prev_lon: 0.0,
            seg_prev_lat: 0.0,
            seg_d_lon: 0.0,
            seg_d_lat: 0.0,
        };
        if !iter.done {
            iter.load_seg();
        }
        iter
    }

    fn load_seg(&mut self) {
        loop {
            if self.seg + 1 >= self.coords.len() {
                self.done = true;
                return;
            }
            let prev = &self.coords[self.seg];
            let next = &self.coords[self.seg + 1];
            let dt = (next.time_offset_ms - prev.time_offset_ms) as f64;
            if dt == 0.0 {
                self.seg += 1;
                continue;
            }
            self.seg_prev_time = prev.time_offset_ms as f64;
            self.seg_dt_inv = 1.0 / dt;
            self.seg_prev_lon = prev.lon;
            self.seg_prev_lat = prev.lat;
            self.seg_d_lon = next.lon - prev.lon;
            self.seg_d_lat = next.lat - prev.lat;
            return;
        }
    }
}

impl<'a> Iterator for EquiTimeIter<'a> {
    type Item = (f64, f64);

    fn next(&mut self) -> Option<(f64, f64)> {
        if self.done {
            return None;
        }

        loop {
            let t = (self.offset - self.seg_prev_time) * self.seg_dt_inv;

            if t > 1.0 {
                self.seg += 1;
                self.load_seg();
                if self.done { return None; }
            } else if t >= 0.0 {
                let lon = self.seg_prev_lon + self.seg_d_lon * t;
                let lat = self.seg_prev_lat + self.seg_d_lat * t;
                self.offset += self.interval;
                return Some((lon, lat));
            } else {
                self.done = true;
                return None;
            }
        }
    }
}
