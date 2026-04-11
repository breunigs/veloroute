use rustler::NifResult;
use crate::{CoordWithBearing, ClosestPointResult};
use crate::polyline;
use crate::smoother;
use crate::cheap_ruler::cheap_bearing;

fn decode(encoded: &str, precision: u32) -> NifResult<Vec<crate::TimedCoord>> {
    polyline::decode_timed_vec(encoded, precision)
        .map_err(|e| rustler::Error::Term(Box::new(e)))
}

#[rustler::nif]
fn nif_timed_line_distance(encoded: String, precision: u32, kx: f64, ky: f64) -> NifResult<f64> {
    let coords = decode(&encoded, precision)?;
    if coords.len() < 2 {
        return Ok(0.0);
    }
    let mut total = 0.0;
    for i in 1..coords.len() {
        let dx = (coords[i].lon - coords[i - 1].lon) * kx;
        let dy = (coords[i].lat - coords[i - 1].lat) * ky;
        total += (dx * dx + dy * dy).sqrt();
    }
    Ok(total)
}

#[rustler::nif]
fn nif_timed_start_end_coords(
    encoded: String,
    precision: u32,
    kx: f64,
    ky: f64,
) -> NifResult<(CoordWithBearing, CoordWithBearing)> {
    let coords = decode(&encoded, precision)?;
    if coords.len() < 2 {
        return Err(rustler::Error::BadArg);
    }

    let n = coords.len();
    let start = CoordWithBearing {
        lat: coords[0].lat,
        lon: coords[0].lon,
        time_offset_ms: coords[0].time_offset_ms,
        bearing: cheap_bearing(
            coords[0].lon, coords[0].lat,
            coords[1].lon, coords[1].lat,
            kx, ky,
        ),
    };

    let end_coord = CoordWithBearing {
        lat: coords[n - 1].lat,
        lon: coords[n - 1].lon,
        time_offset_ms: coords[n - 1].time_offset_ms,
        bearing: cheap_bearing(
            coords[n - 2].lon, coords[n - 2].lat,
            coords[n - 1].lon, coords[n - 1].lat,
            kx, ky,
        ),
    };

    Ok((start, end_coord))
}

#[rustler::nif]
fn nif_timed_coord_at_time(
    encoded: String,
    precision: u32,
    time: i64,
    length_ms: i64,
    kx: f64,
    ky: f64,
) -> NifResult<CoordWithBearing> {
    let coords = decode(&encoded, precision)?;
    if coords.len() < 2 {
        return Err(rustler::Error::BadArg);
    }

    let n = coords.len();

    // time <= 0: return start
    if time <= 0 {
        return Ok(CoordWithBearing {
            lat: coords[0].lat,
            lon: coords[0].lon,
            time_offset_ms: coords[0].time_offset_ms,
            bearing: cheap_bearing(
                coords[0].lon, coords[0].lat,
                coords[1].lon, coords[1].lat,
                kx, ky,
            ),
        });
    }

    // time >= length_ms: return end
    if time >= length_ms {
        return Ok(CoordWithBearing {
            lat: coords[n - 1].lat,
            lon: coords[n - 1].lon,
            time_offset_ms: coords[n - 1].time_offset_ms,
            bearing: cheap_bearing(
                coords[n - 2].lon, coords[n - 2].lat,
                coords[n - 1].lon, coords[n - 1].lat,
                kx, ky,
            ),
        });
    }

    // Find the segment containing this time and interpolate
    for i in 0..n - 1 {
        let a = &coords[i];
        let b = &coords[i + 1];
        if time >= a.time_offset_ms && time <= b.time_offset_ms {
            let dt = b.time_offset_ms - a.time_offset_ms;
            let t = if dt == 0 { 0.0 } else { (time - a.time_offset_ms) as f64 / dt as f64 };
            return Ok(CoordWithBearing {
                lat: a.lat + (b.lat - a.lat) * t,
                lon: a.lon + (b.lon - a.lon) * t,
                time_offset_ms: time,
                bearing: cheap_bearing(a.lon, a.lat, b.lon, b.lat, kx, ky),
            });
        }
    }

    // Fallback: return start (mirrors Elixir's || start_from(rendered, nil))
    Ok(CoordWithBearing {
        lat: coords[0].lat,
        lon: coords[0].lon,
        time_offset_ms: coords[0].time_offset_ms,
        bearing: cheap_bearing(
            coords[0].lon, coords[0].lat,
            coords[1].lon, coords[1].lat,
            kx, ky,
        ),
    })
}

