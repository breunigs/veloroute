defmodule Feed do
  alias Atomex.{Feed, Entry}
  alias Article
  # alias VelorouteWeb.Router.Helpers, as: Routes

  def build() do
    Feed.new(Settings.url(), DateTime.utc_now(), Settings.feed_title())
    |> Feed.author(Settings.feed_author(), email: Settings.email())
    |> Feed.link(Settings.url() <> "/updates.atom", rel: "self")
    |> Feed.entries(articles())
    |> Feed.build(%{
      "xmlns:georss" => "http://www.georss.org/georss",
      "xml:base" => Settings.url()
    })
    |> Atomex.generate_document()
  end

  defp articles() do
    Article.List.category("Blog")
    |> Article.List.sort(:asc)
    |> Enum.reject(&(Date.compare(&1.updated_at(), Date.utc_today()) == :gt))
    |> Enum.take(-10)
    |> Enum.map(&article/1)
  end

  defp article(art) do
    content =
      art
      |> Article.Decorators.html()
      |> Floki.parse_fragment!()
      |> Floki.find_and_update("a:not([href])", fn {"a", _attrs} -> {"i", []} end)
      |> Floki.raw_html()

    full_title = Article.Decorators.full_title(art)
    {:ok, date, _} = DateTime.from_iso8601(Date.to_iso8601(art.updated_at()) <> " 00:00:00Z")
    url = Article.Decorators.url(art)

    Entry.new(url, date, full_title)
    |> Entry.content(content, type: "html")
    |> maybe_add_location(art)
    |> maybe_add_image(art)
    |> maybe_add_summary(art)
    |> Entry.link(url, rel: "alternate", type: "text/html")
    |> Entry.build()
  end

  defp maybe_add_location(entry, art) do
    case Article.Decorators.bbox(art) do
      bbox when is_map(bbox) ->
        lat = (bbox.minLat + bbox.maxLat) / 2
        lon = (bbox.minLon + bbox.maxLon) / 2
        Entry.add_field(entry, "georss:point", %{}, "#{lat} #{lon}")

      _other ->
        entry
    end
  end

  defp maybe_add_summary(entry, article) do
    if article.summary() do
      Entry.summary(entry, article.summary())
    else
      entry
    end
  end

  defp maybe_add_image(entry, article) do
    img_path = Article.Decorators.start_image_path(article)

    if is_binary(img_path) do
      Entry.link(entry, Settings.url() <> img_path, rel: "enclosure", type: "image/jpeg")
    else
      entry
    end
  end
end
