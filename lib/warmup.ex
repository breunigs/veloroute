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

    articles = Article.List.all()
    Parallel.each(articles, &Article.Decorators.related_tracks(&1))
    Parallel.each(articles, &Article.Decorators.bbox_self(&1))

    Statistics.all()
  end
end
