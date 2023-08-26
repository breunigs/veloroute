defmodule Mix.Tasks.Velo.Assets.Prepare do
  use Mix.Task

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
    IO.puts(:stderr, "copying images")
    File.mkdir_p!("priv/static/images/")
    File.cp_r!("data/images/", "priv/static/images/")
  end

  defp robots_txt() do
    File.write("priv/static/robots.txt", """
    User-agent: *
    """)
  end
end
