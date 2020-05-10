defmodule Mapillary do
  require Logger

  @precision 6

  # mix runs from root directory
  @root_dir File.cwd!()
  @cache_path String.to_atom(@root_dir <> "/data/cache/mapillary.dets")

  use Tesla

  defp key(), do: Data.credentials().mapillary_api_key

  plug Tesla.Middleware.BaseUrl, "https://a.mapillary.com/v3"
  plug Tesla.Middleware.Headers, [{"Content-Type", "application/json"}]
  plug Tesla.Middleware.Query, client_id: key()
  plug Tesla.Middleware.JSON
  # plug Tesla.Middleware.Logger # for debugging help

  plug Tesla.Middleware.Retry,
    delay: 500,
    max_retries: 3,
    should_retry: fn
      {:ok, %{status: status}} when status >= 500 -> true
      {:ok, _} -> false
      {:error, _} -> true
    end

  def resolve(%{"seq" => seq, "from" => from, "to" => to} = attr) do
    rev = Map.get(attr, "reverse", false)

    result =
      image_keys(seq, from, to, reverse: rev)
      |> positional_data
      |> Enum.map(fn data ->
        %{
          data
          | lat: Float.round(data.lat, @precision),
            lon: Float.round(data.lon, @precision),
            bearing: Float.round(data.bearing, @precision)
        }
        |> Map.put(:seq, seq)
      end)

    # assert we don't break ordering
    %{img: ^from} = hd(result)

    result
  end

  defp positional_data(keys) do
    keys
    |> Enum.chunk_every(100)
    |> Enum.flat_map(fn keys ->
      lazy("posdata-#{Enum.join(keys, ",")}", fn ->
        jsonKeys = Jason.encode!(keys)
        query = ~s([["imageByKey",#{jsonKeys},["cca","cl"]]])
        IO.write(".")
        {:ok, %{status: 200} = resp} = get("/model.json", query: [paths: query, method: "get"])

        data =
          resp.body
          |> get_in(["jsonGraph", "imageByKey"])
          |> Enum.map(fn {imgKey, data} ->
            bearing = get_in(data, ["cca", "value"])
            lon = get_in(data, ["cl", "value", "lon"])
            lat = get_in(data, ["cl", "value", "lat"])
            {imgKey, %{img: imgKey, lat: lat, lon: lon, bearing: bearing}}
          end)
          |> Enum.into(%{})

        Enum.map(keys, &data[&1])
      end)
    end)
  end

  defp image_keys(seq, from, to, reverse: rev) do
    keys = image_keys(seq, reverse: rev)
    fromIdx = Enum.find_index(keys, fn x -> x == from end)
    toIdx = Enum.find_index(keys, fn x -> x == to end)

    cond do
      !fromIdx ->
        Logger.error("Sequence #{seq} does not contain image #{from}")
        nil

      !toIdx ->
        Logger.error("Sequence #{seq} does not contain image #{to}")
        nil

      fromIdx > toIdx ->
        Logger.error(
          "Sequence #{seq} appears to be out-of-order 'from #{from}' appears later than 'to #{to}'. Either swap them, or specify 'reverse: false'."
        )

        nil

      true ->
        Enum.slice(keys, fromIdx, toIdx - fromIdx)
    end
  end

  defp image_keys(seq, reverse: true) do
    image_keys(seq, reverse: false) |> Enum.reverse()
  end

  defp image_keys(seq, reverse: false) do
    lazy("seq-#{seq}", fn ->
      IO.write(":")
      {:ok, %{status: 200} = resp} = get("/sequences/#{seq}")
      get_in(resp.body, ["properties", "coordinateProperties", "image_keys"])
    end)
  end

  defp lazy(cache_key, func) do
    :dets.lookup(cache(), cache_key)
    |> case do
      [{^cache_key, res}] ->
        res

      _ ->
        res = func.()
        if res, do: :dets.insert_new(cache(), {cache_key, res})
        res
    end
  end

  defp cache do
    {:ok, table} = :dets.open_file(:mapillary, file: @cache_path, type: :set)
    table
  end
end
