defmodule Video.TrimmedSourceSequence do
  @valid_single_way_types ["detour", "article"]

  @known_params [
    :name,
    :tsvs,
    :hash
  ]

  @enforce_keys @known_params
  defstruct @known_params

  @type t :: %__MODULE__{}
  # 32*8=256
  @type hash :: <<_::256>>
  defguard valid_hash(str) when is_binary(str) and byte_size(str) == 32

  # specify a track name to debug here, or false for none
  # @debug false
  # TODO: why is the first bit missing at Roedingsmarkt? Maybe just have simplify take a video from the start if it's "close enough" as well
  # TODO: why is the section around weidenstieg missing completely?
  # @debug "Innenstadt nach Eidelstedt"
  @debug "velo2_2021"
  @enum_lib if @debug, do: Enum, else: Parallel

  @spec new_from_tsv_list([Video.TrimmedSource.t()], binary()) :: t()
  def new_from_tsv_list(tsv_list, name) when is_list(tsv_list) do
    hash = calc_hash(tsv_list)
    %__MODULE__{tsvs: tsv_list, hash: hash, name: name}
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
        tsv_seq

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
         |> new_from_tsv_list("single way #{type} (#{direction}): #{way.tags[:name]}")}

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
      |> @enum_lib.map(&match_track_measure(&1, filtered_tsv))
    end)
  end

  defp match_track_measure(track, tsvs) do
    Benchmark.measure("match #{track.full_name}", fn ->
      match_track(track, tsvs)
    end)
  end

  @doc """
  Given a track and list of trimmed source videos, it will try to find the closest match
  of them to the track.
  """
  # maximum distance between two consecutive source way nodes
  @source_segment_max_dist 25
  # maximum distance meters the segment's start and the found video may be apart
  # @source_and_cut_max_dist 100
  def match_track(%{} = track, tsvs) do
    [first | rest] = Geo.CheapRuler.max_segment_length(track.nodes, @source_segment_max_dist)

    Enum.reduce(rest, {first, nil, []}, fn
      coord, {prev_coord, prev_bearing, acc} ->
        bearing = Geo.CheapRuler.bearing(prev_coord, coord)
        prev_tsv = List.first(acc)

        cut =
          tsvs
          |> Enum.map(fn tsv ->
            Video.TrimmedSource.cut(tsv, prev_coord, coord, prev_bearing, bearing, prev_tsv)
          end)
          |> Enum.filter(&is_struct(&1, Video.TrimmedSource))
          |> Enum.sort_by(fn tsv ->
            dist_start = Geo.CheapRuler.dist(tsv.coord_from, prev_coord)
            dist_end = Geo.CheapRuler.dist(tsv.coord_to, coord)
            same_video = Video.TrimmedSource.same?(prev_tsv, tsv)
            ended = prev_tsv && Video.TrimmedSource.reaches_end_of_video?(prev_tsv)
            consecutive = !same_video && Video.TrimmedSource.consecutive?(prev_tsv, tsv)

            (dist_start + dist_end) / 2 +
              if(same_video && !ended, do: -25, else: 0) +
              if(ended && consecutive, do: -10, else: 0)
          end)
          |> Enum.at(0)

        excessively_far_away = cut && Geo.CheapRuler.dist(cut.coord_from, coord) > 100

        cond do
          cut == nil || excessively_far_away ->
            # i.e. ignore the current node, keep the previous one until
            # we can find a match.
            if @debug, do: IO.puts("No candidate for #{inspect(coord)}")
            {coord, bearing, acc}

          Video.TrimmedSource.reaches_end_of_video?(cut, 500) ->
            # If we read to the end of a TSV, there is a chance our way segment
            # actually extends past it. To avoid gaps, we calculate where we
            # left off in the way and try to resume from there.

            coord =
              [prev_coord, coord]
              |> Geo.CheapRuler.closest_point_on_line(cut.coord_to)
              |> Map.fetch!(:point)

            if @debug,
              do: IO.puts("End of TSV #{cut.source_path_rel}, resume from #{inspect(coord)}")

            {coord, bearing, [cut | acc]}

          true ->
            # Found a non-edge case segment, continue with the same node we used
            # to find our end. Changing the nodes causes gaps or overlaps.
            {coord, bearing, [cut | acc]}
        end
    end)
    |> elem(2)
    |> Enum.reverse()
    |> maybe_debug(track, "full")
    |> Video.TrimmedSource.simplify()
    |> maybe_debug(track, "simplified")
    |> new_from_tsv_list("Route #{track.id} (#{track.direction}): #{track.full_name}")
  end

  defp maybe_debug(tsv_list, track, text), do: maybe_debug(tsv_list, track, text, @debug)

  defp maybe_debug(tsv_list, track, text, debug) do
    if debug && String.contains?(track.full_name, debug) do
      contents =
        tsv_list
        |> Enum.with_index()
        |> Enum.map(fn {tsv, idx} ->
          coords = tsv |> Video.TrimmedSource.coords() |> Map.fetch!(:coords)

          """
            <trk>
               <number>#{idx}</number>
               <desc>#{tsv.coord_from.time_offset_ms} → #{tsv.coord_to.time_offset_ms} (max: #{tsv.duration_ms_uncut})</desc>
               <cmt>#{Video.Timestamp.from_timed_point(tsv.coord_from)} → #{Video.Timestamp.from_timed_point(tsv.coord_to)} (max: #{Video.Timestamp.from_milliseconds(tsv.duration_ms_uncut)})</cmt>
               <src>#{tsv.source_path_rel}</src>
              <trkseg>#{coords |> Enum.map(&Video.TimedPoint.to_gpx_trkpt/1) |> Enum.join()}</trkseg>
            </trk>
          """
        end)
        |> Enum.join("\n")

      gpx =
        String.trim("""
            <?xml version="1.0" encoding="UTF-8"?>
            <gpx creator="gopro2gpx" version="1.1" xmlns="http://www.topografix.com/GPX/1/1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd">
              #{contents}
            </gpx>
        """)

      path = "./tmp/#{track.full_name}.#{text}.gpx"
      IO.puts("Writing #{path} (TSVs before simplification)")
      File.write(path, gpx)
    end

    tsv_list
  end

  defp warn_if_no_videos(rel, filtered_tsv) do
    if length(filtered_tsv) == 0,
      do:
        IO.warn(
          "Relation #{inspect(rel.tags)} has no source videos. Is the folder name correct and relative to #{Settings.video_source_dir_abs()}? Is the video directory mounted?"
        )
  end

  @spec calc_hash([Video.TrimmedSource.t()]) :: hash()
  defp calc_hash(tsv_list) when is_list(tsv_list) do
    tsv_list
    |> Enum.map(&Video.TrimmedSource.to_str(&1))
    |> Enum.reduce(:crypto.hash_init(:md5), fn str, hsh ->
      :crypto.hash_update(hsh, str)
    end)
    |> :crypto.hash_final()
    |> Base.encode16(case: :lower)
  end

  @doc """
  Returns a list of time offsets in milliseconds, relative to the beginning of
  the trimmed and concatenated video and their corresponding lat/lon coordinates.
  """
  def coords(%__MODULE__{} = tsv_seq) do
    tsv_seq.tsvs
    |> Enum.reduce({0, []}, fn tsv, {prev_time_offset_ms, acc} ->
      %{first: %{time_offset_ms: cur_time_offset_ms}, coords: coords} =
        Video.TrimmedSource.coords(tsv)

      coords =
        Enum.map(
          coords,
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
  Returns the list of sources and their cutpoints
  """
  @type sources :: [{binary(), Video.Timestamp.t(), Video.Timestamp.t()}]
  @spec sources(t()) :: sources()
  def sources(%__MODULE__{tsvs: tsvs}) do
    Enum.map(tsvs, fn tsv ->
      {
        tsv.anonymized_path_rel,
        Video.Timestamp.from_timed_point(tsv.coord_from),
        Video.Timestamp.from_timed_point(tsv.coord_to)
      }
    end)
  end
end
