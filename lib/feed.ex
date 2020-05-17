defmodule Feed do
  alias Atomex.{Feed, Entry}
  alias Data.Article

  require Data.ArticleCache

  def build() do
    Feed.new(Settings.url(), DateTime.utc_now(), Settings.feed_title())
    |> Feed.author(Settings.feed_author(), email: Settings.email())
    |> Feed.link(Settings.url() <> "/updates.atom", rel: "self")
    |> Feed.entries(articles())
    |> Feed.build()
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

    Entry.new(Settings.url() <> "/" <> name, date, title)
    |> Entry.content(content, type: "html")
    |> Entry.build()
  end
end
