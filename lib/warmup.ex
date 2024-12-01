defmodule Warmup do
  # Only run it in production, to ensure it's fast even for the first users. In
  # other envs it's preferable to lazy load.
  def maybe() do
    case Application.get_env(:veloroute, :env) do
      :prod -> definitely()
      :dev -> nil
      :test -> nil
    end
  end

  def definitely() do
    Search.Meilisearch.Runner.boot()

    Task.async(fn ->
      Parallel.each(Video.Generator.all(), &Video.Components.variants(&1.hash()))
    end)

    articles = Article.List.all()
    Parallel.each(articles, &Article.Decorators.related_tracks(&1))
    Parallel.each(articles, &Article.Decorators.bbox_self(&1))

    Statistics.all()

    initial_static_map_images()
    initial_video_poster()
  end

  defp initial_static_map_images() do
    cz = Settings.initial() |> Geo.CheapRuler.bounds_to_center_zoom_limited()
    video_route_id = VelorouteWeb.Live.VideoState.default_route_id()

    Parallel.each(VelorouteWeb.Live.Map.static_map_sizes(), fn {w, h} ->
      Basemap.Static.Runner.render(%{
        lon: cz.lon,
        lat: cz.lat,
        zoom: cz.zoom,
        width: w,
        height: h,
        pixelRatio: Basemap.Static.Plug.default_pixel_ratio(),
        highlightRoute: video_route_id
      })
    end)
  end

  defp initial_video_poster() do
    Task.start_link(fn ->
      with {hash, ts} <- VelorouteWeb.Live.VideoState.default_video_poster() do
        VelorouteWeb.ImageExtractController.extract(hash, ts, ts, :webp)
      end
    end)
  end
end
