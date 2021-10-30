defmodule Settings do
  # max extent the user may navigate the map
  def bounds, do: [8.9236, 53.1336, 10.8897, 53.9682]
  # start settings if no other map location/image is selected
  def initial,
    do: %{minLon: 9.724553, minLat: 53.454363, maxLon: 10.21779, maxLat: 53.715809}

  def start_image,
    do: %{
      route: Data.Route.Route11,
      direction: :forward,
      position: %{lat: 53.55044, lon: 9.99440}
    }

  # no trailing slash
  def url, do: "https://veloroute.hamburg"

  def feed_title, do: "veloroute.hamburg – Neue Artikel"
  def feed_author, do: "veloroute.hamburg"

  def sitebar_name, do: "veloroute.hamburg"
  def page_title_short, do: "veloroute.hamburg · "
  def page_title_long, do: "veloroute.hamburg · Fahrradwege für Alltag und Freizeit"
  def email, do: "stefan-veloroute@breunig.xyz"

  def twitter_handle, do: "@VelorouteHH"

  def footer,
    do: """
      <h3>Kontakt</h3>
      <p>Fehler? Wünsche? Alte Bilder? Schreib mir:<br><mailto/></p>

      <p><a href="/"><strong>Zurück zur Startseite</strong></a></p>
    """

  def deploy_ssh_name, do: "veloroute-deploy"
  def deploy_video_mount_dir, do: "/home/veloroute-rclone/mount"

  def enable_sentry_frontend, do: false

  def video_dir_rel, do: "videos"
  def video_dir_abs, do: Path.join(File.cwd!(), video_dir_rel())
  def video_source_dir_abs, do: Path.join(video_dir_abs(), "source")
  def video_target_dir_abs, do: Path.join(video_dir_abs(), "rendered")
  # Note: must be manually adjusted in robots.txt
  def video_serve_path, do: "videos-rendered"
end
