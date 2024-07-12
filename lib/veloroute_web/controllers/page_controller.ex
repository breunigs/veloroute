defmodule VelorouteWeb.PageController do
  use VelorouteWeb, :controller

  require Logger

  def blog(conn, params) do
    conn
    |> put_status(301)
    |> redirect(to: ~p(/article/#{params["article"]}))
  end

  def event(conn, _params) do
    with {:ok, body, _conn} <- Plug.Conn.read_body(conn) do
      Logger.debug("plausible event: #{body}")
    end

    send_resp(conn, 204, "")
  end

  def quality(conn, params) do
    name = Regex.replace(~r/^[0-9-]+/, params["article"], "")

    article =
      Article.List.all()
      |> Stream.filter(&String.ends_with?(&1.name(), name))
      |> Enum.take(1)
      |> List.first()

    if article do
      conn
      |> put_status(301)
      |> redirect(to: Article.Decorators.path(article))
    else
      not_found_redir(conn)
    end
  end

  def article_vs_page(conn, params) do
    conn
    |> put_status(301)
    |> redirect(to: ~p(/#{params["page"]}))

    # |> redirect(to: Routes.page_path(conn, VelorouteWeb.FrameLive, params["page"]))
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

  def old_export_link(conn, params) do
    query = URI.encode_query(params)
    query = if query != "", do: "?" <> query

    conn
    |> put_status(301)
    |> redirect(to: "/datenexport#{query}")
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

  def redir_favicon(conn, _params) do
    size =
      if String.contains?(conn.request_path, "apple-touch-icon") do
        100
      else
        16
      end

    conn |> put_status(301) |> redirect(to: "/favicons/#{size}.png")
  end

  def js_errors(conn, _params) do
    {:ok, data, _conn_details} = Plug.Conn.read_body(conn)
    Logger.error("A JavaScript error was reported:\n#{data}\n#{inspect(conn)}")
    send_resp(conn, 204, "")
  end

  def health(conn, _params) do
    msg = Application.get_env(:veloroute, :health, "ok")
    send_resp(conn, 200, msg)
  end

  defp not_found_redir(conn) do
    home = ~p(/?not_found=true)

    conn
    |> put_status(404)
    |> html("""
       <meta http-equiv="refresh" content="0; URL=#{home}">
       Seite nicht gefunden, leite zur Startseite...
    """)
  end
end
