defmodule(Data.AutoGenerated.Video.Rendered_ae4740e7032c06828f669fa3ac210af0) do
  @moduledoc "#{"Louise-Schroeder-Straße: Louise-Schroeder-Straße nach St. Pauli"}
  
  AUTOGENERATED. To update this file, run mix velo.videos.generate.
  See Video.Rendered for functionality.
  "
  @behaviour Video.Rendered
  @external_resource "videos/rendered/ae4740e7032c06828f669fa3ac210af0/stream.m3u8"
  @impl Video.Rendered
  def(name()) do
    "Louise-Schroeder-Straße: Louise-Schroeder-Straße nach St. Pauli"
  end

  @impl Video.Rendered
  def(hash()) do
    "ae4740e7032c06828f669fa3ac210af0"
  end

  @impl Video.Rendered
  def(length_ms()) do
    17918
  end

  @impl Video.Rendered
  def(sources()) do
    [{"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011414", "00:00:06.139", "00:00:24.057"}]
  end

  @impl Video.Rendered
  def(coords()) do
    [
      %Video.TimedPoint{lat: 53.551139582018706, lon: 9.947431234717369, time_offset_ms: 0},
      %Video.TimedPoint{lat: 53.55113272194065, lon: 9.947716443389654, time_offset_ms: 861},
      %Video.TimedPoint{lat: 53.55110164919875, lon: 9.947953817546365, time_offset_ms: 1861},
      %Video.TimedPoint{lat: 53.5510705772308, lon: 9.948193872570991, time_offset_ms: 2861},
      %Video.TimedPoint{lat: 53.55102038142948, lon: 9.94854658305645, time_offset_ms: 3861},
      %Video.TimedPoint{lat: 53.55097735640952, lon: 9.948849672675136, time_offset_ms: 4861},
      %Video.TimedPoint{lat: 53.55092955078048, lon: 9.949227864146234, time_offset_ms: 5861},
      %Video.TimedPoint{lat: 53.55085146813691, lon: 9.949753577113155, time_offset_ms: 6861},
      %Video.TimedPoint{lat: 53.55077816593226, lon: 9.950212234854698, time_offset_ms: 7861},
      %Video.TimedPoint{lat: 53.550762230653575, lon: 9.9507701343298, time_offset_ms: 8861},
      %Video.TimedPoint{lat: 53.55076, lon: 9.951215, time_offset_ms: 9744},
      %Video.TimedPoint{lat: 53.550762, lon: 9.951473, time_offset_ms: 10411},
      %Video.TimedPoint{lat: 53.550777, lon: 9.951804, time_offset_ms: 11078},
      %Video.TimedPoint{lat: 53.550808, lon: 9.952142, time_offset_ms: 11746},
      %Video.TimedPoint{lat: 53.550831, lon: 9.952314, time_offset_ms: 12079},
      %Video.TimedPoint{lat: 53.550995, lon: 9.953148, time_offset_ms: 13748},
      %Video.TimedPoint{lat: 53.551282, lon: 9.954177, time_offset_ms: 15750},
      %Video.TimedPoint{lat: 53.551415, lon: 9.954705, time_offset_ms: 16751},
      %Video.TimedPoint{lat: 53.551484, lon: 9.955048, time_offset_ms: 17418},
      %Video.TimedPoint{lat: 53.551505, lon: 9.955213, time_offset_ms: 17752},
      %Video.TimedPoint{lat: 53.55150101201201, lon: 9.955290267267268, time_offset_ms: 17918}
    ]
  end

  @impl Video.Rendered
  def(rendered?()) do
    true
  end
end