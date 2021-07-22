defmodule Feed do
  alias Atomex.{Feed, Entry}
  alias Article
  # alias VelorouteWeb.Router.Helpers, as: Routes

  require Cache.Articles

  def build() do
    Feed.new(Settings.url(), DateTime.utc_now(), Settings.feed_title())
    |> Feed.author(Settings.feed_author(), email: Settings.email())
    |> Feed.link(Settings.url() <> "/updates.atom", rel: "self")
    |> Feed.entries(articles())
    |> Feed.build(%{"xmlns:georss" => "http://www.georss.org/georss"})
    |> Atomex.generate_document()
  end

  defp articles() do
    Cache.Articles.get()
    |> Article.ordered_by_date()
    |> Enum.slice(-10..-1)
    |> Enum.map(&article/1)
  end

  defp article(%Article{name: name, date: date} = art) do
    {:safe, content} = VelorouteWeb.ArticleView.render_feed(art)
    {:ok, date, _} = DateTime.from_iso8601(Date.to_iso8601(date) <> " 00:00:00Z")

    # TODO: this fails, presumably because dependencies are missing during
    # compile?
    # Routes.article_url(VelorouteWeb.Endpoint, VelorouteWeb.FrameLive, name)
    url = Settings.url() <> "/article/" <> name

    Entry.new(url, date, art.full_title)
    |> Entry.content(content, type: "html")
    |> maybe_add_location(art)
    |> maybe_add_image(art)
    |> Entry.link(url, rel: "alternate", type: "text/html")
    |> Entry.build()
  end

  defp maybe_add_location(entry, %{bbox: bbox}) when is_map(bbox) do
    lat = (bbox.minLat + bbox.maxLat) / 2
    lon = (bbox.minLon + bbox.maxLon) / 2
    Entry.add_field(entry, "georss:point", %{}, "#{lat} #{lon}")
  end

  defp maybe_add_location(entry, _article), do: entry

  defp maybe_add_image(entry, article) do
    img_path = Article.start_image_path(article)

    if is_binary(img_path) do
      Entry.link(entry, Settings.url() <> img_path, rel: "enclosure", type: "image/jpeg")
    else
      entry
    end
  end
end
