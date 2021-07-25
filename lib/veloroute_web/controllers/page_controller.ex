defmodule VelorouteWeb.PageController do
  use VelorouteWeb, :controller

  require Logger

  def blog(conn, params) do
    conn
    |> put_status(301)
    |> redirect(to: Routes.article_path(conn, VelorouteWeb.FrameLive, params["article"]))
  end

  def quality(conn, params) do
    name = Regex.replace(~r/^[0-9-]+/, params["article"], "")

    article =
      Cache.Articles.get_dated()
      |> Map.keys()
      |> Enum.find(&String.ends_with?(&1, name))

    if article do
      conn
      |> put_status(301)
      |> redirect(to: Routes.article_path(conn, VelorouteWeb.FrameLive, article))
    else
      not_found_redir(conn)
    end
  end

  def article_vs_page(conn, params) do
    conn
    |> put_status(301)
    |> redirect(to: Routes.page_path(conn, VelorouteWeb.FrameLive, params["page"]))
  end

  def old_route_links(conn, %{"suffix" => suffix}) do
    if(String.match?(suffix, ~r/\d+\.(gpx|kml)$/)) do
      conn
      |> put_status(301)
      |> redirect(to: "/geo/" <> suffix)
    else
      not_found_redir(conn)
    end
  end

  def redir_plain_veloroute(conn, _params) do
    with [[_path, route]] <- Regex.scan(~r/^\/([1-9]|10|11|12|13|14)/, conn.request_path) do
      path = "/alltagsroute-#{route}"
      path = if(conn.query_string != "", do: path <> "?" <> conn.query_string, else: path)

      conn
      |> put_status(302)
      |> redirect(to: path)
    else
      _ ->
        not_found_redir(conn)
    end
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

  defp not_found_redir(conn) do
    home = Routes.startpage_url(conn, VelorouteWeb.FrameLive, not_found: true)

    conn
    |> put_status(404)
    |> html("""
       <meta http-equiv="refresh" content="0; URL=#{home}">
       Seite nicht gefunden, leite zur Startseite...
    """)
  end
end
