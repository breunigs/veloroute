defmodule Data.Route.Route6 do
  @behaviour Route.Behaviour

  def id(), do: "6"
  def color(), do: "#2a3283"
  def name(), do: "Alltagsroute 6"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/227477"

  forward = %Video.Track{
    group: "6",
    direction: :forward,
    from: "Innenstadt",
    to: "Volksdorf",
    parent_ref: __MODULE__,
    text: "aus der Innenstadt nach Volksdorf",
    videos: [
      {"2021-06-22-velo7-und-pauli-altona/GX011937", "0:00:45.812", "0:00:48.682"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011826", "0:00:15.782", :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011827", :start, "0:00:22.389"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011779", "0:00:00.834", :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011780", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011781", :start, "0:00:18.285"},
      {"2021-04-18-freizeitroute3/GX011334", "0:00:01.201", :end},
      {"2021-04-18-freizeitroute3/GX011335", :start, :end},
      {"2021-04-18-freizeitroute3/GX011336", :start, :end},
      {"2021-06-19-veloroute6/GX011850", :start, :end},
      {"2021-06-19-veloroute6/GX011855", :start, :end},
      {"2021-06-19-veloroute6/GX011856", :start, :end},
      {"2021-06-19-veloroute6/GX011857", :start, :end},
      {"2021-06-19-veloroute6/GX011858", :start, :end},
      {"2021-06-19-veloroute6/GX011859", :start, :end},
      {"2021-06-19-veloroute6/GX011860", :start, :end},
      {"2021-06-19-veloroute6/GX011861", :start, :end},
      {"2021-06-19-veloroute6/GX011862", :start, :end},
      {"2021-06-19-veloroute6/GX011863", :start, "0:01:56.000"}
    ]
  }

  backward = %Video.Track{
    group: "6",
    direction: :backward,
    from: "Volksdorf",
    to: "Innenstadt",
    parent_ref: __MODULE__,
    text: "aus Volksdorf in die Innenstadt",
    videos: [
      {"2021-06-19-veloroute6/GX011864", "0:00:15.449", :end},
      {"2021-06-19-veloroute6/GX011865", :start, :end},
      {"2021-06-19-veloroute6/GX011866", :start, :end},
      {"2021-06-19-veloroute6/GX011867", :start, :end},
      {"2021-06-19-veloroute6/GX011868", :start, :end},
      {"2021-06-19-veloroute6/GX011869", :start, :end},
      {"2021-06-19-veloroute6/GX011870", :start, :end},
      {"2021-06-19-veloroute6/GX011871", :start, :end},
      {"2021-06-19-veloroute6/GX011872", :start, :end},
      {"2021-04-18-freizeitroute3/GX011360", :start, "0:01:59.920"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011821", "0:00:02.636", :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011822", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011823", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011824", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011825", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011829", "0:00:13.947", :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011830", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011831", :start, "0:00:02.336"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011826", "0:00:09.610", "0:00:14.348"}
    ]
  }

  @tracks [forward, backward]
  def tracks(), do: @tracks

  # legacy
  def parsed() do
    %{{id(), ""} => []}
  end

  def index() do
    %{}
  end
end
