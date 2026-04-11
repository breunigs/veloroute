use rustler::{Env, Term, NifResult, Encoder};
use crate::{atoms, Coord, TimedCoord};
use crate::cheap_ruler::{cheap_bearing, cheap_bearing_diff};

pub fn interpolate_timed_coord(a: &TimedCoord, b: &TimedCoord, t: f64) -> TimedCoord {
    let time = a.time_offset_ms as f64 + (b.time_offset_ms - a.time_offset_ms) as f64 * t;
    TimedCoord {
        lat: a.lat + (b.lat - a.lat) * t,
        lon: a.lon + (b.lon - a.lon) * t,
        time_offset_ms: time.round() as i64,
    }
}

pub fn cut_corners_vec(coords: Vec<TimedCoord>, iterations: u32, cut_corner_dist: f64) -> Vec<TimedCoord> {
    if coords.len() < 2 || iterations == 0 {
        return coords;
    }
    let mut current = coords;
    for _ in 0..iterations {
        let n = current.len();
        let mut next_iter = Vec::with_capacity(n * 2);
        next_iter.push(current[0]);
        for j in 0..n - 1 {
            next_iter.push(interpolate_timed_coord(&current[j], &current[j + 1], cut_corner_dist));
            next_iter.push(interpolate_timed_coord(&current[j], &current[j + 1], 1.0 - cut_corner_dist));
        }
        next_iter.push(current[n - 1]);
        current = next_iter;
    }
    current
}

pub fn average_in_distance_vec(coords: &[TimedCoord], range_in_meters: f64, kx: f64, ky: f64) -> Vec<TimedCoord> {
    let n = coords.len();
    let range_sq = range_in_meters * range_in_meters;
    let mut result = Vec::with_capacity(n);

    for i in 0..n {
        let center = &coords[i];
        let mut sum_lat = 0.0_f64;
        let mut sum_lon = 0.0_f64;
        let mut sum_weight = 0.0_f64;

        for j in (0..=i).rev() {
            let c = &coords[j];
            let dx = (c.lon - center.lon) * kx;
            let dy = (c.lat - center.lat) * ky;
            let dist_sq = dx * dx + dy * dy;
            if dist_sq > range_sq {
                break;
            }
            let weight = range_in_meters - dist_sq.sqrt();
            sum_lat += c.lat * weight;
            sum_lon += c.lon * weight;
            sum_weight += weight;
        }

        for j in (i + 1)..n {
            let c = &coords[j];
            let dx = (c.lon - center.lon) * kx;
            let dy = (c.lat - center.lat) * ky;
            let dist_sq = dx * dx + dy * dy;
            if dist_sq > range_sq {
                break;
            }
            let weight = range_in_meters - dist_sq.sqrt();
            sum_lat += c.lat * weight;
            sum_lon += c.lon * weight;
            sum_weight += weight;
        }

        result.push(TimedCoord {
            lat: sum_lat / sum_weight,
            lon: sum_lon / sum_weight,
            time_offset_ms: center.time_offset_ms,
        });
    }

    result
}

pub fn remove_overlaps_vec(coords: Vec<TimedCoord>, max_overlap_m: f64, min_heading_deg: f64, kx: f64, ky: f64) -> Vec<TimedCoord> {
    let n = coords.len();
    if n < 3 {
        return coords;
    }

    let max_dist_sq = max_overlap_m * max_overlap_m;
    let mut kept: Vec<usize> = vec![0, 1];
    let mut prev_bearing = cheap_bearing(
        coords[0].lon, coords[0].lat,
        coords[1].lon, coords[1].lat,
        kx, ky,
    );

    for i in 2..n {
        let c3 = &coords[i];
        let ki1 = kept[kept.len() - 2];
        let ki2 = kept[kept.len() - 1];
        let c1 = &coords[ki1];
        let c2 = &coords[ki2];

        let dx = (c1.lon - c3.lon) * kx;
        let dy = (c1.lat - c3.lat) * ky;
        let dist_sq = dx * dx + dy * dy;

        let next_bearing = cheap_bearing(c2.lon, c2.lat, c3.lon, c3.lat, kx, ky);
        let diff = cheap_bearing_diff(prev_bearing, next_bearing);

        if dist_sq <= max_dist_sq && diff >= min_heading_deg {
            // skip overlap
        } else {
            prev_bearing = next_bearing;
            kept.push(i);
        }
    }

    kept.into_iter().map(|i| coords[i]).collect()
}

#[rustler::nif]
fn nif_average_in_distance<'a>(
    env: Env<'a>,
    coords_term: Term<'a>,
    range_in_meters: f64,
    kx: f64,
    ky: f64,
) -> NifResult<Vec<Term<'a>>> {
    let coords = coords_term.decode::<Vec<Coord>>()?;
    let original_maps: Vec<Term<'a>> = coords_term.decode()?;
    let n = coords.len();
    let range_sq = range_in_meters * range_in_meters;

    let mut result = Vec::with_capacity(n);

    for i in 0..n {
        let center = &coords[i];
        let mut sum_lat = 0.0_f64;
        let mut sum_lon = 0.0_f64;
        let mut sum_weight = 0.0_f64;

        for j in (0..=i).rev() {
            let c = &coords[j];
            let dx = (c.lon - center.lon) * kx;
            let dy = (c.lat - center.lat) * ky;
            let dist_sq = dx * dx + dy * dy;
            if dist_sq > range_sq {
                break;
            }
            let weight = range_in_meters - dist_sq.sqrt();
            sum_lat += c.lat * weight;
            sum_lon += c.lon * weight;
            sum_weight += weight;
        }

        for j in (i + 1)..n {
            let c = &coords[j];
            let dx = (c.lon - center.lon) * kx;
            let dy = (c.lat - center.lat) * ky;
            let dist_sq = dx * dx + dy * dy;
            if dist_sq > range_sq {
                break;
            }
            let weight = range_in_meters - dist_sq.sqrt();
            sum_lat += c.lat * weight;
            sum_lon += c.lon * weight;
            sum_weight += weight;
        }

        let smoothed_lat = sum_lat / sum_weight;
        let smoothed_lon = sum_lon / sum_weight;

        let mut map = original_maps[i];
        map = map.map_put(atoms::lat().encode(env), smoothed_lat.encode(env))?;
        map = map.map_put(atoms::lon().encode(env), smoothed_lon.encode(env))?;
        result.push(map);
    }

    Ok(result)
}

