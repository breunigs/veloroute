defmodule VelorouteWeb.VerifyCrawler.Rdns do
  require Logger

  @dns_timeout_ms 2_000
  @expire_verified :timer.hours(24)
  @expire_forged :timer.hours(6)

  def cache_child_spec do
    Supervisor.child_spec({Cachex, name: __MODULE__}, id: __MODULE__)
  end

  @spec verify(:inet.ip_address(), [binary()]) :: :verified | :forged | :unknown
  def verify(addr, domains) do
    case Cachex.get(__MODULE__, {addr, domains}) do
      {:ok, nil} ->
        resolve_in_background(addr, domains)
        :unknown

      {:ok, verdict} ->
        verdict

      _ ->
        :unknown
    end
  end

  @spec resolve(
          :inet.ip_address(),
          [binary()],
          (:inet.ip_address() -> {:ok, binary()} | :forged | :error),
          (binary(), :inet.ip_address() -> {:ok, [:inet.ip_address()]} | :forged | :error)
        ) :: :verified | :forged | :unknown
  def resolve(addr, domains, reverse \\ &reverse_lookup/1, forward \\ &forward_lookup/2) do
    with {:ok, name} <- reverse.(addr),
         true <- Enum.any?(domains, &String.ends_with?(normalise(name), &1)),
         {:ok, addrs} <- forward.(name, addr) do
      if addr in addrs, do: :verified, else: :forged
    else
      :forged -> :forged
      false -> :forged
      _ -> :unknown
    end
  end

  @spec normalise(binary()) :: binary()
  def normalise(name), do: name |> String.trim_trailing(".") |> String.downcase()

  defp resolve_in_background(addr, domains) do
    Task.start(fn ->
      Cachex.fetch(__MODULE__, {addr, domains}, fn _ -> cache_entry(addr, domains) end)
    end)
  end

  defp cache_entry(addr, domains) do
    case resolve(addr, domains) do
      :verified -> {:commit, :verified, expire: @expire_verified}
      :forged -> {:commit, :forged, expire: @expire_forged}
      :unknown -> {:ignore, :unknown}
    end
  rescue
    e ->
      Logger.warning("reverse DNS for #{:inet.ntoa(addr)} raised: #{Exception.message(e)}")
      {:ignore, :unknown}
  catch
    kind, reason ->
      Logger.warning("reverse DNS for #{:inet.ntoa(addr)} #{kind}: #{inspect(reason)}")
      {:ignore, :unknown}
  end

  defp reverse_lookup(addr) do
    case :inet_res.gethostbyaddr(addr, @dns_timeout_ms) do
      {:ok, {:hostent, name, _, _, _, _}} -> {:ok, to_string(name)}
      {:error, :nxdomain} -> :forged
      _ -> :error
    end
  end

  defp forward_lookup(name, addr) do
    family = if tuple_size(addr) == 8, do: :inet6, else: :inet

    case :inet_res.gethostbyname(String.to_charlist(name), family, @dns_timeout_ms) do
      {:ok, {:hostent, _, _, _, _, addrs}} -> {:ok, addrs}
      {:error, :nxdomain} -> :forged
      _ -> :error
    end
  end
end
