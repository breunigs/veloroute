use std::collections::HashMap;
use std::fs;
use std::io::{BufWriter, Write};

use flate2::read::GzDecoder;
use flate2::write::GzEncoder;
use flate2::Compression;
use rayon::prelude::*;
use rustler::NifResult;
use serde::{Deserialize, Serialize};

// ── Data structures ────────────────────────────────────────────────────

type Pt = [f64; 2];

#[derive(Deserialize, Serialize)]
struct GeoJson {
    #[serde(rename = "type")]
    typ: String,
    features: Vec<Feature>,
}

#[derive(Deserialize, Serialize)]
struct Feature {
    #[serde(rename = "type")]
    typ: String,
    #[serde(default, skip_serializing_if = "Option::is_none")]
    id: Option<serde_json::Value>,
    geometry: Geometry,
    properties: Properties,
}

#[derive(Deserialize, Serialize)]
struct Geometry {
    #[serde(rename = "type")]
    typ: String,
    coordinates: Vec<Vec<Vec<f64>>>,
}

#[derive(Deserialize, Serialize)]
struct Properties {
    knotennummer: String,
    dwg_name: String,
    polizeidatum: String,
    lsbgdatum: String,
    obreite: String,
}

struct GroupInfo {
    feature_indices: Vec<usize>,
    aabb: AABB,
    timestamp: Option<i64>,
}

#[derive(Clone, Copy)]
struct AABB {
    min_x: f64,
    min_y: f64,
    max_x: f64,
    max_y: f64,
}

// ── AABB ───────────────────────────────────────────────────────────────

impl AABB {
    fn new() -> Self {
        AABB {
            min_x: f64::INFINITY,
            min_y: f64::INFINITY,
            max_x: f64::NEG_INFINITY,
            max_y: f64::NEG_INFINITY,
        }
    }

    fn expand_point(&mut self, x: f64, y: f64) {
        self.min_x = self.min_x.min(x);
        self.min_y = self.min_y.min(y);
        self.max_x = self.max_x.max(x);
        self.max_y = self.max_y.max(y);
    }

    fn expand(&mut self, other: &AABB) {
        self.min_x = self.min_x.min(other.min_x);
        self.min_y = self.min_y.min(other.min_y);
        self.max_x = self.max_x.max(other.max_x);
        self.max_y = self.max_y.max(other.max_y);
    }

    fn overlaps(&self, other: &AABB) -> bool {
        self.min_x <= other.max_x
            && self.max_x >= other.min_x
            && self.min_y <= other.max_y
            && self.max_y >= other.min_y
    }
}

fn compute_aabb(coordinates: &[Vec<Vec<f64>>]) -> AABB {
    let mut aabb = AABB::new();
    for line in coordinates {
        for pt in line {
            if pt.len() >= 2 {
                aabb.expand_point(pt[0], pt[1]);
            }
        }
    }
    aabb
}

// ── Convex hull (Andrew's monotone chain, returns CCW) ─────────────────

fn convex_hull(points: &mut Vec<Pt>) -> Vec<Pt> {
    points.sort_by(|a, b| a[0].partial_cmp(&b[0]).unwrap().then(a[1].partial_cmp(&b[1]).unwrap()));
    points.dedup();

    if points.len() <= 2 {
        return points.clone();
    }

    let cross = |o: &Pt, a: &Pt, b: &Pt| -> f64 {
        (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0])
    };

    let mut lower = Vec::new();
    for p in points.iter() {
        while lower.len() >= 2 && cross(&lower[lower.len() - 2], &lower[lower.len() - 1], p) <= 0.0
        {
            lower.pop();
        }
        lower.push(*p);
    }

    let mut upper = Vec::new();
    for p in points.iter().rev() {
        while upper.len() >= 2 && cross(&upper[upper.len() - 2], &upper[upper.len() - 1], p) <= 0.0
        {
            upper.pop();
        }
        upper.push(*p);
    }

    lower.pop();
    upper.pop();
    lower.extend(upper);
    lower
}

