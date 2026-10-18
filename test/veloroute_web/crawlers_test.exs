defmodule VelorouteWeb.CrawlersTest do
  use ExUnit.Case, async: true

  describe "policy/1 rejects what robots.txt disallows" do
    test "a plain disallowed crawler" do
      assert VelorouteWeb.Crawlers.policy(
               "Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)"
             ) == :disallowed
    end

    test "every name on the disallow list matches on its own" do
      for name <- VelorouteWeb.Crawlers.disallowed() do
        assert VelorouteWeb.Crawlers.policy("Mozilla/5.0 (compatible; #{name}/1.0)") ==
                 :disallowed,
               "#{name} is in robots.txt but policy/1 lets it through"
      end
    end

    test "every prefix family matches its suffixed variants too" do
      for name <- VelorouteWeb.Crawlers.disallowed_families(),
          variant <- [name, "#{name}-BM", "#{name}-COUB", "#{name}-SomethingNew"] do
        assert VelorouteWeb.Crawlers.policy("Mozilla/5.0 (compatible; #{variant}/1.0)") ==
                 :disallowed,
               "#{variant} belongs to a disallowed family but policy/1 lets it through"
      end
    end

    test "the Yandex crawlers robots.txt bans are actually caught" do
      for name <- ~w(Yandex YandexBot YandexImages YandexAccessibilityBot YandexMobileBot) do
        assert VelorouteWeb.Crawlers.policy(
                 "Mozilla/5.0 (compatible; #{name}/3.0; +http://yandex.com/bots)"
               ) == :disallowed,
               "#{name} is a Yandex crawler but policy/1 lets it through"
      end
    end

    test "YandexSearch, their phone app, is banned too - we ban Yandex whole" do
      assert VelorouteWeb.Crawlers.policy(
               "Mozilla/5.0 (Linux; Android 10) AppleWebKit/537.36 YandexSearch/25.1 Mobile Safari/537.36"
             ) == :disallowed
    end

    test "a link to yandex.com in somebody else's user agent is not a Yandex bot" do
      assert VelorouteWeb.Crawlers.policy(
               "Mozilla/5.0 (compatible; SomeBot/1.0; +http://yandex.com/bots)"
             ) == :pass
    end
  end

  describe "policy/1 only matches whole user agent tokens" do
    test "a contact address does not count as the crawler being named" do
      assert VelorouteWeb.Crawlers.policy(
               "Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Claude-SearchBot/1.0; +claudebot@anthropic.com)"
             ) == :pass
    end

    test "a link to the vendor does not count either" do
      assert VelorouteWeb.Crawlers.policy(
               "Mozilla/5.0 (compatible; SomeBot/1.0; +https://www.seobility.net/x)"
             ) == :pass
    end

    test "but the crawler itself is still caught alongside its contact address" do
      assert VelorouteWeb.Crawlers.policy(
               "Mozilla/5.0 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)"
             ) == :disallowed
    end

    test "a longer name is not swallowed by a shorter one it contains" do
      assert VelorouteWeb.Crawlers.policy("Mozilla/5.0 (compatible; GPTBot-User/1.0)") == :pass
      assert VelorouteWeb.Crawlers.policy("Mozilla/5.0 (compatible; GPTBot/1.4)") == :disallowed
    end

    test "Applebot is allowed while Applebot-Extended is not" do
      assert {:verify, _} =
               VelorouteWeb.Crawlers.policy(
                 "Mozilla/5.0 (Applebot/0.1; +http://www.apple.com/go/applebot)"
               )

      assert VelorouteWeb.Crawlers.policy("Mozilla/5.0 (compatible; Applebot-Extended/1.0)") ==
               :disallowed
    end
  end

  describe "policy/1 with Kimi, whose agents share one user agent shape" do
    defp kimi(name) do
      "Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko); compatible; #{name}/1.0; +https://www.kimi.com/policies/kimi-crawlers"
    end

    test "the training crawler is disallowed" do
      assert VelorouteWeb.Crawlers.policy(kimi("KimiBot")) == :disallowed
    end

    test "the search crawler is disallowed" do
      assert VelorouteWeb.Crawlers.policy(kimi("Kimi-SearchBot")) == :disallowed
    end

    test "the user-initiated agent is allowed but verified" do
      assert VelorouteWeb.Crawlers.policy(kimi("Kimi-User")) ==
               {:verify, {:ip_ranges, [:kimi_user]}}
    end

    test "the policy URL in the user agent does not itself trigger a match" do
      refute VelorouteWeb.Crawlers.policy(
               "Mozilla/5.0 (compatible; SomeBot/1.0; +https://www.kimi.com/policies/kimi-crawlers)"
             ) == :disallowed
    end
  end

  describe "policy/1 picks a verification method" do
    test "search engines that support reverse DNS" do
      assert {:verify, {:rdns, domains}} =
               VelorouteWeb.Crawlers.policy(
                 "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
               )

      assert ".googlebot.com" in domains
    end

    test "allowed agents that only publish IP ranges" do
      assert {:verify, {:ip_ranges, keys}} =
               VelorouteWeb.Crawlers.policy("Mozilla/5.0 (compatible; OAI-SearchBot/1.4)")

      assert :openai_searchbot in keys
    end
  end

  describe "policy/1 leaves everyone else alone" do
    test "an ordinary browser" do
      assert VelorouteWeb.Crawlers.policy(
               "Mozilla/5.0 (X11; Linux x86_64; rv:158.0) Gecko/20100101 Firefox/158.0"
             ) == :pass
    end

    test "a crawler we neither allow nor disallow by name" do
      assert VelorouteWeb.Crawlers.policy("Mozilla/5.0 (compatible; CCBot/2.0)") == :pass
    end

    test "a missing user agent" do
      assert VelorouteWeb.Crawlers.policy(nil) == :pass
    end
  end

  describe "robots_txt/1" do
    setup do
      %{txt: VelorouteWeb.Crawlers.robots_txt("https://example.com/sitemap.xml")}
    end

    test "lists every disallowed crawler", %{txt: txt} do
      for name <- VelorouteWeb.Crawlers.disallowed() do
        assert txt =~ "User-agent: #{name}\n"
      end
    end

    test "disallows them and allows everyone else", %{txt: txt} do
      assert txt =~ "User-agent: *\nAllow: /"
      assert txt =~ "Disallow: /"
    end

    test "keeps the explicit allows", %{txt: txt} do
      for name <- VelorouteWeb.Crawlers.explicitly_allowed() do
        assert txt =~ "User-agent: #{name}\nAllow: /"
      end
    end

    test "carries the throttling rules", %{txt: txt} do
      assert txt =~ "User-agent: AhrefsBot"
      assert txt =~ "Crawl-Delay: 600"
      assert txt =~ "Disallow: /map/___static/"
    end

    test "names the sitemap", %{txt: txt} do
      assert txt =~ "sitemap: https://example.com/sitemap.xml"
    end

    test "does not name a crawler we verify rather than block", %{txt: txt} do
      refute txt =~ "User-agent: Googlebot"
      refute txt =~ "User-agent: bingbot"
    end
  end
end
