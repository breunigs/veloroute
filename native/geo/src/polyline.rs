use geo_types::{Coord, LineString};
use rustler::{Term, NifResult};
use crate::TimedCoord;

pub fn decode_timed_vec(encoded: &str, precision: u32) -> Result<Vec<TimedCoord>, String> {
    let factor = 10_f64.powi(precision as i32);
    let bytes = encoded.as_bytes();
    let mut pos = 0;
    let mut lat: i64 = 0;
    let mut lon: i64 = 0;
    let mut time: i64 = 0;
    let mut coords = Vec::new();

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
    let line: LineString<f64> = coords
        .map(|(lon, lat)| Coord { x: lon, y: lat })
        .collect();
    polyline::encode_coordinates(line, precision).expect("polyline encode failed")
}

fn encode_value(value: i64, output: &mut String) {
    let mut v = if value < 0 { !(value << 1) } else { value << 1 } as u64;
    while v >= 0x20 {
        output.push(char::from(((v & 0x1f) as u8) + 63 + 0x20));
        v >>= 5;
    }
    output.push(char::from((v as u8) + 63));
}

pub fn polyline_encode_timed(
    coords: impl Iterator<Item = (f64, f64, i64)>,
    precision: u32,
) -> String {
    let factor = 10_f64.powi(precision as i32);
    let mut output = String::new();
    let mut prev_lat: i64 = 0;
    let mut prev_lon: i64 = 0;
    let mut prev_time: i64 = 0;

    for (lat, lon, time_offset_ms) in coords {
        let lat_e = (lat * factor).round() as i64;
        let lon_e = (lon * factor).round() as i64;
        encode_value(lat_e - prev_lat, &mut output);
        encode_value(lon_e - prev_lon, &mut output);
        encode_value(time_offset_ms - prev_time, &mut output);
        prev_lat = lat_e;
        prev_lon = lon_e;
        prev_time = time_offset_ms;
    }
    output
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

    let iter = EquiTimeIter {
        coords: &coords,
        offset: 0.0,
        seg: 0,
        done: false,
        interval: interval_in_ms,
    };

    Ok(polyline_encode_coords(iter, precision))
}

pub struct EquiTimeIter<'a> {
    coords: &'a [crate::TimedCoord],
    offset: f64,
    seg: usize,
    done: bool,
    interval: f64,
}

impl<'a> EquiTimeIter<'a> {
    pub fn new(coords: &'a [crate::TimedCoord], interval: f64) -> Self {
        EquiTimeIter {
            coords,
            offset: 0.0,
            seg: 0,
            done: false,
            interval,
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
            if self.seg + 1 >= self.coords.len() {
                self.done = true;
                return None;
            }

            let prev = &self.coords[self.seg];
            let next = &self.coords[self.seg + 1];

            if prev.time_offset_ms == next.time_offset_ms {
                self.seg += 1;
                continue;
            }

            let t = (self.offset - prev.time_offset_ms as f64)
                / (next.time_offset_ms - prev.time_offset_ms) as f64;

            if t > 1.0 {
                self.seg += 1;
            } else if t >= 0.0 {
                let lon = prev.lon + (next.lon - prev.lon) * t;
                let lat = prev.lat + (next.lat - prev.lat) * t;
                self.offset += self.interval;
                return Some((lon, lat));
            } else {
                self.done = true;
                return None;
            }
        }
    }
}
