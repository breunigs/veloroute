defmodule Data.Article do
  require Logger

  defstruct [
    :type,
    :title,
    :name,
    :images,
    :hideFromMap,
    :tags,
    :text,
    :start,
    :end,
    :date,
    :live_html
  ]

  @required_params [:type, :title, :text, :date, :name]
  def required_params, do: @required_params

  def load(path) do
    {:ok, parsed} = YamlElixir.read_from_file(path)

    parsed = Enum.into(parsed, %{}, fn {k, v} -> {String.to_atom(k), v} end)

    name = Path.basename(path, ".yaml")

    {:ok, date} =
      name
      |> String.slice(0..9)
      |> case do
        "0000-00-00" -> {:ok, nil}
        x -> Date.from_iso8601(x)
      end

    live_html =
      parsed[:text]
      |> Floki.parse_fragment!()
      |> Floki.traverse_and_update(&to_live_links/1)
      |> Floki.raw_html()

    data = Map.merge(%{name: name, date: date, live_html: live_html}, parsed)
    struct(Data.Article, data)
  end

  def load_all(path) do
    File.ls!(path)
    |> Enum.map(fn filename ->
      load(Path.join([path, filename]))
    end)
    |> Enum.into(%{}, fn art ->
      {art.name, art}
    end)
  end

  defp to_live_links({"a", attrs, children} = keep) do
    href =
      attrs
      |> Enum.find({nil, nil}, fn {key, _val} -> key == "href" end)
      |> elem(1)

    cond do
      nil == href ->
        name = Floki.text(children)
        {"a", [{"phx-click", "map-zoom-to"}, {"phx-value-name", name} | attrs], children}

      String.starts_with?(href, "http") ->
        {"a", [{"target", "_blank"} | attrs], children}

      opts = parse_map_link(href) ->
        values = opts |> Enum.map(fn {k, v} -> {"phx-value-#{k}", v} end)
        attrs = [{"phx-click", "map-zoom-to"}, {"onclick", "return false"}] ++ values ++ attrs
        {"a", attrs, children}

      String.starts_with?(href, "/") ->
        {"a", [{"data-phx-link-state", "push"}, {"data-phx-link", "patch"} | attrs], children}

      "mailto:" <> _rest = href ->
        keep
    end
  end

  defp to_live_links(any), do: any

  defp parse_map_link(path) do
    # /13#zoom/lat/lon/img
    Regex.named_captures(
      ~r{/(?<route>\d+)?#(?<zoom>[\d.]+)/(?<lat>[\d.]+)/(?<lon>[\d.]+)(?:/(?<img>.+))?},
      path
    )
  end
end
