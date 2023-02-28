defmodule SearchResult do
  use Phoenix.Component

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

  @spec sort([t()] | Enumerable.t()) :: [t()]
  def sort(a) do
    Enum.sort(a, &order/2)
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
  def to_html(%__MODULE__{url: url} = assigns) when is_binary(url) do
    assigns = %{url: url, name: assigns.name, ping: ping(assigns)}

    ~H"""
    <a
      href={@url}
      data-phx-link-state="push"
      data-phx-link="patch"
      phx-click={@ping}
    ><%= @name %></a>
    """
  end

  def to_html(%__MODULE__{} = assigns) do
    js = assigns |> ping() |> zoom_to_bounds(assigns)
    assigns = %{js: js, name: assigns.name}

    ~H"""
    <a phx-click={@js}><%= @name %></a>
    """
  end

  def ping(sr) do
    center =
      with %{lat: lat, lon: lon} <- sr.center,
           %{minLat: minLat, maxLat: maxLat, minLon: minLon, maxLon: maxLon}
           when maxLat - minLat < 0.0001 and maxLon - minLon < 0.0001 <- sr.bounds do
        %{lat: lat, lon: lon}
      else
        _ -> nil
      end

    Phoenix.LiveView.JS.dispatch(%Phoenix.LiveView.JS{}, "map:ping",
      detail: %{
        name: sr.name,
        center: center
      }
    )
  end

  def zoom_to_bounds(js, %{bounds: bounds}) do
    str = VelorouteWeb.VariousHelpers.to_string_bounds(bounds)
    Phoenix.LiveView.JS.push(js, "map-zoom-to", value: %{bounds: str})
  end
end
