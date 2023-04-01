defmodule MapStyleEditor.Server do
  @moduledoc """
  HTTP server providing the actual editor, the basemap, the styles and its
  sprites.
  """

  use Plug.Router

  plug Basemap.RelativePath
  plug Esri.Tiles
  plug Maptiler.Tiles

  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, File.read!(Path.join(MapStyleEditor.Main.path(), "index.html")))
  end

  get "/styles" do
    files = [MapStyleEditor.Tracker.style()]
    send_resp(conn, 200, Jason.encode!(files))
  end

  get "/styles/*path" do
    serve_file(conn, Enum.join(path, "/"))
  end

  put "/styles/:name" do
    path = MapStyleEditor.Tracker.style() |> Path.dirname()
    local_path = Path.join(path, name) <> ".json"

    if File.exists?(local_path) do
      {:ok, body, conn} = Plug.Conn.read_body(conn, length: 100_000_000)
      MapStyleEditor.Tracker.update(local_path, body)
      body = replace_host_reverse(conn, body)
      File.write!(local_path, body)
      # update asset outside of normal asset pipeline to allow checking style
      # behaviour on dev server without having to restart it.
      File.cp!(local_path, Basemap.Styles.assets_path("#{name}.json"))
      # IO.puts(:stderr, "saved #{local_path} from web editor")
      send_resp(conn, 201, "Created")
    else
      msg =
        "Tried writing style '#{name}.json', which doesn't exist.\nEnsure style id and filename are equal."

      IO.puts(:stderr, msg)
      send_resp(conn, 404, msg)
    end
  end

  get Basemap.Fonts.serve_path("*path") do
    serve_file(conn, Basemap.Fonts.assets_path(path), Basemap.Fonts.fallback())
  end

  get Basemap.Tiles.serve_path("*path") do
    serve_file(conn, Basemap.Tiles.assets_path(path), Basemap.Tiles.fallback())
  end

  get Basemap.Servable.serve_path("*path") do
    serve_file(conn, Basemap.Servable.assets_path(path))
  end

  match "*path" do
    local_path = Path.join([MapStyleEditor.Main.path() | path])
    serve_file(conn, local_path)
  end

  defp serve_file(conn, path, fallback \\ nil)

  defp serve_file(conn, {:error, reason}, _fallback) do
    IO.puts(:stderr, "invalid path given: #{reason}")
    send_resp(conn, 500, "invalid path given: #{reason}")
  end

  defp serve_file(conn, path, fallback) do
    "." <> ext = Path.extname(path)
    mime_type = MIME.type(ext)
    json = mime_type in ~w(application/json)
    charset = if json, do: "utf-8", else: nil

    conn = put_resp_content_type(conn, mime_type, charset)

    cond do
      File.exists?(path) ->
        content = File.read!(path)

        content = maybe_replace_host(conn, content, ext)
        if json, do: MapStyleEditor.Tracker.update(path, content)

        send_resp(conn, 200, content)

      # serve compressed variants if we deleted the original. Since we don't do
      # content negotiation, simply serve the more supported variant first.
      File.exists?(path <> ".gz") ->
        serve_compressed(conn, path, "gz")

      File.exists?(path <> ".br") ->
        serve_compressed(conn, path, "br")

      fallback ->
        IO.puts(:stderr, "path #{path} not found, using fallback")
        send_resp(conn, 200, fallback)

      true ->
        short = "#{conn.method} #{conn.request_path}"
        short = if conn.query_string != "", do: "#{short}?#{conn.query_string}", else: short

        IO.puts(
          :stderr,
          """
            Style editor to read path which doesn't exist:
            request line: #{short}
            local path:   #{path}
            conn:
            #{inspect(conn)}
          """
        )

        send_resp(conn, 404, "Not found")
    end
  end

  defp serve_compressed(conn, path, ending) do
    content = File.read!(path <> "." <> ending)
    encoding = %{"gz" => "gzip", "br" => "br"}[ending]

    conn
    |> put_resp_header("content-encoding", encoding)
    |> send_resp(200, content)
  end

  defp url(conn), do: "#{conn.scheme}://#{conn.host}:#{conn.port}"

  defp maybe_replace_host(conn, content, "json") do
    Basemap.RelativePath.hardcode(content, url(conn))
  end

  defp maybe_replace_host(_conn, content, _ohter), do: content

  defp replace_host_reverse(conn, content) do
    updated = Basemap.RelativePath.parameterize(content, url(conn))

    if content == updated do
      raise("""
      Expected to find #{url(conn)} in the style saved by the frontend.
      However, no such URL was found. Did you accidentally edit the URL?
      If so, restore it to #{url(conn)} as otherwise the production build
      will break.
      """)
    end

    updated
  end
end
