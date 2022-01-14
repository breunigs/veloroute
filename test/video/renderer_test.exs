defmodule Video.RendererTest do
  use ExUnit.Case, async: true

  test "produces correct video render commands" do
    # silence warning
    System.put_env("DISABLE_OPENCL", "1")

    cmd =
      Video.RendererTest.Example
      |> Video.Renderer.render_cmd("FAKE_TMP")

    assert [
             "nice",
             "-n19",
             "ionice",
             "-c",
             "3",
             "ffmpeg",
             "-hide_banner",
             "-hwaccel",
             "auto",
             "-re",
             "-ss",
             "00:00:00.000",
             "-to",
             "00:00:00.456",
             "-i",
             "videos/source/1.mp4",
             "-ss",
             "00:00:00.000",
             "-to",
             "00:00:00.123",
             "-i",
             "videos/source/2.mp4",
             "-filter_complex",
             "[0]frei0r=jsonblur:videos/source/1.mp4.json.gz|0[blur0];[1]frei0r=jsonblur:videos/source/2.mp4.json.gz|0[blur1];[blur0][blur1]xfade=transition=fade:duration=0.05:offset=0.406,split=6[out0][out1][out2][out3][out4][out5]",
             "-an",
             "-f",
             "hls",
             "-hls_playlist_type",
             "vod",
             "-sc_threshold",
             "0",
             "-movflags",
             "+faststart",
             "-pix_fmt",
             "yuv420p",
             "-hls_segment_type",
             "fmp4",
             "-master_pl_name",
             "stream.m3u8",
             "-hls_flags",
             "single_file+independent_segments",
             "-hls_list_size",
             "0",
             "-keyint_min",
             60,
             "-g",
             60,
             "-hls_time",
             2,
             "-c:v:0",
             "libx264",
             "-preset",
             "veryslow",
             "-refs:v:0",
             "5",
             "-flags",
             "+cgop",
             "-map",
             "[out0]",
             "-s:0",
             "640x360",
             "-metadata:s:v:0",
             "title=\"360p\"",
             "-b:v:0",
             "4M",
             "-maxrate:0",
             "4.4M",
             "-bufsize:0",
             "8.0M",
             "-c:v:1",
             "libx264",
             "-preset",
             "veryslow",
             "-refs:v:1",
             "5",
             "-flags",
             "+cgop",
             "-map",
             "[out1]",
             "-s:1",
             "256x144",
             "-metadata:s:v:1",
             "title=\"144p\"",
             "-b:v:1",
             "0.7M",
             "-maxrate:1",
             "0.77M",
             "-bufsize:1",
             "1.4M",
             "-c:v:2",
             "libx264",
             "-preset",
             "veryslow",
             "-refs:v:2",
             "5",
             "-flags",
             "+cgop",
             "-map",
             "[out2]",
             "-s:2",
             "426x240",
             "-metadata:s:v:2",
             "title=\"240p\"",
             "-b:v:2",
             "2M",
             "-maxrate:2",
             "2.2M",
             "-bufsize:2",
             "4.0M",
             "-c:v:3",
             "libvpx-vp9",
             "-row-mt:v:3",
             "1",
             "-tile-columns",
             "4",
             "-frame-parallel",
             "1",
             "-speed",
             "1",
             "-threads",
             "2",
             "-refs:v:3",
             "5",
             "-flags",
             "+cgop",
             "-map",
             "[out3]",
             "-s:3",
             "854x480",
             "-metadata:s:v:3",
             "title=\"480p\"",
             "-b:v:3",
             "4M",
             "-maxrate:3",
             "4.4M",
             "-bufsize:3",
             "8.0M",
             "-c:v:4",
             "libx264",
             "-preset",
             "veryslow",
             "-refs:v:4",
             "5",
             "-flags",
             "+cgop",
             "-map",
             "[out4]",
             "-s:4",
             "1280x720",
             "-metadata:s:v:4",
             "title=\"720p\"",
             "-b:v:4",
             "6M",
             "-maxrate:4",
             "6.6000000000000005M",
             "-bufsize:4",
             "12.0M",
             "-c:v:5",
             "libx264",
             "-preset",
             "veryslow",
             "-refs:v:5",
             "5",
             "-flags",
             "+cgop",
             "-map",
             "[out5]",
             "-s:5",
             "1920x1080",
             "-metadata:s:v:5",
             "title=\"1080p\"",
             "-b:v:5",
             "12M",
             "-maxrate:5",
             "13.200000000000001M",
             "-bufsize:5",
             "24.0M",
             "-var_stream_map",
             "v:0 v:1 v:2 v:3 v:4 v:5",
             "FAKE_TMP/stream_%v.m3u8"
           ] ==
             cmd
  end

  test "produces correct video preview commands" do
    cmd =
      Video.RendererTest.Example
      |> Video.Renderer.preview_cmd(true)

    assert [
             "nice",
             "-n15",
             "ffmpeg",
             "-hide_banner",
             "-loglevel",
             "fatal",
             "-hwaccel",
             "auto",
             "-re",
             "-ss",
             "00:00:00.000",
             "-to",
             "00:00:00.456",
             "-i",
             "videos/source/1.mp4",
             "-ss",
             "00:00:00.000",
             "-to",
             "00:00:00.123",
             "-i",
             "videos/source/2.mp4",
             "-filter_complex",
             "[0]frei0r=jsonblur:videos/source/1.mp4.json.gz|0[blur0];[1]frei0r=jsonblur:videos/source/2.mp4.json.gz|0[blur1];[blur0][blur1]xfade=transition=fade:duration=0.05:offset=0.406",
             "-pix_fmt",
             "yuv420p",
             "-f",
             "yuv4mpegpipe",
             "-",
             "|",
             "mpv",
             "--pause",
             "--no-resume-playback",
             "--framedrop=no",
             "--audio=no",
             "--keep-open=yes",
             "--demuxer-max-bytes=10G",
             "--force-seekable=yes",
             "-"
           ] == cmd
  end

  defmodule Example do
    @behaviour Video.Rendered

    @impl Video.Rendered
    def name(), do: "example"
    @impl Video.Rendered
    def hash(), do: "badc0ffeebadc0ffeebadc0ffeebadc0"
    @impl Video.Rendered
    def fade(), do: 0.050
    @impl Video.Rendered
    def length_ms(), do: 579
    @impl Video.Rendered
    def sources(),
      do: [
        {"1.mp4", "00:00:00.000", "00:00:00.456"},
        {"2.mp4", "00:00:00.000", "00:00:00.123"}
      ]

    @impl Video.Rendered
    def coords(),
      do: [
        %Video.TimedPoint{lat: 53.507, lon: 10.044, time_offset_ms: 0},
        %Video.TimedPoint{lat: 53.508, lon: 10.042, time_offset_ms: 100},
        %Video.TimedPoint{lat: 53.509, lon: 10.040, time_offset_ms: 200},
        %Video.TimedPoint{lat: 53.510, lon: 10.038, time_offset_ms: 300},
        %Video.TimedPoint{lat: 53.511, lon: 10.036, time_offset_ms: 400}
      ]

    @impl Video.Rendered
    def rendered?(), do: true

    @impl Video.Rendered
    def bbox(), do: Geo.CheapRuler.bbox(coords())
  end
end
