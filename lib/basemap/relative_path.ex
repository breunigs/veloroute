defmodule Basemap.RelativePath do
  @moduledoc """
  Vector Tiles require absolute URLs almost everywhere. However, for projects
  this tiny, setting up an out-of-bands tile server makes no sense. Thus we
  would like to update tiles alongside our normal assets.

  For production, our source of truth is in Settings.url(). For development,
  it's either in the config/dev.exs for VelorouteWeb.Endpoint, or the hardcoded
  ports for the style editor in Mix.Tasks.Velo.Map.Style.Edit.

  The general strategy is: use the placeholder in all source files not written
  in Elixir, which is the tile generator's config.json and all the different
  styles.json. When generating the assets, hardcode the production URL so that
  we can serve these static files later directly from the server, without
  passing through Elixir code. For devel environments, both the placeholder and
  the hardcoded production URL are replace with the current host upon
  reading/serving the files.
  """

  require Logger

  def hardcode(input, url) when is_binary(input) and is_binary(url) do
    input =
      Enum.reduce(Basemap.Servable.list(), input, fn servable, input ->
        name = String.upcase(servable.name())
        url = servable.serve_url(url)
        String.replace(input, "%%URL_#{name}%%", url)
      end)

    # replace URL for dynamic invocations even if we hardcoded the production URL during asset generation
    if url == Settings.url(), do: input, else: String.replace(input, Settings.url(), url)
  end

  def parameterize(input, url \\ Settings.url()) when is_binary(input) and is_binary(url) do
    Enum.reduce(Basemap.Servable.list(), input, fn servable, input ->
      name = String.upcase(servable.name())
      url = servable.serve_url(url)
      String.replace(input, url, "%%URL_#{name}%%")
    end)
  end

  @behaviour Plug

  @impl Plug
  def init(_opts), do: []

  @serve_path Basemap.Servable.serve_path()
  @impl Plug
  def call(%Plug.Conn{request_path: @serve_path <> rest} = conn, _opts) do
    with true <- String.ends_with?(conn.request_path, ".json"),
         path <- Basemap.Servable.assets_path(rest),
         {:ok, data} <- File.read(path) do
      conn
      |> Plug.Conn.put_resp_content_type(MIME.type("json"))
      |> Plug.Conn.send_resp(200, hardcode(data, url(conn)))
      |> Plug.Conn.halt()
    else
      false ->
        # i.e. not a JSON
        conn

      error ->
        Logger.info("basemap path modify failed for #{conn.request_path}: #{inspect(error)}")
        conn
    end
  end

  def call(conn, _opts), do: conn

  defp url(conn), do: "#{conn.scheme}://#{conn.host}:#{conn.port}"
end
