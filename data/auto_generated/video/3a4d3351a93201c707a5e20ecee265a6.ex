defmodule Data.AutoGenerated.Video.Rendered_3a4d3351a93201c707a5e20ecee265a6 do
  @moduledoc "#{"lexikon/direktes-und-indirektes-abbiegen: indirekt aus der Bebelalle in die Rathenaustraße abbiegen"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "lexikon/direktes-und-indirektes-abbiegen: indirekt aus der Bebelalle in die Rathenaustraße abbiegen"
  end

  @impl Video.Rendered
  def hash() do
    "3a4d3351a93201c707a5e20ecee265a6"
  end

  @impl Video.Rendered
  def length_ms() do
    10940
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2022-01-29-rickling/GX013202", "00:00:10.511", :end},
      {"2022-01-29-rickling/GX013204", :start, :end},
      {"2022-01-29-rickling/GX013205", :start, "00:00:02.836"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      minLon: 9.99688206006006,
      minLat: 53.60451271856287,
      maxLon: 9.997909,
      maxLat: 53.60590186186186
    }
  end

  @impl Video.Rendered
  def renderer() do
    2
  end

  @impl Video.Rendered
  def recording_dates() do
    [%{text: "Januar 2022", timestamp: 0}]
  end

  @impl Video.Rendered
  # names derived from OpenStreetMap data, thus ODbL https://osmfoundation.org/wiki/Licence
  def street_names() do
    [
      %{timestamp: 0, text: "Bebelallee"},
      %{timestamp: 4034, text: "Wilhelm-Metzger-Straße"},
      %{timestamp: 8904, text: "Rathenaustraße"}
    ]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lon: 9.997221245508982, lat: 53.60451271856287, time_offset_ms: 0},
      %Video.TimedPoint{lon: 9.997262, lat: 53.604552, time_offset_ms: 164},
      %Video.TimedPoint{lon: 9.997346, lat: 53.604637, time_offset_ms: 498},
      %Video.TimedPoint{lon: 9.997431, lat: 53.604713, time_offset_ms: 831},
      %Video.TimedPoint{lon: 9.997516, lat: 53.604786, time_offset_ms: 1165},
      %Video.TimedPoint{lon: 9.997597, lat: 53.604865, time_offset_ms: 1498},
      %Video.TimedPoint{lon: 9.997675, lat: 53.60494, time_offset_ms: 1832},
      %Video.TimedPoint{lon: 9.99776, lat: 53.605005, time_offset_ms: 2166},
      %Video.TimedPoint{lon: 9.99784, lat: 53.605056, time_offset_ms: 2499},
      %Video.TimedPoint{lon: 9.99788, lat: 53.605095, time_offset_ms: 2833},
      %Video.TimedPoint{lon: 9.997881201201201, lat: 53.60510761261261, time_offset_ms: 3033},
      %Video.TimedPoint{lon: 9.997909, lat: 53.605213, time_offset_ms: 3033},
      %Video.TimedPoint{lon: 9.997882, lat: 53.605224, time_offset_ms: 3367},
      %Video.TimedPoint{lon: 9.997826, lat: 53.605242, time_offset_ms: 3700},
      %Video.TimedPoint{lon: 9.997767, lat: 53.60526, time_offset_ms: 4034},
      %Video.TimedPoint{lon: 9.997703, lat: 53.605282, time_offset_ms: 4367},
      %Video.TimedPoint{lon: 9.997639, lat: 53.605304, time_offset_ms: 4701},
      %Video.TimedPoint{lon: 9.997582, lat: 53.605327, time_offset_ms: 5035},
      %Video.TimedPoint{lon: 9.99753, lat: 53.605346, time_offset_ms: 5368},
      %Video.TimedPoint{lon: 9.997479, lat: 53.605364, time_offset_ms: 5702},
      %Video.TimedPoint{lon: 9.997428, lat: 53.605382, time_offset_ms: 6035},
      %Video.TimedPoint{lon: 9.997381, lat: 53.605399, time_offset_ms: 6369},
      %Video.TimedPoint{lon: 9.997343, lat: 53.605412, time_offset_ms: 6702},
      %Video.TimedPoint{lon: 9.99731, lat: 53.605425, time_offset_ms: 7036},
      %Video.TimedPoint{lon: 9.997282, lat: 53.605434, time_offset_ms: 7370},
      %Video.TimedPoint{lon: 9.99726, lat: 53.605441, time_offset_ms: 7703},
      %Video.TimedPoint{lon: 9.997245, lat: 53.605446, time_offset_ms: 8037},
      %Video.TimedPoint{lon: 9.997241996996996, lat: 53.6054484024024, time_offset_ms: 8237},
      %Video.TimedPoint{lon: 9.997177, lat: 53.605465, time_offset_ms: 8237},
      %Video.TimedPoint{lon: 9.997148, lat: 53.605475, time_offset_ms: 8571},
      %Video.TimedPoint{lon: 9.997082, lat: 53.605503, time_offset_ms: 8904},
      %Video.TimedPoint{lon: 9.997034, lat: 53.605553, time_offset_ms: 9238},
      %Video.TimedPoint{lon: 9.996996, lat: 53.605612, time_offset_ms: 9571},
      %Video.TimedPoint{lon: 9.996959, lat: 53.605678, time_offset_ms: 9905},
      %Video.TimedPoint{lon: 9.996931, lat: 53.605746, time_offset_ms: 10239},
      %Video.TimedPoint{lon: 9.996907, lat: 53.605818, time_offset_ms: 10572},
      %Video.TimedPoint{lon: 9.996884, lat: 53.605894, time_offset_ms: 10906},
      %Video.TimedPoint{lon: 9.99688206006006, lat: 53.60590186186186, time_offset_ms: 10940}
    ]
  end

  @impl Video.Rendered
  def polyline() do
    %{
      interval: 16.666666666666668,
      polyline:
        "_jwfeBizdaRAAAACCACCACCCCCEECCEEEEEGEEGGGIGIIIKKKIIKKIIIIIIGGIIGIIGGIGGIIGGGGGIGGGGEGGIGGGGGGEGGIGGGGEGGGGGEIGGGGGGEIGGGGEGGGEGGGGIGGEGGGGGEGGGGGEIGGGGGGGGEGGIGGGGGGGGGIGGGGGGGGGGGGGGGGGGEIGGGGGGGGGGGGEGGGGGGGEGGGGGGGEGGGEGGGEGGGEGGIEGGGEGGGEIGGEGEGGIEGEGGIEGEGEIEGEGEIGGEIEGEGEIEGEGGIEGEIGGEIEGEGEGEEEGCCEECECCCECCCCCCAACCACCAACCAAAAAAACAAAAAAAAAAAA?AAAA??AAA???AAAAEAECOE{BOu@FMBEBCBC@A@?@A@A??@??A@?@A@??A@?@A@?@A@?@A@AB?@A@AB?@ABABA@?BABABABAB?BABABADABABADABADABADADADABADADAFADADADADAFADADAFCDAFADADAFADAFADCDAFADADAFADADAFCDADAFADAFADCDAFADADAFADCDAFADADAFCDADADAFADADCDADADAFADADADCDADADADADADABADADADADABADADADABADADABADADABADABADABADABADABADAB?DABADABADABADABADABADAD?BADABADABADABADADABADADABADADADAB?DADABADADADABADADABADADABADADABADADABADAB?DADABADABADABADABAD?BADABADABADABADAB?DABABABAD?BABAB?BABA@?BABAB?@AB?BA@?BA@AB?@AB?@AB?@?@AB?@A@?@AB?@?@A@?@A@?B?@A@?@?@A@?@?@A@?@?@A@?@??A@?@?@A@?@?@?@A??@?@?@A@???@?@A??@?@??A@?@???@?@A??@???@???@A??@???@???@A??@???@?????@??A??@?????@???@ABADENKj@CJCFAFADABAD?@AB?BA@AB?BA@?BABADABABADADADADADCFADCFAFCFCFAFCDCDADCDADCDCDADCDCDCDCDCDEFCDCDEDCFEDEDCDEDCDEDEDCBEDEBEDCBEDEBEBCBEDEBEBEBEBEBEDEBEBEBEBEBEBE@GBEBEBEBEBGBEBEBEBGBE@GBEBEBGBE@EBGBEBE@GBEBG@EBE@GBE@EBG@EBE@GBE@GBE@E@GBE@G@EBG@E@GBE@G@EBG@E@G@EBG@G@G@EBG@G@GBG@IBI@KBMBKBG@IBG@G@GBG@E@E@E?C@E@C@C?C@A?C@C?A@A?C?",
      precision: 6
    }
  end
end
