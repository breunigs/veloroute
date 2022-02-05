defmodule Map.ReverseProxyPlug do
  @behaviour Plug

  defmodule Massager do
    @behaviour Tesla.Middleware

    @impl Tesla.Middleware
    def call(env, next, _opts) do
      env
      |> drop_req_headers()
      |> set_access_token()
      |> Tesla.run(next)
      |> drop_resp_headers()
    end

    @drop_req_headers ~w[cache-control cookie dnt pragma referer user-agent]
    defp drop_req_headers(env) do
      Map.update!(env, :headers, &drop_string_keywords(&1, @drop_req_headers))
    end

    defp set_access_token(env) do
      uri = URI.parse(env.url)

      query = if uri.query, do: uri.query |> URI.query_decoder() |> Enum.into(%{}), else: %{}
      query = merge(query, env.query)
      query = Map.put(query, "access_token", Credentials.mapbox_access_token())

      url = %{uri | query: nil} |> to_string()

      Map.merge(env, %{url: url, query: Enum.to_list(query)})
    end

    @drop_resp_headers ~w[age via x-amz-cf-id x-amz-cf-pop x-cache x-origin x-request-id]
    defp drop_resp_headers({:ok, env}) do
      {:ok, Map.update!(env, :headers, &drop_string_keywords(&1, @drop_resp_headers))}
    end

    defp drop_resp_headers(buggy), do: buggy

    defp merge(a, b) when is_list(a), do: merge(Map.new(a), b)
    defp merge(a, b) when is_list(b), do: merge(a, Map.new(b))
    defp merge(a, b), do: Map.merge(a, b)

    defp drop_string_keywords(list, keys) when is_list(list) and is_list(keys) do
      :lists.filter(fn {key, _} -> key not in keys end, list)
    end
  end

  def init(_opts) do
    client =
      Tesla.client([
        Map.ReverseProxyPlug.Massager,
        {Tesla.Middleware.Cache, ttl: :timer.hours(24)}
      ])

    ReverseProxyPlug.init(
      upstream: Mapbox.base(),
      response_mode: :buffer,
      client_options: [tesla_client: client]
    )
  end

  def call(conn = %{path_info: ["map" | rest]}, opts) do
    conn
    |> Plug.forward(rest, ReverseProxyPlug, opts)
    |> Plug.Conn.halt()
  end

  def call(conn, _opts), do: conn
end
