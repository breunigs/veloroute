defmodule Mix.Tasks.Velo.Videos.Unused do
  use Mix.Task
  import Guards
  @requirements ["app.start"]

  @shortdoc "List unused/unreferenced rendered videos"
  def run(_args) do
    Video.Dir.must_exist!()

    in_dir =
      File.ls!(Settings.r(:video_target_dir_abs)) |> Enum.filter(&valid_hash/1) |> MapSet.new()

    in_code = Video.Generator.all() |> Enum.map(& &1.hash()) |> MapSet.new()

    {current, historic} =
      Article.List.all()
      |> Enum.flat_map(& &1.tracks())
      |> Enum.reduce({[], []}, fn track, {currs, hists} ->
        historic = Map.keys(track.historic || %{})
        current = Video.Generator.get(track)

        {[if(current, do: current.hash()) | currs], historic ++ hists}
      end)

    current = current |> Util.compact() |> MapSet.new()
    historic = historic |> MapSet.new()
    in_articles = MapSet.union(current, historic)

    unreferenced = in_dir |> MapSet.difference(in_articles)
    unreachable = unreferenced |> MapSet.difference(in_code)
    with_link_only = unreferenced |> MapSet.difference(unreachable)
    historic_only = historic |> MapSet.difference(current)

    rel_path = "./" <> Path.relative_to_cwd(Settings.r(:video_target_dir_abs))

    broken =
      MapSet.difference(in_code, in_dir)
      # reject not yet rendered videos
      |> MapSet.reject(&(Video.Generator.get(&1) == nil))

    if MapSet.size(unreachable) > 0 do
      IO.puts("""
      #####################################################################
      The following video renders are not referenced from any article.
      They can't be played by users anymore and can thus likely be removed.
      To clean up:
      rm -rf #{rel_path}/<HASH>
      #####################################################################

      #{unreachable |> with_size |> Enum.join("\n")}
      """)

      Enum.each(unreachable, fn hash ->
        if Cli.confirm("Delete #{rel_path}/#{hash}?", false) do
          delete_render(hash)
          IO.puts("  Deleted.")
        end
      end)
    end

    if MapSet.size(with_link_only) > 0 do
      IO.puts("""

      #####################################################################
      The following video renders are not referenced from any article.
      However, with an old link they should still be playable by users.
      Consider keeping these if they are still played.
      To clean up:
      rm -rf ./data/auto_generated/video/<HASH>.ex #{rel_path}/<HASH>
      #####################################################################

      #{with_link_only |> with_size |> Enum.join("\n")}
      """)

      Enum.each(with_link_only, fn hash ->
        if Cli.confirm("Delete #{hash} (video render + generated .ex)?", false) do
          delete_render(hash)
          delete_generated(hash)
          IO.puts("  Deleted.")
        end
      end)
    end

    if MapSet.size(broken) > 0 do
      IO.puts("""

      #####################################################################
      The following video renders are reachable by the user, but they don't
      exist on disk.
      To clean up:
      rm ./data/auto_generated/video/<HASH>.ex
      #####################################################################

      #{Enum.join(broken, "\n")}
      """)

      Enum.each(broken, fn hash ->
        if Cli.confirm("Delete ./data/auto_generated/video/#{hash}.ex?", false) do
          delete_generated(hash)
          IO.puts("  Deleted.")
        end
      end)
    end

    historic_only =
      historic_only
      |> Parallel.map(&{&1, count_variants(&1)})
      |> Enum.filter(fn {_hash, num} -> num && num > 1 end)
      |> Enum.map(&elem(&1, 0))
      # v7 segments are shared across renders, skip per-hash quality reduction
      |> Enum.reject(fn hash ->
        case Video.Generator.get(hash) do
          nil -> false
          rendered -> rendered.renderer() >= 7
        end
      end)

    if historic_only != [] do
      IO.puts("""

      #####################################################################
      The following video renders are only used as historic reference. It's
      likely enough to only keep the highest quality for these, since they
      are not directly playable in the browser by the user anymore.

      To clean up:
      mix velo.videos.delete_low_quality <HASH>
      #####################################################################

      #{Enum.join(historic_only, "\n")}
      """)

      Enum.each(historic_only, fn hash ->
        if Cli.confirm("Delete low quality variants for #{hash}?", false) do
          %{update: update, delete: delete} =
            Video.RenderedTools.keep_highest_quality_video_only_actions(hash)

          Enum.each(update, fn {path, val} -> :ok = File.write(path, val) end)
          Enum.each(delete, fn path -> :ok = File.rm(path) end)
          IO.puts("  Cleaned up.")
        end
      end)
    end

    cleanup_orphan_segments()

    IO.puts("\n\n\nDone")
  end

  defp cleanup_orphan_segments do
    seg_dir = Video.Path.segment_dir()

    if File.dir?(seg_dir) do
      variant_count = length(Video.Renderer.variants())

      # Collect segment files referenced by all remaining v7 renders on disk
      referenced =
        File.ls!(Settings.r(:video_target_dir_abs))
        |> Enum.filter(&valid_hash/1)
        |> Enum.flat_map(fn hash ->
          rendered = Video.Generator.get(hash)

          if rendered && rendered.renderer() >= 7 do
            try do
              rendered
              |> Video.Segment.segments()
              |> Enum.flat_map(fn seg ->
                basename = Video.Segment.basename(seg)

                Enum.flat_map(0..(variant_count - 1), fn idx ->
                  ["#{basename}_v#{idx}.m4s", "#{basename}_v#{idx}.m3u8"]
                end)
              end)
            rescue
              _ -> []
            end
          else
            []
          end
        end)
        |> MapSet.new()

      all_files = list_files_recursive(seg_dir, seg_dir)

      orphans = Enum.reject(all_files, &MapSet.member?(referenced, &1))

      if orphans != [] do
        total_bytes =
          Enum.reduce(orphans, 0, fn file, acc ->
            case File.stat(Path.join(seg_dir, file)) do
              {:ok, %{size: size}} -> acc + size
              _ -> acc
            end
          end)

        size_gb =
          (total_bytes / 1024.0 / 1024.0 / 1024.0)
          |> Float.round(2)
          |> :erlang.float_to_binary(decimals: 2)

        IO.puts("""

        #####################################################################
        #{length(orphans)} segment files in seg/ are not referenced by any
        remaining v7 render (#{size_gb} GB total).
        #####################################################################
        """)

        if Cli.confirm("Delete #{length(orphans)} orphaned segment files?", false) do
          Enum.each(orphans, &File.rm(Path.join(seg_dir, &1)))
          IO.puts("  Deleted orphaned segments.")
        end
      end
    end
  end

  defp list_files_recursive(dir, base_dir) do
    case File.ls(dir) do
      {:ok, entries} ->
        Enum.flat_map(entries, fn entry ->
          full = Path.join(dir, entry)

          if File.dir?(full),
            do: list_files_recursive(full, base_dir),
            else: [Path.relative_to(full, base_dir)]
        end)

      _ ->
        []
    end
  end

  defp delete_render(hash),
    do: File.rm_rf!(Path.join(Settings.r(:video_target_dir_abs), hash))

  defp delete_generated(hash),
    do: File.rm(Path.join("data/auto_generated/video", "#{hash}.ex"))

  defp with_size(enum_with_hashes) do
    enum_with_hashes
    |> Parallel.map(fn hash ->
      path = Path.join(Settings.r(:video_target_dir_abs), hash)
      size = Float.round(Util.IO.dir_size(path) / 1024.0 / 1024.0 / 1024.0, 2)
      display = size |> :erlang.float_to_binary(decimals: 2) |> String.pad_leading(7)

      {"#{hash}  #{display} GB", size}
    end)
    |> Enum.sort_by(&elem(&1, 1), :desc)
    |> Enum.map(&elem(&1, 0))
  end

  defp count_variants(hash) do
    path = Path.join([Settings.r(:video_target_dir_abs), hash, "stream.m3u8"])

    with {:ok, tokens} <- M3U8.Tokenizer.read_file(path),
         variants when is_list(variants) <- M3U8.Utils.variants(tokens) do
      length(variants)
    else
      _ -> nil
    end
  end
end
