use std::collections::{HashMap, HashSet};
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

// Hamburg approximate meters per degree
const KX: f64 = 66_200.0;
const KY: f64 = 111_320.0;

// Grid cell size ~5m in degrees
const CELL_X: f64 = 5.0 / KX;
const CELL_Y: f64 = 5.0 / KY;

// Thresholds
const MATCH_DIST_M: f64 = 3.0;
const ANGLE_THRESH_RAD: f64 = 15.0 * std::f64::consts::PI / 180.0;

// DEBUG: only process these knotennummern (empty = process all)
const DEBUG_ONLY: &[&str] = &["0716", "1060", "0036"];

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

// A segment between two consecutive points in a line
struct Seg {
    mid: Pt,
    angle: f64,
    length: f64,
    feature_idx: usize,
    line_idx: usize,
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

// ── Grid spatial index ────────────────────────────────────────────────

struct GridIndex {
    cells: HashMap<(i32, i32), Vec<usize>>,
}

impl GridIndex {
    fn new() -> Self {
        GridIndex {
            cells: HashMap::new(),
        }
    }

    fn cell_key(x: f64, y: f64) -> (i32, i32) {
        ((x / CELL_X).floor() as i32, (y / CELL_Y).floor() as i32)
    }

    fn insert(&mut self, x: f64, y: f64, idx: usize) {
        let key = Self::cell_key(x, y);
        self.cells.entry(key).or_default().push(idx);
    }

    fn query_neighborhood(&self, x: f64, y: f64) -> impl Iterator<Item = usize> + '_ {
        let (cx, cy) = Self::cell_key(x, y);
        (-1..=1).flat_map(move |dx| {
            (-1..=1).flat_map(move |dy| {
                self.cells
                    .get(&(cx + dx, cy + dy))
                    .map(|v| v.as_slice())
                    .unwrap_or(&[])
                    .iter()
                    .copied()
            })
        })
    }
}

// ── Segment extraction ────────────────────────────────────────────────

fn collect_segments(features: &[Feature], feature_indices: &[usize]) -> Vec<Seg> {
    let mut segs = Vec::new();
    for &fi in feature_indices {
        let feat = &features[fi];
        for (li, line) in feat.geometry.coordinates.iter().enumerate() {
            for si in 0..line.len().saturating_sub(1) {
                if line[si].len() < 2 || line[si + 1].len() < 2 {
                    continue;
                }
                let mid = [
                    (line[si][0] + line[si + 1][0]) / 2.0,
                    (line[si][1] + line[si + 1][1]) / 2.0,
                ];
                let dx = (line[si + 1][0] - line[si][0]) * KX;
                let dy = (line[si + 1][1] - line[si][1]) * KY;
                let angle = dy.atan2(dx);
                let length = (dx * dx + dy * dy).sqrt();
                segs.push(Seg {
                    mid,
                    angle,
                    length,
                    feature_idx: fi,
                    line_idx: li,
                });
            }
        }
    }
    segs
}

fn build_grid(segs: &[Seg]) -> GridIndex {
    let mut grid = GridIndex::new();
    for (i, s) in segs.iter().enumerate() {
        grid.insert(s.mid[0], s.mid[1], i);
    }
    grid
}

// ── Geometry helpers ──────────────────────────────────────────────────

fn dist_m(a: Pt, b: Pt) -> f64 {
    let dx = (b[0] - a[0]) * KX;
    let dy = (b[1] - a[1]) * KY;
    (dx * dx + dy * dy).sqrt()
}

/// Direction-agnostic angle difference in [0, PI/2].
/// Segments A→B and B→A are the same line, so 180° apart = 0 difference.
fn angle_diff(a: f64, b: f64) -> f64 {
    let d = (a - b).rem_euclid(std::f64::consts::PI);
    d.min(std::f64::consts::PI - d)
}

// ── Duplicate detection (per-line) ────────────────────────────────────

fn seg_has_match(sl: &Seg, winner_segs: &[Seg], winner_grid: &GridIndex) -> bool {
    for idx in winner_grid.query_neighborhood(sl.mid[0], sl.mid[1]) {
        let sw = &winner_segs[idx];
        if angle_diff(sl.angle, sw.angle) > ANGLE_THRESH_RAD {
            continue;
        }
        let (short, long) = if sl.length < sw.length {
            (sl.length, sw.length)
        } else {
            (sw.length, sl.length)
        };
        if long > 0.01 && short / long < 0.5 {
            continue;
        }
        if dist_m(sl.mid, sw.mid) <= MATCH_DIST_M {
            return true;
        }
    }
    false
}

