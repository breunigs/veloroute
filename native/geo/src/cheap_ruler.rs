use rustler::{Term, NifResult};
use crate::Coord;

pub fn cheap_bearing(lon1: f64, lat1: f64, lon2: f64, lat2: f64, kx: f64, ky: f64) -> f64 {
    let dx = (lon2 - lon1) * kx;
    let dy = (lat2 - lat1) * ky;
    if dx == 0.0 && dy == 0.0 {
        0.0
    } else {
        let bear = dx.atan2(dy).to_degrees();
        if bear < 0.0 { bear + 360.0 } else { bear }
    }
}

pub fn cheap_bearing_diff(b1: f64, b2: f64) -> f64 {
    let d = b2 - b1;
    let d = if d < -180.0 { d + 360.0 } else if d > 180.0 { d - 360.0 } else { d };
    d.abs()
}

#[rustler::nif]
fn nif_bbox(coords_term: Term) -> NifResult<(f64, f64, f64, f64)> {
    let mut iter = coords_term.decode::<rustler::ListIterator>()?;
    let first: Coord = iter.next().ok_or(rustler::Error::BadArg)?.decode()?;
    let mut min_lon = first.lon;
    let mut min_lat = first.lat;
    let mut max_lon = first.lon;
    let mut max_lat = first.lat;
    for term in iter {
        let c: Coord = term.decode()?;
        if c.lon < min_lon { min_lon = c.lon; }
        if c.lat < min_lat { min_lat = c.lat; }
        if c.lon > max_lon { max_lon = c.lon; }
        if c.lat > max_lat { max_lat = c.lat; }
    }
    Ok((min_lon, min_lat, max_lon, max_lat))
}

#[rustler::nif]
fn nif_line_distance(coords_term: Term, kx: f64, ky: f64) -> NifResult<f64> {
    let mut iter = coords_term.decode::<rustler::ListIterator>()?;
    let mut prev: Coord = iter.next().ok_or(rustler::Error::BadArg)?.decode()?;
    let mut total = 0.0;
    for term in iter {
        let cur: Coord = term.decode()?;
        let dx = (cur.lon - prev.lon) * kx;
        let dy = (cur.lat - prev.lat) * ky;
        total += (dx * dx + dy * dy).sqrt();
        prev = cur;
    }
    Ok(total)
}

/// Returns {dist, before_idx, after_idx, t} so Elixir can do protocol-based interpolation.
#[rustler::nif]
fn nif_closest_point_on_line(
    line_term: Term,
    point_lon: f64,
    point_lat: f64,
    epsilon: f64,
    kx: f64,
    ky: f64,
) -> NifResult<(f64, usize, usize, f64)> {
    let mut iter = line_term.decode::<rustler::ListIterator>()?;
    let head: Coord = iter.next().ok_or(rustler::Error::BadArg)?.decode()?;

    let eps2 = epsilon * epsilon;

    let dx = (head.lon - point_lon) * kx;
    let dy = (head.lat - point_lat) * ky;
    let init_dist_sq = dx * dx + dy * dy;

    let mut best_dist_sq = init_dist_sq;
    let mut best_before: usize = 0;
    let mut best_after: usize = 0;
    let mut best_t: f64 = 0.0;

    let mut prev = head;
    for (i, term) in iter.enumerate() {
        let next: Coord = term.decode()?;
        let i = i + 1;

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
            best_before = i - 1;
            best_after = i;
            best_t = t;
        } else if best_dist_sq <= eps2 && dist_sq > eps2 {
            break;
        }

        prev = next;
    }

    Ok((best_dist_sq.sqrt(), best_before, best_after, best_t))
}

#[derive(PartialEq)]
enum Orientation {
    Clockwise,
    Counter,
    Colinear,
}

fn orient(
    coord_lon: f64, coord_lat: f64,
    prev_lon: f64, prev_lat: f64,
    next_lon: f64, next_lat: f64,
) -> Orientation {
    let area = (next_lat - prev_lat) * (coord_lon - prev_lon)
        - (coord_lat - prev_lat) * (next_lon - prev_lon);
    if area > 0.0 {
        Orientation::Clockwise
    } else if area < 0.0 {
        Orientation::Counter
    } else {
        Orientation::Colinear
    }
}

#[rustler::nif]
fn nif_inside_polygon_euclid(
    point_lon: f64,
    point_lat: f64,
    polygon_term: Term,
) -> NifResult<bool> {
    let polygon = polygon_term.decode::<Vec<Coord>>()?;
    if polygon.is_empty() {
        return Ok(false);
    }

    let mut min_idx = 0;
    for i in 1..polygon.len() {
        if polygon[i].lon < polygon[min_idx].lon {
            min_idx = i;
        }
    }
    let outside_lon = polygon[min_idx].lon - 0.001;
    let outside_lat = polygon[min_idx].lat;

    let mut intersections = 0;
    for i in 0..polygon.len() - 1 {
        let prev = &polygon[i];
        let next = &polygon[i + 1];

        let o1 = orient(point_lon, point_lat, outside_lon, outside_lat, prev.lon, prev.lat);
        let o2 = orient(point_lon, point_lat, outside_lon, outside_lat, next.lon, next.lat);
        let o3 = orient(prev.lon, prev.lat, next.lon, next.lat, point_lon, point_lat);
        let o4 = orient(prev.lon, prev.lat, next.lon, next.lat, outside_lon, outside_lat);

        if o1 != o2 && o3 != o4 {
            intersections += 1;
        }
    }

    Ok(intersections % 2 == 1)
}

/// Returns a list of %{lon, lat} maps. The first element corresponds to
/// hd(polyline) — the Elixir wrapper replaces it with the original map to
/// preserve extra keys. Duplicate consecutive points are silently dropped.
#[rustler::nif]
fn nif_max_segment_length(
    coords_term: Term,
    max_dist: f64,
    kx: f64,
    ky: f64,
) -> NifResult<Vec<Coord>> {
    let coords = coords_term.decode::<Vec<Coord>>()?;
    if coords.is_empty() {
        return Ok(vec![]);
    }

    let mut result = Vec::new();
    result.push(Coord { lon: coords[0].lon, lat: coords[0].lat });

    for i in 0..coords.len() - 1 {
        let a = &coords[i];
        let b = &coords[i + 1];

        if a.lon == b.lon && a.lat == b.lat {
            continue;
        }

        let dx = (a.lon - b.lon) * kx;
        let dy = (a.lat - b.lat) * ky;
        let dist = (dx * dx + dy * dy).sqrt();
        let pieces = (dist / max_dist).ceil() as usize;

        for n in 1..=pieces {
            let t = n as f64 / pieces as f64;
            let lon = a.lon + (b.lon - a.lon) * t;
            let lat = a.lat + (b.lat - a.lat) * t;
            result.push(Coord { lon, lat });
        }
    }

    Ok(result)
}
