defmodule Settings do
  # max extent the user may navigate the map (min lon, min lat, max lon, max lat)
  def bounds, do: [8.9236, 53.1336, 10.8897, 53.9682]
  # tiny debug area around Landungsbrücken for basemap testing
  # def bounds, do: [9.95815, 53.54178, 9.97641, 53.54781]

  # start settings if no other map location/image is selected
  def initial,
    do: %{minLon: 9.724553, minLat: 53.454363, maxLon: 10.21779, maxLat: 53.715809}

  def map_styles,
    do: [
      %{
        name: "Karte",
        id: "/assets/basemap/styles/standard.json",
        active: true
      },
      %{
        name: "Satellitenbild",
        id: "/assets/basemap/styles/satellite.json",
        active: false
      }
    ]

  def map_layers,
    do: [
      %Layer{
        name: "Artikel",
        route_group: nil,
        active: true,
        line: [],
        icon: ["article-areas title"],
        fill: ["article-areas bg"],
        outline: ["article-areas bg outline", "article-areas bg outline dash"]
      },
      %Layer{
        name: "Alltagsrouten",
        route_group: :alltag,
        active: true,
        line: ["vr-line-off-p1", "vr-line-off-m1", "vr-line-off-none"],
        icon: ["vr-oneway", "vr-sign"],
        fill: [],
        outline: []
      },
      %Layer{
        name: "Freizeitrouten",
        route_group: :freizeit,
        active: false,
        line: ["fr-line"],
        icon: ["fr-oneway", "fr-sign", "fr-warning-icons"],
        fill: [],
        outline: []
      },
      %Layer{
        name: "Bezirksrouten",
        route_group: :bezirk,
        active: false,
        line: ["br-line-off-p1", "br-line-off-m1", "br-line-off-none"],
        icon: ["br-oneway", "br-sign"],
        fill: [],
        outline: []
      },
      %Layer{
        name: "Radschnellwege",
        route_group: :rsw,
        active: false,
        line: ["rsw-line"],
        icon: ["rsw-oneway", "rsw-sign"],
        fill: [],
        outline: []
      }
    ]

  def start_image,
    do: %{
      article_id: "11",
      direction: :forward,
      position: %{lat: 53.55044, lon: 9.99440}
    }

  # no trailing slash
  def url, do: "https://veloroute.hamburg"

  def osm_data_source, do: "https://download.geofabrik.de/europe/germany-latest.osm.pbf"
  def osm_data_source_max_age_days, do: 30 * 6

  def osm_data_source_extra_shapes,
    do: [
      "https://osmdata.openstreetmap.de/download/water-polygons-split-4326.zip"
      # "https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_urban_areas.zip"
    ]

  def feed_title, do: "veloroute.hamburg – Neue Artikel"
  def feed_author, do: "veloroute.hamburg"

  def sitebar_name, do: "veloroute.hamburg"
  def page_title_short, do: "veloroute.hamburg · "
  def page_title_long, do: "veloroute.hamburg · Fahrradwege für Alltag und Freizeit"
  def email, do: "mail@veloroute.hamburg"

  def twitter_handle, do: "@VelorouteHH"
  def mastodon_url, do: "https://norden.social/@VelorouteHamburg"
  def bluesky_url, do: "https://bsky.app/profile/veloroutehh.bsky.social"
  def deploy_ssh_name, do: "veloroute-deploy"

  def deploy_video_copy_cmd,
    do: [
      "ssh",
      deploy_ssh_name(),
      "--",
      "rclone",
      "sync",
      "--max-delete",
      "15",
      "hsbssh:veloroute/videos/rendered/",
      "/home/veloroute-rendered-videos/"
    ]

  def video_dir_rel, do: "videos"
  def video_dir_abs, do: Path.join(File.cwd!(), video_dir_rel())
  def video_source_dir_abs, do: Path.join(video_dir_abs(), "source")
  def video_target_dir_abs, do: Path.join(video_dir_abs(), "rendered")
  def video_serve_path, do: "videos-rendered"
  # full URL up until host and TLD, no trailing slash. Or nil for "same".
  def video_serve_host(), do: "https://p.qp.vc"

  # Thumbnails have approximately 100 kB, so 100 thumbs are ~10 MB, 1000 are ~100MB
  def thumbnail_cache_entry_limit, do: 1000
  def map_cache_entry_limit, do: 1000
end
