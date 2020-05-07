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
    :live_html,
    :range
  ]

  @required_params [:type, :title, :text, :date, :name]
  def required_params, do: @required_params

  def load(path) do
    {:ok, parsed} = YamlElixir.read_from_file(path)

    parsed = Enum.into(parsed, %{}, fn {k, v} -> {String.to_existing_atom(k), v} end)

    name = Path.basename(path, ".yaml")

    {:ok, date} =
      Map.get(parsed, :updated, name)
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
      |> append_related_articles(Map.get(parsed, :tags, nil))

    title_html =
      if Map.get(parsed, :title) && !String.starts_with?(live_html, "<h3"),
        do:
          Phoenix.HTML.Tag.content_tag(:h3, parsed.title)
          |> Phoenix.HTML.safe_to_string(),
        else: ""

    tags = Map.get(parsed, :tags, []) |> Enum.map(&to_string/1)

    data =
      Map.merge(parsed, %{
        name: name,
        date: date,
        live_html: title_html <> live_html,
        tags: tags,
        start: parsed |> Map.get(:start) |> Data.RoughDate.parse(),
        end: parsed |> Map.get(:end) |> Data.RoughDate.parse()
      })

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

  # def filter(all, ""), do: all
  # def filter(all, nil), do: all
  # def filter(all, []), do: all

  # def filter(all, filter) when is_binary(filter) do
  #   filter =
  #     filter
  #     |> String.trim()
  #     |> String.split(" ")
  #     |> Enum.map(&String.split(&1, "=", parts: 2))
  #     |> Enum.map(fn [key, vals] ->
  #       {String.to_existing_atom(key), String.split(vals, ",")}
  #     end)

  #   filter(all, filter)
  # end

  def filter(all, filter) when is_list(filter) do
    all
    |> Enum.filter(fn {_name, art} ->
      Enum.all?(filter, fn {key, allowed_values} ->
        allowed = MapSet.new(allowed_values)
        have = Map.get(art, key, []) |> List.wrap() |> MapSet.new()
        matches = MapSet.intersection(allowed, have)

        MapSet.size(matches) > 0
      end)
    end)
    |> Enum.into(%{})
  end

  def ordered(various, key) when is_binary(key),
    do: ordered(various, String.to_existing_atom(key))

  def ordered(various, key) do
    case key do
      :start -> ordered_by_start(various)
      :date -> ordered_by_date(various)
      nil -> ordered_by_date(various)
    end
  end

  def ordered_by_start(various) do
    various
    |> orderable_only()
    |> Enum.sort_by(
      fn art -> art.start end,
      &Data.RoughDate.compare(&1, &2)
    )
  end

  def ordered_by_date(various) do
    various
    |> orderable_only()
    |> Enum.sort_by(fn
      %Data.Article{date: %Date{} = d} -> {d.year, d.month, d.day}
    end)
  end

  def range(%Data.Article{start: from, end: to}) do
    Data.RoughDate.range(from, to)
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

  def orderable_only(map) when is_map(map),
    do: map |> Map.values() |> orderable_only()

  def orderable_only([{name, %Data.Article{name: name}} | _rest] = list),
    do: list |> Enum.map(&elem(&1, 1)) |> orderable_only()

  def orderable_only(list) when is_list(list) do
    list
    |> Enum.reject(fn
      %Data.Article{date: nil} -> true
      _ -> false
    end)
  end

  defp append_related_articles(content, nil), do: content
  defp append_related_articles(content, []), do: content

  defp append_related_articles(content, tags) when is_list(tags) do
    """
      #{content}

      <h3>Verwandte Artikel</h3>
      <articles tags="#{Enum.join(tags, ",")}" sort="date"/>
    """
  end
end
