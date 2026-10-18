defmodule VelorouteWeb.VerifyCrawlerTest do
  use ExUnit.Case, async: false

  @googlebot "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
  @searchbot "Mozilla/5.0 (compatible; OAI-SearchBot/1.4; +https://openai.com/searchbot)"
  @claudebot "Mozilla/5.0 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)"
  @firefox "Mozilla/5.0 (X11; Linux x86_64; rv:158.0) Gecko/20100101 Firefox/158.0"

  defmodule VerifiedStub do
    def verify(_addr, _arg), do: :verified
  end

  defmodule ForgedStub do
    def verify(_addr, _arg), do: :forged
  end

  defmodule UnknownStub do
    def verify(_addr, _arg), do: :unknown
  end

  defmodule UnreachableStub do
    def verify(_addr, _arg), do: raise("verifier must not be consulted")
  end

  defmodule OnlySpooferStub do
    def verify({34, 80, 23, 117}, _arg), do: :forged
    def verify(_addr, _arg), do: :verified
  end

  defp run(ua, opts) do
    ip = Keyword.get(opts, :ip, unique_ip())
    path = Keyword.get(opts, :path, "/")

    verifiers =
      VelorouteWeb.VerifyCrawler.init(
        rdns: Keyword.get(opts, :rdns, UnreachableStub),
        ip_ranges: Keyword.get(opts, :ip_ranges, UnreachableStub)
      )

    Plug.Test.conn(:get, path)
    |> then(fn conn ->
      if ua, do: Plug.Conn.put_req_header(conn, "user-agent", ua), else: conn
    end)
    |> Plug.Conn.put_req_header("x-forwarded-for", ip)
    |> VelorouteWeb.VerifyCrawler.call(verifiers)
  end

  defp unique_ip,
    do: "198.51.100.#{System.unique_integer([:positive]) |> rem(254) |> Kernel.+(1)}"

  describe "crawlers disallowed in robots.txt" do
    test "are rejected without consulting any verifier" do
      conn = run(@claudebot, [])
      assert conn.status == 403
      assert conn.halted
    end

    test "are told not to index the response" do
      conn = run(@claudebot, [])
      assert Plug.Conn.get_resp_header(conn, "x-robots-tag") == ["noindex"]
    end
  end

  describe "crawlers we allow and can verify" do
    test "pass when reverse DNS backs the claim" do
      conn = run(@googlebot, rdns: VerifiedStub)
      refute conn.halted
    end

    test "are rejected when reverse DNS contradicts the claim" do
      conn = run(@googlebot, rdns: ForgedStub)
      assert conn.status == 403
    end

    test "pass when the lookup itself fails, rather than risk a real crawler" do
      conn = run(@googlebot, rdns: UnknownStub)
      refute conn.halted
    end

    test "use the IP range list for agents without reverse DNS" do
      assert run(@searchbot, ip_ranges: ForgedStub).status == 403
      refute run(@searchbot, ip_ranges: VerifiedStub).halted
    end
  end

  describe "everyone else" do
    test "an ordinary browser is never checked" do
      refute run(@firefox, []).halted
    end

    test "a request without a user agent is never checked" do
      refute run(nil, []).halted
    end
  end

  describe "robots.txt is always served" do
    test "to a disallowed crawler, so it can read why" do
      refute run(@claudebot, path: "/robots.txt").halted
    end

    test "to a crawler failing verification" do
      refute run(@googlebot, path: "/robots.txt", rdns: ForgedStub).halted
    end
  end

  describe "client address" do
    defp forwarded_for(value) do
      Plug.Test.conn(:get, "/")
      |> Plug.Conn.put_req_header("user-agent", @googlebot)
      |> Plug.Conn.put_req_header("x-forwarded-for", value)
      |> VelorouteWeb.VerifyCrawler.call(
        VelorouteWeb.VerifyCrawler.init(rdns: OnlySpooferStub, ip_ranges: UnreachableStub)
      )
    end

    test "is taken from the rightmost entry" do
      assert forwarded_for("66.249.70.1, 34.80.23.117").status == 403
    end

    test "ignores a leftmost entry the client made up" do
      refute forwarded_for("34.80.23.117, 66.249.70.1").halted
    end

    defp forwarded_for_lines(values) do
      conn = Plug.Conn.put_req_header(Plug.Test.conn(:get, "/"), "user-agent", @googlebot)
      lines = Enum.map(values, &{"x-forwarded-for", &1})

      %{conn | req_headers: conn.req_headers ++ lines}
      |> VelorouteWeb.VerifyCrawler.call(
        VelorouteWeb.VerifyCrawler.init(rdns: OnlySpooferStub, ip_ranges: UnreachableStub)
      )
    end

    test "takes the last entry when the header arrives as two separate lines" do
      assert length(
               Plug.Conn.get_req_header(
                 %{
                   Plug.Test.conn(:get, "/")
                   | req_headers: [{"x-forwarded-for", "a"}, {"x-forwarded-for", "b"}]
                 },
                 "x-forwarded-for"
               )
             ) == 2

      assert forwarded_for_lines(["66.249.70.1", "34.80.23.117"]).status == 403
    end

    test "ignores an earlier header line the client made up" do
      refute forwarded_for_lines(["34.80.23.117", "66.249.70.1"]).halted
    end
  end

  describe "the plug keeps no state of its own" do
    test "it asks the verifier again for an address it has already seen" do
      ip = unique_ip()
      assert run(@googlebot, ip: ip, rdns: ForgedStub).status == 403
      refute run(@googlebot, ip: ip, rdns: VerifiedStub).halted
    end

    test "a changed verdict takes effect immediately" do
      ip = unique_ip()
      refute run(@googlebot, ip: ip, rdns: UnknownStub).halted
      assert run(@googlebot, ip: ip, rdns: ForgedStub).status == 403
    end
  end
end