/// Returns set of (feature_idx, line_idx) for lines where >50% of segments match.
fn find_duplicate_lines(
    loser_segs: &[Seg],
    winner_segs: &[Seg],
    winner_grid: &GridIndex,
) -> HashSet<(usize, usize)> {
    // Group segments by (feature_idx, line_idx), count matches per line
    let mut line_counts: HashMap<(usize, usize), (usize, usize)> = HashMap::new(); // (total, matched)

    for sl in loser_segs {
        let key = (sl.feature_idx, sl.line_idx);
        let entry = line_counts.entry(key).or_insert((0, 0));
        entry.0 += 1;
        if seg_has_match(sl, winner_segs, winner_grid) {
            entry.1 += 1;
        }
    }

    line_counts
        .into_iter()
        .filter(|&(_, (total, matched))| matched * 2 > total) // >50%
        .map(|(key, _)| key)
        .collect()
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

// ── Line removal from features ────────────────────────────────────────

fn remove_lines(features: &mut [Feature], to_remove: &HashSet<(usize, usize)>) {
    let mut by_feature: HashMap<usize, HashSet<usize>> = HashMap::new();
    for &(fi, li) in to_remove {
        by_feature.entry(fi).or_default().insert(li);
    }

    for (&fi, line_indices) in &by_feature {
        let feat = &mut features[fi];
        let old_coords = std::mem::take(&mut feat.geometry.coordinates);
        feat.geometry.coordinates = old_coords
            .into_iter()
            .enumerate()
            .filter(|(li, _)| !line_indices.contains(li))
            .map(|(_, line)| line)
            .collect();
    }
}

// ── Main cleanup ───────────────────────────────────────────────────────

fn cleanup(input_path: &str, output_path: &str) -> Result<String, Box<dyn std::error::Error>> {
    // 1. Decompress in background thread, parse in main thread via pipe
    eprintln!("Reading and parsing {}...", input_path);
    let (read_end, write_end) = std::io::pipe()?;
    let input_owned = input_path.to_string();
    let decompress_thread = std::thread::spawn(
        move || -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
            let file = fs::File::open(&input_owned)?;
            let mut decoder = GzDecoder::new(std::io::BufReader::with_capacity(1 << 20, file));
            let mut writer = BufWriter::with_capacity(1 << 20, write_end);
            std::io::copy(&mut decoder, &mut writer)?;
            Ok(())
        },
    );
    let reader = std::io::BufReader::with_capacity(1 << 20, read_end);
    let mut geojson: GeoJson = serde_json::from_reader(reader)?;
    decompress_thread
        .join()
        .unwrap()
        .map_err(|e| -> Box<dyn std::error::Error> { e })?;

    let num_features = geojson.features.len();
    eprintln!("{} features loaded", num_features);

    // 2. Group by knotennummer, compute AABBs
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

    // 3. Find AABB-overlapping pairs
    let keys: Vec<String> = groups.keys().cloned().collect();
    let mut aabb_pairs: Vec<(String, String)> = Vec::new();
    for i in 0..keys.len() {
        for j in (i + 1)..keys.len() {
            if !DEBUG_ONLY.is_empty()
                && (!DEBUG_ONLY.contains(&keys[i].as_str())
                    || !DEBUG_ONLY.contains(&keys[j].as_str()))
            {
                continue;
            }
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

    // 4. For each overlapping pair: find duplicate lines
    let mut all_removals: HashSet<(usize, usize)> = HashSet::new();
    let mut overlap_count = 0;

    for (key_a, key_b) in &aabb_pairs {
        let segs_a = collect_segments(&geojson.features, &groups[key_a].feature_indices);
        let segs_b = collect_segments(&geojson.features, &groups[key_b].feature_indices);

        if segs_a.is_empty() || segs_b.is_empty() {
            continue;
        }

        let grid_a = build_grid(&segs_a);
        let grid_b = build_grid(&segs_b);

        let ts_a = groups[key_a].timestamp;
        let ts_b = groups[key_b].timestamp;

        let dups = match (ts_a, ts_b) {
            (Some(a), Some(b)) if a != b => {
                if a < b {
                    let dups = find_duplicate_lines(&segs_a, &segs_b, &grid_b);
                    if !dups.is_empty() {
                        eprintln!(
                            "  {} <-> {}: {} wins, {} lines removed from {}",
                            key_a, key_b, key_b, dups.len(), key_a
                        );
                    }
                    dups
                } else {
                    let dups = find_duplicate_lines(&segs_b, &segs_a, &grid_a);
                    if !dups.is_empty() {
                        eprintln!(
                            "  {} <-> {}: {} wins, {} lines removed from {}",
                            key_a, key_b, key_a, dups.len(), key_b
                        );
                    }
                    dups
                }
            }
            _ => {
                let dups_a = find_duplicate_lines(&segs_a, &segs_b, &grid_b);
                let dups_b = find_duplicate_lines(&segs_b, &segs_a, &grid_a);
                let mut combined = dups_a;
                combined.extend(dups_b);
                if !combined.is_empty() {
                    eprintln!(
                        "  {} <-> {}: no timestamp, {} lines removed from both",
                        key_a, key_b, combined.len()
                    );
                }
                combined
            }
        };

        if !dups.is_empty() {
            overlap_count += 1;
            all_removals.extend(dups);
        }
    }

    let total_removed_lines = all_removals.len();
    eprintln!(
        "{} overlapping pairs processed, {} total lines to remove",
        overlap_count, total_removed_lines
    );

    // 5. Remove matched lines from features
    remove_lines(&mut geojson.features, &all_removals);

    // 6. Round coordinates to 7 decimal places (~1cm) and remove empty features
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
    let removed_features = num_features - geojson.features.len();

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
        "{} features in {} groups, {} AABB overlaps, {} pairs with duplicates, {} lines removed, {} empty features removed",
        num_features, num_groups, aabb_pairs.len(), overlap_count, total_removed_lines, removed_features
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
