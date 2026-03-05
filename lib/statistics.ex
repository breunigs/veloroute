defmodule Statistics do
  # 538.6 GiB / 130207.527s at 2026-03-05
  @mib_per_second_rendered 4.235748982468579

  def visible_video_distance_km() do
    dist_m = all().distance_m
    round(dist_m / 1000)
  end

  def visible_video_duration_h() do
    dur_ms = all().duration_ms
    round(dur_ms / (1000 * 60 * 60))
  end

  def approx_disk_rendered() do
    dur_s = all().duration_ms / 1000
    mib = dur_s * @mib_per_second_rendered
    round(mib / 1024)
  end

  use Memoize

  defmemo all do
    visible_videos = Article.List.all() |> Enum.flat_map(& &1.tracks()) |> Video.Generator.get()

    Enum.reduce(visible_videos, %{duration_ms: 0, distance_m: 0}, fn render, all ->
      all
      |> Map.update!(:duration_ms, &(&1 + render.length_ms()))
      |> Map.update!(:distance_m, &(&1 + Geo.CheapRuler.line_distance(render.coords())))
    end)
  end
end
