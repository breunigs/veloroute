defmodule VelorouteWeb.VerifyCrawler.RdnsTest do
  use ExUnit.Case, async: true

  @google ~w(.googlebot.com .google.com)
  @addr {66, 249, 70, 1}
  @other {34, 80, 23, 117}

  defp resolve(opts) do
    reverse = Keyword.get(opts, :reverse, fn _ -> {:ok, "crawl-66-249-70-1.googlebot.com"} end)
    forward = Keyword.get(opts, :forward, fn _, _ -> {:ok, [@addr]} end)

    VelorouteWeb.VerifyCrawler.Rdns.resolve(
      @addr,
      Keyword.get(opts, :domains, @google),
      reverse,
      forward
    )
  end

  describe "a name under the operator's domain that resolves back" do
    test "is verified" do
      assert resolve([]) == :verified
    end

    test "is verified even when the PTR comes back with a trailing dot" do
      assert resolve(reverse: fn _ -> {:ok, "crawl-66-249-70-1.googlebot.com."} end) == :verified
    end

    test "is verified even when the PTR comes back in mixed case" do
      assert resolve(reverse: fn _ -> {:ok, "Crawl-66-249-70-1.GoogleBot.COM"} end) == :verified
    end

    test "is verified when the forward lookup returns several addresses" do
      assert resolve(forward: fn _, _ -> {:ok, [{1, 2, 3, 4}, @addr]} end) == :verified
    end
  end

  describe "forged" do
    test "when the address has no PTR record at all" do
      assert resolve(reverse: fn _ -> :forged end) == :forged
    end

    test "when the PTR sits under somebody else's domain" do
      assert resolve(reverse: fn _ -> {:ok, "117.23.80.34.bc.googleusercontent.com"} end) ==
               :forged
    end

    test "when the name forward-resolves to a different address" do
      assert resolve(forward: fn _, _ -> {:ok, [@other]} end) == :forged
    end

    test "when the name does not forward-resolve at all" do
      assert resolve(forward: fn _, _ -> :forged end) == :forged
    end

    test "when the domain merely appears inside the name rather than ending it" do
      assert resolve(reverse: fn _ -> {:ok, "crawl.googlebot.com.evil.example"} end) == :forged
    end
  end

  describe "unknown, so the request is let through" do
    test "when the reverse lookup errors rather than answering" do
      assert resolve(reverse: fn _ -> :error end) == :unknown
    end

    test "when the forward lookup errors rather than answering" do
      assert resolve(forward: fn _, _ -> :error end) == :unknown
    end
  end

  describe "normalise/1" do
    test "drops a trailing dot" do
      assert VelorouteWeb.VerifyCrawler.Rdns.normalise("a.googlebot.com.") == "a.googlebot.com"
    end

    test "lowercases" do
      assert VelorouteWeb.VerifyCrawler.Rdns.normalise("A.GoogleBot.COM") == "a.googlebot.com"
    end

    test "leaves an already normal name alone" do
      assert VelorouteWeb.VerifyCrawler.Rdns.normalise("a.googlebot.com") == "a.googlebot.com"
    end
  end

  describe "verify/3 waits briefly for a verdict" do
    setup do
      addr = {192, 0, 2, System.unique_integer([:positive]) |> rem(250) |> Kernel.+(1)}
      on_exit(fn -> Cachex.del(VelorouteWeb.VerifyCrawler.Rdns, {addr, @google}) end)
      %{addr: addr}
    end

    test "a lookup that answers in time decides the request", %{addr: addr} do
      assert VelorouteWeb.VerifyCrawler.Rdns.verify(addr, @google, fn _, _ -> :forged end) ==
               :forged
    end

    test "a lookup that is too slow lets the request through", %{addr: addr} do
      slow = fn _, _ -> Process.sleep(600) && :forged end
      assert VelorouteWeb.VerifyCrawler.Rdns.verify(addr, @google, slow) == :unknown
    end

    test "but the slow lookup still lands, so the next request is decided", %{addr: addr} do
      slow = fn _, _ -> Process.sleep(400) && :forged end
      assert VelorouteWeb.VerifyCrawler.Rdns.verify(addr, @google, slow) == :unknown

      Process.sleep(500)

      assert VelorouteWeb.VerifyCrawler.Rdns.verify(addr, @google, fn _, _ ->
               raise "must come from the cache"
             end) == :forged
    end

    test "the wait is bounded even when the lookup hangs", %{addr: addr} do
      hang = fn _, _ -> Process.sleep(5_000) && :forged end

      {us, verdict} =
        :timer.tc(fn -> VelorouteWeb.VerifyCrawler.Rdns.verify(addr, @google, hang) end)

      assert verdict == :unknown
      assert us < 1_000_000, "waited #{div(us, 1000)}ms, expected to give up at ~250ms"
    end

    test "a known verdict answers without consulting the resolver", %{addr: addr} do
      Cachex.put(VelorouteWeb.VerifyCrawler.Rdns, {addr, @google}, :verified)

      assert VelorouteWeb.VerifyCrawler.Rdns.verify(addr, @google, fn _, _ ->
               raise "resolver must not be consulted"
             end) == :verified
    end

    test "an inconclusive lookup is not cached, so it is retried", %{addr: addr} do
      assert VelorouteWeb.VerifyCrawler.Rdns.verify(addr, @google, fn _, _ -> :unknown end) ==
               :unknown

      assert VelorouteWeb.VerifyCrawler.Rdns.verify(addr, @google, fn _, _ -> :forged end) ==
               :forged
    end
  end
end
