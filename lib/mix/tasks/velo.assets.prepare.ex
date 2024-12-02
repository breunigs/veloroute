defmodule Mix.Tasks.Velo.Assets.Prepare do
  use Mix.Task
  require Logger

  @requirements ["app.start"]

  @shortdoc "Preprocess custom assets"
  def run(args) do
    copy_images()
    robots_txt()

    Mix.Tasks.Velo.Map.Ensure.run(nil)
    Mix.Tasks.Velo.Favicon.Raster.run(nil)
    Mix.Tasks.Velo.Gpx.Generate.run(nil)
    Mix.Tasks.Velo.Map.StaticRenderer.run(nil)

    if :skip_esbuild not in args, do: Mix.Tasks.Esbuild.run(~w(default --minify))

    if :skip_sass not in args,
      do: Mix.Tasks.Sass.run(~w(default --no-source-map --style=compressed))
  end

  defp copy_images() do
    Logger.info("copying images")
    File.mkdir_p!("priv/static/images/")
    File.cp_r!("data/images/", "priv/static/images/")
  end

  defp robots_txt() do
    File.write("priv/static/robots.txt", """
    sitemap: #{Settings.url()}/sitemap.xml

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
    User-agent: Applebot-Extended
    User-agent: barkrowler
    User-agent: DataForSeoBot
    User-agent: GPTBot
    User-agent: meta-externalagent
    User-agent: PerplexityBot
    User-agent: turnitinbot
    Disallow: /

    User-agent: GPTBot-User
    Allow: /
    """)
  end
end
