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
    attrs
    |> Enum.find({nil, nil}, fn {key, _val} -> key == "href" end)
    |> elem(1)
    |> case do
      "http" <> _rest ->
        {"a", [{"target", "_blank"} | attrs], children}

      # "/#" <> coords ->
      #   # TODO: PARSE HASH. Edge case: /13#zoom/lat/lon/img ??
      #   {"a", [{"phx-click", "map-zoom-to"}, {"phx-value-", coords} | attrs], children}

      "/" <> _rest ->
        {"a", [{"data-phx-link-state", "push"}, {"data-phx-link", "patch"} | attrs], children}

      "mailto:" <> _rest ->
        keep

      "#" <> _rest ->
        {"a", [{"data-phx-link-state", "push"}, {"data-phx-link", "patch"} | attrs], children}

      nil ->
        name = Floki.text(children)
        {"a", [{"phx-click", "map-zoom-to"}, {"phx-value-name", name} | attrs], children}
    end
  end

  defp to_live_links(any), do: any
end
