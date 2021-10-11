defmodule Video.Path do
  import Video.Track, only: [valid_hash: 1]

  @detections_suffix ".json.gz"
  @source_endings [".MP4", ".mkv"]
  @gpx_ending ".gpx"

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
    path = path |> abs_path() |> String.replace_suffix(@detections_suffix, "")
    if has_extension?(path), do: path, else: path <> hd(@source_endings)
  end

  def gpx(path) when is_binary(path) do
    ext = file_extension(path)
    path = abs_path(path)
    if ext == "", do: path <> @gpx_ending, else: String.replace_suffix(path, ext, @gpx_ending)
  end

  def gpx_rel_to_cwd(path) when is_binary(path) do
    gpx(path) |> rel_to_cwd()
  end

  def detections(path) when is_binary(path) do
    path =
      cond do
        String.ends_with?(path, @detections_suffix) ->
          path

        has_extension?(path) ->
          path <> @detections_suffix

        true ->
          path <> hd(@source_endings) <> @detections_suffix
      end

    abs_path(path)
  end

  def detections_rel_to_cwd(path) when is_binary(path) do
    detections(path) |> rel_to_cwd()
  end

  def source_base(path) when is_binary(path) do
    path
    |> source_base_with_ending()
    |> String.replace_suffix(hd(@source_endings), "")
  end

  def source_base_with_ending(path) when is_binary(path) do
    path
    |> source()
    |> Path.relative_to(Settings.video_source_dir_abs())
  end

  def source_rel_to_cwd(path) when is_binary(path) do
    path |> source() |> rel_to_cwd()
  end

  def rel_to_cwd(path) do
    path |> abs_path() |> Path.relative_to_cwd()
  end

  def abs_path("/" <> _rest = path), do: path

  def abs_path(path), do: Path.join(Settings.video_source_dir_abs(), path)

  @doc """
  Returns if the path is either extension less or the extension is one
  of the valid source extensions.
  """
  def is_source_path(path) do
    cond do
      String.ends_with?(path, @detections_suffix) -> false
      Enum.any?(@source_endings, &String.ends_with?(path, &1)) -> true
      !has_extension?(path) -> true
      true -> false
    end
  end

  @doc """
  Returns true if the path has a file extension
  """
  def has_extension?(path) do
    path |> Path.basename() |> String.contains?(".")
  end

  defp file_extension(path) do
    Path.basename(path)
    |> String.split(".", parts: 2)
    |> case do
      [_name] -> ""
      [_name, extension] -> "." <> extension
    end
  end
end
