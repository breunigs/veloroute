defmodule Mix.Tasks.Velo.Videos.Preload do
  use Mix.Task
  @seen_path "data/cache/video_previous_preloads.json"

  @shortdoc "Print command to preload the videos on the server"
  def run(_) do
    Video.Dir.must_exist!(&real_run/0)
  end

  defp real_run do
    video_files =
      Settings.video_target_dir_abs()
      |> Util.IO.tree()
      |> Enum.map(&Path.relative_to(&1, Settings.video_target_dir_abs()))

    seen = load_seen()

    Video.Rendered.rendered()
    |> Enum.flat_map(fn rendered ->
      Enum.filter(video_files, &String.starts_with?(&1, rendered.hash))
    end)
    |> Enum.reject(&MapSet.member?(seen, &1))
    |> Parallel.map(4, fn path ->
      full_path = Path.join(Settings.deploy_video_mount_dir(), path)
      cmd = [Settings.deploy_ssh_name(), "--", "cat", full_path, ">/dev/null"]

      try do
        System.cmd("ssh", cmd)
        |> case do
          {_msgs, 0} ->
            IO.puts("✓ #{path}")
            path

          {msgs, exit_code} ->
            IO.puts(:stderr, "FAILED #{path} with exit code #{exit_code}:\n#{msgs}\n\n")
            nil
        end
      rescue
        error ->
          IO.puts(:stderr, "FAILED #{path}:\n#{inspect(error)}\n\n")
          nil
      end
    end)
    |> Util.compact()
    |> update_seen(seen)
  end

  defp load_seen() do
    case File.read(@seen_path) do
      {:ok, file} -> file |> Jason.decode!() |> MapSet.new()
      _other -> MapSet.new()
    end
  end

  @spec update_seen(list(binary()), MapSet.t()) :: :ok | {:error, binary()}
  defp update_seen(preloaded, previously_seen) when is_list(preloaded) do
    preloaded = MapSet.new(preloaded)
    seen_json = previously_seen |> MapSet.union(preloaded) |> MapSet.to_list() |> Jason.encode!()
    File.write(@seen_path, seen_json)
  end
end
