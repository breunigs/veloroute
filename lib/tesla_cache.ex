defmodule TeslaCache do
  @behaviour Tesla.Middleware
  @ttl :timer.hours(24)

  require Cachex.Spec

  def child_spec() do
    Supervisor.child_spec(
      {Cachex,
       name: __MODULE__,
       hooks: [
         Cachex.Spec.hook(
           module: Cachex.Limit.Scheduled,
           args: {
             # setting cache max size
             Settings.external_map_cache_entry_limit(),
             # options for `Cachex.prune/3`
             [],
             # options for `Cachex.Limit.Scheduled`
             []
           }
         )
       ]},
      id: __MODULE__
    )
  end

  def call(env, next, _opts) do
    {:ok, resp} = Cachex.get(__MODULE__, cache_key(env))

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
    {cache_status, resp} = Cachex.fetch(__MODULE__, key, run(env, next), expire: @ttl)
    if cache_status == :ok, do: Cachex.touch(__MODULE__, key)
    resp
  end

  defp background_update(env, next) do
    Task.start(fn ->
      with {:commit, resp} <- run(env, next).() do
        Cachex.put(__MODULE__, cache_key(env), resp, expire: @ttl)
      end
    end)
  end

  defp run(env, next) do
    fn ->
      resp = Tesla.run(env, next)
      {keep?(resp), resp}
    end
  end

  defp keep?({:ok, %Tesla.Env{status: 200, body: body}})
       when body != <<>> and body != "" and body != nil,
       do: :commit

  defp keep?({_status, _env}), do: :ignore

  defp cache_busters?(%Tesla.Env{query: query}), do: Enum.any?(query, &(elem(&1, 0) == "sku"))

  defp cache_key(%Tesla.Env{url: url, query: query}) do
    query = Enum.reject(query, &(elem(&1, 0) == "sku"))
    Tesla.build_url(url, query)
  end
end
