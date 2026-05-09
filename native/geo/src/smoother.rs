use crate::TimedCoord;
use rayon::prelude::*;

pub fn interpolate_timed_coord(a: &TimedCoord, b: &TimedCoord, t: f64) -> TimedCoord {
    let time = a.time_offset_ms as f64 + (b.time_offset_ms - a.time_offset_ms) as f64 * t;
    TimedCoord {
        lat: a.lat + (b.lat - a.lat) * t,
        lon: a.lon + (b.lon - a.lon) * t,
        time_offset_ms: (time + 0.5) as i64,
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

fn smooth_point(coords: &[TimedCoord], i: usize, range_sq: f64, range_in_meters: f64, kx: f64, ky: f64) -> TimedCoord {
    let center = &coords[i];
    let mut sum_lat = 0.0_f64;
    let mut sum_lon = 0.0_f64;
    let mut sum_weight = 0.0_f64;

    for j in (0..=i).rev() {
        let c = &coords[j];
        let dx = (c.lon - center.lon) * kx;
        let dy = (c.lat - center.lat) * ky;
        let dist_sq = dx * dx + dy * dy;
        if dist_sq > range_sq { break; }
        let weight = range_in_meters - dist_sq.sqrt();
        sum_lat += c.lat * weight;
        sum_lon += c.lon * weight;
        sum_weight += weight;
    }

    for j in (i + 1)..coords.len() {
        let c = &coords[j];
        let dx = (c.lon - center.lon) * kx;
        let dy = (c.lat - center.lat) * ky;
        let dist_sq = dx * dx + dy * dy;
        if dist_sq > range_sq { break; }
        let weight = range_in_meters - dist_sq.sqrt();
        sum_lat += c.lat * weight;
        sum_lon += c.lon * weight;
        sum_weight += weight;
    }

    TimedCoord { lat: sum_lat / sum_weight, lon: sum_lon / sum_weight, time_offset_ms: center.time_offset_ms }
}

pub fn average_in_distance_vec(coords: &[TimedCoord], range_in_meters: f64, kx: f64, ky: f64) -> Vec<TimedCoord> {
    let n = coords.len();
    let range_sq = range_in_meters * range_in_meters;

    (0..n).into_par_iter().map(|i| {
        smooth_point(coords, i, range_sq, range_in_meters, kx, ky)
    }).collect()
}

pub fn remove_overlaps_vec(mut coords: Vec<TimedCoord>, max_overlap_m: f64, min_heading_deg: f64, kx: f64, ky: f64) -> Vec<TimedCoord> {
    let n = coords.len();
    if n < 3 {
        return coords;
    }

    // Two-pointer in-place filter. Invariant: write <= read, so reads never
    // see values we've already overwritten. TimedCoord is Copy so we move
    // values out before any write could clobber them.
    let max_dist_sq = max_overlap_m * max_overlap_m;
    // Replace atan2-based bearing with dot-product reversal check.
    // angle >= min_heading_deg  ⟺  cos(angle) <= cos(min_heading_deg).
    // cos² is used to avoid sqrt: dot² >= cos²(min) * |prev|² * |next|²,
    // with the additional guard dot < 0 (vectors pointing backward).
    let cos_min_sq = min_heading_deg.to_radians().cos().powi(2);

    let mut write = 2usize; // coords[0] and coords[1] are always kept
    let mut prev_dx = (coords[1].lon - coords[0].lon) * kx;
    let mut prev_dy = (coords[1].lat - coords[0].lat) * ky;
    let mut prev_len_sq = prev_dx * prev_dx + prev_dy * prev_dy;

    for read in 2..n {
        let c3 = coords[read]; // copy before any write
        let c1 = coords[write - 2];
        let c2 = coords[write - 1];

        let dx = (c1.lon - c3.lon) * kx;
        let dy = (c1.lat - c3.lat) * ky;
        let dist_sq = dx * dx + dy * dy;

        let next_dx = (c3.lon - c2.lon) * kx;
        let next_dy = (c3.lat - c2.lat) * ky;
        let next_len_sq = next_dx * next_dx + next_dy * next_dy;

        let dot = prev_dx * next_dx + prev_dy * next_dy;
        let is_reversal = dot < 0.0
            && prev_len_sq > 0.0
            && dot * dot >= cos_min_sq * prev_len_sq * next_len_sq;

        if dist_sq > max_dist_sq || !is_reversal {
            prev_dx = next_dx;
            prev_dy = next_dy;
            prev_len_sq = next_len_sq;
            coords[write] = c3;
            write += 1;
        }
    }

    coords.truncate(write);
    coords
}

#[cfg(test)]
mod tests {
    use super::*;

    fn tc(lat: f64, lon: f64, time_offset_ms: i64) -> TimedCoord {
        TimedCoord { lat, lon, time_offset_ms }
    }

    // CheapRuler kx/ky for ref_lat = 53.551 (test environment)
    fn test_kx_ky() -> (f64, f64) {
        let ref_lat: f64 = 53.551;
        let cos1 = (ref_lat * std::f64::consts::PI / 180.0).cos();
        let cos2 = 2.0 * cos1 * cos1 - 1.0;
        let cos3 = 2.0 * cos1 * cos2 - cos1;
        let cos4 = 2.0 * cos1 * cos3 - cos2;
        let cos5 = 2.0 * cos1 * cos4 - cos3;
        let kx = 1000.0 * (111.41513 * cos1 - 0.09455 * cos3 + 0.00012 * cos5);
        let ky = 1000.0 * (111.13209 - 0.56605 * cos2 + 0.0012 * cos4);
        (kx, ky)
    }

    #[test]
    fn cut_corners_two_points() {
        let coords = vec![
            tc(1.0, 1.0, 0),
            tc(2.0, 2.0, 100),
        ];
        let result = cut_corners_vec(coords, 1, 0.25);
        assert_eq!(result.len(), 4);
        assert_eq!(result[0], tc(1.0, 1.0, 0));
        assert_eq!(result[1], tc(1.25, 1.25, 25));
        assert_eq!(result[2], tc(1.75, 1.75, 75));
        assert_eq!(result[3], tc(2.0, 2.0, 100));
    }

    #[test]
    fn average_in_distance_identity() {
        let (kx, ky) = test_kx_ky();
        let coords = vec![
            tc(1.0, 1.0, 0),
            tc(2.0, 2.0, 0),
        ];
        let result = average_in_distance_vec(&coords, 15.0, kx, ky);
        assert_eq!(result.len(), 2);
        assert_eq!(result[0].lat, 1.0);
        assert_eq!(result[0].lon, 1.0);
        assert_eq!(result[1].lat, 2.0);
        assert_eq!(result[1].lon, 2.0);
    }

    #[test]
    fn average_in_distance_smoothing() {
        let (kx, ky) = test_kx_ky();
        let coords = vec![
            tc(53.550957, 9.993817, 0), tc(53.550923, 9.993876, 1),
            tc(53.550890, 9.993928, 2), tc(53.550856, 9.993975, 3),
            tc(53.550826, 9.994023, 4), tc(53.550804, 9.994050, 5),
            tc(53.550794, 9.994055, 6), tc(53.550792, 9.994056, 7),
            tc(53.550791, 9.994055, 8), tc(53.550787, 9.994058, 9),
            tc(53.550777, 9.994084, 10), tc(53.550755, 9.994120, 11),
            tc(53.550728, 9.994151, 12), tc(53.550713, 9.994180, 13),
            tc(53.550700, 9.994205, 14),
        ];
        let result = average_in_distance_vec(&coords, 15.0, kx, ky);
        assert_eq!(result.len(), 15);

        let expected = [
            (53.55093540218586, 9.993853659506811),
            (53.550913319343586, 9.993889060855963),
            (53.55087641183799, 9.993944100086669),
            (53.55083124900453, 9.994007224526495),
            (53.55080706000847, 9.994040496573183),
            (53.55079534011067, 9.99405624638512),
            (53.550791158262086, 9.994061873356419),
            (53.55079028159536, 9.994063080640776),
            (53.55079010151522, 9.994063321860297),
            (53.55078816325091, 9.994066085984363),
            (53.550780844634836, 9.994077002907744),
            (53.55076735405408, 9.994097127443395),
            (53.55075232901659, 9.994119545995215),
            (53.55073993441644, 9.99413870892748),
            (53.55072684539607, 9.994159412578323),
        ];

        for (i, (exp_lat, exp_lon)) in expected.iter().enumerate() {
            assert!((result[i].lat - exp_lat).abs() < 1e-10,
                "lat[{}]: {} != {}", i, result[i].lat, exp_lat);
            assert!((result[i].lon - exp_lon).abs() < 1e-10,
                "lon[{}]: {} != {}", i, result[i].lon, exp_lon);
        }
    }

    #[test]
    fn remove_overlaps_basic() {
        let (kx, ky) = test_kx_ky();
        let coords = vec![
            tc(53.5525911, 10.0125893, 20),
            tc(53.5525899, 10.0124563, 30),
            tc(53.5526008, 10.0125561, 40),
            tc(53.5525944, 10.0124142, 50),
        ];
        let result = remove_overlaps_vec(coords, 5.0, 170.0, kx, ky);
        assert_eq!(result.len(), 3);
        assert_eq!(result[0], tc(53.5525911, 10.0125893, 20));
        assert_eq!(result[1], tc(53.5525899, 10.0124563, 30));
        assert_eq!(result[2], tc(53.5525944, 10.0124142, 50));
    }

    #[test]
    fn equi_time_interval_basic() {
        let coords = vec![
            tc(1.0, 1.0, 0),
            tc(2.0, 2.0, 10),
        ];
        let result: Vec<(f64, f64)> = crate::polyline::EquiTimeIter::new(&coords, 5.0).collect();
        assert_eq!(result.len(), 3);
        // EquiTimeIter yields (lon, lat)
        assert_eq!(result[0], (1.0, 1.0));
        assert_eq!(result[1], (1.5, 1.5));
        assert_eq!(result[2], (2.0, 2.0));
    }
}
