defmodule Basemap.Appointments do
  @empty_document JSON.encode!(%{
                    type: "FeatureCollection",
                    features: []
                  })
  @empty_document_name "empty_appointments.geojson"

  use Basemap.Renderable

  @impl Basemap.Renderable
  def staleness() do
    if File.exists?(assets_path(@empty_document_name)) do
      {false, "empty document exists"}
    else
      {true, "empty document missing"}
    end
  end

  @impl Basemap.Renderable
  def render(), do: File.write(assets_path(@empty_document_name), @empty_document)

  use VelorouteWeb, :verified_routes
  @behaviour Basemap.Servable
  @impl Basemap.Servable
  def serve_path(_extra \\ ""), do: ~p"/termine.geojson"

  @impl Basemap.Servable
  def serve_url(url \\ "", _extra \\ ""), do: Path.join(url, ~p"/termine.geojson")

  @impl Basemap.Servable
  def assets_path(_extra \\ ""), do: "priv/static/#{@empty_document_name}"
end
