defmodule VelorouteWeb.FeedController do
  use VelorouteWeb, :controller

  def feed(conn, _params) do
    conn
    |> put_resp_content_type("application/atom+xml")
    |> text(get())
  end

  def legacy(conn, _params) do
    conn
    |> put_status(301)
    |> redirect(to: Routes.feed_path(conn, :feed))
  end

  defp get(), do: Application.get_env(:veloroute, :cached_feed) || build()

  defp build() do
    xml = Feed.build()
    Application.put_env(:veloroute, :cached_feed, xml)
    xml
  end
end
