defmodule Video.TrimmedSource do
  @known_params [
    :anonymized_path_rel,
    :from,
    :to,
    :coords
  ]

  @type t :: %__MODULE__{
          anonymized_path_rel: binary(),
          from: binary(),
          to: binary(),
          coords: [
            %{
              lat: float(),
              lon: float(),
              time_offset_ms: integer()
            }
          ]
        }

  @enforce_keys @known_params
  defstruct @known_params

  @spec new_from_way(Map.Way.t(), atom()) :: t()
  def new_from_way(%Map.Way{tags: %{video_forward: video_name}, nodes: [hd | tail]}, :forward) do
    new(video_name, hd, List.last(tail))
  end

  def new_from_way(%Map.Way{tags: %{video_backward: video_name}, nodes: [hd | tail]}, :backward) do
    new(video_name, List.last(tail), hd)
  end

  @spec new(binary(), Geo.CheapRuler.point(), Geo.CheapRuler.point()) :: t()
  def new(video_name, from, to) do
    video = Video.Source.new_from_path(video_name)
    coords = Video.Source.time_range(video, from, to)

    %__MODULE__{
      anonymized_path_rel: video.path_anonymized,
      coords: coords,
      from: coords |> hd |> format_time_ffmpeg(),
      to: coords |> List.last() |> format_time_ffmpeg()
    }
  end

  def to_str(%__MODULE__{anonymized_path_rel: p, from: f, to: t}), do: "#{p} #{f} #{t}"

  def abs_path(%__MODULE__{anonymized_path_rel: r}),
    do:
      Settings.video_source_dir_abs()
      |> Path.join(r)

  @second_in_ms 1000
  @minute_in_ms 60 * @second_in_ms
  @hour_in_ms 60 * @minute_in_ms
  defp format_time_ffmpeg(%{time_offset_ms: duration_in_ms}) do
    hours = div(duration_in_ms, @hour_in_ms)
    duration_in_ms = rem(duration_in_ms, @hour_in_ms)

    minutes = div(duration_in_ms, @minute_in_ms)
    duration_in_ms = rem(duration_in_ms, @minute_in_ms)

    seconds = div(duration_in_ms - hours - minutes, @second_in_ms)
    milliseconds = rem(duration_in_ms, @second_in_ms)

    "#{hours}:#{pad_left(minutes)}:#{pad_left(seconds)}.#{pad_left(milliseconds, 4)}"
  end

  defp pad_left(int, num \\ 2), do: String.pad_leading("#{int}", num, "0")
end