fn interpolate_timed(a: &TimedCoord, b: &TimedCoord, t: f64) -> TimedCoord {
    interpolate_timed_coord(a, b, t)
}

#[rustler::nif]
fn nif_equi_time_interval<'a>(
    env: Env<'a>,
    coords_term: Term<'a>,
    interval_in_ms: f64,
) -> NifResult<Vec<Term<'a>>> {
    let coords = coords_term.decode::<Vec<TimedCoord>>()?;
    let n = coords.len();
    if n < 2 {
        return Ok(Vec::new());
    }

    let mut result: Vec<Term<'a>> = Vec::new();
    let mut offset = 0.0_f64;
    let mut i = 0;

    while i + 1 < n {
        let prev = &coords[i];
        let next = &coords[i + 1];

        if prev.time_offset_ms == next.time_offset_ms {
            i += 1;
            continue;
        }

        let t = (offset - prev.time_offset_ms as f64) / (next.time_offset_ms - prev.time_offset_ms) as f64;

        if t > 1.0 {
            i += 1;
        } else if t >= 0.0 {
            let interp = interpolate_timed(prev, next, t);
            result.push(interp.encode(env));
            offset += interval_in_ms;
        } else {
            break;
        }
    }

    Ok(result)
}

#[rustler::nif]
fn nif_cut_corners<'a>(
    env: Env<'a>,
    coords_term: Term<'a>,
    iterations: u32,
    cut_corner_dist: f64,
) -> NifResult<Vec<Term<'a>>> {
    let initial = coords_term.decode::<Vec<TimedCoord>>()?;
    if initial.len() < 2 || iterations == 0 {
        let original: Vec<Term<'a>> = coords_term.decode()?;
        return Ok(original);
    }

    let mut current = initial;

    for _ in 0..iterations {
        let n = current.len();
        let mut next_iter = Vec::with_capacity(n * 2);
        next_iter.push(TimedCoord {
            lat: current[0].lat,
            lon: current[0].lon,
            time_offset_ms: current[0].time_offset_ms,
        });

        for j in 0..n - 1 {
            let prev = &current[j];
            let next = &current[j + 1];
            next_iter.push(interpolate_timed(prev, next, cut_corner_dist));
            next_iter.push(interpolate_timed(prev, next, 1.0 - cut_corner_dist));
        }

        let last = &current[n - 1];
        next_iter.push(TimedCoord {
            lat: last.lat,
            lon: last.lon,
            time_offset_ms: last.time_offset_ms,
        });

        current = next_iter;
    }

    let mut result = Vec::with_capacity(current.len());
    for c in &current {
        result.push(c.encode(env));
    }
    Ok(result)
}

#[rustler::nif]
fn nif_remove_overlaps<'a>(
    coords_term: Term<'a>,
    max_overlap_length_m: f64,
    min_heading_change_deg: f64,
    kx: f64,
    ky: f64,
) -> NifResult<Vec<Term<'a>>> {
    let coords = coords_term.decode::<Vec<Coord>>()?;
    let original_maps: Vec<Term<'a>> = coords_term.decode()?;
    let n = coords.len();
    if n < 3 {
        return Ok(original_maps);
    }

    let max_dist_sq = max_overlap_length_m * max_overlap_length_m;

    // kept[i] = index into coords/original_maps
    let mut kept: Vec<usize> = vec![0, 1];
    let mut prev_bearing = cheap_bearing(
        coords[0].lon, coords[0].lat,
        coords[1].lon, coords[1].lat,
        kx, ky,
    );

    for i in 2..n {
        let c3 = &coords[i];

        // c1 is two back in kept, c2 is one back
        let ki1 = kept[kept.len() - 2];
        let ki2 = kept[kept.len() - 1];
        let c1 = &coords[ki1];
        let c2 = &coords[ki2];

        let dx = (c1.lon - c3.lon) * kx;
        let dy = (c1.lat - c3.lat) * ky;
        let dist_sq = dx * dx + dy * dy;

        let next_bearing = cheap_bearing(c2.lon, c2.lat, c3.lon, c3.lat, kx, ky);
        let diff = cheap_bearing_diff(prev_bearing, next_bearing);

        let nearby = dist_sq <= max_dist_sq;
        let u_turn = diff >= min_heading_change_deg;

        if nearby && u_turn {
            // skip c3 (the overlap point), keep prev_bearing unchanged
        } else {
            prev_bearing = next_bearing;
            kept.push(i);
        }
    }

    Ok(kept.into_iter().map(|i| original_maps[i]).collect())
}
