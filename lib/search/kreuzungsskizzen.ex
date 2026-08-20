defmodule Search.Kreuzungsskizzen do
  @geojson_gz_path "data/cache/kreuzungsskizzen/poldata_lines.geojson.gz"

  def source, do: @geojson_gz_path

  @spec centroids() :: %{binary() => %{lat: float(), lon: float()}}
  def centroids do
    case File.read(@geojson_gz_path) do
      {:ok, gz} ->
        gz
        |> :zlib.gunzip()
        |> JSON.decode!()
        |> Map.fetch!("features")
        |> Enum.group_by(& &1["properties"]["knotennummer"])
        |> Map.new(fn {knoten, features} ->
          {knoten, centroid(features)}
        end)

      {:error, _} ->
        %{}
    end
  end

  defp centroid(features) do
    {sum_lon, sum_lat, count} =
      Enum.reduce(features, {0.0, 0.0, 0}, fn feature, acc ->
        feature["geometry"]["coordinates"]
        |> List.flatten()
        |> Enum.chunk_every(2)
        |> Enum.reduce(acc, fn [lon, lat], {sl, sa, c} ->
          {sl + lon, sa + lat, c + 1}
        end)
      end)

    %{lon: sum_lon / count, lat: sum_lat / count}
  end
end
