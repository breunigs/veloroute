defmodule VelorouteWeb.FeedController do
  use VelorouteWeb, :controller
  use Memoize

  def feed(conn, _params) do
    conn
    |> put_resp_content_type("application/atom+xml")
    |> text(get())
  end

  def legacy(conn, _params) do
    conn
    |> put_status(301)
    |> redirect(to: ~p(/updates.atom))
  end

  defmemo(get(), do: build())

  defp build(), do: Feed.build()
end
