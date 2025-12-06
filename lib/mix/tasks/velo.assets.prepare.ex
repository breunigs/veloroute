defmodule Mix.Tasks.Velo.Assets.Prepare do
  use Mix.Task
  require Logger

  @requirements ["app.start"]

  @shortdoc "Preprocess custom assets"
  def run(args) do
    copy_images()
    robots_txt()
    Components.GraphIcon.generate_all()

    Mix.Tasks.Velo.Map.Ensure.run(nil)
    Mix.Tasks.Velo.Favicon.Raster.run(nil)
    Mix.Tasks.Velo.Gpx.Generate.run(nil)
    Mix.Tasks.Velo.Map.StaticRenderer.run(nil)

    if :skip_esbuild not in args, do: Mix.Tasks.Esbuild.run(~w(default --minify))

    if :skip_sass not in args,
      do: Mix.Tasks.Sass.run(~w(default --no-source-map --style=compressed))

    early_hints()
  end

  @digest_prefix "priv/static"
  @early_hint_preload [
    {"#{@digest_prefix}/assets/app.css", :style},
    {"#{@digest_prefix}/assets/mbgl2.js", :script},
    {"#{@digest_prefix}/images/header.svg", :image},
    {"/images/layers.svg?vsn=1", :image},
    {"/images/play.svg?vsn=1", :image},
    {"/images/reverse.svg?vsn=1", :image},
    {"/images/gear.svg?vsn=1", :image},
    {"/images/fullscreen.svg?vsn=1", :image}
  ]
  defp early_hints() do
    content =
      @early_hint_preload
      |> Enum.map(fn {path, type} ->
        path = to_digested_path(path, type)
        "header +Link \"<#{path}>; rel=preload; as=#{type}\""
      end)
      |> Enum.join("\n")

    :ok = File.write("priv/static/early_hints.txt", content <> "\n")
  end

  defp to_digested_path(@digest_prefix <> _ = file_path, type) do
    content = File.read!(file_path)
    digest = Base.encode16(:erlang.md5(content), case: :lower)
    basename = Path.basename(file_path)
    rootname = Path.rootname(basename)
    extension = Path.extname(basename)

    folder = if type == :image, do: :images, else: :assets

    "/#{folder}/#{rootname}-#{digest}#{extension}?vsn=d"
  end

  defp to_digested_path(other, _type), do: other

  defp copy_images() do
    Logger.info("copying images")
    File.mkdir_p!("priv/static/images/")
    File.cp_r!("data/images/", "priv/static/images/")
  end

  defp robots_txt() do
    File.write("priv/static/robots.txt", """
    sitemap: #{Settings.r(:url)}/sitemap.xml

    User-agent: *
    Allow: /

    User-agent: AhrefsBot
    Crawl-Delay: 600

    User-agent: AhrefsBot
    Disallow: /live/websocket
    Disallow: /images/thumbnails/
    Disallow: /map/___static/
    Disallow: /assets/basemap/

    User-agent: Amazonbot
    User-agent: anthropic-ai
    User-agent: Applebot-Extended
    User-agent: barkrowler
    User-agent: BLEXBot
    User-agent: Claude-Web
    User-agent: ClaudeBot
    User-agent: DataForSeoBot
    User-agent: dotbot
    User-agent: Google-Extended
    User-agent: GPTBot
    User-Agent: ImagesiftBot
    User-agent: meta-externalagent
    User-agent: meta-webindexer
    User-agent: MJ12bot
    User-agent: PerplexityBot
    User-agent: SemrushBot
    User-Agent: SemrushBot
    User-agent: SemrushBot-BA
    User-agent: SemrushBot-FT
    User-agent: SemrushBot-OCOB
    User-agent: SemrushBot-SI
    User-agent: SemrushBot-SWA
    User-Agent: Seobility
    User-agent: SiteAuditBot
    User-agent: SplitSignalBot
    User-agent: turnitinbot
    User-Agent: VelenPublicWebCrawler
    User-agent: Yandex
    User-agent: Twitterbot
    Disallow: /

    User-agent: GPTBot-User
    Allow: /
    """)
  end
end
