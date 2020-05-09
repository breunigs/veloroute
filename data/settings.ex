defmodule Settings do
  # max extent the user may navigate the map
  def bounds, do: [8.9236, 53.1336, 10.8897, 53.9682]
  # start settings if no other map location/image is selected
  def center, do: %{lon: 9.993, lat: 53.551}
  def zoom, do: 10
  def image, do: "c4B6txFX6Xgza8iWNFzSYw"
  def route, do: {"4", "(stadtauswärts zum Ochsenzoll)"}

  def page_title_short, do: "veloroute.hamburg · "
  def page_title_long, do: "veloroute.hamburg · Fahrradwege für den Alltag"
  def email, do: "stefan-veloroute@breunig.xyz"

  def default_page, do: "0000-00-00-startpage"

  def footer,
    do: """
      <h3>Kontakt</h3>
      <p>Fehler? Wünsche? Alte Bilder? Schreib mir:<br><mailto/></p>

      <p><a href="/"><strong>Zurück zur Startseite</strong></a></p>
    """
end
