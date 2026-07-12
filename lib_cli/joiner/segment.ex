defmodule Joiner.Segment do
  @type t :: %__MODULE__{
          from: Joiner.Video.t(),
          to: Joiner.Video.t(),
          duration_ms: non_neg_integer(),
          metrics: %{optional(Joiner.Options.metric()) => float()}
        }

  @enforce_keys [:from, :to, :duration_ms, :metrics]
  defstruct @enforce_keys

  def new(from, to) when is_binary(from) do
    with {:ok, from} <- Joiner.Video.load(from) do
      new(from, to)
    end
  end

  def new(from, to) when is_binary(to) do
    with {:ok, to} <- Joiner.Video.load(to) do
      new(from, to)
    end
  end

  def new(%Joiner.Video{} = from, %Joiner.Video{} = to) do
    {:ok,
     %__MODULE__{
       from: from,
       to: to,
       duration_ms: min(Joiner.Video.duration_ms(from), Joiner.Video.duration_ms(to)),
       metrics: %{}
     }}
  end

  @spec name(t()) :: binary()
  def name(seg) do
    "#{seg.from.ident} → #{seg.to.ident}"
  end

  @spec name_full(t()) :: binary()
  def name_full(seg) do
    stop1 = seg.from.stop.time_offset_ms |> Video.Timestamp.from_milliseconds()
    start2 = seg.from.start.time_offset_ms |> Video.Timestamp.from_milliseconds()

    "#{Video.Path.stem(seg.from.source.source)}_to_#{stop1}___#{Video.Path.stem(seg.to.source.source)}_from_#{start2}"
  end

  @doc """
  A segment overlaps when both their from and to videos overlap.
  """
  @spec overlap?(t(), t()) :: boolean()
  def overlap?(seg1, seg2) do
    Joiner.Video.overlap?(seg1.from, seg2.from) && Joiner.Video.overlap?(seg1.to, seg2.to)
  end

  @spec maybe_merge(t(), t()) :: {:ok, t()} | {:error, :no_overlap}
  def maybe_merge(seg1, seg2) do
    if overlap?(seg1, seg2) do
      {:ok, merge(seg1, seg2)}
    else
      {:error, :no_overlap}
    end
  end

  defp merge(seg1, seg2) do
    from = Joiner.Video.merge(seg1.from, seg2.from)
    to = Joiner.Video.merge(seg1.to, seg2.to)

    metrics =
      Map.intersect(seg1.metrics, seg2.metrics, fn _k, v1, v2 ->
        (v1 + v2) / 2.0
      end)

    {:ok, merged} = new(from, to)
    %{merged | metrics: metrics}
  end

  @doc """
  Returns data suitable to be displayed as a table.
  """
  @spec table_data(Joiner.Segment.t()) :: %{
          atom() => float() | binary() | :start | :end | Video.Timestamp.t()
        }
  def table_data(seg) do
    from_speed = Joiner.Video.avg_speed_kmh(seg.from) |> rnd()
    to_speed = Joiner.Video.avg_speed_kmh(seg.to) |> rnd()

    Map.merge(
      seg.metrics,
      %{
        v1_end: stop_human(seg, :from),
        v2_start: start_human(seg, :to),
        v1_pos: "#{stop_percent(seg, :from) |> rnd(0)}%",
        v2_pos: "#{start_percent(seg, :to) |> rnd(0)}%",
        speed: "#{from_speed} → #{to_speed}"
      }
    )
  end

  @spec debug(t(), binary()) :: binary()
  def debug(seg, msg \\ "") do
    start1 = start_timestamp(seg, :from)
    start2 = start_timestamp(seg, :to)
    stop1 = stop_timestamp(seg, :from)
    stop2 = stop_timestamp(seg, :to)

    len = max(String.length(seg.from.ident), String.length(seg.to.ident))
    ident1 = String.pad_trailing(seg.from.ident, len)
    ident2 = String.pad_trailing(seg.to.ident, len)

    "#{msg}\n  #{ident1} #{start1} #{stop1}\n  #{ident2} #{start2} #{stop2}"
  end

  @typep sel() :: :from | :to
  defguardp sel(sel) when sel == :from or sel == :to

  @spec start_ms(t(), sel()) :: non_neg_integer()
  def start_ms(seg, video) when sel(video), do: Map.fetch!(seg, video).start.time_offset_ms
  @spec stop_ms(t(), sel()) :: non_neg_integer()
  def stop_ms(seg, video) when sel(video), do: Map.fetch!(seg, video).stop.time_offset_ms

  @spec start_s(t(), sel()) :: float()
  def start_s(seg, video) when sel(video), do: start_ms(seg, video) / 1000.0
  @spec stop_s(t(), sel()) :: float()
  def stop_s(seg, video) when sel(video), do: stop_ms(seg, video) / 1000.0

  @spec start_timestamp(t(), sel()) :: Video.Timestamp.t()
  def start_timestamp(seg, video) when sel(video),
    do: start_ms(seg, video) |> Video.Timestamp.from_milliseconds()

  @spec stop_timestamp(t(), sel()) :: Video.Timestamp.t()
  def stop_timestamp(seg, video) when sel(video),
    do: stop_ms(seg, video) |> Video.Timestamp.from_milliseconds()

  @spec start_percent(t(), sel()) :: float()
  def start_percent(seg, video) when sel(video) do
    ms = start_ms(seg, video)
    dur = Map.fetch!(seg, video).meta.duration * 1000
    ms / dur * 100
  end

  @spec stop_percent(t(), sel()) :: float()
  def stop_percent(seg, video) when sel(video) do
    ms = stop_ms(seg, video)
    dur = Map.fetch!(seg, video).meta.duration * 1000
    ms / dur * 100
  end

  @spec stop_percent(t(), sel()) :: :start | Video.Timestamp.t()
  def start_human(seg, video) when sel(video) do
    if Joiner.Video.at_start?(Map.fetch!(seg, video)),
      do: :start,
      else: start_timestamp(seg, video)
  end

  @spec stop_human(t(), sel()) :: :end | Video.Timestamp.t()
  def stop_human(seg, video) when sel(video) do
    if Joiner.Video.at_end?(Map.fetch!(seg, video)),
      do: :end,
      else: stop_timestamp(seg, video)
  end

  @spec video_path(t(), sel()) :: binary()
  def video_path(seg, video) when sel(video), do: Map.fetch!(seg, video).source.source

  @spec start_end?(t()) :: boolean()
  def start_end?(seg) do
    Joiner.Video.at_end?(seg.from) && Joiner.Video.at_start?(seg.to)
  end

  @doc """
  Calculates the average speed of each video and stores their normalized diff in
  `segment.metrics.speed_diff`. Uses relative difference so that e.g. 5→15 km/h
  (100% change) is penalized more than 30→40 km/h (33% change). The values
  range [0.0, 1.0], where 1.0 would be no speed difference.
  """
  @spec set_speed_diff_metric(t()) :: t()
  def set_speed_diff_metric(seg) do
    kmh1 = Joiner.Video.avg_speed_kmh(seg.from)
    kmh2 = Joiner.Video.avg_speed_kmh(seg.to)

    norm = 1.0 - abs(kmh1 - kmh2) / max(kmh1, max(kmh2, 1.0))

    set_metric(seg, :speed_diff, norm)
  end

  @doc """
  Calculates the distance between the average position of the two videos. The
  metric is normalized to [0.0, 1.0], where 1.0 would be a "videos are perfectly
  on top of each other". The result is stored in `segment.metrics.distance`.
  """
  @spec set_distance_metric(t(), Joiner.Options.t()) :: t() | no_return()
  def set_distance_metric(seg, %{geo_max_dist_m: max_dist}) do
    pos1 = Joiner.Video.avg_position(seg.from)
    pos2 = Joiner.Video.avg_position(seg.to)

    dist = Geo.CheapRuler.point2point_dist(pos1, pos2)
    norm = 1.0 - min(dist, max_dist) / max_dist

    set_metric(seg, :distance, norm)
  end

  @doc """
  Estimates the distance between the two videos using the GPS overlap region's
  start/stop endpoints. Unlike `set_distance_metric/2` (which uses the full
  polyline's average position), this works before visual refinement trims the
  polylines. Returns a value in [0.0, 1.0] on the same scale as the distance
  metric.
  """
  @spec estimate_overlap_distance(t(), Joiner.Options.t()) :: float()
  def estimate_overlap_distance(seg, %{geo_max_dist_m: max_dist}) do
    d1 = Geo.CheapRuler.point2point_dist(seg.from.start, seg.to.start)
    d2 = Geo.CheapRuler.point2point_dist(seg.from.stop, seg.to.stop)
    1.0 - min((d1 + d2) / 2.0, max_dist) / max_dist
  end

  @doc """
  Calculates the weighted metric for this segment and stores it in the
  `segment.metrics.weighted`. Raises if a weighted metric has not been
  calculated for this segment. Assumes that the stored metrics in this segment
  already have been normalized to [0.0, 1.0].
  """
  @spec set_weighted_metric(t(), Joiner.Options.t()) :: t() | no_return()
  def set_weighted_metric(seg, %{weights: weights}) do
    val =
      Enum.reduce(weights, 0.0, fn {metric, weight}, sum ->
        Map.fetch!(seg.metrics, metric) * weight + sum
      end)

    set_metric(seg, :weighted, val)
  end

  @spec set_metric(t(), Joiner.Options.t() | atom(), float()) :: t()
  def set_metric(seg, %{visual_compare_metric: metric}, val), do: set_metric(seg, metric, val)

  def set_metric(seg, metric, val) when is_atom(metric),
    do: %{seg | metrics: Map.put(seg.metrics, metric, val)}

  @spec set_from(t(), Joiner.Video.t()) :: t()
  def set_from(seg, from) do
    dur1 = Joiner.Video.duration_ms(from)
    dur2 = Joiner.Video.duration_ms(seg.to)
    %{seg | from: from, duration_ms: min(dur1, dur2)}
  end

  @spec set_to(t(), Joiner.Video.t()) :: t()
  def set_to(seg, to) do
    dur1 = Joiner.Video.duration_ms(seg.from)
    dur2 = Joiner.Video.duration_ms(to)
    %{seg | to: to, duration_ms: min(dur1, dur2)}
  end

  @spec set_from_to(t(), Joiner.Video.t(), Joiner.Video.t()) :: t()
  def set_from_to(seg, from, to) do
    dur1 = Joiner.Video.duration_ms(from)
    dur2 = Joiner.Video.duration_ms(to)
    %{seg | from: from, to: to, duration_ms: min(dur1, dur2)}
  end

  @spec frame_count_between(t(), sel()) :: non_neg_integer()
  def frame_count_between(seg, video) when sel(video) do
    Video.Metadata.frame_count_between(
      Map.fetch!(seg, video).meta,
      start_s(seg, video),
      stop_s(seg, video)
    )
  end

  defp rnd(val, decimals \\ 1) do
    :erlang.float_to_binary(val, decimals: decimals)
  end
end
