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
  How far past `from_s` the first decoded frame sits, in seconds.

  `-ss` does not land on a frame boundary, so the first frame ffmpeg hands us is
  anywhere up to one source frame interval later. Everything downstream — the
  `vf_fps` grid anchor and every interpolation ratio — is offset by this, so it
  has to be computed from the millisecond-rounded `-ss` value rather than from a
  raw warp inversion.

      iex> Video.Speedup.phase(1.0, 25.0)
      0.0

      iex> Float.round(Video.Speedup.phase(1.01, 25.0), 4)
      0.03
  """
  @spec phase(float(), float()) :: float()
  def phase(from_s, src_fps) do
    ceil(from_s * src_fps) / src_fps - from_s
  end

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

      iex> Video.Speedup.speedup(30.0, 5, 30000/1001)
      {3.8333333333333335, :target}

      iex> Video.Speedup.speedup(0.0, 1, 30000/1001)
      {5.0, :baseline}

      iex> Video.Speedup.speedup(nil, 1, 30000/1001)
      {5.0, :baseline}

      iex> {speedup, reason} = Video.Speedup.speedup(200.0, 5, 25.0)
      iex> {Float.round(speedup, 3), reason}
      {2.997, :density}
  """
  @spec speedup(float() | nil, pos_integer(), float()) ::
          {float(), :baseline | :target | :density}
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
      wanted < floor_speedup -> {floor_speedup, :density}
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
  The interpolation ratio for every output frame of a source range.

  Built by forward simulating what `vf_fps` actually does, rather than by
  inverting the warp: `vf_fps` quantises each input frame's PTS onto the output
  lattice *before* deciding which frame fills which slot, so deriving the
  bracketing frame from `floor(W⁻¹(t) · src_fps)` would disagree with the filter
  by a whole frame at slot boundaries and pair the wrong frames with the ratio.

  `0.0` means "use the earlier real frame", `1.0` the later one; anything between
  is a RIFE timestep. A real frame is preferred whenever rounding would have
  picked it anyway, which makes every ratio `0.0`/`1.0` as soon as frames are
  being dropped rather than generated.

  Indexed by **absolute** output slot, with the leading entries up to the
  `vf_fps` grid anchor padded, because the plugin derives its index from the
  frame timestamp.
  """
  @spec frame_ratios(t(), Video.Metadata.t(), float(), float()) :: [float()]
  def frame_ratios(%__MODULE__{} = warp, %{fps: src_fps}, from_s, to_s) do
    out_fps = Video.Constants.output_fps()
    base_out = output_s(warp, from_s)
    rel_out = fn t -> output_s(warp, from_s + t) - base_out end
    rel_src = fn o -> source_s(warp, base_out + o) - from_s end

    phase = phase(from_s, src_fps)
    rel_dur = max(to_s - from_s, 0.0)
    frames = max(floor((rel_dur - phase) * src_fps) + 1, 1)

    # ceil, matching fps=…:round=up below. Flooring would place a frame in a
    # slot *before* its own timestamp, so the frame held at slot k could be
    # ahead of k and every frac would come out negative.
    slots = Enum.map(0..(frames - 1), &ceil(rel_out.(phase + &1 / src_fps) * out_fps))
    k0 = hd(slots)
    k_last = max(floor(rel_out.(rel_dur) * out_fps), k0)

    {ratios, _} =
      Enum.map_reduce(k0..k_last, {slots, -1}, fn k, acc ->
        {rest, i} = consume_slots(acc, k)

        ratio =
          if k == k0 do
            # the delayed branch has no frame to pair with yet
            0.0
          else
            at_rel = rel_src.(k / out_fps)
            frac = (at_rel - phase) * src_fps - i
            d = density(slope_at(warp, from_s + at_rel), src_fps)
            snap = min(0.5, 0.5 / d)

            cond do
              frac <= snap -> 0.0
              frac >= 1.0 - snap -> 1.0
              true -> min(max(frac, 0.0), 1.0)
            end
          end

        {ratio, {rest, i}}
      end)

    List.duplicate(0.0, k0) ++ ratios
  end

  defp consume_slots({[slot | rest], i}, k) when slot <= k, do: consume_slots({rest, i + 1}, k)
  defp consume_slots(acc, _k), do: acc

  @doc """
  Whether any frame in this ratio list has to be generated.
  """
  @spec needs_rife?([float()]) :: boolean()
  def needs_rife?(ratios), do: Enum.any?(ratios, &(&1 > 0.0 && &1 < 1.0))

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

  @doc """
  The filter chain that normalises one source range onto the output frame rate,
  taking and leaving the stream at `label`.

  Returns `[]` when there is nothing to do, which is both the fast path for the
  pre-existing corpus and the condition the segment cache key gates on.

  Options:

    * `:generate` — set to `false` to skip RIFE even where frames are missing,
      used by the preview paths where exact frame content does not matter and
      RIFE latency would hurt. Timing still matches the final render.
    * `:ratios_dir` — where to write the ratio list. Required when generating.
  """
  @spec filter_parts(t(), Video.Metadata.t(), float(), float(), binary(), keyword()) :: [binary()]
  def filter_parts(%__MODULE__{} = warp, meta, from_s, to_s, label, opts \\ []) do
    cond do
      identity?(warp, meta) ->
        []

      !Keyword.get(opts, :generate, true) ->
        [resample(warp, from_s, to_s, label)]

      true ->
        ratios = frame_ratios(warp, meta, from_s, to_s)

        if needs_rife?(ratios) do
          generating_parts(warp, meta, from_s, to_s, label, ratios, opts)
        else
          [resample(warp, from_s, to_s, label)]
        end
    end
  end

  defp resample(warp, from_s, to_s, label) do
    "#{label}setpts=#{setpts_expr(warp, from_s, to_s)}," <>
      "fps=#{Video.Constants.output_fps()},settb=AVTB#{label}"
  end

  # The output grid is built once, at the final rate, so the plugin is invoked
  # exactly once per frame that actually ships. Delaying one branch by exactly
  # one *source* frame — before the warp, where the interval is still constant —
  # makes [b] carry frame i+1 wherever [a] carries frame i, so the pair always
  # brackets the output timestamp even under a varying warp.
  #
  # round=up, not down: vf_fps quantises each input PTS onto the output lattice
  # before picking, and rounding up is what makes "the last frame whose
  # quantised PTS <= k" mean "the last frame at or before slot k's timestamp".
  # Rounding down lets the held frame sit *after* the slot, which puts the
  # interpolation timestep outside [0, 1).
  defp generating_parts(warp, meta, from_s, to_s, label, ratios, opts) do
    inner = label |> String.trim_leading("[") |> String.trim_trailing("]")
    {x, y, a, b} = {"[#{inner}x]", "[#{inner}y]", "[#{inner}a]", "[#{inner}b]"}

    dir = Keyword.fetch!(opts, :ratios_dir)
    path = write_ratios!(dir, inner, ratios)
    expr = setpts_expr(warp, from_s, to_s)
    fps = Video.Constants.output_fps_s()
    delay = fmt(1.0 / meta.fps)

    [
      "#{label}split#{x}#{y}",
      "#{x}setpts=#{expr},fps=#{fps}:round=up#{a}",
      "#{y}setpts=PTS-#{delay}/TB,setpts=#{expr},fps=#{fps}:round=up#{b}",
      "#{a}#{b}frei0r=filter_name=rife_transition:" <>
        "filter_params=0||0|0|#{path}|#{Video.Constants.output_fps()},settb=AVTB#{label}"
    ]
  end

  # a file rather than an inline list: the inline form is comma separated, and
  # commas separate filters inside a filtergraph
  defp write_ratios!(dir, name, ratios) do
    path = Path.join(dir, "ratios_#{name}.txt")
    File.write!(path, Enum.map_join(ratios, "\n", &fmt(&1)) <> "\n")
    path
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

    clamped = Enum.count(sampled, fn {_at, _slope, reason} -> reason == :density end)

    if clamped > 0 do
      Logger.warning(
        "#{path}: #{clamped}/#{length(sampled)} samples hit the interpolation density " <>
          "clamp, so their apparent speed exceeds " <>
          "#{Video.Constants.target_apparent_speed_kmh()} km/h"
      )
    end
  end

  defp hash(slopes) do
    :crypto.hash(:md5, Enum.join(slopes, ","))
    |> Base.encode16(case: :lower)
    |> String.slice(0, 8)
  end
end
