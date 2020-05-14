defmodule VelorouteWeb.PageController do
  use VelorouteWeb, :controller

  def blog(conn, params) do
    conn
    |> put_status(301)
    |> redirect(to: Routes.article_path(conn, VelorouteWeb.FrameLive, params["article"]))
  end
end
