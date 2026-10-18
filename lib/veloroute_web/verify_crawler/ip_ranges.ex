defmodule VelorouteWeb.VerifyCrawler.IpRanges do
  require Logger
  use Tesla
  plug Tesla.Middleware.FollowRedirects, max_redirects: 3
  plug Tesla.Middleware.Retry, delay: 500, max_retries: 3
  plug Tesla.Middleware.JSON, decode_content_types: ["application/octet-stream", "text/plain"]

  @sources %{
    openai_searchbot: "https://openai.com/searchbot.json",
    openai_chatgpt_user: "https://openai.com/chatgpt-user.json",
    perplexity_user: "https://www.perplexity.com/perplexity-user.json",
    kimi_user: "https://www.kimi.com/policies/kimi-user.json"
  }

  @expire :timer.hours(24)
  @timeout_ms 20_000

  def sources, do: @sources

  def cache_child_spec do
    Supervisor.child_spec({Cachex, name: __MODULE__}, id: __MODULE__)
  end

  @spec verify(:inet.ip_address(), [atom()]) :: :verified | :forged | :unknown
  def verify(addr, keys), do: verify(addr, keys, &prefixes/1)

  @spec verify(:inet.ip_address(), [atom()], (atom() -> {:ok, list()} | :pending)) ::
          :verified | :forged | :unknown
  def verify(addr, keys, lookup) do
    loaded =
      Enum.map(keys, fn key ->
        case lookup.(key) do
          {:ok, [_ | _] = prefixes} -> {:ok, prefixes}
          _ -> :pending
        end
      end)

    cond do
      Enum.any?(loaded, fn
        {:ok, prefixes} -> in_any?(addr, prefixes)
        :pending -> false
      end) ->
        :verified

      loaded != [] and Enum.all?(loaded, &match?({:ok, _}, &1)) ->
        :forged

      true ->
        :unknown
    end
  end

  @spec in_any?(:inet.ip_address(), [{:inet.ip_address(), non_neg_integer()}]) :: boolean()
  def in_any?(addr, prefixes), do: Enum.any?(prefixes, &contains?(&1, addr))

  @spec parse_prefix(map()) :: {:inet.ip_address(), non_neg_integer()} | nil
  def parse_prefix(%{} = prefix) do
    with cidr when is_binary(cidr) <- prefix["ipv4Prefix"] || prefix["ipv6Prefix"],
         [addr, bits] <- String.split(cidr, "/"),
         {:ok, parsed} <- :inet.parse_address(String.to_charlist(addr)),
         {bits, ""} <- Integer.parse(bits) do
      {parsed, bits}
    else
      _ -> nil
    end
  end

  defp prefixes(key) do
    case Cachex.get(__MODULE__, key) do
      {:ok, [_ | _] = prefixes} ->
        {:ok, prefixes}

      {:ok, nil} ->
        load_in_background(key)
        :pending

      _ ->
        :pending
    end
  end

  defp load_in_background(key) do
    Task.start(fn -> Cachex.fetch(__MODULE__, key, &fetch/1) end)
  end

  defp fetch(key) do
    case get(@sources[key], opts: [adapter: [recv_timeout: @timeout_ms]]) do
      {:ok, %{status: 200, body: %{"prefixes" => prefixes}}} ->
        case prefixes |> Enum.map(&parse_prefix/1) |> Enum.reject(&is_nil/1) do
          [] ->
            Logger.warning("crawler IP list #{key} held nothing we could parse, not caching it")
            {:ignore, []}

          parsed ->
            Logger.info("crawler IP list #{key}: #{length(parsed)} prefixes")
            {:commit, parsed, expire: @expire}
        end

      other ->
        Logger.warning("could not fetch crawler IP list #{key}: #{inspect(other)}")
        {:ignore, []}
    end
  rescue
    e ->
      Logger.warning("crawler IP list #{key} raised: #{Exception.message(e)}")
      {:ignore, []}
  catch
    kind, reason ->
      Logger.warning("crawler IP list #{key} #{kind}: #{inspect(reason)}")
      {:ignore, []}
  end

  defp contains?({net, bits}, addr) when tuple_size(net) == tuple_size(addr) do
    width = if tuple_size(net) == 8, do: 16, else: 8
    total = tuple_size(net) * width
    mask = Bitwise.bsl(Bitwise.bsl(1, bits) - 1, total - bits)
    Bitwise.band(to_int(net, width), mask) == Bitwise.band(to_int(addr, width), mask)
  end

  defp contains?(_, _), do: false

  defp to_int(tuple, width) do
    tuple
    |> Tuple.to_list()
    |> Enum.reduce(0, fn part, acc -> Bitwise.bsl(acc, width) + part end)
  end
end
