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

    if :skip_esbuild not in args do
      Mix.Tasks.Esbuild.run(~w(default --minify))
      Mix.Tasks.Esbuild.run(~w(maplibre --minify))
    end

    if :skip_sass not in args,
      do: Mix.Tasks.Sass.run(~w(default --no-source-map --style=compressed))

    early_hints()
  end

  @digest_prefix "priv/static"
  @early_hint_preload [
    {"#{@digest_prefix}/assets/app.css", :style},
    {"#{@digest_prefix}/assets/mbgl2.js", :module},
    # imported by both bundles below, so it must stay undigested to match the
    # relative import they contain
    {"/assets/mbgl2_shared.js", :module},
    {"#{@digest_prefix}/assets/mbgl2_worker.js", :worker},
    {"#{@digest_prefix}/images/header.svg", :image},
    {"/images/layers.svg?vsn=1", :image},
    {"/images/play.svg?vsn=1", :image},
    {"/images/reverse.svg?vsn=1", :image},
    {"/images/gear.svg?vsn=1", :image},
    {"/images/fullscreen.svg?vsn=1", :image}
  ]
  defp early_hints() do
    content =
      Enum.map_join(@early_hint_preload, "\n", fn {path, type} ->
        path = to_digested_path(path, type)
        "header +Link \"<#{path}>; #{rel(type)}\""
      end)

    :ok = File.write("priv/static/early_hints.txt", content <> "\n")
  end

  defp rel(:module), do: "rel=modulepreload"
  defp rel(type), do: "rel=preload; as=#{type}"

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
    File.write(
      "priv/static/robots.txt",
      VelorouteWeb.Crawlers.robots_txt("#{Settings.r(:url)}/sitemap.xml")
    )
  end
end
