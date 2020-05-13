defmodule VelorouteWeb.FeedController do
  use VelorouteWeb, :controller

  @feed Feed.build()

  def feed(conn, _params) do
    conn
    |> put_resp_content_type("application/atom+xml")
    |> text(@feed)
  end

  def legacy(conn, _params) do
    conn
    |> put_status(301)
    |> redirect(to: Routes.feed_path(conn, :feed))
  end
end
