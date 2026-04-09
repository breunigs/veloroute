defmodule MapStyleEditor.Main do
  @container_ref {"map style editor", {:dockerfile, "lib/map_style_editor/Dockerfile.editor"}}

  @dirname "map_style_editor"
  def path, do: "data/cache/#{@dirname}"

  def build do
    :ok =
      Util.Docker.build_and_run(
        @container_ref,
        %{command_args: ["cp", "-r", "/editor/.", "/workdir/#{@dirname}"]},
        []
      )
  end

  def serve(style: style, port: port) when is_binary(style) do
    build()

    {:ok, _} = Supervisor.start_child(Veloroute.Supervisor, {MapStyleEditor.Tracker, style})

    {:ok, _} =
      Supervisor.start_child(
        Veloroute.Supervisor,
        {Bandit, plug: MapStyleEditor.Server, port: port}
      )

    url(port)
  end

  def url(port) do
    pos = Settings.r(:bounds) |> Geo.BoundingBox.parse() |> Geo.CheapRuler.bounds_to_center_zoom()
    "http://localhost:#{port}##{pos.zoom}/#{pos.lat}/#{pos.lon}"
  end
end
