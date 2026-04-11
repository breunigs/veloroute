pub mod cheap_ruler;
pub mod polyline;
pub mod smoother;
mod timed_nifs;

mod atoms {
    rustler::atoms! {
        lat,
        lon,
        time_offset_ms,
    }
}

#[derive(Clone, Copy, rustler::NifMap)]
pub struct Coord {
    pub lat: f64,
    pub lon: f64,
}

#[derive(Clone, Copy, Debug, PartialEq, rustler::NifStruct)]
#[module = "Video.TimedPoint"]
pub struct TimedCoord {
    pub lat: f64,
    pub lon: f64,
    pub time_offset_ms: i64,
}

#[derive(rustler::NifMap)]
pub struct CoordWithBearing {
    pub lat: f64,
    pub lon: f64,
    pub time_offset_ms: i64,
    pub bearing: f64,
}

#[derive(rustler::NifMap)]
pub struct ClosestPointResult {
    pub dist: f64,
    pub lat: f64,
    pub lon: f64,
    pub time_offset_ms: i64,
    pub bearing: f64,
}

rustler::init!("Elixir.Geo.Nif");
