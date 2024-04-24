defmodule Video.RenderedTools do
  import Guards
  require Logger

  @extract_fallback_file "stream_0.m4s"
  @doc """
  Finds the video file with the highest quality for a given hash. The returned
  path is relative to the "rendered" videos directory.
  """
  @spec highest_quality_video_file(Video.Track.hash()) :: binary()
  def highest_quality_video_file(hash) when valid_hash(hash) do
    with path <- Path.join([Settings.video_target_dir_abs(), hash, "stream.m3u8"]),
         {:ok, tokens} <- M3U8.Tokenizer.read_file(path),
         variants when is_list(variants) <- M3U8.Utils.variants(tokens),
         best <- determine_best_video(variants) do
      Path.join(hash, String.replace(best.url, ".m3u8", ".m4s"))
    else
      _ ->
        Path.join(hash, @extract_fallback_file)
    end
  end

  @spec keep_highest_quality_video_only_actions(Video.Track.hash()) :: %{
          atom() => %{binary() => binary()} | [binary()]
        }
  @doc """
  Finds the highest quality and returns file system operations needed to only
  keep that one.
  """
  def keep_highest_quality_video_only_actions(hash) when valid_hash(hash) do
    with path <- Path.join([Settings.video_target_dir_abs(), hash, "stream.m3u8"]),
         {:ok, tokens} <- M3U8.Tokenizer.read_file(path),
         variants when is_list(variants) <- M3U8.Utils.variants(tokens),
         best <- determine_best_video(variants) do
      stream_m3u8 = """
      #EXTM3U
      #EXT-X-VERSION:7
      #EXT-X-STREAM-INF:BANDWIDTH=#{best.bandwidth},RESOLUTION=#{best.width}x#{best.height},CODECS="#{best.codec}"
      #{best.url}
      """

      to_delete =
        Enum.flat_map(variants -- [best], fn var ->
          [var.url, String.replace(var.url, ".m3u8", ".m4s")]
        end)
        |> Enum.map(&Path.join([Settings.video_target_dir_abs(), hash, &1]))

      %{
        update: %{
          Path.join([Settings.video_target_dir_abs(), hash, "stream.m3u8"]) => stream_m3u8
        },
        delete: to_delete
      }
    else
      _ -> "cannot generate video"
    end
  end

  @doc """
  Returns the human readable name of the most recent recording tht makes up the
  video.
  """
  @spec most_recent_recording_month(Video.Track.hash() | nil | Video.Rendered.t()) :: binary()
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

  @codec_factors %{"" => 1, "avc1" => 1, "hvc1" => 1.2, "av01" => 1.3}
  defp determine_best_video(variants) do
    Enum.max_by(variants, fn var ->
      codec_type = String.split(var.codec || "", ".") |> hd

      factor =
        Map.get_lazy(@codec_factors, codec_type, fn ->
          Logger.warning("unknown video codec #{var.codec}, falling back to 1.0 ratio guess")
          1.0
        end)

      var.bandwidth * factor
    end)
  end
end
