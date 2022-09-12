defmodule M3U8.UtilsTest do
  use ExUnit.Case, async: true

  test "lists variants" do
    expect = [
      %{
        url: "stream_0.m3u8",
        bandwidth: 4_400_000,
        width: 640,
        height: 360,
        codec: "avc1.64001e"
      },
      %{
        url: "stream_1.m3u8",
        bandwidth: 770_000,
        width: 256,
        height: 144,
        codec: "avc1.64000d"
      }
    ]

    assert expect == M3U8.Utils.variants(master_playlist())
  end

  test "finds all offsets" do
    expect = %{
      "stream_0.m4s" => [
        %{byte: 123..144, timestamp: 0..2002},
        %{byte: 145..177, timestamp: 2002..4004}
      ]
    }

    assert expect == M3U8.Utils.byte_ranges(media_playlist())
  end

  test "finds offset for timestamp" do
    expect = %{"stream_0.m4s" => 123..144}
    assert expect == M3U8.Utils.byte_range_for(media_playlist(), "00:00:01.337")
  end

  defp master_playlist() do
    m3u8 = """
    #EXTM3U
    #EXT-X-VERSION:7
    #EXT-X-STREAM-INF:BANDWIDTH=4400000,RESOLUTION=640x360,CODECS="avc1.64001e"
    stream_0.m3u8

    #EXT-X-STREAM-INF:BANDWIDTH=770000,RESOLUTION=256x144,CODECS="avc1.64000d"
    stream_1.m3u8
    """

    {:ok, tokens} = M3U8.Tokenizer.read(m3u8)
    tokens
  end

  defp media_playlist() do
    m3u8 = """
    #EXTM3U
    #EXT-X-VERSION:7
    #EXT-X-TARGETDURATION:2
    #EXT-X-MEDIA-SEQUENCE:0
    #EXT-X-PLAYLIST-TYPE:VOD
    #EXT-X-INDEPENDENT-SEGMENTS
    #EXT-X-MAP:URI="stream_0.m4s",BYTERANGE="123@0"
    #EXTINF:2.002000,
    #EXT-X-BYTERANGE:22@123
    stream_0.m4s
    #EXTINF:2.002000,
    #EXT-X-BYTERANGE:33@145
    stream_0.m4s
    #EXT-X-ENDLIST
    """

    {:ok, tokens} = M3U8.Tokenizer.read(m3u8)
    tokens
  end
end
