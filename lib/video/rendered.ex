defmodule Video.Rendered do
  # TODO ideally this would be the type of a class implementing the behaviour
  @type t() :: module()

  @autogen_module_name 'Elixir.Data.AutoGenerated.Video.Rendered_'
  @autogen_file_path "data/auto_generated/video"

  @concat_tool "./tools/video_concat.rb"
  @inaccurate_concat ["INACCURATE_CUTS=1", @concat_tool]
  @anonymizing_concat ["ANONYMIZE=1", @concat_tool]

  import Video.Track, only: [valid_hash: 1]

  @doc """
  Return a list of all known videos, including the ones without video material
  available.
  """
  @spec all() :: [t()]
  def all() do
    :code.all_available()
    |> Enum.map(&elem(&1, 0))
    |> Enum.filter(&List.starts_with?(&1, @autogen_module_name))
    |> Enum.map(&List.to_atom/1)
    |> Enum.sort()
  end

  @doc """
  Tries to find a fully rendered video for the given hash or track. It returns
  nil if the hash is invalid, the video cannot be found or has not been rendered
  yet. Note that you need to recompile if videos were rendered in the meantime.
  """
  @spec get(Video.Track.t() | Video.Track.hash() | module()) :: t() | nil
  def get(nil), do: nil

  def get(hash) when valid_hash(hash) do
    rendered() |> Enum.find(fn mod -> String.ends_with?("#{mod}", hash) end)
  end

  def get(module) when is_atom(module), do: if(module.rendered?(), do: module, else: nil)

  def get(%Video.Track{videos: videos}) do
    Enum.find(all(), fn rendered -> rendered.sources() == videos end)
  end

  def get(_any), do: nil

  @doc """
  Return a list of all videos which have video material available.
  """
  @spec rendered() :: [t()]
  def rendered() do
    all() |> Enum.filter(& &1.rendered?())
  end

  @doc """
  Return a list of all videos for which video material still needs to be generated.
  """
  @spec pending() :: [t()]
  def pending() do
    all() |> Enum.reject(& &1.rendered?())
  end

  @doc """
  Returns the command needed to render the given video(s) in streamable resolutions
  """
  @spec render(t()) :: [binary()]
  def render(rendered) do
    concat =
      Enum.reduce(rendered.sources(), @anonymizing_concat, fn {path, from, to}, cmd ->
        path = Video.Path.source_rel_to_cwd(path)
        cmd ++ [path, from, to]
      end)

    concat ++
      [
        "|",
        "./tools/video_convert_streamable.rb",
        Video.Path.target_rel_to_cwd(rendered.hash()),
        "#{rendered.length_ms()}"
      ]
  end

  @doc """
  Returns the commands to preview the given video(s). The first item previews
  everything, the following ones just the individual concatting points.
  """
  def preview(rendered, gap_buffer_ms \\ 5_000) do
    player = [
      "|",
      "mpv",
      "--pause",
      "--no-resume-playback",
      "--framedrop=no",
      "--audio=no",
      "--keep-open=yes",
      "--demuxer-max-bytes=10G",
      "--force-seekable=yes",
      "-"
    ]

    concats =
      rendered.sources
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.map(fn [{path1, _from1, to1}, {path2, from2, _to2}] ->
        path1 = Video.Path.source_rel_to_cwd(path1)
        path2 = Video.Path.source_rel_to_cwd(path2)

        from = to1 |> Video.Timestamp.add_milliseconds(-1 * gap_buffer_ms)
        to = from2 |> Video.Timestamp.add_milliseconds(gap_buffer_ms)

        [@concat_tool, path1, from, to1, path2, from2, to] ++ player
      end)

    full =
      Enum.reduce(rendered.sources, @inaccurate_concat, fn {path, from, to}, cmd ->
        path = Video.Path.source_rel_to_cwd(path)
        cmd ++ [path, from, to]
      end) ++ player

    [full] ++ concats
  end

  @doc """
  Returns the path to the autogenerated video metadata for the given TSV or
  rendered module itself.
  """
  @spec path(Video.Track.hash() | t()) ::
          binary() | {:error, binary()}
  def path(hash) when valid_hash(hash) do
    Path.join(@autogen_file_path, "#{hash}.ex")
  end

  def path(module) when is_atom(module) do
    prefix_as_str = to_string(@autogen_module_name)
    mod_as_str = to_string(module)

    if String.starts_with?(mod_as_str, prefix_as_str) do
      hash = String.replace_prefix(mod_as_str, prefix_as_str, "")
      path(hash)
    else
      {:error, "#{module} is not a Rendered instance"}
    end
  end

  @doc """
  Render the given trimmed sequence as a rendered video, then save it to disk
  at the matching path.
  """
  @spec save_from_track(Video.Track.t()) ::
          :ok | {:error, binary()} | {:error, list(), list()}
  def save_from_track(track) do
    {hash, coords} = Video.Track.render(track)
    path = path(hash)

    name =
      cond do
        is_binary(track.parent_ref) ->
          "#{track.parent_ref}: #{track.text}"

        is_atom(track.parent_ref) && !is_nil(track.parent_ref) ->
          "#{track.parent_ref.name()}: #{track.text}"

        true ->
          track.text
      end

    with content <- as_code(name, hash, track.videos, coords),
         :ok <- File.write(path, content),
         {:ok, _modules, _warnings} <- Kernel.ParallelCompiler.compile([path], []) do
      module_name(hash)
    end
  end

  @spec module_name(Video.Track.hash()) :: module()
  def module_name(hash) when valid_hash(hash) do
    :"#{to_string(@autogen_module_name)}#{hash}"
  end

  defp as_code(name, hash, sources, coords) do
    length_ms = coords |> List.last() |> Map.fetch!(:time_offset_ms)
    rendered = Video.Path.fully_rendered?(hash)

    quote do
      defmodule unquote(module_name(hash)) do
        @moduledoc """
        #{unquote(name)}

        AUTOGENERATED. To update this file, run mix velo.videos.generate.
        See Video.Rendered for functionality.
        """

        @behaviour Video.Rendered

        @impl Video.Rendered
        def name(), do: unquote(name)
        @impl Video.Rendered
        def hash(), do: unquote(hash)
        @impl Video.Rendered
        def length_ms(), do: unquote(length_ms)
        @impl Video.Rendered
        def sources(), do: unquote(sources)
        @impl Video.Rendered
        def coords(), do: unquote(coords)
        @impl Video.Rendered
        def rendered?(), do: unquote(rendered)
      end
    end
    |> Macro.to_string()
    |> Code.format_string!()
  end

  @callback name() :: binary()
  @callback hash() :: binary()
  @callback length_ms() :: integer()
  @callback sources() :: Video.Track.plain()
  @callback coords() :: [Video.TimedPoint.t()]
  @callback rendered?() :: boolean()
  @doc """
  Outputs the timestamps and coordinates as an iolist, suitable to be passed to the
  frontend for displaying the video position. It returns a flat list with the values
  being time_in_seconds, lon, lat for each point, repeated for all coordinates. The
  caller must take care to iterate through this list by incrementing the index by 3.
  The individual values are floats separated by a space. The first three are the
  original values, thereafter it's the difference to the previous value.

  ## Examples

      iex> Video.Rendered.coord_io_list(Video.RenderedTest.Example)
      '0 10044000 53507000 100 -2000 1000 100 -2000 1000 100 -2000 1000 100 -2000 1000'
  """
  @spec coord_io_list(t()) :: iolist()
  def coord_io_list(rendered) do
    rendered.coords
    |> Enum.reduce(
      {%Video.TimedPoint{lon: 0, lat: 0, time_offset_ms: 0}, ''},
      fn curr, {prev, acc} ->
        lon = curr.lon - prev.lon
        lat = curr.lat - prev.lat
        ms = curr.time_offset_ms - prev.time_offset_ms

        coord = ' #{ms} #{round(lon * 1_000_000)} #{round(lat * 1_000_000)}'

        {curr, [acc | coord]}
      end
    )
    |> elem(1)
    |> List.flatten()
    |> tl()
  end

  @spec start_from(t(), Geo.Point.like() | integer() | nil) :: %{
          lat: float(),
          lon: float(),
          bearing: float(),
          time_offset_ms: integer()
        }
  @doc """
  Find the closest point for the video that roughly corresponds to the given
  point or timestmap. If the point is not valid, it returns the start of the
  video.

  ## Examples

      iex> Video.Rendered.start_from(Video.RenderedTest.Example, %{lat: 53.5085, lon: 10.041})
      %{bearing: 310.0161346069299, lat: 53.5085, lon: 10.041000000000002, time_offset_ms: 150}

      iex> last_coord = Video.RenderedTest.Example.coords |> List.last()
      iex> Video.Rendered.start_from(Video.RenderedTest.Example, last_coord)
      %{bearing: 310.01613460713037, lat: last_coord.lat, lon: last_coord.lon, time_offset_ms: last_coord.time_offset_ms}

      iex> Video.Rendered.start_from(Video.RenderedTest.Example, 124)
      %{bearing: 310.0161346069299, lat: 53.50824, lon: 10.04152, time_offset_ms: 124}
  """
  def start_from(rendered, point_or_time)

  def start_from(rendered, nil) do
    [a, b | _rest] = rendered.coords
    Map.put(a, :bearing, Geo.CheapRuler.bearing(a, b))
  end

  def start_from(rendered, time) when is_integer(time) do
    cond do
      time <= 0 ->
        start_from(rendered, nil)

      time >= rendered.length_ms() ->
        [a, b] = rendered.coords() |> Enum.slice(-2..-1)
        Map.put(b, :bearing, Geo.CheapRuler.bearing(a, b))

      true ->
        rendered.coords()
        |> Enum.chunk_every(2, 1, :discard)
        |> Enum.find_value(fn [a, b] ->
          if time >= a.time_offset_ms && time <= b.time_offset_ms do
            t = calc_t(time, a, b)

            Video.TimedPoint.interpolate(a, b, t)
            |> Map.put(:bearing, Geo.CheapRuler.bearing(a, b))
            |> Map.delete(:__struct__)
          end
        end)
    end || start_from(rendered, nil)
  end

  def start_from(rendered, point) do
    %{point: %{lon: lon, lat: lat}, t: t, index: idx} =
      Geo.CheapRuler.closest_point_on_line(rendered.coords, point)

    {idx, time} =
      if idx == length(rendered.coords) - 1 do
        {idx - 1, Enum.at(rendered.coords, idx).time_offset_ms}
      else
        {idx, nil}
      end

    [prev, next] = Enum.slice(rendered.coords, idx..(idx + 1))
    bearing = Geo.CheapRuler.bearing(prev, next)
    time = time || prev.time_offset_ms + t * (next.time_offset_ms - prev.time_offset_ms)

    %{
      lon: lon,
      lat: lat,
      bearing: bearing,
      time_offset_ms: round(time)
    }
  end

  defp calc_t(interp, prev, next),
    do: (interp - prev.time_offset_ms) / (next.time_offset_ms - prev.time_offset_ms)
end
