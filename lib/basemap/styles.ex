defmodule Basemap.Styles do
  use Basemap.Renderable
  use Basemap.Servable

  def source(), do: "assets/map/styles"

  @impl Basemap.Renderable
  def stale?(), do: Util.IO.stale?(assets_path(), [source()])

  @impl Basemap.Renderable
  def render() do
    Enum.each(list(), fn path ->
      # serving
      # Always hardcode production URL here, since the active components of the
      # devel servers can replace the URL. For production, we want to be able to
      # directly serve these static files, though.
      case write(path, Settings.url()) do
        :ok -> Util.Compress.file_glob(assets_path("**/*.json"), true, "basemap styles")
        {:error, reason} -> IO.puts(:stderr, reason)
      end

      # local rendering
      localizer = fn data ->
        data
        |> String.replace("metadata.json", "metadata.json.local")
        |> String.replace(".pbf", ".pbf.gz")
      end

      case write(path, "asset://", ".local", localizer) do
        :ok -> :ok
        {:error, reason} -> IO.puts(:stderr, reason)
      end
    end)
  end

  defp write(path, hardcode_url, suffix \\ "", modifier \\ & &1) do
    with {:ok, data} <- File.read(path),
         data = Basemap.RelativePath.hardcode(data, hardcode_url),
         data = attribute(data),
         data = modifier.(data),
         {:ok, decoded} <- Jason.decode(data),
         {:ok, minified} <- Jason.encode(decoded),
         target <- assets_path(Path.relative_to(path, source())),
         :ok <- File.mkdir_p(Path.dirname(target)),
         :ok <- File.write(target <> suffix, minified) do
      :ok
    else
      error -> {:error, "failed to minifiy JSON from #{path}: #{inspect(error)}"}
    end
  end

  def list() do
    Path.join([source(), "**", "*.json"])
    |> Path.wildcard()
    |> Enum.sort()
  end

  defp attribute(data) do
    Enum.reduce(Esri.Tiles.attribution(:from_api), data, fn {key, text}, data ->
      # encode as string but strip the quotes
      text = text |> Jason.encode!() |> String.slice(1..-2//1)
      String.replace(data, "%%ATTRIBUTION#{key}%%", text)
    end)
  end
end
