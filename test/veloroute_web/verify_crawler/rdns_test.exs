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

  describe "verify/2 does not block the caller" do
    test "an address it has never seen is unknown rather than a DNS wait" do
      assert VelorouteWeb.VerifyCrawler.Rdns.verify({192, 0, 2, 123}, @google) == :unknown
    end

    test "it answers from the cache once a verdict is known" do
      key = {{192, 0, 2, 200}, @google}
      Cachex.put(VelorouteWeb.VerifyCrawler.Rdns, key, :forged)
      on_exit(fn -> Cachex.del(VelorouteWeb.VerifyCrawler.Rdns, key) end)

      assert VelorouteWeb.VerifyCrawler.Rdns.verify({192, 0, 2, 200}, @google) == :forged
    end
  end
end
