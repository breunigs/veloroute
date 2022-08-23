defmodule M3U8.UtilsTest do
  use ExUnit.Case, async: true

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
