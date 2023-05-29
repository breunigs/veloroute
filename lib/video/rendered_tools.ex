defmodule Video.RenderedTools do
  import Guards

  @extract_fallback_file "stream_0.m4s"
  @doc """
  Finds the video file with the highest quality for a given hash. The returned
  path is relative to the "rendered" videos directory.
  """
  @spec highest_quality_video_file(Video.Track.hash()) :: binary()
  def highest_quality_video_file(hash) when valid_hash(hash) do
    with path = Path.join([Settings.video_target_dir_abs(), hash, "stream.m3u8"]),
         {:ok, tokens} <- M3U8.Tokenizer.read_file(path),
         variants when is_list(variants) <- M3U8.Utils.variants(tokens) do
      best = Enum.max_by(variants, & &1.bandwidth)
      Path.join(hash, String.replace(best.url, ".m3u8", ".m4s"))
    else
      _ ->
        Path.join(hash, @extract_fallback_file)
    end
  end

  @doc """
  Returns the human readable name of the most recent recording tht makes up the
  video.
  """
  @spec most_recent_recording_month(Video.Track.hash() | nil | Video.Generator.t()) :: binary()
  def most_recent_recording_month(nil), do: "unbekannt"

  def most_recent_recording_month(hash) when valid_hash(hash),
    do: most_recent_recording_month(Video.Generator.find_by_hash(hash))

  def most_recent_recording_month(rendered) when is_module(rendered) do
    rendered.sources()
    |> Enum.map(&elem(&1, 0))
    |> Enum.map(&String.slice(&1, 0..9))
    |> Enum.max()
    |> Data.RoughDate.parse()
    |> Data.RoughDate.without_day()
  end
end
