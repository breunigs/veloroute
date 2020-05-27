defmodule VelorouteWeb.PageController do
  use VelorouteWeb, :controller

  require Logger

  def blog(conn, params) do
    conn
    |> put_status(301)
    |> redirect(to: Routes.article_path(conn, VelorouteWeb.FrameLive, params["article"]))
  end

  def article_vs_page(conn, params) do
    conn
    |> put_status(301)
    |> redirect(to: Routes.page_path(conn, VelorouteWeb.FrameLive, params["page"]))
  end

  def js_errors(conn, _params) do
    {:ok, data, _conn_details} = Plug.Conn.read_body(conn)
    err = "A JavaScript error was reported:\n#{data}\n#{inspect(conn)}"

    try do
      raise err
    rescue
      exp ->
        Logger.error(exp.message)
        Sentry.capture_exception(exp, extra: %{})
    end

    send_resp(conn, 204, "")
  end
end
