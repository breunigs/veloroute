defmodule Video.Speedup do
  @moduledoc """
  How much faster than real time a source is rendered, as a function of position
  within it.

  The single authority on speedup. `Video.Metadata` deliberately does not know
  about it, and must never call into this module: `Video.Speedup` reads metadata,
  not the other way around. `Video.SpeedupTest` asserts that edge stays one way.

  ## The model

  Apparent speed (real riding speed × speedup) is held at or below
  `Video.Constants.target_apparent_speed_kmh/0`. Nothing is ever sped *up* past
  its baseline to reach that target — only slowed down, and only where it would
  otherwise be too fast.

      natural  = time_lapse * output_fps / src_fps     # real frames map 1:1
      baseline = max(desired_time_lapse, natural)
      speedup  = min(baseline, target_kmh / real_kmh)  # clamped, see speedup/4
      slope    = time_lapse / speedup                  # d(output)/d(source)

  `natural` is the rate at which the source's real frames land exactly one per
  output frame. `desired_time_lapse` keeps the editorial default for under-sped
  recordings — without it a realtime clip would render at 1x. Throughout, the
  generation density has a closed form:

      d = natural / speedup

  so `d == 1.0` means frames map 1:1, `d < 1` means frames are dropped, and
  `d > 1` means frames have to be generated. **At the baseline `d <= 1` always**,
  so frame generation can only ever be caused by the speed cap.

  ## Timeline

  `W` maps **source/video seconds to output seconds**. That is the timeline
  `-ss`, `setpts`'s `T`, and `Video.TrimmedSource`'s coordinates all use, which
  is why the speed profile is built from `Video.Source.video_timeline_points/1`
  rather than from raw GPX times: for `.mkv` and `_stabilized.MP4` the two
  differ by the GPX stretch factor, and evaluating `W` on the wrong one desyncs
  the map progressively.
  """

  require Logger

  @type t :: %__MODULE__{
          source: binary(),
          breakpoints: [float()],
          cumulative: [float()],
          slopes: [float()],
          constant: float() | nil,
          hash: binary()
        }

  @enforce_keys [:source, :breakpoints, :cumulative, :slopes, :constant, :hash]
  defstruct @enforce_keys

  @doc """
  The warp for a source, cached per path.
  """
  @spec for(binary()) :: {:ok, t()} | {:error, binary()}
  def for(path) when is_binary(path) do
    key = {__MODULE__, path}

    case :persistent_term.get(key, nil) do
      nil ->
        result = build(path)
        :persistent_term.put(key, result)
        result

      cached ->
        cached
    end
  end

  # breakpoints, cumulative and slopes are always the same length. Entry i
  # starts an interval at source second breakpoints[i], which is output second
  # cumulative[i], and runs with slopes[i] until breakpoints[i+1] — or forever,
  # for the last one.
  defp segments(%__MODULE__{} = warp) do
    Enum.zip([warp.breakpoints, warp.cumulative, warp.slopes])
  end

  defp segment_by(segments, pick, at) do
    Enum.reduce_while(segments, hd(segments), fn seg, acc ->
      if pick.(seg) <= at, do: {:cont, seg}, else: {:halt, acc}
    end)
  end

  @doc """
  Source seconds to output seconds.

      iex> w = Video.Speedup.testing_warp([0.0, 1.0], [1.0, 2.0])
      iex> {Video.Speedup.output_s(w, 0.0), Video.Speedup.output_s(w, 1.0), Video.Speedup.output_s(w, 1.5)}
      {0.0, 1.0, 2.0}

  Beyond the last breakpoint the final slope continues:

      iex> w = Video.Speedup.testing_warp([0.0, 1.0], [1.0, 2.0])
      iex> Video.Speedup.output_s(w, 2.0)
      3.0
  """
  @spec output_s(t(), float()) :: float()
  def output_s(%__MODULE__{constant: slope}, source_s) when is_float(slope),
    do: source_s * slope

  def output_s(%__MODULE__{} = warp, source_s) do
    {b, c, s} = segment_by(segments(warp), fn {b, _, _} -> b end, source_s)
    c + (source_s - b) * s
  end

  @doc """
  Output seconds back to source seconds. The inverse of `output_s/2`.

      iex> w = Video.Speedup.testing_warp([0.0, 1.0], [1.0, 2.0])
      iex> {Video.Speedup.source_s(w, 1.0), Video.Speedup.source_s(w, 2.0), Video.Speedup.source_s(w, 3.0)}
      {1.0, 1.5, 2.0}
  """
  @spec source_s(t(), float()) :: float()
  def source_s(%__MODULE__{constant: slope}, output_s) when is_float(slope),
    do: output_s / slope

  def source_s(%__MODULE__{} = warp, output_s) do
    {b, c, s} = segment_by(segments(warp), fn {_, c, _} -> c end, output_s)
    b + (output_s - c) / s
  end

  @doc """
  The local slope, i.e. the `pts_correction` in effect at that source position.

      iex> w = Video.Speedup.testing_warp([0.0, 1.0], [1.0, 2.0])
      iex> {Video.Speedup.slope_at(w, 0.5), Video.Speedup.slope_at(w, 1.5)}
      {1.0, 2.0}
  """
  @spec slope_at(t(), float()) :: float()
  def slope_at(%__MODULE__{constant: slope}, _at) when is_float(slope), do: slope

  def slope_at(%__MODULE__{} = warp, at) do
    {_b, _c, s} = segment_by(segments(warp), fn {b, _, _} -> b end, at)
    s
  end

  @doc """
  The largest slope anywhere in a source range, which is what decides whether
  frames have to be generated for it.

      iex> w = Video.Speedup.testing_warp([0.0, 1.0], [1.0, 2.0])
      iex> {Video.Speedup.max_slope(w, 0.0, 0.5), Video.Speedup.max_slope(w, 0.0, 5.0)}
      {1.0, 2.0}
  """
  @spec max_slope(t(), float(), float()) :: float()
  def max_slope(%__MODULE__{constant: slope}, _from_s, _to_s) when is_float(slope), do: slope

  def max_slope(%__MODULE__{} = warp, from_s, to_s) do
    ends = Enum.drop(warp.breakpoints, 1) ++ [:infinity]

    warp
    |> segments()
    |> Enum.zip(ends)
    |> Enum.filter(fn {{b, _c, _s}, e} -> b <= to_s && (e == :infinity || e > from_s) end)
    |> Enum.map(fn {{_b, _c, s}, _e} -> s end)
    |> case do
      [] -> slope_at(warp, from_s)
      found -> Enum.max(found)
    end
  end

  @doc """
  Whether this warp is the one the pre-rework code would have produced for the
  same source, in which case its filter emits nothing and its rendered segments
  are unchanged.

  Both the "emit nothing" filter case and the segment name suffix gate on this,
  so the cache key is tied to the filter output rather than to a formula. That
  matters because this rework also changed the legacy formula: a legacy source
  with `fps != output_fps` renders different content while still having a
  constant warp, and keying on the formula would silently reuse its stale
  segments.
  """
  @spec identity?(t(), Video.Metadata.t()) :: boolean()
  def identity?(%__MODULE__{constant: nil}, _meta), do: false

  def identity?(%__MODULE__{constant: slope}, %{fps: fps}) do
    abs(slope - 1.0) < 1.0e-6 && same_fps?(fps)
  end

  @doc """
  Whether a frame rate is the output frame rate. Tolerant on purpose: a source
  reporting `r_frame_rate=2997/100` is 29.97 exactly, which is not
  `30000/1001 = 29.9700299…`, and float equality would push it down the varying
  path for nothing.
  """
  @spec same_fps?(float()) :: boolean()
  def same_fps?(fps), do: abs(fps - Video.Constants.output_fps()) < 0.001

  @doc """
  The source timestamp that is `fade_s` of **output** time before `at_s`.

  Used wherever a transition trims the tail of the outgoing clip. The old code
  simply subtracted `fade_s` from a source timestamp, which is only right at a
  slope of 1.0. Rounded to milliseconds because `format_ts/1` rounds the `-ss`
  it ends up in anyway, and because three separate call sites have to agree
  bit-for-bit.
  """
  @spec fade_before(t(), float(), float()) :: float()
  def fade_before(%__MODULE__{} = warp, at_s, fade_s) do
    round_ms(source_s(warp, output_s(warp, at_s) - fade_s))
  end

  @doc """
  The source timestamp that is `fade_s` of **output** time after `at_s`, i.e.
  the symmetric counterpart of `fade_before/3` for the incoming clip.
  """
  @spec fade_after(t(), float(), float()) :: float()
  def fade_after(%__MODULE__{} = warp, at_s, fade_s) do
    round_ms(source_s(warp, output_s(warp, at_s) + fade_s))
  end

  @doc """
  Rounds a source timestamp the way every consumer of one has to.
  """
  @spec round_ms(float()) :: float()
  def round_ms(seconds), do: Float.round(seconds, 3)

  @doc """
  Build a constant warp directly. Used for the legacy path and from tests.
  """
  @spec constant(binary(), float()) :: t()
  def constant(source, slope) do
    %__MODULE__{
      source: source,
      breakpoints: [0.0],
      cumulative: [0.0],
      slopes: [slope],
      constant: slope,
      hash: hash([slope])
    }
  end

  @doc false
  @spec testing_warp([float()], [float()]) :: t()
  def testing_warp(breakpoints, slopes) do
    cumulative = cumulative(breakpoints, slopes)

    %__MODULE__{
      source: "testing",
      breakpoints: breakpoints,
      cumulative: cumulative,
      slopes: slopes,
      constant: nil,
      hash: hash(slopes)
    }
  end

  @doc """
  The speedup for one speed sample, with all three clamps applied.

  Returns the speedup and which clamp decided it, so callers can log.

      iex> Video.Speedup.speedup(10.0, 5, 30000/1001)
      {5.0, :baseline}

      iex> Video.Speedup.speedup(25.0, 5, 30000/1001)
      {4.0, :target}

  Above ~30 km/h the 20fps floor binds before the target does:

      iex> {speedup, reason} = Video.Speedup.speedup(30.0, 5, 30000/1001)
      iex> {Float.round(speedup, 4), reason}
      {3.3367, :min_fps}

      iex> Video.Speedup.speedup(0.0, 1, 30000/1001)
      {5.0, :baseline}

      iex> Video.Speedup.speedup(nil, 1, 30000/1001)
      {5.0, :baseline}

      iex> {speedup, reason} = Video.Speedup.speedup(200.0, 5, 25.0)
      iex> {Float.round(speedup, 3), reason}
      {4.0, :min_fps}
  """
  @spec speedup(float() | nil, pos_integer(), float()) ::
          {float(), :baseline | :target | :min_fps}
  def speedup(real_kmh, time_lapse, src_fps) do
    natural = natural(time_lapse, src_fps)
    baseline = baseline(time_lapse, src_fps)
    floor_speedup = natural / Video.Constants.max_interpolation_density()

    wanted =
      if is_nil(real_kmh) || real_kmh <= Video.Constants.min_real_speed_kmh() do
        baseline
      else
        min(baseline, Video.Constants.target_apparent_speed_kmh() / real_kmh)
      end

    cond do
      wanted < floor_speedup -> {floor_speedup, :min_fps}
      wanted >= baseline -> {baseline, :baseline}
      true -> {wanted, :target}
    end
  end

  @doc """
  The speedup at which the source's real frames map one per output frame, i.e.
  where the generation density is exactly 1.0.

      iex> Float.round(Video.Speedup.natural(5, 25.0), 3)
      5.994

      iex> Float.round(Video.Speedup.natural(1, 59.9401), 3)
      0.5
  """
  @spec natural(pos_integer(), float()) :: float()
  def natural(time_lapse, src_fps), do: time_lapse * Video.Constants.output_fps() / src_fps

  @doc """
  The speedup used wherever the speed target does not bite. Also the fallback
  whenever no usable GPS speed is available — deliberately not
  `desired_time_lapse`, which for a 25fps 5x source would mean generating frames
  on a source with no GPS data at all, and not `natural`, which for a realtime
  source would mean no speedup whatsoever.

      iex> Video.Speedup.baseline(5, 30000/1001)
      5.0

      iex> Float.round(Video.Speedup.baseline(5, 25.0), 3)
      5.994

      iex> Video.Speedup.baseline(1, 59.9401)
      5.0
  """
  @spec baseline(pos_integer(), float()) :: float()
  def baseline(time_lapse, src_fps) do
    max(Video.Constants.desired_time_lapse() / 1, natural(time_lapse, src_fps))
  end

  @doc """
  The generation density: output frames per source frame. `1.0` means frames map
  1:1, below that frames are dropped, above it they have to be generated.

      iex> Video.Speedup.density(1.0, 30000/1001)
      1.0
  """
  @spec density(float(), float()) :: float()
  def density(slope, src_fps), do: Video.Constants.output_fps() * slope / src_fps

  @doc """
  The `setpts` expression that maps this source range onto output time.

  A constant warp keeps the exact shape the pre-rework code emitted. A varying
  one becomes a piecewise linear nested `if` over `T`, relative to the range
  start — which holds because `-ss` precedes `-i` without `-copyts`, the same
  assumption the old `setpts=pc*PTS` already made.
  """
  @spec setpts_expr(t(), float(), float()) :: binary()
  def setpts_expr(%__MODULE__{constant: slope}, _from_s, _to_s) when is_float(slope),
    do: "#{fmt(slope)}*PTS"

  def setpts_expr(%__MODULE__{} = warp, from_s, to_s) do
    base_out = output_s(warp, from_s)

    pieces =
      [from_s | Enum.filter(warp.breakpoints, &(&1 > from_s && &1 < to_s))]
      |> Enum.map(fn at ->
        {at - from_s, output_s(warp, at) - base_out, slope_at(warp, at)}
      end)

    "'(#{seconds_expr(pieces)})/TB'"
  end

  defp seconds_expr([{t0, c0, s0}]), do: "#{fmt(c0)}+#{fmt(s0)}*(T-#{fmt(t0)})"

  defp seconds_expr([{t0, c0, s0} | [{t1, _, _} | _] = rest]) do
    "if(lt(T,#{fmt(t1)}),#{fmt(c0)}+#{fmt(s0)}*(T-#{fmt(t0)}),#{seconds_expr(rest)})"
  end

  # ffmpeg's expression parser has no use for scientific notation
  defp fmt(value) do
    rounded = Float.round(value * 1.0, 6)

    if rounded == trunc(rounded),
      do: "#{trunc(rounded)}",
      else: :erlang.float_to_binary(rounded, decimals: 6)
  end

  @spec filter_parts(t(), Video.Metadata.t(), float(), float(), binary()) :: [binary()]
  def filter_parts(%__MODULE__{} = warp, meta, from_s, to_s, label) do
    if identity?(warp, meta) do
      []
    else
      [
        "#{label}setpts=#{setpts_expr(warp, from_s, to_s)},#{rate_cap()},settb=AVTB#{label}"
      ]
    end
  end

  @doc """
  How long a source range lasts in output time. The one expression every
  consumer of a segment duration has to agree on.
  """
  @spec warped_span_s(t(), float(), float()) :: float()
  def warped_span_s(%__MODULE__{} = warp, from_s, to_s) do
    output_s(warp, to_s) - output_s(warp, from_s)
  end

  @doc """
  Caps the frame rate at the output rate without ever duplicating a frame.

  `fps=` would pad a slowed stretch with duplicates, which is the whole thing we
  are avoiding, so instead keep a frame only once enough output time has passed
  since the last one kept. Where the warp compresses (any speed-up) that drops
  down to the output rate as before; where it stretches, every real frame is kept
  and the rate simply falls to `src_fps / slope`.
  """
  @spec rate_cap() :: binary()
  def rate_cap do
    "select='isnan(prev_selected_t)+gte(t-prev_selected_t,1/(#{Video.Constants.output_fps_s()}))'"
  end

  @spec build(binary()) :: {:ok, t()} | {:error, binary()}
  defp build(path) do
    with {:ok, meta} <- Video.Metadata.for(path) do
      legacy = legacy_slope(meta)

      # callers hand us whatever they handed Video.Metadata, which may be cwd
      # relative; Video.Path.abs_path/1 would prepend the source dir again
      case Video.Source.new_from_path(Path.expand(path)) do
        %Video.Source{date: %Date{} = date} = source ->
          if Date.before?(date, Video.Constants.speed_target_from_date()),
            do: {:ok, constant(path, legacy)},
            else: {:ok, speed_targeted(source, meta, legacy)}

        _ ->
          # not a source path, or no date in it: keep the legacy behaviour
          {:ok, constant(path, legacy)}
      end
    end
  end

  defp legacy_slope(%{time_lapse: time_lapse}) do
    time_lapse / Video.Constants.desired_time_lapse()
  end

  @spec speed_targeted(Video.Source.t(), Video.Metadata.t(), float()) :: t()
  defp speed_targeted(source, meta, legacy) do
    window = Video.Constants.speed_average_window_source_s()
    step = Video.Constants.warp_breakpoint_s()

    case Video.Source.speed_profile(source, meta.time_lapse, window, step) do
      [_ | _] = profile ->
        from_profile(source.source, profile, meta)

      other ->
        Logger.warning(
          "#{source.source}: no usable GPS speed (#{inspect(other)}), " <>
            "falling back to a constant #{Float.round(legacy, 4)} slope"
        )

        constant(source.source, Video.Speedup.baseline(meta.time_lapse, meta.fps))
    end
  end

  @spec from_profile(binary(), [{float(), float()}], Video.Metadata.t()) :: t()
  defp from_profile(path, profile, meta) do
    quantum = Video.Constants.slope_quantum()

    sampled =
      Enum.map(profile, fn {at_s, real_kmh} ->
        {speedup, reason} = speedup(real_kmh, meta.time_lapse, meta.fps)
        slope = quantise(meta.time_lapse / speedup, quantum)
        {at_s, slope, reason}
      end)

    maybe_log_generation(path, sampled, meta)

    {breakpoints, slopes} = collapse(sampled)

    case slopes do
      [only] ->
        constant(path, only)

      _ ->
        %__MODULE__{
          source: path,
          breakpoints: breakpoints,
          cumulative: cumulative(breakpoints, slopes),
          slopes: slopes,
          constant: nil,
          hash: hash(slopes)
        }
    end
  end

  # Quantising is what lets a near uniform warp collapse at all: with 1s
  # breakpoints and a 30s window adjacent slopes differ by far less than 1%, so
  # exact equality would never collapse and hundreds of breakpoints would be
  # emitted instead of taking the "emit nothing" fast path. It shifts apparent
  # speed by at most the quantum and introduces no video/GPS drift, because both
  # are driven by this same quantised warp.
  defp quantise(slope, quantum), do: Float.round(round(slope / quantum) * quantum, 6)

  @spec collapse([{float(), float(), atom()}]) :: {[float()], [float()]}
  defp collapse([{first_at, first_slope, _} | rest]) do
    {breakpoints, slopes} =
      Enum.reduce(rest, {[first_at], [first_slope]}, fn {at_s, slope, _}, {bs, [prev | _] = ss} ->
        if slope == prev, do: {bs, ss}, else: {[at_s | bs], [slope | ss]}
      end)

    {Enum.reverse(breakpoints), Enum.reverse(slopes)}
  end

  # output second at each breakpoint: the running integral of slope × interval
  @spec cumulative([float()], [float()]) :: [float()]
  defp cumulative(breakpoints, slopes) do
    breakpoints
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.zip(slopes)
    |> Enum.reduce([0.0], fn {[b0, b1], slope}, [acc | _] = all ->
      [acc + (b1 - b0) * slope | all]
    end)
    |> Enum.reverse()
  end

  defp maybe_log_generation(path, sampled, meta) do
    generating =
      Enum.filter(sampled, fn {_at, slope, _} -> density(slope, meta.fps) > 1.0 end)

    if generating != [] do
      worst = generating |> Enum.map(fn {_a, s, _} -> density(s, meta.fps) end) |> Enum.max()
      pct = Float.round((worst - 1.0) / worst * 100, 1)

      Logger.info(
        "#{path}: generating frames for #{length(generating)}/#{length(sampled)} samples, " <>
          "up to #{pct}% of output frames (density #{Float.round(worst, 3)})"
      )
    end

    clamped = Enum.count(sampled, fn {_at, _slope, reason} -> reason == :min_fps end)

    if clamped > 0 do
      Logger.warning(
        "#{path}: #{clamped}/#{length(sampled)} samples hit the " <>
          "#{Video.Constants.min_output_fps()}fps floor, so their apparent speed exceeds " <>
          "#{Video.Constants.target_apparent_speed_kmh()} km/h"
      )
    end
  end

  # The mode marker matters: switching from RIFE interpolation to a lower frame
  # rate leaves the slopes untouched, so without it every already rendered
  # speed-targeted segment would be silently reused.
  @slowdown_mode "vfr1"

  defp hash(slopes) do
    :crypto.hash(:md5, @slowdown_mode <> Enum.join(slopes, ","))
    |> Base.encode16(case: :lower)
    |> String.slice(0, 8)
  end
end
