defimpl Phoenix.HTML.Safe, for: BoundingBox do
  def to_iodata(bounds) do
    bounds
    |> VelorouteWeb.VariousHelpers.to_string_bounds()
    |> Plug.HTML.html_escape_to_iodata()
  end
end

defmodule BoundingBox do
  @params [:minLon, :minLat, :maxLon, :maxLat]
  defstruct @params
  @enforce_keys @params
end
