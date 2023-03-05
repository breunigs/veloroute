defmodule Basemap.Styles do
  use Basemap.Renderable
  use Basemap.Servable

  def source(), do: "assets/map/styles"

  @impl Basemap.Renderable
  def stale?(), do: Util.IO.stale?(assets_path(), [source()])

  @impl Basemap.Renderable
  def render() do
    Enum.each(list(), fn path ->
      with {:ok, data} <- File.read(path),
           # Always hardcode production URL here, since the active components of
           # the devel servers can replace the URL. For production, we want to
           # be able to directly serve these static files, though.
           data = Basemap.RelativePath.hardcode(data, Settings.url()),
           data = attribute(data),
           {:ok, decoded} <- Jason.decode(data),
           {:ok, minified} <- Jason.encode(decoded),
           target <- assets_path(Path.relative_to(path, source())),
           :ok <- File.mkdir_p(Path.dirname(target)),
           :ok <- File.write(target, minified) do
        Util.Compress.file_glob(assets_path("**/*.json"), true, "basemap styles")
        :ok
      else
        error -> IO.puts(:stderr, "failed to minifiy JSON from #{path}: #{inspect(error)}")
      end
    end)
  end

  def list() do
    Path.join([source(), "**", "*.json"])
    |> Path.wildcard()
    |> Enum.sort()
  end

  defp attribute(data) do
    Enum.reduce(Esri.Tiles.attribution(:from_api), data, fn {key, text}, data ->
      # encode as string but strip the quotes
      text = text |> Jason.encode!() |> String.slice(1..-2)
      String.replace(data, "%%ATTRIBUTION#{key}%%", text)
    end)
  end
end
