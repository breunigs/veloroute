defmodule Mapillary do
  require Logger

  @precision 6

  @cache_path String.to_atom("data/cache/mapillary.dets")

  # 176 = 22*8
  @type ref() :: <<_::176>>
  defguard is_ref(x) when is_binary(x) and byte_size(x) == 22
  # TODO: move to central place so it can be shared more easily
  @type img() :: %{img: ref(), lat: float(), lon: float(), bearing: float(), seq: ref()} | nil

  use Tesla

  defp key(), do: Credentials.mapillary_api_key()

  plug Tesla.Middleware.BaseUrl, "https://a.mapillary.com/v3"
  plug Tesla.Middleware.Headers, [{"Content-Type", "application/json"}]
  plug Tesla.Middleware.Query, client_id: key()
  plug Tesla.Middleware.JSON
  # for debugging help
  # plug Tesla.Middleware.Logger

  plug Tesla.Middleware.Retry,
    delay: 500,
    max_retries: 3,
    should_retry: fn
      {:ok, %{status: status}} when status >= 500 -> true
      {:ok, _} -> false
      {:error, _} -> true
    end

  @spec close_to(img() | ref(), [ref()]) :: any()
  def close_to(img, sequences \\ [])

  def close_to(img, sequences) when is_ref(img) do
    close_to(image_lookup(img), sequences)
  end

  def close_to(%{img: img, lon: lon, lat: lat}, sequences) do
    sequences
    |> Enum.sort()
    |> Stream.chunk_every(10)
    |> Stream.flat_map(fn sequences ->
      seq_strs = Enum.join(sequences, ",")
      radius = 15
      pp = 10

      lazy("close-to-#{pp}-#{radius}-#{img}-#{seq_strs}-v3", fn ->
        IO.write("~")

        query = [closeto: "#{lon},#{lat}", radius: radius, per_page: pp]

        query = if sequences == [], do: query, else: Keyword.put(query, :sequence_keys, seq_strs)

        {:ok, %{status: 200} = resp} = get("/images", query: query)

        resp.body["features"]
        |> Enum.map(&parse_mapillary_image/1)
      end)
    end)
  end

  @spec resolve(%{required(binary()) => ref()}) :: [img()]
  def resolve(%{"seq" => seq, "from" => from, "to" => to} = attr)
      when is_ref(seq) and is_ref(from) and is_ref(to) do
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
    %{img: ^to} = List.last(result)

    result
  end

  @spec resolve(ref()) :: [img()]
  def resolve(img) when is_ref(img) do
    [image_lookup(img)]
  end

  def img_url(img, size \\ 1024) when size in [320, 640, 1024, 2048] do
    "https://images.mapillary.com/#{img}/thumb-#{size}.jpg"
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
            # ensure we're passing floats
            bearing = get_in(data, ["cca", "value"]) / 1
            lon = get_in(data, ["cl", "value", "lon"]) / 1
            lat = get_in(data, ["cl", "value", "lat"]) / 1
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
        Enum.slice(keys, fromIdx, toIdx - fromIdx + 1)
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

  defp image_lookup(img) when is_ref(img) do
    lazy("img-#{img}", fn ->
      {:ok, %{status: 200} = resp} = get("/images/#{img}")
      parse_mapillary_image(resp.body)
    end)
  end

  defp parse_mapillary_image(%{} = m) do
    lon = m["geometry"]["coordinates"] |> Enum.at(0)
    lat = m["geometry"]["coordinates"] |> Enum.at(1)
    img = m["properties"]["key"]
    bearing = m["properties"]["ca"]
    seq = m["properties"]["sequence_key"]

    # ensure we're passing floats
    %{img: img, lon: lon / 1, lat: lat / 1, bearing: bearing / 1, seq: seq}
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
