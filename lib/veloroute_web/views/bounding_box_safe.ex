defimpl Phoenix.HTML.Safe, for: Geo.BoundingBox do
  def to_iodata(bounds) do
    bounds
    |> VelorouteWeb.VariousHelpers.to_string_bounds()
    |> Plug.HTML.html_escape_to_iodata()
  end
end
