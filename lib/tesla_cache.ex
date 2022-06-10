defmodule TeslaCache do
  @behaviour Tesla.Middleware
  @ttl :timer.hours(24)

  def call(env, next, _opts) do
    if cache_busters?(env) do
      Tesla.run(env, next)
    else
      run = fn ->
        resp = Tesla.run(env, next)
        {keep?(resp), resp}
      end

      {_status, resp} = Cachex.fetch(:tesla_cache_cachex, cache_key(env), run, ttl: @ttl)
      resp
    end
  end

  defp keep?({:ok, %Tesla.Env{status: 200}}), do: :commit
  defp keep?({_status, _env}), do: :ignore

  defp cache_busters?(%Tesla.Env{query: query}), do: Enum.any?(query, &(elem(&1, 0) == "sku"))

  defp cache_key(%Tesla.Env{url: url, query: query}), do: Tesla.build_url(url, query)
end
