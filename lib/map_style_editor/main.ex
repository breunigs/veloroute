defmodule MapStyleEditor.Main do
  @container_ref {"map style editor", {:dockerfile, "lib/map_style_editor/Dockerfile.editor"}}

  @dirname "map_style_editor"
  def path, do: "data/cache/#{@dirname}"

  def build do
    Util.Docker.build_and_run(
      @container_ref,
      %{command_args: ["cp", "-r", "/editor/.", "/workdir/#{@dirname}"]},
      []
    )
  end

  def serve(style: style, port: port) when is_binary(style) do
    build()

    {:ok, _pid} = MapStyleEditor.Tracker.start_link(style)
    {:ok, _pid} = Plug.Cowboy.http(MapStyleEditor.Server, [], port: port, dispatch: dispatch())

    url(port)
  end

  def url(port) do
    pos = Settings.bounds() |> Geo.BoundingBox.parse() |> Geo.CheapRuler.bounds_to_center_zoom()
    "http://localhost:#{port}##{pos.zoom}/#{pos.lat}/#{pos.lon}"
  end

  defp dispatch() do
    [
      {:_,
       [
         {"/ws", MapStyleEditor.WebSocket, %{}},
         {:_, Plug.Cowboy.Handler, {MapStyleEditor.Server, []}}
       ]}
    ]
  end
end
