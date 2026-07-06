defmodule Video.Segment do
  @segment_duration_s 10
  @rounding 3

  @type regular :: %{
          type: :regular,
          source: binary(),
          start_s: float(),
          end_s: float(),
          opts: keyword()
        }

  @type transition :: %{
          type: :transition,
          source_a: binary(),
          source_b: binary(),
          end_a_s: float(),
          start_b_s: float(),
          fade_s: float(),
          opts_a: keyword(),
          opts_b: keyword()
        }

  @type t :: regular() | transition()

  @spec segments(module()) :: [t()]
  def segments(rendered) do
    sources = rendered.sources() |> Video.Track.normalize_video_tuples()

    case sources do
      [] ->
        []

      _ ->
        fade_s = Video.Track.fade(rendered.renderer())
        nexts = tl(sources) ++ [nil]

        sources
        |> Enum.zip(nexts)
        |> Enum.with_index()
        |> Enum.flat_map(fn {{current, next}, idx} ->
          process_source(current, next, idx == 0, fade_s)
        end)
    end
  end

  defp process_source({path, from, to, opts}, next, is_first, fade_s) do
    start_s = resolve_start(from)
    end_s = resolve_end(to, path)

    next_from = if next, do: elem(next, 1)

    effective_start =
      if !is_first && from != :seamless,
        do: Float.round(start_s + fade_s, @rounding),
        else: Float.round(start_s, @rounding)

    effective_end =
      if next != nil && next_from != :seamless,
        do: Float.round(end_s - fade_s, @rounding),
        else: Float.round(end_s, @rounding)

    if effective_start >= effective_end do
      raise ArgumentError,
            "Segment too short for fade: source #{path} effective range " <>
              "[#{effective_start}, #{effective_end}] (fade=#{fade_s}s)"
    end

    regular = grid_split(path, effective_start, effective_end, opts)

    transition =
      if next != nil && next_from != :seamless do
        {next_path, _next_from, _next_to, next_opts} = next
        next_start_s = resolve_start(next_from)

        [
          %{
            type: :transition,
            source_a: path,
            source_b: next_path,
            end_a_s: Float.round(end_s, @rounding),
            start_b_s: Float.round(next_start_s, @rounding),
            fade_s: fade_s,
            opts_a: opts,
            opts_b: next_opts
          }
        ]
      else
        []
      end

    regular ++ transition
  end

  defp resolve_start(:start), do: 0.0
  defp resolve_start(:seamless), do: 0.0
  defp resolve_start(timestamp), do: Video.Timestamp.in_seconds(timestamp)

  defp resolve_end(:end, path) do
    {:ok, meta} = Video.Metadata.for(%{source: path})
    meta.duration
  end

  defp resolve_end(timestamp, _path), do: Video.Timestamp.in_seconds(timestamp)

  @doc """
  Splits a source time range into 10s-grid-aligned segments.
  """
  @spec grid_split(binary(), float(), float(), keyword()) :: [regular()]
  def grid_split(source, start_s, end_s, opts) do
    first_grid =
      (start_s / @segment_duration_s)
      |> Float.round(6)
      |> Float.ceil()
      |> Kernel.*(@segment_duration_s)
      |> Float.round(@rounding)

    if first_grid >= end_s do
      [%{type: :regular, source: source, start_s: start_s, end_s: end_s, opts: opts}]
    else
      boundary =
        if start_s < first_grid do
          [%{type: :regular, source: source, start_s: start_s, end_s: first_grid, opts: opts}]
        else
          []
        end

      boundary ++ full_segments(source, first_grid, end_s, opts)
    end
  end

  defp full_segments(source, grid_point, end_s, opts) do
    next_grid = Float.round(grid_point + @segment_duration_s, @rounding)

    if next_grid >= end_s do
      [%{type: :regular, source: source, start_s: grid_point, end_s: end_s, opts: opts}]
    else
      [
        %{type: :regular, source: source, start_s: grid_point, end_s: next_grid, opts: opts}
        | full_segments(source, next_grid, end_s, opts)
      ]
    end
  end

  @doc """
  Returns the basename for a segment (without variant suffix).
  """
  @spec basename(t()) :: binary()
  def basename(%{type: :regular} = seg), do: segment_basename(seg)
  def basename(%{type: :transition} = seg), do: transition_basename(seg)

  def segment_basename(%{
        type: :regular,
        source: source,
        start_s: start_s,
        end_s: end_s,
        opts: opts
      }) do
    date = String.slice(Path.dirname(source), 0, 10)
    stem = Video.Path.stem(source)
    ts = format_timestamp(start_s)
    dur = format_duration(end_s - start_s)
    vf_suffix = if opts[:vf], do: "_vf#{vf_hash(opts[:vf])}", else: ""
    "#{date}-#{stem}-#{ts}_#{dur}#{vf_suffix}"
  end

  def transition_basename(%{type: :transition} = t) do
    stem_a = Video.Path.stem(t.source_a)
    stem_b = Video.Path.stem(t.source_b)
    ts_a = format_timestamp(t.end_a_s)
    ts_b = format_timestamp(t.start_b_s)
    "xfade-#{stem_a}@#{ts_a}+#{stem_b}@#{ts_b}"
  end

  @doc """
  Formats seconds as HH_MM_SS or HH_MM_SS.mmm timestamp.

  ## Examples

      iex> Video.Segment.format_timestamp(20.0)
      "00_00_20"

      iex> Video.Segment.format_timestamp(13.5)
      "00_00_13.500"

      iex> Video.Segment.format_timestamp(107.2)
      "00_01_47.200"
  """
  @spec format_timestamp(number()) :: binary()
  def format_timestamp(seconds) when is_number(seconds) do
    total_ms = round(seconds * 1000)
    h = div(total_ms, 3_600_000)
    rem_after_h = rem(total_ms, 3_600_000)
    m = div(rem_after_h, 60_000)
    rem_after_m = rem(rem_after_h, 60_000)
    s = div(rem_after_m, 1000)
    ms = rem(rem_after_m, 1000)

    base = "#{pad2(h)}_#{pad2(m)}_#{pad2(s)}"
    if ms == 0, do: base, else: "#{base}.#{pad3(ms)}"
  end

  @doc """
  Formats a duration in seconds as Ns or N.mmms.

  ## Examples

      iex> Video.Segment.format_duration(10.0)
      "10s"

      iex> Video.Segment.format_duration(6.5)
      "6.500s"
  """
  @spec format_duration(number()) :: binary()
  def format_duration(seconds) when is_number(seconds) do
    total_ms = round(seconds * 1000)
    s = div(total_ms, 1000)
    ms = rem(total_ms, 1000)

    if ms == 0, do: "#{s}s", else: "#{s}.#{pad3(ms)}s"
  end

  @doc """
  Checks if all 5 variant files (m4s + m3u8) exist for a segment.
  """
  @spec all_variants_exist?(t()) :: boolean()
  def all_variants_exist?(segment) do
    base = basename(segment)

    Enum.all?(0..4, fn idx ->
      File.exists?(Video.Path.segment_file(base, idx)) &&
        File.exists?(Video.Path.segment_m3u8(base, idx))
    end)
  end

  defp pad2(n), do: String.pad_leading(Integer.to_string(n), 2, "0")
  defp pad3(n), do: String.pad_leading(Integer.to_string(n), 3, "0")

  defp vf_hash(vf_string) do
    :crypto.hash(:md5, vf_string)
    |> Base.encode16(case: :lower)
    |> String.slice(0, 8)
  end
end
