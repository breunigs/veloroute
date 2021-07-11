defmodule Video.ServePlug do
  use Plug.Builder

  plug Plug.Static,
    at: "/",
    from: :veloroute,
    gzip: false,
    brotli: false,
    headers: %{
      "cache-control" => "public, max-age=31536000, immutable",
      "x-robots-tag" => "noindex"
    },
    only: [Settings.video_serve_path()]

  plug :maybe_not_found

  @serve_path Settings.video_serve_path()
  def maybe_not_found(conn = %{request_path: "/#{@serve_path}/" <> _rest}, _opts) do
    conn
    |> put_resp_content_type("text/html")
    |> put_resp_header("x-robots-tag", "noindex")
    |> send_resp(404, """
    <html lang="de">
    <body>
    <h1>Datei nicht gefunden</h1>
    <p>Die Datei gibt's nicht (mehr). Wenn Du über <a href="#{Settings.url()}">#{Settings.sitebar_name()}</a> auf dieser Fehlerseite gelandet bist, <a href="mailto:#{Settings.email()}">schreib mir bitte</a> wie. Dann kann ich den Fehler evtl. beheben.</p>
    <p><strong><a href="#{Settings.url()}">zur vollständigen Seite</a></strong></p>
    </body>
    </html>
    """)
    |> halt()
  end

  def maybe_not_found(conn, _opts), do: conn
end