fn ensure_ccw(poly: &mut Vec<Pt>) {
    if poly.len() < 3 {
        return;
    }
    let mut area = 0.0;
    for i in 0..poly.len() {
        let j = (i + 1) % poly.len();
        area += poly[i][0] * poly[j][1] - poly[j][0] * poly[i][1];
    }
    if area < 0.0 {
        poly.reverse();
    }
}

// ── SAT overlap test for convex polygons ───────────────────────────────

fn convex_overlap(a: &[Pt], b: &[Pt]) -> bool {
    for poly in [a, b] {
        for i in 0..poly.len() {
            let j = (i + 1) % poly.len();
            let axis = [-(poly[j][1] - poly[i][1]), poly[j][0] - poly[i][0]];

            let (min_a, max_a) = project(a, axis);
            let (min_b, max_b) = project(b, axis);
            if max_a < min_b || max_b < min_a {
                return false;
            }
        }
    }
    true
}

fn project(poly: &[Pt], axis: Pt) -> (f64, f64) {
    let mut min = f64::INFINITY;
    let mut max = f64::NEG_INFINITY;
    for pt in poly {
        let d = pt[0] * axis[0] + pt[1] * axis[1];
        min = min.min(d);
        max = max.max(d);
    }
    (min, max)
}

// ── Sutherland-Hodgman polygon intersection ────────────────────────────

fn intersect_convex(subject: &[Pt], clip: &[Pt]) -> Vec<Pt> {
    let mut output: Vec<Pt> = subject.to_vec();

    for i in 0..clip.len() {
        if output.is_empty() {
            break;
        }
        let a = clip[i];
        let b = clip[(i + 1) % clip.len()];
        let input = output;
        output = Vec::new();

        for j in 0..input.len() {
            let curr = input[j];
            let prev = input[(j + input.len() - 1) % input.len()];
            let curr_in = left_of(a, b, curr);
            let prev_in = left_of(a, b, prev);

            if curr_in {
                if !prev_in {
                    output.push(seg_intersect(prev, curr, a, b));
                }
                output.push(curr);
            } else if prev_in {
                output.push(seg_intersect(prev, curr, a, b));
            }
        }
    }

    output
}

fn left_of(a: Pt, b: Pt, p: Pt) -> bool {
    (b[0] - a[0]) * (p[1] - a[1]) - (b[1] - a[1]) * (p[0] - a[0]) >= 0.0
}

fn seg_intersect(p1: Pt, p2: Pt, p3: Pt, p4: Pt) -> Pt {
    let d = (p1[0] - p2[0]) * (p3[1] - p4[1]) - (p1[1] - p2[1]) * (p3[0] - p4[0]);
    if d.abs() < 1e-15 {
        return p1;
    }
    let t = ((p1[0] - p3[0]) * (p3[1] - p4[1]) - (p1[1] - p3[1]) * (p3[0] - p4[0])) / d;
    [p1[0] + t * (p2[0] - p1[0]), p1[1] + t * (p2[1] - p1[1])]
}

// ── Half-plane clip (keep left side of a→b) ────────────────────────────

fn clip_by_line(polygon: &[Pt], a: Pt, b: Pt) -> Vec<Pt> {
    let mut output = Vec::new();
    for j in 0..polygon.len() {
        let curr = polygon[j];
        let prev = polygon[(j + polygon.len() - 1) % polygon.len()];
        let curr_in = left_of(a, b, curr);
        let prev_in = left_of(a, b, prev);

        if curr_in {
            if !prev_in {
                output.push(seg_intersect(prev, curr, a, b));
            }
            output.push(curr);
        } else if prev_in {
            output.push(seg_intersect(prev, curr, a, b));
        }
    }
    output
}

// ── Shrink convex polygon inward by buffer (meters) ────────────────────

