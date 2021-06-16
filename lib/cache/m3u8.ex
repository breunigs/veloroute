defmodule Cache.M3U8 do
  @glob_path Settings.video_target_dir_abs() |> Path.join("**/*.m3u8")

  paths = Path.wildcard(@glob_path)
  paths_hash = :erlang.md5(paths)

  def __mix_recompile__?() do
    # ensure our cache is up to date for production only
    Mix.env() == :prod && :erlang.md5(Path.wildcard(@glob_path)) != unquote(paths_hash)
  end

  @cache Benchmark.measure("#{__MODULE__}: caching m3u8s", fn ->
           paths
           |> Task.async_stream(
             fn file ->
               ref = file |> Path.split() |> Enum.slice(-2..-1) |> Path.join()
               raw = File.read!(file)
               gzip = :zlib.gzip(raw)
               {ref, {raw, gzip}}
             end,
             timeout: :infinity
           )
           |> Enum.map(&elem(&1, 1))
           |> Enum.into(%{})
         end)
  @spec get(binary()) :: nil | {binary(), binary()}
  def get(path), do: Map.get(@cache, path, nil)
end
