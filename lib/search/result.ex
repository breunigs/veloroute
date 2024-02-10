defmodule Search.Result do
  use Phoenix.Component

  @type t() :: %__MODULE__{
          name: binary(),
          bounds: Geo.BoundingBox.t(),
          center: Geo.Point.t() | nil,
          relevance: float(),
          type: binary(),
          url: binary() | nil,
          subtext: binary() | nil,
          source: binary() | nil
        }

  @enforce_keys [:name, :bounds, :relevance, :type]

  defstruct @enforce_keys ++ [:url, :subtext, :center, :source]

  @spec sort([t()] | Enumerable.t()) :: [t()]
  def sort(a) do
    Enum.sort(a, &order/2)
  end

  @spec merge_same([t()] | Enumerable.t()) :: [t()]
  def merge_same(a) do
    a
    |> Enum.group_by(&{&1.name, &1.subtext, &1.type, &1.url})
    |> Enum.map(fn
      {_merge_key, [d1]} ->
        d1

      {_merge_key, [d1 | drest] = dall} ->
        merged =
          Enum.reduce(drest, d1, fn d2, d1 ->
            %{
              d1
              | bounds: Geo.CheapRuler.union(d1.bounds, d2.bounds),
                relevance: d1.relevance + d2.relevance,
                source: d1.source <> "\n" <> d2.source
            }
          end)

        %{
          merged
          | center: Geo.CheapRuler.center(merged.bounds),
            relevance: merged.relevance / length(dall)
        }
    end)
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
    assigns = %{url: url, name: assigns.name, ping: ping(assigns), subtext: assigns.subtext}

    ~H"""
    <a
      href={@url}
      data-phx-link-state="push"
      data-phx-link="patch"
      phx-click={@ping}
    >
      <%= @name %><br>
      <aside :if={@subtext}><%= @subtext %></aside>
    </a>
    """
  end

  def to_html(%__MODULE__{} = assigns) do
    js = assigns |> ping() |> zoom_to_bounds(assigns)
    assigns = %{js: js, name: assigns.name, subtext: assigns.subtext}

    ~H"""
    <a phx-click={@js}>
      <%= @name %><br>
      <aside :if={@subtext}><%= @subtext %></aside>
    </a>
    """
  end

  def ping(sr) do
    center =
      with %{lat: lat, lon: lon} <- sr.center,
           %{minLat: minLat, maxLat: maxLat, minLon: minLon, maxLon: maxLon}
           when maxLat - minLat < 0.001 and maxLon - minLon < 0.001 <- sr.bounds do
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
    str = Geo.BoundingBox.to_string_bounds(bounds)
    Phoenix.LiveView.JS.push(js, "map-zoom-to", value: %{bounds: str})
  end
end
