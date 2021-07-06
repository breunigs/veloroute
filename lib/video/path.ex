defmodule Video.Path do
  import Video.TrimmedSourceSequence, only: [valid_hash: 1]

  @anonymized_suffix ".anonymized.mkv"

  @video_out_m3u8 "stream.m3u8"

  def target(hash) when valid_hash(hash) do
    Path.join(Settings.video_target_dir_abs(), hash)
  end

  def target_rel_to_cwd(hash) when valid_hash(hash) do
    hash |> target() |> rel_to_cwd()
  end

  def fully_rendered?(hash) when valid_hash(hash) do
    path = target(hash)
    File.dir?(path) && File.exists?(Path.join(path, @video_out_m3u8))
  end

  def stream(hash) when valid_hash(hash) do
    hash |> target() |> Path.join(@video_out_m3u8)
  end

  def stream_rel_to_cwd(hash) when valid_hash(hash) do
    hash |> stream() |> rel_to_cwd()
  end

  def source(path) when is_binary(path) do
    path |> abs_path() |> String.replace_suffix(@anonymized_suffix, "")
  end

  def anonymized(path) when is_binary(path) do
    path =
      if String.ends_with?(path, @anonymized_suffix) do
        path
      else
        path <> @anonymized_suffix
      end

    abs_path(path)
  end

  def source_base(path) when is_binary(path) do
    path |> source() |> Path.relative_to(Settings.video_source_dir_abs())
  end

  def source_rel_to_cwd(path) when is_binary(path) do
    path |> source() |> rel_to_cwd()
  end

  def anonymized_rel_to_cwd(path) when is_binary(path) do
    path |> anonymized() |> rel_to_cwd()
  end

  def rel_to_cwd(path) do
    path |> abs_path() |> Path.relative_to_cwd()
  end

  def abs_path("/" <> _rest = path), do: path

  def abs_path(path), do: Path.join(Settings.video_source_dir_abs(), path)
end
