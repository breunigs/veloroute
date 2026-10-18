defmodule VelorouteWeb.Crawlers do
  @disallowed ~w(
    Amazonbot
    anthropic-ai
    Applebot-Extended
    Baiduspider
    barkrowler
    BLEXBot
    Claude-Web
    ClaudeBot
    DataForSeoBot
    dotbot
    Google-Extended
    GPTBot
    ImagesiftBot
    Kimi-SearchBot
    KimiBot
    meta-externalagent
    meta-webindexer
    MJ12bot
    MoonshotBot
    PerplexityBot
    Seobility
    SiteAuditBot
    SplitSignalBot
    turnitinbot
    Twitterbot
    VelenPublicWebCrawler
    )

  @disallowed_families ~w(SemrushBot Yandex)

  @explicitly_allowed ~w(GPTBot-User)

  @throttled %{
    "AhrefsBot" => %{
      crawl_delay: 600,
      disallow: ~w(/live/websocket /images/thumbnails/ /map/___static/ /assets/basemap/)
    }
  }

  @verifiable [
    {~r/Googlebot|Google-InspectionTool|GoogleOther|Storebot-Google/i,
     {:rdns, ~w(.googlebot.com .google.com)}},
    {~r/bingbot|BingPreview|adidxbot/i, {:rdns, ~w(.search.msn.com)}},
    {~r/Applebot/i, {:rdns, ~w(.applebot.apple.com)}},
    {~r/OAI-SearchBot/i, {:ip_ranges, [:openai_searchbot]}},
    {~r/ChatGPT-User/i, {:ip_ranges, [:openai_chatgpt_user]}},
    {~r/Perplexity-User/i, {:ip_ranges, [:perplexity_user]}},
    {~r/Kimi-User/i, {:ip_ranges, [:kimi_user]}}
  ]

  @exact_re @disallowed
            |> Enum.sort_by(&(-String.length(&1)))
            |> Enum.map_join("|", &Regex.escape/1)

  @family_re @disallowed_families
             |> Enum.sort_by(&(-String.length(&1)))
             |> Enum.map_join("|", &Regex.escape/1)

  @disallowed_re Regex.compile!(
                   "(?<![\\w@.+/-])(?:(?:#{@family_re})[-\\w]*|(?:#{@exact_re})(?![-\\w]))",
                   "i"
                 )

  def disallowed, do: @disallowed
  def disallowed_families, do: @disallowed_families
  def explicitly_allowed, do: @explicitly_allowed
  def throttled, do: @throttled

  @spec policy(binary() | nil) ::
          :disallowed | {:verify, {:rdns, [binary()]} | {:ip_ranges, [atom()]}} | :pass
  def policy(nil), do: :pass

  def policy(user_agent) do
    cond do
      Regex.match?(@disallowed_re, user_agent) ->
        :disallowed

      match = Enum.find(@verifiable, fn {re, _} -> Regex.match?(re, user_agent) end) ->
        {:verify, elem(match, 1)}

      true ->
        :pass
    end
  end

  def robots_txt(sitemap_url) do
    """
    sitemap: #{sitemap_url}

    User-agent: *
    Allow: /
    #{Enum.map_join(@throttled, "", &throttle_block/1)}
    #{Enum.map_join(Enum.sort(@disallowed ++ @disallowed_families, :asc), "", &"User-agent: #{&1}\n")}Disallow: /
    #{Enum.map_join(@explicitly_allowed, "", &"\nUser-agent: #{&1}\nAllow: /\n")}
    """
  end

  defp throttle_block({name, %{crawl_delay: delay, disallow: paths}}) do
    """

    User-agent: #{name}
    Crawl-Delay: #{delay}
    #{Enum.map_join(paths, "", &"Disallow: #{&1}\n")}
    """
  end
end