fn shrink_polygon(poly: &[Pt], buffer_m: f64) -> Vec<Pt> {
    if poly.len() < 3 {
        return vec![];
    }
    // Hamburg approximate meters per degree
    let kx: f64 = 66_200.0;
    let ky: f64 = 111_320.0;

    let mut result = poly.to_vec();
    for i in 0..poly.len() {
        let j = (i + 1) % poly.len();
        let dx = (poly[j][0] - poly[i][0]) * kx;
        let dy = (poly[j][1] - poly[i][1]) * ky;
        let len = (dx * dx + dy * dy).sqrt();
        if len < 1e-10 {
            continue;
        }
        // Inward normal for CCW polygon: (-dy, dx) / len
        let nx_deg = -dy / len * buffer_m / kx;
        let ny_deg = dx / len * buffer_m / ky;
        let p1 = [poly[i][0] + nx_deg, poly[i][1] + ny_deg];
        let p2 = [poly[j][0] + nx_deg, poly[j][1] + ny_deg];
        result = clip_by_line(&result, p1, p2);
        if result.len() < 3 {
            return vec![];
        }
    }
    result
}

// ── Point-in-polygon (ray casting) ─────────────────────────────────────

fn point_in_poly(pt: Pt, poly: &[Pt]) -> bool {
    let (x, y) = (pt[0], pt[1]);
    let mut inside = false;
    let n = poly.len();
    let mut j = n - 1;
    for i in 0..n {
        let (xi, yi) = (poly[i][0], poly[i][1]);
        let (xj, yj) = (poly[j][0], poly[j][1]);
        if (yi > y) != (yj > y) && x < (xj - xi) * (y - yi) / (yj - yi) + xi {
            inside = !inside;
        }
        j = i;
    }
    inside
}

fn centroid(poly: &[Pt]) -> Pt {
    let n = poly.len() as f64;
    let (mut cx, mut cy) = (0.0, 0.0);
    for pt in poly {
        cx += pt[0];
        cy += pt[1];
    }
    [cx / n, cy / n]
}

// ── Date parsing ───────────────────────────────────────────────────────

fn parse_date(s: &str) -> Option<i64> {
    let s = s.trim();
    if s.is_empty() {
        return None;
    }
    // "dd.MM.yyyy HH:mm:ss"
    let mut parts = s.splitn(2, ' ');
    let date_str = parts.next()?;
    let time_str = parts.next().unwrap_or("00:00:00");

    let d: Vec<i64> = date_str.split('.').filter_map(|x| x.parse().ok()).collect();
    let t: Vec<i64> = time_str.split(':').filter_map(|x| x.parse().ok()).collect();
    if d.len() != 3 {
        return None;
    }

    // Comparable ordering value (not epoch, but monotonically increasing)
    Some(
        d[2] * 10_000_000_000
            + d[1] * 100_000_000
            + d[0] * 1_000_000
            + t.first().copied().unwrap_or(0) * 10_000
            + t.get(1).copied().unwrap_or(0) * 100
            + t.get(2).copied().unwrap_or(0),
    )
}

fn best_timestamp(polizeidatum: &str, lsbgdatum: &str) -> Option<i64> {
    match (parse_date(polizeidatum), parse_date(lsbgdatum)) {
        (Some(a), Some(b)) => Some(a.max(b)),
        (a, b) => a.or(b),
    }
}

// ── Main cleanup ───────────────────────────────────────────────────────

