defmodule Mix.Tasks.Velo.Favicon.Raster do
  use Mix.Task

  @source "data/images/favicon.svg"
  @target "priv/static/favicons/"
  @variants ~w(16 32 36 48 57 72 96 100 144 152 167 180 192)

  @shortdoc "Generate raster versions of #{@source}"
  def run(_args) do
    File.mkdir_p!(@target)

    source_mod = modified(@source)
    variants = Enum.reject(@variants, fn size -> source_mod < modified(target(size)) end)
    len = length(variants)

    if len > 0 do
      IO.puts("updating #{len} favicon rasters")
      generate(variants)
    end

    :ok = File.write(Path.join(@target, "manifest.json"), manifest())
  end

  @base_variant 48
  defp manifest() do
    icons =
      Enum.map(@variants, fn variant ->
        %{
          src: "/favicons/#{variant}.png?vsn=1",
          sizes: "#{variant}x#{variant}",
          type: "image/png",
          density: Float.round(String.to_integer(variant) / @base_variant, 2)
        }
      end)

    %{
      name: Settings.feed_author(),
      icons: icons,
      start_url: "/",
      display: "standalone"
    }
    |> Jason.encode!()
  end

  defp generate([]), do: :ok

  defp generate(variants) do
    %{result: :ok} =
      Util.Cmd2.exec(~w(inkscape --shell),
        stdin: inkscape_script(variants),
        raise: true,
        stdout: "",
        stderr: ""
      )

    Parallel.each(variants, System.schedulers_online(), fn size ->
      %{result: :ok} = Util.Cmd2.exec(~w(optipng -quiet -o7) ++ [target(size)], raise: true)
    end)
  end

  defp inkscape_script(variants) do
    exports =
      Enum.map(variants, fn size ->
        Enum.join(
          [
            "export-filename:#{target(size)};",
            "export-width:#{size};",
            "export-height:#{size};",
            "export-do;"
          ],
          " "
        )
      end)

    """
    file-open:#{@source}; export-type:png;
    #{Enum.join(exports, "\n")}
    """
  end

  defp target(size), do: "#{@target}/#{size}.png"

  defp modified(filename) do
    with {:ok, %File.Stat{mtime: mtime}} <- File.stat(filename) do
      mtime
    else
      _ -> {{1970, 0, 0}, {0, 0, 0}}
    end
  end
end
