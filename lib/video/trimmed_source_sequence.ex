defmodule Video.TrimmedSourceSequence do
  @valid_single_way_types ["detour", "article"]

  @known_params [
    :tsvs,
    :hash
  ]

  @enforce_keys @known_params
  defstruct @known_params

  @type t :: %__MODULE__{}

  @debug true
  @enum_lib if @debug, do: Enum, else: Parallel

  @spec new_from_tsv_list([Video.TrimmedSource.t()]) :: t()
  def new_from_tsv_list(tsv_list) when is_list(tsv_list) do
    hash = calc_hash(tsv_list)
    %__MODULE__{tsvs: tsv_list, hash: hash}
  end

  @spec maybe_hash_from_way(Map.Way.t(), :forward | :backward) :: binary() | nil
  def maybe_hash_from_way(%Map.Way{} = way, direction) do
    tsv_seq = maybe_from_way(way, direction)
    if tsv_seq, do: tsv_seq.hash, else: nil
  end

  @spec maybe_from_way(Map.Way.t(), :forward | :backward) :: t() | nil
  def maybe_from_way(%Map.Way{} = way, direction)
      when direction == :forward or direction == :backward do
    new_from_way(way, direction)
    |> case do
      {:ok, tsv_seq} ->
        if already_rendered?(tsv_seq),
          do: tsv_seq,
          else: nil

      {:no_video, _error} ->
        nil

      {:invalid_type, err} ->
        IO.warn(err)
        nil
    end
  end

  def new_from_way(%Map.Way{tags: %{type: type}} = way, direction)
      when type in @valid_single_way_types do
    cond do
      has_video_for?(way, direction) ->
        {:ok,
         way
         |> Video.TrimmedSource.new_from_way(direction)
         |> List.wrap()
         |> new_from_tsv_list()}

      has_any_video?(way) ->
        {:no_video,
         "way id=#{way.id} does not seem to have video for the desired #{direction} direction"}

      true ->
        {:no_video, "way id=#{way.id} does not seem to have video associated"}
    end
  end

  # handle error scenarios where the type is not a supported video ones
  def new_from_way(%Map.Way{} = way, _direction) do
    if(has_any_video?(way)) do
      {:invalid_type,
       "way id=#{way.id} references some videos, but doesn't have a valid type (#{inspect(way.tags)})"}
    else
      {:no_video, "way id=#{way.id} does not seem to have video associated"}
    end
  end

  defp has_video_for?(way, direction) do
    is_binary(way.tags[:"video_#{direction}"])
  end

  defp has_any_video?(way) do
    has_video_for?(way, :forward) || has_video_for?(way, :backward)
  end

  @spec list_from_map(struct()) :: [t()]
  @doc """
  Extracts all video references from the Map.Parsed
  """
  def list_from_map(%Map.Parsed{} = map) do
    map
    |> collect_all()
    |> uniq()
  end

  @spec uniq([t()]) :: [t()]
  @doc """
  Takes a list of TSV Sequences and removes any duplicates
  """
  def uniq(list_of_tsv_seqs) when is_list(list_of_tsv_seqs) do
    Enum.uniq_by(list_of_tsv_seqs, & &1.hash)
  end

  def already_rendered?(%__MODULE__{} = tsv_seq) do
    tda = target_dir_abs(tsv_seq)
    File.dir?(tda) && File.exists?(Path.join(tda, "stream.m3u8"))
  end

  defp collect_all(%Map.Parsed{ways: ways, relations: relations}) do
    [collect_relations(relations), collect_single_ways(ways)]
    |> List.flatten()
    |> Enum.reject(&is_nil/1)
  end

  defp collect_single_ways(ways) do
    ways
    |> Map.values()
    |> Enum.flat_map(fn way ->
      [new_from_way(way, :forward), new_from_way(way, :backward)]
    end)
    |> Enum.reduce([], fn
      {:ok, tsv}, acc -> [tsv | acc]
      {_err, _err_msg}, acc -> acc
    end)
  end

  # Find relations that specify a video_folder, then generate tsv_seqs for each
  # of their tracks.
  @max_video_segment_length_seconds 30
  defp collect_relations(rels) do
    tsvs =
      Settings.video_source_dir_abs()
      |> Video.TrimmedSource.new_from_folder()
      |> Enum.flat_map(&Video.TrimmedSource.split_every(&1, @max_video_segment_length_seconds))

    rels
    |> Enum.filter(fn {_id, rel} -> Map.has_key?(rel.tags, :video_folders) end)
    |> @enum_lib.flat_map(fn {_id, rel} ->
      allowed = rel.tags.video_folders |> String.split(" ") |> Enum.uniq()

      filtered_tsv =
        tsvs
        |> Enum.filter(fn tsv ->
          Enum.any?(allowed, &String.starts_with?(tsv.source_path_rel, &1))
        end)

      warn_if_no_videos(rel, filtered_tsv)

      rel
      |> TrackFinder.ordered()
      |> TrackFinder.with_nodes()
      |> @enum_lib.map(&match_track(&1, filtered_tsv))
    end)
  end

  defp sort_by_matchiness(tsvs, coord, bearing, prev_tsv) do
    Enum.sort_by(tsvs, &Video.TrimmedSource.matchiness(&1, coord, bearing, prev_tsv))
  end

  # maximum distance between two consecutive source way nodes
  @source_segment_max_dist 25
  # maximum distance meters the segment's start and the found video may be apart
  @source_and_cut_max_dist 100

  defp match_track(track, tsvs) do
    Benchmark.measure("match #{track.full_name}", fn ->
      match_track_real(track, tsvs)
    end)
  end

  @auto_connect_threshold_ms 1_000
  @discard_threshold_ms 150
  defp match_track_real(track, tsvs) do
    [first | rest] = Geo.CheapRuler.max_segment_length(track.nodes, @source_segment_max_dist)

    close =
      Enum.reduce(rest, {first, nil, []}, fn
        coord, {prev_coord, prev_bearing, acc} ->
          bearing = Geo.CheapRuler.bearing(prev_coord, coord)
          prev_tsv = List.first(acc)
          sorted_tsvs = sort_by_matchiness(tsvs, prev_coord, bearing, prev_tsv)

          cut =
            sorted_tsvs
            |> Stream.take(10)
            |> Stream.map(fn tsv ->
              Video.TrimmedSource.cut(tsv, prev_coord, coord, prev_bearing, bearing, prev_tsv)
            end)
            |> Stream.filter(&is_struct(&1, Video.TrimmedSource))
            |> Stream.filter(fn tsv ->
              Geo.CheapRuler.dist(hd(tsv.coords), coord) < @source_and_cut_max_dist
            end)
            |> Stream.take(1)
            |> Enum.at(0)

          cond do
            cut == nil ->
              # i.e. ignore the current node, keep the previous one until
              # we can find a match.
              {coord, bearing, acc}

            cut.to == cut.original_duration ->
              # If we read to the end of a TSV, there is a chance our way segment
              # actually extends past it. To avoid gaps, we calculate where we
              # left off in the way and try to resume from there.
              coord =
                [prev_coord, coord]
                |> Geo.CheapRuler.closest_point_on_line(List.last(cut.coords))
                |> Map.fetch!(:point)

              {coord, bearing, [cut | acc]}

            true ->
              # Found a non-edge case segment, continue with the same node we used
              # to find our end. Changing the nodes causes gaps or overlaps.
              {coord, bearing, [cut | acc]}
          end
      end)
      |> elem(2)
      |> Enum.reverse()
      |> Video.TrimmedSource.simplify(@auto_connect_threshold_ms, @discard_threshold_ms)

    trackpts = fn coords ->
      Enum.map(coords, fn coord ->
        """
          <trkpt lat="#{coord.lat}" lon="#{coord.lon}"></trkpt>
        """
      end)
      |> Enum.join("\n")
    end

    xxx =
      Enum.map(Enum.with_index(close), fn {tsv, idx} ->
        """
          <trk>
             <name>#{idx} #{tsv.source_path_rel} || #{tsv.from} → #{tsv.to}</name>
            <trkseg>#{trackpts.(tsv.coords)}</trkseg>
          </trk>
        """
      end)
      |> Enum.join("\n")

    File.write(
      "/tmp/#{track.full_name}.gpx",
      String.trim("""
          <?xml version="1.0" encoding="UTF-8"?>
          <gpx creator="gopro2gpx" version="1.1" xmlns="http://www.topografix.com/GPX/1/1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd">
            #{xxx}
          </gpx>
      """)
    )

    nil
  end

  defp warn_if_no_videos(rel, filtered_tsv) do
    if length(filtered_tsv) == 0,
      do:
        IO.warn(
          "Relation #{inspect(rel.tags)} has no source videos. Is the folder name correct and relative to #{Settings.video_source_dir_abs()}? Is the video directory mounted?"
        )
  end

  defp calc_hash(tsv_list) when is_list(tsv_list) do
    tsv_list
    |> Enum.map(&Video.TrimmedSource.to_str(&1))
    |> Enum.reduce(:crypto.hash_init(:md5), fn str, hsh ->
      :crypto.hash_update(hsh, str)
    end)
    |> :crypto.hash_final()
    |> Base.encode16(case: :lower)
  end

  @concat_tool "./tools/video_concat.rb"
  @doc """
  Returns the command to concatenate the given video(s) and output them to stdout.
  """
  def concat(%__MODULE__{tsvs: tsvs}) do
    tsvs
    |> Enum.reduce([@concat_tool], fn tsv, cmd ->
      path = Video.TrimmedSource.cwd_to_anonymized_path(tsv)
      cmd ++ [path, tsv.from, tsv.to]
    end)
  end

  @doc """
  Returns the commands to preview the given video(s). The first item previews
  everything, the following ones just the individual concatting points.
  """
  def preview(%__MODULE__{tsvs: tsvs}, gap_buffer_ms \\ 5_000) do
    player = [
      "|",
      "mpv",
      "--pause",
      "--no-resume-playback",
      # "--speed=0.5",
      "--framedrop=no",
      "--keep-open=yes",
      "--demuxer-max-bytes=500M",
      "-"
    ]

    concats =
      tsvs
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.map(fn [tsv1, tsv2] ->
        path1 = Video.TrimmedSource.cwd_to_source_path(tsv1)
        path2 = Video.TrimmedSource.cwd_to_source_path(tsv2)

        from = tsv1.to |> Video.Timestamp.add_milliseconds(-1 * gap_buffer_ms)
        to = tsv2.from |> Video.Timestamp.add_milliseconds(gap_buffer_ms)

        [@concat_tool, path1, from, tsv1.to, path2, tsv2.from, to] ++ player
      end)

    full =
      Enum.reduce(tsvs, [@concat_tool], fn tsv, cmd ->
        path = Video.TrimmedSource.cwd_to_source_path(tsv)
        cmd ++ [path, tsv.from, tsv.to]
      end) ++ player

    [full] ++ concats
  end

  @doc """
  Returns a list of time offsets in milliseconds, relative to the beginning of
  the trimmed and concatenated video and their corresponding lat/lon coordinates.
  """
  def coords(%__MODULE__{} = tsv_seq) do
    tsv_seq.tsvs
    |> Enum.reduce({0, []}, fn tsv, {prev_time_offset_ms, acc} ->
      [%{time_offset_ms: cur_time_offset_ms} | _rest] = tsv.coords

      coords =
        Enum.map(
          tsv.coords,
          &Map.put(
            &1,
            :time_offset_ms,
            &1.time_offset_ms - cur_time_offset_ms + prev_time_offset_ms
          )
        )

      prev_time_offset_ms = List.last(coords).time_offset_ms
      {prev_time_offset_ms, acc ++ coords}
    end)
    |> elem(1)
  end

  @doc """
  Returns the command needed to render the given video(s) in streamable resolutions
  """
  def render(%__MODULE__{} = tsv_seq) do
    concat(tsv_seq) ++
      ["|", "./tools/video_convert_streamable.rb", target_dir_abs(tsv_seq), "#{size(tsv_seq)}"]
  end

  @doc """
  Returns the combined size in bytes of all input files
  """
  def size(%__MODULE__{tsvs: tsvs}) do
    Enum.reduce(tsvs, 0, fn tsv, acc ->
      file = Video.TrimmedSource.abs_path(tsv)

      with {:ok, %{size: size}} <- File.stat(file) do
        acc + size
      else
        _ ->
          acc
      end
    end)
  end

  defp target_dir_abs(%__MODULE__{hash: hash}),
    do: Path.join(Settings.video_target_dir_abs(), hash)
end
