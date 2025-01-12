defmodule Video.ServePlug do
  use Plug.Builder
  require Settings

  @serve_path Settings.c(:video_serve_path)

  plug Plug.Static,
    at: "/#{@serve_path}",
    from: Settings.c(:video_target_dir_rel),
    gzip: false,
    brotli: false,
    headers: %{
      "cache-control" => "public, max-age=31536000, immutable"
    }

  plug :maybe_not_found

  def maybe_not_found(%{request_path: "/#{@serve_path}/" <> _rest} = conn, _opts) do
    conn
    |> put_resp_content_type("text/html")
    |> put_resp_header("x-robots-tag", "noindex")
    |> send_resp(404, """
    <html lang="de">
    <body>
    <h1>Datei nicht gefunden</h1>
    <p>Die Datei gibt's nicht (mehr). Wenn Du über <a href="#{Settings.r(:url)}">#{Settings.r(:sitebar_name)}</a> auf dieser Fehlerseite gelandet bist, <a href="mailto:#{Settings.r(:email)}">schreib mir bitte</a> wie. Dann kann ich den Fehler evtl. beheben.</p>
    <p><strong><a href="#{Settings.r(:url)}">zur vollständigen Seite</a></strong></p>
    </body>
    </html>
    """)
    |> halt()
  end

  def maybe_not_found(conn, _opts), do: conn
end
