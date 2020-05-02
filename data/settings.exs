defmodule Settings do
  # max extent the user may navigate the map
  def bounds, do: [8.9236, 53.1336, 10.8897, 53.9682]
  # start settings if no other map location/image is selected
  def center, do: %{lon: 9.993, lat: 53.551}
  def zoom, do: 10
  def image, do: "c4B6txFX6Xgza8iWNFzSYw"
  def route, do: {"4", "(stadtauswärts zum Ochsenzoll)"}

  def page_title, do: "Veloroute Hamburg"
end
