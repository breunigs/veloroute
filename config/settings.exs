import Config

config :veloroute, Settings, %{
  # max extent the user may navigate the map (min lon, min lat, max lon, max lat)
  bounds: [8.9236, 53.1336, 10.8897, 53.9682],
  # tiny debug area around Landungsbrücken for basemap testing
  # bounds: [9.95815, 53.54178, 9.97641, 53.54781],

  # start settings if no other map location/image is selected
  initial: %{minLon: 9.724553, minLat: 53.454363, maxLon: 10.21779, maxLat: 53.715809},

  # which basemap styles to show, their display name, and if they're default or not
  map_styles: [
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
  ],

  # which individual map layers are grouped into a human readable combination of
  # those
  map_layers: [
    %{
      name: "Artikel",
      route_group: nil,
      active: true,
      line: [],
      icon: ["article-areas title"],
      fill: ["article-areas bg"],
      outline: ["article-areas bg outline", "article-areas bg outline dash"]
    },
    %{
      name: "Alltagsrouten",
      route_group: :alltag,
      active: true,
      line: ["vr-line-off-p1", "vr-line-off-m1", "vr-line-off-none"],
      icon: ["vr-oneway", "vr-sign"],
      fill: [],
      outline: []
    },
    %{
      name: "Freizeitrouten",
      route_group: :freizeit,
      active: false,
      line: ["fr-line"],
      icon: ["fr-oneway", "fr-sign", "fr-warning-icons"],
      fill: [],
      outline: []
    },
    %{
      name: "Bezirksrouten",
      route_group: :bezirk,
      active: false,
      line: ["br-line-off-p1", "br-line-off-m1", "br-line-off-none"],
      icon: ["br-oneway", "br-sign"],
      fill: [],
      outline: []
    },
    %{
      name: "Radschnellwege",
      route_group: :rsw,
      active: false,
      line: ["rsw-line"],
      icon: ["rsw-oneway", "rsw-sign"],
      fill: [],
      outline: []
    }
  ],

  # the start video/image to display if the user visits the start page
  start_image: %{
    article_id: "11",
    direction: :forward,
    position: %{lat: 53.55044, lon: 9.99440}
  },

  # city/area/region name that will have its results boosted over the ones
  # outside of it. Should be written like it is in OpenStreetMap data.
  boost_search_results_within: "Hamburg",

  # no trailing slash, absolute URL to the project
  url: "https://veloroute.hamburg",
  # full URL up until host and TLD, no trailing slash. Or nil for "same".
  video_serve_host: "https://veloroute.hamburg",
  # appended to `video_serve_host` or `url`
  video_serve_path: "videos-rendered",

  # where do download the OpenStreetMap data from
  osm_data_source: "https://download.geofabrik.de/europe/germany-latest.osm.pbf",
  # how stale it may be
  osm_data_source_max_age_days: 30 * 2,
  # extra shapes if needed
  osm_data_source_extra_shapes: [
    "https://osmdata.openstreetmap.de/download/water-polygons-split-4326.zip"
    # "https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_urban_areas.zip"
  ],

  # various names and titles
  feed_title: "veloroute.hamburg – Neue Artikel",
  feed_author: "veloroute.hamburg",
  sitebar_name: "veloroute.hamburg",
  page_title_short: "veloroute.hamburg · ",
  page_title_long: "veloroute.hamburg · Fahrradwege für Alltag und Freizeit",
  email: "mail@veloroute.hamburg",
  email_name: "Stefan Breunig",
  twitter_handle: "@VelorouteHH",
  mastodon_url: "https://norden.social/@VelorouteHamburg",
  bluesky_url: "https://bsky.app/profile/veloroutehh.bsky.social",

  # which SSH handle to use to deploy the page
  deploy_ssh_name: "veloroute-deploy",

  # specify command if videos need to be copied to the server
  # spec: [binary()] | nil
  deploy_video_copy_cmd: nil,
  # [
  #   "ssh",
  #   deploy_ssh_name(),
  #   "--",
  #   "rclone",
  #   "sync",
  #   "--max-delete",
  #   "15",
  #   "hsbssh:veloroute/videos/rendered/",
  #   "/home/veloroute-rendered-videos/"
  # ],

  # which language to use if none available match the user's
  default_language: "de",

  # which links to tag with a [€] marker
  paywall_hostnames: ["abendblatt.de", "www.abendblatt.de"],

  # Thumbnails have approximately 100 kB, so 100 thumbs are ~10 MB, 1000 are ~100MB
  video_thumbnail_cache_entry_limit: 1000,
  external_map_cache_entry_limit: 1000,
  static_map_cache_entry_limit: 200,

  # various video related paths
  video_dir_rel: "videos",
  video_source_dir_rel: Path.join("videos", "source"),
  video_target_dir_rel: Path.join("videos", "rendered")
}
