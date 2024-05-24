defmodule Mix.Tasks.Velo.Videos.Unused do
  use Mix.Task
  import Guards
  @requirements ["app.start"]

  @shortdoc "List unused/unreferenced rendered videos"
  def run(_args) do
    Video.Dir.must_exist!()

    in_dir =
      File.ls!(Settings.video_target_dir_abs()) |> Enum.filter(&valid_hash/1) |> MapSet.new()

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

    rel_path = "./" <> Path.relative_to_cwd(Settings.video_target_dir_abs())

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
    end

    historic_only =
      historic_only
      |> Parallel.map(&{&1, count_variants(&1)})
      |> Enum.filter(fn {_hash, num} -> num && num > 1 end)
      |> Enum.map(&elem(&1, 0))

    if length(historic_only) > 0 do
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
    end

    IO.puts("\n\n\nDone")
  end

  defp with_size(enum_with_hashes) do
    enum_with_hashes
    |> Parallel.map(fn hash ->
      path = Path.join(Settings.video_target_dir_abs(), hash)
      size = Float.round(Util.IO.dir_size(path) / 1024.0 / 1024.0 / 1024.0, 2)
      display = size |> :erlang.float_to_binary(decimals: 2) |> String.pad_leading(7)

      {"#{hash}  #{display} GB", size}
    end)
    |> Enum.sort_by(&elem(&1, 1), :desc)
    |> Enum.map(&elem(&1, 0))
  end

  defp count_variants(hash) do
    with path = Path.join([Settings.video_target_dir_abs(), hash, "stream.m3u8"]),
         {:ok, tokens} <- M3U8.Tokenizer.read_file(path),
         variants when is_list(variants) <- M3U8.Utils.variants(tokens) do
      length(variants)
    else
      _ -> nil
    end
  end
end
