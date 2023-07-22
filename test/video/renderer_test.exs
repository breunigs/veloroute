defmodule Video.RendererTest do
  use ExUnit.Case, async: true

  # test "produces correct video render commands" do

  #   cmd =
  #     Video.RendererTest.Example
  #     |> Video.Renderer.render_cmd("FAKE_TMP")

  #   assert [
  #            "nice",
  #            "-n19",
  #            "ionice",
  #            "-c",
  #            "3",
  #            "ffmpeg",
  #            "-hide_banner",
  #            "-hwaccel",
  #            "auto",
  #            "-re",
  #            "-ss",
  #            "00:00:58.692",
  #            "-to",
  #            "00:00:59.660",
  #            "-i",
  #            "videos/source/1.mp4",
  #            "-ss",
  #            "00:00:36.904",
  #            "-to",
  #            "00:00:37.904",
  #            "-i",
  #            "videos/source/2.mp4",
  #            "-filter_complex",
  #            "[0]frei0r=jsonblur:videos/source/1.mp4.json.gz|1760,settb=AVTB[blur0];[1]frei0r=jsonblur:videos/source/2.mp4.json.gz|1106,settb=AVTB[blur1];[blur0][blur1]xfade=transition=fade:duration=0.26693360026693363:offset=0.7010663997330664,split=5[out0][out1][out2][out3][out4]",
  #            "-an",
  #            "-f",
  #            "hls",
  #            "-hls_playlist_type",
  #            "vod",
  #            "-sc_threshold",
  #            "0",
  #            "-movflags",
  #            "+faststart",
  #            "-pix_fmt",
  #            "yuv420p",
  #            "-hls_segment_type",
  #            "fmp4",
  #            "-master_pl_name",
  #            "stream.m3u8",
  #            "-hls_flags",
  #            "single_file+independent_segments",
  #            "-hls_list_size",
  #            "0",
  #            "-g",
  #            60,
  #            "-hls_time",
  #            2,
  #            "-c:v:0",
  #            "libaom-av1",
  #            "-tile-columns:0",
  #            "0",
  #            "-tile-rows:0",
  #            "1",
  #            "-cpu-used:0",
  #            "4",
  #            "-lag-in-frames:0",
  #            "48",
  #            "-aom-params:0",
  #            "enable-qm=1:sb-size=64:enable-keyframe-filtering=0:arnr-strength=1:aq-mode=1:deltaq-mode=1:sharpness=1:enable-chroma-deltaq=1:quant-b-adapt=1",
  #            "-flags",
  #            "+cgop",
  #            "-map",
  #            "[out0]",
  #            "-s:0",
  #            "1280x720",
  #            "-metadata:s:v:0",
  #            "title=\"720p\"",
  #            "-b:v:0",
  #            "4.5M",
  #            "-maxrate:0",
  #            "4.95M",
  #            "-bufsize:0",
  #            "9.0M",
  #            "-c:v:1",
  #            "libaom-av1",
  #            "-tile-columns:1",
  #            "0",
  #            "-tile-rows:1",
  #            "1",
  #            "-cpu-used:1",
  #            "4",
  #            "-lag-in-frames:1",
  #            "48",
  #            "-aom-params:1",
  #            "enable-qm=1:sb-size=64:enable-keyframe-filtering=0:arnr-strength=1:aq-mode=1:deltaq-mode=1:sharpness=1:enable-chroma-deltaq=1:quant-b-adapt=1",
  #            "-flags",
  #            "+cgop",
  #            "-map",
  #            "[out1]",
  #            "-s:1",
  #            "640x360",
  #            "-metadata:s:v:1",
  #            "title=\"360p\"",
  #            "-b:v:1",
  #            "3M",
  #            "-maxrate:1",
  #            "3.3000000000000003M",
  #            "-bufsize:1",
  #            "6.0M",
  #            "-c:v:2",
  #            "libaom-av1",
  #            "-tile-columns:2",
  #            "1",
  #            "-tile-rows:2",
  #            "1",
  #            "-cpu-used:2",
  #            "4",
  #            "-lag-in-frames:2",
  #            "48",
  #            "-aom-params:2",
  #            "enable-qm=1:sb-size=64:enable-keyframe-filtering=0:arnr-strength=1:aq-mode=1:deltaq-mode=1:sharpness=1:enable-chroma-deltaq=1:quant-b-adapt=1",
  #            "-flags",
  #            "+cgop",
  #            "-map",
  #            "[out2]",
  #            "-s:2",
  #            "1920x1080",
  #            "-metadata:s:v:2",
  #            "title=\"1080p\"",
  #            "-b:v:2",
  #            "9M",
  #            "-maxrate:2",
  #            "9.9M",
  #            "-bufsize:2",
  #            "18.0M",
  #            "-c:v:3",
  #            "libx264",
  #            "-preset:v:3",
  #            "veryslow",
  #            "-refs:v:3",
  #            "5",
  #            "-flags",
  #            "+cgop",
  #            "-map",
  #            "[out3]",
  #            "-s:3",
  #            "640x360",
  #            "-metadata:s:v:3",
  #            "title=\"360p\"",
  #            "-b:v:3",
  #            "4M",
  #            "-maxrate:3",
  #            "4.4M",
  #            "-bufsize:3",
  #            "8.0M",
  #            "-c:v:4",
  #            "libx264",
  #            "-preset:v:4",
  #            "veryslow",
  #            "-refs:v:4",
  #            "5",
  #            "-flags",
  #            "+cgop",
  #            "-map",
  #            "[out4]",
  #            "-s:4",
  #            "1280x720",
  #            "-metadata:s:v:4",
  #            "title=\"720p\"",
  #            "-b:v:4",
  #            "6M",
  #            "-maxrate:4",
  #            "6.6000000000000005M",
  #            "-bufsize:4",
  #            "12.0M",
  #            "-x264-params",
  #            "threads=4",
  #            "-var_stream_map",
  #            "v:0 v:1 v:2 v:3 v:4",
  #            "FAKE_TMP/stream_%v.m3u8"
  #          ] ==
  #            cmd
  # end

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
             "00:00:58.692",
             "-to",
             "00:00:59.660",
             "-i",
             "videos/source/1.mp4",
             "-ss",
             "00:00:36.904",
             "-to",
             "00:00:37.904",
             "-i",
             "videos/source/2.mp4",
             "-filter_complex",
             "[0]frei0r=jsonblur:videos/source/1.mp4.json.gz|1760,settb=AVTB[blur0];[1]frei0r=jsonblur:videos/source/2.mp4.json.gz|1106,settb=AVTB[blur1];[blur0][blur1]xfade=transition=fade:duration=0.26693360026693363:offset=0.7010663997330664",
             "-pix_fmt",
             "yuv420p",
             "-s",
             "640x480",
             "-c:v",
             "libx264",
             "-preset",
             "ultrafast",
             "-qp",
             "17",
             "-tune",
             "zerolatency",
             "-an",
             "-f",
             "matroska",
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
    def length_ms(), do: 579
    @impl Video.Rendered
    def renderer(), do: 3
    @impl Video.Rendered
    def recording_dates(), do: [%{timestamp: 0, text: "Januar 2022"}]

    @impl Video.Rendered
    def sources() do
      # fake the metadata entries for these non-existing files
      prefix = File.cwd!() <> "/videos/source/"

      default_meta = %Video.Metadata{
        duration: 60.0,
        fps: 30000 / 1001,
        time_base: 1 / 90000,
        time_lapse: 5,
        pts_correction: 1.0
      }

      Video.Metadata.start_link()
      Video.Metadata.fake(prefix <> "1.mp4", default_meta)
      Video.Metadata.fake(prefix <> "2.mp4", %{default_meta | time_base: 1 / 1000})

      [
        {"1.mp4", "00:00:58.692", "00:00:59.660"},
        {"2.mp4", "00:00:36.904", "00:00:37.904"}
      ]
    end

    @polyline_interval_ms 100
    @polyline_precision 6

    @impl Video.Rendered
    def coords(),
      do: [
        %Video.TimedPoint{lat: 53.507, lon: 10.044, time_offset_ms: 0 * @polyline_interval_ms},
        %Video.TimedPoint{lat: 53.508, lon: 10.042, time_offset_ms: 1 * @polyline_interval_ms},
        %Video.TimedPoint{lat: 53.509, lon: 10.040, time_offset_ms: 2 * @polyline_interval_ms},
        %Video.TimedPoint{lat: 53.510, lon: 10.038, time_offset_ms: 3 * @polyline_interval_ms},
        %Video.TimedPoint{lat: 53.511, lon: 10.036, time_offset_ms: 4 * @polyline_interval_ms}
      ]

    @impl Video.Rendered
    def polyline() do
      %{
        polyline: Geo.Smoother.polyline(coords(), @polyline_interval_ms, @polyline_precision),
        interval: @polyline_interval_ms,
        precision: @polyline_precision
      }
    end

    @impl Video.Rendered
    def rendered?(), do: true

    @impl Video.Rendered
    def bbox(), do: Geo.CheapRuler.bbox(coords())
  end
end