#[rustler::nif]
fn nif_timed_closest_point(
    encoded: String,
    precision: u32,
    point_lon: f64,
    point_lat: f64,
    epsilon: f64,
    kx: f64,
    ky: f64,
) -> NifResult<ClosestPointResult> {
    let coords = decode(&encoded, precision)?;
    if coords.len() < 2 {
        return Err(rustler::Error::BadArg);
    }

    let eps2 = epsilon * epsilon;

    let dx = (coords[0].lon - point_lon) * kx;
    let dy = (coords[0].lat - point_lat) * ky;

    let mut best_dist_sq = dx * dx + dy * dy;
    let mut best_before: usize = 0;
    let mut best_after: usize = 0;
    let mut best_t: f64 = 0.0;

    for i in 0..coords.len() - 1 {
        let prev = &coords[i];
        let next = &coords[i + 1];

        let x = prev.lon;
        let y = prev.lat;
        let seg_dx = (next.lon - x) * kx;
        let seg_dy = (next.lat - y) * ky;

        let (px, py, t) = if seg_dx == 0.0 && seg_dy == 0.0 {
            (x, y, 0.0)
        } else {
            let t = ((point_lon - x) * kx * seg_dx + (point_lat - y) * ky * seg_dy)
                / (seg_dx * seg_dx + seg_dy * seg_dy);
            if t > 1.0 {
                (next.lon, next.lat, 1.0)
            } else if t > 0.0 {
                (x + seg_dx / kx * t, y + seg_dy / ky * t, t)
            } else {
                (x, y, 0.0)
            }
        };

        let dx = (point_lon - px) * kx;
        let dy = (point_lat - py) * ky;
        let dist_sq = dx * dx + dy * dy;

        if dist_sq < best_dist_sq {
            best_dist_sq = dist_sq;
            best_before = i;
            best_after = i + 1;
            best_t = t;
        } else if best_dist_sq <= eps2 && dist_sq > eps2 {
            break;
        }
    }

    let before = &coords[best_before];
    let after = &coords[best_after];

    let lat = before.lat + (after.lat - before.lat) * best_t;
    let lon = before.lon + (after.lon - before.lon) * best_t;
    let time = before.time_offset_ms as f64
        + (after.time_offset_ms - before.time_offset_ms) as f64 * best_t;

    Ok(ClosestPointResult {
        dist: best_dist_sq.sqrt(),
        lat,
        lon,
        time_offset_ms: time.round() as i64,
        bearing: cheap_bearing(before.lon, before.lat, after.lon, after.lat, kx, ky),
    })
}

#[rustler::nif]
fn nif_timed_smoother_polyline(
    encoded: String,
    precision: u32,
    cut_iterations: u32,
    cut_dist: f64,
    avg_range_m: f64,
    max_overlap_m: f64,
    min_heading_deg: f64,
    interval_ms: f64,
    output_precision: u32,
    kx: f64,
    ky: f64,
) -> NifResult<String> {
    let coords = decode(&encoded, precision)?;
    if coords.len() < 2 {
        return Ok(String::new());
    }

    let smoothed = smoother::cut_corners_vec(coords, cut_iterations, cut_dist);
    let smoothed = smoother::average_in_distance_vec(&smoothed, avg_range_m, kx, ky);
    let smoothed = smoother::remove_overlaps_vec(smoothed, max_overlap_m, min_heading_deg, kx, ky);

    let iter = polyline::EquiTimeIter::new(&smoothed, interval_ms);
    Ok(polyline::polyline_encode_coords(iter, output_precision))
}
