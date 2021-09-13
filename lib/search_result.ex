defmodule SearchResult do
  alias __MODULE__

  @type t() :: %SearchResult{
          name: binary(),
          bounds: Geo.BoundingBox.t(),
          center: Geo.Point.t() | nil,
          relevance: float(),
          type: binary(),
          url: binary() | nil,
          subtext: binary() | nil
        }

  @enforce_keys [:name, :bounds, :relevance, :type]

  defstruct @enforce_keys ++ [:url, :subtext, :center]

  @spec sort_merge([t()], [t()]) :: [t()]
  def sort_merge(a, b) do
    Enum.sort(a ++ b, &order/2)
  end

  defp order(%__MODULE__{type: a, relevance: x}, %__MODULE__{type: b, relevance: x}) do
    type_to_num(a) >= type_to_num(b)
  end

  defp order(%__MODULE__{relevance: x}, %__MODULE__{relevance: y}), do: x >= y

  defp type_to_num(type) do
    case type do
      "article" -> 2
      "poi" -> 1
      _ -> 0
    end
  end

  @doc """
  Generate suitable live view links that will show the search result by
  navigating or adapting the map
  """
  def to_html(%SearchResult{name: name, url: url}) when is_binary(url) do
    Phoenix.LiveView.Helpers.live_patch(name, to: url)
  end

  def to_html(%SearchResult{name: name, bounds: bounds, center: center}) do
    attrs = [
      {"phx-click", "map-zoom-to"},
      {"phx-value-bounds", VelorouteWeb.VariousHelpers.to_string_bounds(bounds)}
    ]

    attrs =
      if center,
        do: [{"phx-value-ping-lon", center.lon}, {"phx-value-ping-lat", center.lat} | attrs],
        else: attrs

    Phoenix.HTML.Tag.content_tag(:a, name, attrs)
  end
end