fn cleanup(input_path: &str, output_path: &str) -> Result<String, Box<dyn std::error::Error>> {
    // 1. Read + decompress + parse in one pass
    eprintln!("Reading and parsing {}...", input_path);
    let file = fs::File::open(input_path)?;
    let decoder = GzDecoder::new(std::io::BufReader::new(file));
    let reader = std::io::BufReader::with_capacity(1 << 20, decoder);
    let mut geojson: GeoJson = serde_json::from_reader(reader)?;

    let num_features = geojson.features.len();
    eprintln!("{} features loaded", num_features);

    // 3. Group by knotennummer, compute AABBs
    let mut groups: HashMap<String, GroupInfo> = HashMap::new();
    for (idx, feature) in geojson.features.iter().enumerate() {
        let key = feature.properties.knotennummer.clone();
        let aabb = compute_aabb(&feature.geometry.coordinates);
        let ts = best_timestamp(
            &feature.properties.polizeidatum,
            &feature.properties.lsbgdatum,
        );

        let group = groups.entry(key).or_insert_with(|| GroupInfo {
            feature_indices: Vec::new(),
            aabb: AABB::new(),
            timestamp: None,
        });
        group.feature_indices.push(idx);
        group.aabb.expand(&aabb);
        if let Some(t) = ts {
            group.timestamp = Some(group.timestamp.map_or(t, |prev| prev.max(t)));
        }
    }

    let num_groups = groups.len();

    // 4. Find AABB-overlapping pairs
    let keys: Vec<String> = groups.keys().cloned().collect();
    let mut aabb_pairs: Vec<(String, String)> = Vec::new();
    for i in 0..keys.len() {
        for j in (i + 1)..keys.len() {
            if groups[&keys[i]].aabb.overlaps(&groups[&keys[j]].aabb) {
                aabb_pairs.push((keys[i].clone(), keys[j].clone()));
            }
        }
    }
    eprintln!(
        "{} groups, {} AABB-overlapping pairs",
        num_groups,
        aabb_pairs.len()
    );

    // 5. Compute convex hulls only for groups involved in AABB overlaps
    let overlapping_keys: std::collections::HashSet<&String> = aabb_pairs
        .iter()
        .flat_map(|(a, b)| [a, b])
        .collect();

    let mut hull_cache: HashMap<String, Vec<Pt>> = HashMap::new();
    for key in overlapping_keys {
        let group = &groups[key];
        let mut points: Vec<Pt> = Vec::new();
        for &idx in &group.feature_indices {
            for line in &geojson.features[idx].geometry.coordinates {
                for pt in line {
                    if pt.len() >= 2 {
                        points.push([pt[0], pt[1]]);
                    }
                }
            }
        }
        if points.len() > 50_000 {
            let step = points.len() / 50_000;
            points = points.into_iter().step_by(step.max(1)).collect();
        }
        let mut hull = convex_hull(&mut points);
        ensure_ccw(&mut hull);
        hull_cache.insert(key.clone(), hull);
    }

    // 6-8. Check actual hull overlaps and resolve
    let mut clip_areas: HashMap<String, Vec<Vec<Pt>>> = HashMap::new();
    let mut overlap_count = 0;

    for (key_a, key_b) in &aabb_pairs {
        let hull_a = &hull_cache[key_a];
        let hull_b = &hull_cache[key_b];

        if hull_a.len() < 3 || hull_b.len() < 3 || !convex_overlap(hull_a, hull_b) {
            continue;
        }

        let intersection = intersect_convex(hull_a, hull_b);
        let intersection = shrink_polygon(&intersection, 10.0);
        if intersection.len() < 3 {
            continue;
        }

        overlap_count += 1;
        let ts_a = groups[key_a].timestamp;
        let ts_b = groups[key_b].timestamp;

        if let (Some(a), Some(b)) = (ts_a, ts_b) {
            if a != b {
                let loser = if a < b { key_a } else { key_b };
                clip_areas
                    .entry(loser.clone())
                    .or_default()
                    .push(intersection);
                eprintln!("  overlap {} <-> {}: {} wins", key_a, key_b, if a < b { key_b } else { key_a });
                continue;
            }
        }

        // No usable timestamps or same — split at midpoint
        let cent_a = centroid(hull_a);
        let cent_b = centroid(hull_b);
        let mid = [
            (cent_a[0] + cent_b[0]) / 2.0,
            (cent_a[1] + cent_b[1]) / 2.0,
        ];
        let perp = [-(cent_b[1] - cent_a[1]), cent_b[0] - cent_a[0]];

        let line_p1 = [mid[0] - perp[0], mid[1] - perp[1]];
        let line_p2 = [mid[0] + perp[0], mid[1] + perp[1]];

        let a_is_left = left_of(line_p1, line_p2, cent_a);

        let clip_for_a = if a_is_left {
            clip_by_line(&intersection, line_p2, line_p1)
        } else {
            clip_by_line(&intersection, line_p1, line_p2)
        };
        let clip_for_b = if a_is_left {
            clip_by_line(&intersection, line_p1, line_p2)
        } else {
            clip_by_line(&intersection, line_p2, line_p1)
        };

        if clip_for_a.len() >= 3 {
            clip_areas
                .entry(key_a.clone())
                .or_default()
                .push(clip_for_a);
        }
        if clip_for_b.len() >= 3 {
            clip_areas
                .entry(key_b.clone())
                .or_default()
                .push(clip_for_b);
        }
        eprintln!("  overlap {} <-> {}: split at midpoint", key_a, key_b);
    }

    let clipped_groups = clip_areas.len();
    eprintln!(
        "{} actual hull overlaps, {} groups to clip",
        overlap_count, clipped_groups
    );

    // 9. Clip: drop segments whose midpoint falls inside any clip area
    // Build a lookup from feature index → clip areas for parallel processing
    let mut feature_clip: HashMap<usize, &Vec<Vec<Pt>>> = HashMap::new();
    for (key, areas) in &clip_areas {
        for &idx in &groups[key].feature_indices {
            feature_clip.insert(idx, areas);
        }
    }

    geojson.features.par_iter_mut().enumerate().for_each(|(idx, feature)| {
        let areas = match feature_clip.get(&idx) {
            Some(a) => *a,
            None => return,
        };

        let old_coords = std::mem::take(&mut feature.geometry.coordinates);
        let mut new_coords: Vec<Vec<Vec<f64>>> = Vec::new();

        for line in &old_coords {
            let mut current_line: Vec<Vec<f64>> = Vec::new();

            for i in 0..line.len().saturating_sub(1) {
                if line[i].len() < 2 || line[i + 1].len() < 2 {
                    continue;
                }
                let mid = [
                    (line[i][0] + line[i + 1][0]) / 2.0,
                    (line[i][1] + line[i + 1][1]) / 2.0,
                ];
                let in_clip = areas.iter().any(|area| point_in_poly(mid, area));

                if !in_clip {
                    if current_line.is_empty() {
                        current_line.push(line[i].clone());
                    }
                    current_line.push(line[i + 1].clone());
                } else if current_line.len() >= 2 {
                    new_coords.push(std::mem::take(&mut current_line));
                } else {
                    current_line.clear();
                }
            }

            if current_line.len() >= 2 {
                new_coords.push(current_line);
            }
        }

        feature.geometry.coordinates = new_coords;
    });

    // 10. Round coordinates to 7 decimal places (~1cm) and remove empty features
    let precision = 1e7;
    geojson.features.par_iter_mut().for_each(|f| {
        for line in &mut f.geometry.coordinates {
            for pt in line.iter_mut() {
                for v in pt.iter_mut() {
                    *v = (*v * precision).round() / precision;
                }
            }
        }
    });
    geojson
        .features
        .retain(|f| !f.geometry.coordinates.is_empty());
    let removed = num_features - geojson.features.len();

    eprintln!("Writing {}...", output_path);

    // Serialize features in parallel, then stream-write
    let serialized: Vec<Vec<u8>> = geojson
        .features
        .par_iter()
        .map(|f| serde_json::to_vec(f).unwrap())
        .collect();

    let output_file = fs::File::create(output_path)?;
    let mut encoder = GzEncoder::new(BufWriter::new(output_file), Compression::fast());
    encoder.write_all(b"{\"type\":\"FeatureCollection\",\"features\":[\n")?;
    for (i, buf) in serialized.iter().enumerate() {
        if i > 0 {
            encoder.write_all(b",\n")?;
        }
        encoder.write_all(buf)?;
    }
    encoder.write_all(b"\n]}")?;
    encoder.finish()?;

    Ok(format!(
        "{} features in {} groups, {} AABB overlaps, {} hull overlaps, {} groups clipped, {} empty features removed",
        num_features, num_groups, aabb_pairs.len(), overlap_count, clipped_groups, removed
    ))
}

#[rustler::nif(schedule = "DirtyCpu")]
pub fn nif_cleanup_kreuzungsskizzen(
    input_path: String,
    output_path: String,
) -> NifResult<String> {
    cleanup(&input_path, &output_path)
        .map_err(|e| rustler::Error::RaiseTerm(Box::new(e.to_string())))
}
