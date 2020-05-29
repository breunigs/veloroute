defmodule Feed do
  alias Atomex.{Feed, Entry}
  alias Data.Article
  # alias VelorouteWeb.Router.Helpers, as: Routes

  require Data.ArticleCache

  def build() do
    Feed.new(Settings.url(), DateTime.utc_now(), Settings.feed_title())
    |> Feed.author(Settings.feed_author(), email: Settings.email())
    |> Feed.link(Settings.url() <> "/updates.atom", rel: "self")
    |> Feed.entries(articles())
    |> Feed.build(%{"xmlns:georss" => "http://www.georss.org/georss"})
    |> Atomex.generate_document()
  end

  defp articles() do
    Data.ArticleCache.get()
    |> Article.ordered_by_date()
    |> Enum.slice(-10..-1)
    |> Enum.map(&article/1)
  end

  defp article(%Article{name: name, date: date} = art) do
    title = Article.full_title(art)
    {:safe, content} = VelorouteWeb.ArticleView.render_feed(art)
    {:ok, date, _} = DateTime.from_iso8601(Date.to_iso8601(date) <> " 00:00:00Z")

    # TODO: this fails, presumably because dependencies are missing during
    # compile?
    # Routes.article_url(VelorouteWeb.Endpoint, VelorouteWeb.FrameLive, name)
    (Settings.url() <> "/article/" <> name)
    |> Entry.new(date, title)
    |> Entry.content(content, type: "html")
    |> maybe_add_location(art)
    |> Entry.build()
  end

  defp maybe_add_location(entry, %{bbox: bbox}) when is_map(bbox) do
    lat = (bbox.minLat + bbox.maxLat) / 2
    lon = (bbox.minLon + bbox.maxLon) / 2
    Entry.add_field(entry, "georss:point", %{}, "#{lat} #{lon}")
  end

  defp maybe_add_location(entry, _article), do: entry
end
