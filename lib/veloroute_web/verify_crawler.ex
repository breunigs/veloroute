defmodule VelorouteWeb.VerifyCrawler do
  @behaviour Plug
  require Logger

  @always_served ["/robots.txt"]

  @impl Plug
  def init(opts) do
    %{
      rdns: Keyword.get(opts, :rdns, VelorouteWeb.VerifyCrawler.Rdns),
      ip_ranges: Keyword.get(opts, :ip_ranges, VelorouteWeb.VerifyCrawler.IpRanges)
    }
  end

  @impl Plug
  def call(%{request_path: path} = conn, _verifiers) when path in @always_served, do: conn

  def call(conn, verifiers) do
    case VelorouteWeb.Crawlers.policy(user_agent(conn)) do
      :pass -> conn
      :disallowed -> reject(conn, "disallowed in robots.txt")
      {:verify, how} -> maybe_reject(conn, how, verifiers)
    end
  end

  defp maybe_reject(conn, how, verifiers) do
    with {:ok, addr} <- client_address(conn),
         :forged <- verify(addr, how, verifiers) do
      reject(conn, "forged crawler identity")
    else
      _ -> conn
    end
  end

  defp reject(conn, reason) do
    Logger.info("rejected (#{reason}): #{user_agent(conn)}")

    conn
    |> Plug.Conn.put_resp_header("x-robots-tag", "noindex")
    |> Plug.Conn.send_resp(403, "")
    |> Plug.Conn.halt()
  end

  defp user_agent(conn) do
    conn |> Plug.Conn.get_req_header("user-agent") |> List.first()
  end

  defp client_address(conn) do
    ip =
      case Plug.Conn.get_req_header(conn, "x-forwarded-for") do
        [] ->
          conn.remote_ip |> :inet.ntoa() |> to_string()

        forwarded ->
          forwarded |> Enum.join(",") |> String.split(",") |> List.last() |> String.trim()
      end

    case :inet.parse_address(String.to_charlist(ip)) do
      {:ok, addr} -> {:ok, addr}
      _ -> :skip
    end
  end

  defp verify(addr, {:rdns, domains}, %{rdns: mod}), do: mod.verify(addr, domains)
  defp verify(addr, {:ip_ranges, keys}, %{ip_ranges: mod}), do: mod.verify(addr, keys)
end
