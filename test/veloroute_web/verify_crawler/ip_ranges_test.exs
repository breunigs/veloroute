defmodule VelorouteWeb.VerifyCrawler.IpRangesTest do
  use ExUnit.Case, async: true

  defp addr(str) do
    {:ok, parsed} = :inet.parse_address(String.to_charlist(str))
    parsed
  end

  defp prefix(cidr) do
    [ip, bits] = String.split(cidr, "/")
    key = if String.contains?(ip, ":"), do: "ipv6Prefix", else: "ipv4Prefix"
    VelorouteWeb.VerifyCrawler.IpRanges.parse_prefix(%{key => "#{ip}/#{bits}"})
  end

  describe "parse_prefix/1" do
    test "reads an IPv4 prefix" do
      assert prefix("74.7.175.128/25") == {{74, 7, 175, 128}, 25}
    end

    test "reads an IPv6 prefix" do
      assert prefix("2600:1f14::/48") == {{9728, 7956, 0, 0, 0, 0, 0, 0}, 48}
    end

    test "ignores an entry it cannot understand" do
      assert VelorouteWeb.VerifyCrawler.IpRanges.parse_prefix(%{"ipv4Prefix" => "nonsense"}) ==
               nil

      assert VelorouteWeb.VerifyCrawler.IpRanges.parse_prefix(%{"ipv4Prefix" => "1.2.3.4"}) == nil

      assert VelorouteWeb.VerifyCrawler.IpRanges.parse_prefix(%{"somethingElse" => "1.2.3.0/24"}) ==
               nil
    end
  end

  describe "in_any?/2 with IPv4" do
    setup do
      %{nets: [prefix("74.7.175.128/25"), prefix("18.97.9.96/29")]}
    end

    test "matches an address inside a range", %{nets: nets} do
      assert VelorouteWeb.VerifyCrawler.IpRanges.in_any?(addr("74.7.175.137"), nets)
    end

    test "matches the first and last address of a range", %{nets: nets} do
      assert VelorouteWeb.VerifyCrawler.IpRanges.in_any?(addr("74.7.175.128"), nets)
      assert VelorouteWeb.VerifyCrawler.IpRanges.in_any?(addr("74.7.175.255"), nets)
    end

    test "rejects the addresses just outside a range", %{nets: nets} do
      refute VelorouteWeb.VerifyCrawler.IpRanges.in_any?(addr("74.7.175.127"), nets)
      refute VelorouteWeb.VerifyCrawler.IpRanges.in_any?(addr("74.7.176.0"), nets)
    end

    test "rejects one of the GCP addresses that forged these identities", %{nets: nets} do
      refute VelorouteWeb.VerifyCrawler.IpRanges.in_any?(addr("34.80.23.117"), nets)
    end

    test "handles a small prefix exactly", %{nets: nets} do
      assert VelorouteWeb.VerifyCrawler.IpRanges.in_any?(addr("18.97.9.96"), nets)
      assert VelorouteWeb.VerifyCrawler.IpRanges.in_any?(addr("18.97.9.103"), nets)
      refute VelorouteWeb.VerifyCrawler.IpRanges.in_any?(addr("18.97.9.104"), nets)
    end
  end

  describe "in_any?/2 with IPv6" do
    setup do: %{nets: [prefix("2600:1f14::/48")]}

    test "matches inside the range", %{nets: nets} do
      assert VelorouteWeb.VerifyCrawler.IpRanges.in_any?(addr("2600:1f14:0:dead::1"), nets)
    end

    test "rejects outside the range", %{nets: nets} do
      refute VelorouteWeb.VerifyCrawler.IpRanges.in_any?(addr("2600:1f15::1"), nets)
    end

    test "never matches an IPv4 address against an IPv6 prefix", %{nets: nets} do
      refute VelorouteWeb.VerifyCrawler.IpRanges.in_any?(addr("74.7.175.137"), nets)
    end
  end

  describe "in_any?/2 edge cases" do
    test "an empty list matches nothing" do
      refute VelorouteWeb.VerifyCrawler.IpRanges.in_any?(addr("1.2.3.4"), [])
    end

    test "a /32 matches only itself" do
      nets = [prefix("44.208.221.197/32")]
      assert VelorouteWeb.VerifyCrawler.IpRanges.in_any?(addr("44.208.221.197"), nets)
      refute VelorouteWeb.VerifyCrawler.IpRanges.in_any?(addr("44.208.221.198"), nets)
    end
  end

  describe "verify/3" do
    defp lookup(map), do: fn key -> Map.get(map, key, :pending) end

    test "verified when the address is in a loaded list" do
      nets = [prefix("74.7.175.128/25")]

      assert VelorouteWeb.VerifyCrawler.IpRanges.verify(
               addr("74.7.175.137"),
               [:openai_searchbot],
               lookup(%{openai_searchbot: {:ok, nets}})
             ) == :verified
    end

    test "forged when every list is loaded and none match" do
      nets = [prefix("74.7.175.128/25")]

      assert VelorouteWeb.VerifyCrawler.IpRanges.verify(
               addr("34.80.23.117"),
               [:openai_searchbot],
               lookup(%{openai_searchbot: {:ok, nets}})
             ) == :forged
    end

    test "unknown while a list has not loaded yet, rather than guessing" do
      assert VelorouteWeb.VerifyCrawler.IpRanges.verify(
               addr("1.2.3.4"),
               [:openai_searchbot],
               lookup(%{})
             ) == :unknown
    end

    test "unknown when only some of several lists have loaded" do
      nets = [prefix("74.7.175.128/25")]

      assert VelorouteWeb.VerifyCrawler.IpRanges.verify(
               addr("34.80.23.117"),
               [:openai_searchbot, :openai_chatgpt_user],
               lookup(%{openai_searchbot: {:ok, nets}})
             ) == :unknown
    end
  end

  describe "an empty list never rejects anybody" do
    test "verify/3 treats a loaded but empty list as no answer" do
      refute VelorouteWeb.VerifyCrawler.IpRanges.verify(
               addr("104.210.140.130"),
               [:openai_chatgpt_user],
               lookup(%{openai_chatgpt_user: {:ok, []}})
             ) == :forged
    end

    test "verify/2 does not reject when an empty list sits in the cache" do
      Cachex.put(VelorouteWeb.VerifyCrawler.IpRanges, :perplexity_user, [])

      on_exit(fn -> Cachex.del(VelorouteWeb.VerifyCrawler.IpRanges, :perplexity_user) end)

      assert VelorouteWeb.VerifyCrawler.IpRanges.verify(addr("1.2.3.4"), [:perplexity_user]) ==
               :unknown
    end
  end

  describe "sources/0" do
    test "lists only agents that robots.txt allows" do
      for key <- Map.keys(VelorouteWeb.VerifyCrawler.IpRanges.sources()) do
        refute key in [:openai_gptbot, :perplexitybot],
               "#{key} is disallowed by name, so its ranges are never consulted"
      end
    end

    test "covers every key the crawler policy can ask for" do
      known = VelorouteWeb.VerifyCrawler.IpRanges.sources() |> Map.keys() |> MapSet.new()

      asked =
        ["OAI-SearchBot/1.4", "ChatGPT-User/1.0", "Perplexity-User/1.0"]
        |> Enum.flat_map(fn ua ->
          case VelorouteWeb.Crawlers.policy("Mozilla/5.0 (compatible; #{ua})") do
            {:verify, {:ip_ranges, keys}} -> keys
            _ -> []
          end
        end)
        |> MapSet.new()

      assert MapSet.size(asked) > 0
      assert MapSet.subset?(asked, known)
    end
  end
end
