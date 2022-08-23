defmodule M3U8.TokenizerTest do
  use ExUnit.Case, async: true
  doctest M3U8.Tokenizer

  test "tokenizes master playlist" do
    m3u8 = """
    #EXTM3U
    #EXT-X-VERSION:7
    #EXT-X-STREAM-INF:BANDWIDTH=4950000,RESOLUTION=1280x720,CODECS="av01.0.08M.08"
    stream_0.m3u8

    #EXT-X-STREAM-INF:BANDWIDTH=1650000,RESOLUTION=426x240,CODECS="av01.0.08M.08"
    stream_1.m3u8
    """

    expect =
      {:ok,
       [
         {:preamble, nil},
         {:version, 7},
         {:stream,
          %{
            "BANDWIDTH" => 4_950_000,
            "CODECS" => "av01.0.08M.08",
            "RESOLUTION" => %{height: 720, width: 1280}
          }},
         {:url, "stream_0.m3u8"},
         {:blank, ""},
         {:stream,
          %{
            "BANDWIDTH" => 1_650_000,
            "CODECS" => "av01.0.08M.08",
            "RESOLUTION" => %{height: 240, width: 426}
          }},
         {:url, "stream_1.m3u8"},
         {:blank, ""}
       ]}

    assert expect == M3U8.Tokenizer.read(m3u8)
  end

  test "tokenizes media playlist" do
    m3u8 = """
    #EXTM3U
    #EXT-X-VERSION:7
    #EXT-X-TARGETDURATION:2
    #EXT-X-MEDIA-SEQUENCE:0
    #EXT-X-PLAYLIST-TYPE:VOD
    #EXT-X-INDEPENDENT-SEGMENTS
    #EXT-X-MAP:URI="stream_0.m4s",BYTERANGE="892@0"
    #EXTINF:2.002000,
    #EXT-X-BYTERANGE:1199211@892
    stream_0.m4s
    #EXTINF:2.002000,
    #EXT-X-BYTERANGE:1051534@1200103
    stream_0.m4s
    #EXT-X-ENDLIST
    """

    expect =
      {:ok,
       [
         {:preamble, nil},
         {:version, 7},
         {:target_duration, 2},
         {:media_sequence, 0},
         {:playlist_type, :vod},
         {:independent_segments, nil},
         {:map, %{"BYTERANGE" => %{length: 892, offset: 0}, "URI" => "stream_0.m4s"}},
         {:extinf, %{duration: 2.002, title: ""}},
         {:byte_range, %{length: 1_199_211, offset: 892}},
         {:url, "stream_0.m4s"},
         {:extinf, %{duration: 2.002, title: ""}},
         {:byte_range, %{length: 1_051_534, offset: 1_200_103}},
         {:url, "stream_0.m4s"},
         {:endlist, nil},
         {:blank, ""}
       ]}

    assert expect == M3U8.Tokenizer.read(m3u8)
  end
end
