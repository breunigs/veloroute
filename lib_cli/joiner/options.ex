defmodule Joiner.Options do
  @type metric() :: Joiner.FfmpegMetrics.metric() | :dino | :distance | :speed_diff | :weighted
  @type weights() :: %{metric() => float()}

  @non_metric_cols [:v1_end, :v2_start, :v1_pos, :v2_pos, :speed]
  @type table_columns :: :v1_end | :v2_start | :speed | metric()

  def non_weight_table_columns(), do: @non_metric_cols

  @type t :: %__MODULE__{
          fade_duration_ms: non_neg_integer(),
          geo_max_dist_m: float(),
          geo_max_bearing_deg: float(),
          geo_min_time_diff_self_join_ms: non_neg_integer(),
          geo_max_segment_length_ms: non_neg_integer(),
          visual_image_height: non_neg_integer(),
          visual_compare_metric: Joiner.FfmpegMetrics.metric(),
          visual_prune_below: float(),
          visual_top_percent: float(),
          visual_max_candidates: pos_integer(),
          dino_prune_below: float(),
          dino_top_percent: float(),
          distance_prune_below: float(),
          weights: weights(),
          user_max_candidates: pos_integer(),
          preview_blur: boolean(),
          preview_player_custom: binary() | nil,
          preview_use_host_ffmpeg: boolean()
        }

  @enforce_keys [
    :fade_duration_ms,
    :geo_max_dist_m,
    :geo_max_bearing_deg,
    :geo_min_time_diff_self_join_ms,
    :geo_max_segment_length_ms,
    :visual_image_height,
    :visual_compare_metric,
    :visual_prune_below,
    :visual_top_percent,
    :visual_max_candidates,
    :dino_prune_below,
    :dino_top_percent,
    :distance_prune_below,
    :weights,
    :user_max_candidates,
    :preview_blur,
    :preview_player_custom,
    :preview_use_host_ffmpeg
  ]
  defstruct @enforce_keys

  def new(),
    do: %__MODULE__{
      # how long the fade should take, in milliseconds
      fade_duration_ms: round(Video.Track.default_fade() * 1000.0),

      ### GPS track matching
      # how close two GPS points must be each other to be considered
      # "overlapping" (and thus a potential video joining point)
      geo_max_dist_m: 15.0,
      # how strongly must two GPS tracks aim in the same direction to be
      # considered "overlapping". 180° would consider even tracks in the
      # opposite direction to be allowed, 90° would allow intersections shaped
      # like a +. The lower, the more closely the tracks must share the same
      # direction.
      geo_max_bearing_deg: 25.0,
      # How many milliseconds the track needs to be apart to be considered for
      # self joins. Should be large enough so that the previous or next few
      # frames are not considered to be overlapping, but short enough to not
      # exclude "quick fixes" like a double U-turn.
      geo_min_time_diff_self_join_ms: 10_000,
      # How long a segment is allowed to be before being split up into multiple
      # segments. This avoids a long segment comparing the start of video1 with
      # the end of video2, even if those two are very far apart.
      geo_max_segment_length_ms: 3_000,

      ### visual candidate search
      # To conserve computing power, videos will be downscaled to this size
      # before applying the (cheaper) visual compare metric.
      visual_image_height: 270,
      # Which visual compare metric to use. Must be supported bei
      # `Joiner.FfmpegMetrics`.
      visual_compare_metric: :xpsnr,
      # Completely ignore candidates that result in a metric value lower than
      # this. The raw result is normalized by fade_duration_ms and
      # visual_image_height. However, it is before the metric is normalized for
      # the final selection (i.e. its range is not bounded from [0.0, 1.0]).
      visual_prune_below: 0.17,
      # Within a single visual comparison of a segment, take only the top-n%
      # candidates and discard the rest. This avoids passing too many candidates
      # down the more expensive OpenAI filter, if there are a lot of matches not
      # caught by the static visual_prune_below limit.
      visual_top_percent: 10.0,
      # If the above two settings didn't remove enough candidates, still only
      # take the maximum specified here.
      visual_max_candidates: 20,

      ### visual candidate refinement
      # Ignore all results for which DINOv3 model results in a cosine
      # similarity lower than this.
      dino_prune_below: 0.65,
      # Within a single visual refinement run, only take the top n% candidates
      # and discard the rest.
      dino_top_percent: 5.0,

      ### distance pre-filter
      # Before running expensive visual/dino processing, estimate the distance
      # between the GPS overlap region endpoints. Skip segments where the
      # estimated distance metric falls below this threshold. Uses the same
      # [0.0, 1.0] scale as the distance metric (1.0 = on top of each other).
      distance_prune_below: 0.1,

      ### final selections
      # to compute the order in which results are presented to the user, specify
      # the weight of various statistics.
      weights: %{
        dino: 0.68,
        xpsnr: 0.09,
        distance: 0.09,
        speed_diff: 0.14
      },
      # assuming there's more results, how many to present to the user
      user_max_candidates: 5,

      ### miscellaneous options
      preview_blur: false,
      preview_player_custom: nil,
      preview_use_host_ffmpeg: true
    }

  @spec fade_duration_s(t()) :: float()
  def fade_duration_s(%{fade_duration_ms: ms}), do: ms / 1000.0
end
