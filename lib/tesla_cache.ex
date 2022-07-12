defmodule TeslaCache do
  @behaviour Tesla.Middleware
  @ttl :timer.hours(24)

  def call(env, next, _opts) do
    {:ok, resp} = Cachex.get(:tesla_cache_cachex, cache_key(env))

    cond do
      is_nil(resp) ->
        fetch(env, next)

      cache_busters?(env) ->
        background_update(env, next)
        resp

      true ->
        resp
    end
  end

  defp fetch(env, next) do
    key = cache_key(env)
    {cache_status, resp} = Cachex.fetch(:tesla_cache_cachex, key, run(env, next), ttl: @ttl)
    if cache_status == :ok, do: Cachex.touch(:tesla_cache_cachex, key)
    resp
  end

  defp background_update(env, next) do
    Task.start(fn ->
      with {:commit, resp} <- run(env, next).() do
        Cachex.put(:tesla_cache_cachex, cache_key(env), resp, ttl: @ttl)
      end
    end)
  end

  defp run(env, next) do
    fn ->
      resp = Tesla.run(env, next)
      {keep?(resp), resp}
    end
  end

  defp keep?({:ok, %Tesla.Env{status: 200}}), do: :commit
  defp keep?({_status, _env}), do: :ignore

  defp cache_busters?(%Tesla.Env{query: query}), do: Enum.any?(query, &(elem(&1, 0) == "sku"))

  defp cache_key(%Tesla.Env{url: url, query: query}) do
    query = Enum.reject(query, &(elem(&1, 0) == "sku"))
    Tesla.build_url(url, query)
  end
end
