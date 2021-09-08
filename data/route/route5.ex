defmodule Data.Route.Route5 do
  @behaviour Route.Behaviour

  def id(), do: "5"
  def type(), do: :alltag
  def color(), do: "#078a3d"
  def name(), do: "Alltagsroute 5"
  def article(), do: "alltagsroute-5"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/226032"

  forward = %Video.Track{
    group: "5",
    direction: :forward,
    from: "Innenstadt",
    to: "Duvenstedt",
    parent_ref: __MODULE__,
    text: "aus der Innenstadt nach Duvenstedt",
    videos: [
      {"2021-06-22-velo7-und-pauli-altona/GX011937", "00:00:45.812", "00:00:48.682"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011826", "00:00:15.782", :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011827", :start, "00:00:22.155"},
      {"2021-09-08-velo5-reroute/GX012706", "00:00:00.667", :end},
      {"2021-09-08-velo5-reroute/GX012707", :start, "00:00:12.346"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011779", "00:00:09.009", :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011780", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011781", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011782", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011783", :start, "00:00:01.301"},
      {"2021-09-08-velo5-reroute/GX012710", "00:00:00.701", :end},
      {"2021-09-08-velo5-reroute/GX012711", :start, :end},
      {"2021-09-08-velo5-reroute/GX012712", :start, "00:00:16.583"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011799", "00:00:10.878", :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011800", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011801", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011802", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011803", :start, "00:01:25.185"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011804", "00:00:00.801", :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011805", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011807", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011808", :start, "00:02:45.766"},
      {"2021-05-29-freizeitroute1/GX011488", "00:04:12.519", :end},
      {"2021-05-29-freizeitroute1/GX021488", :start, "00:00:31.465"}
    ]
  }

  backward = %Video.Track{
    group: "5",
    direction: :backward,
    from: "Duvenstedt",
    to: "Innenstadt",
    parent_ref: __MODULE__,
    text: "von Duvenstedt in die Innenstadt",
    videos: [
      {"2021-05-29-freizeitroute1/GX021488", "00:00:32.399", "00:00:55.055"},
      {"2021-05-29-freizeitroute1/GX011488", "00:00:29.062", "00:01:41.868"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011808", "00:02:57.444", :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX021808", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011809", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011810", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011811", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011812", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011813", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011814", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011815", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011816", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011817", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011818", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011819", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011820", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011821", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011822", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011823", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011824", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011825", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011829", "00:00:13.947", :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011830", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011831", :start, "00:00:02.336"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011826", "00:00:09.610", "00:00:14.348"}
    ]
  }

  forward_5N = %Video.Track{
    group: "5N",
    direction: :forward,
    from: "Hamburger Meile",
    to: "City Nord",
    parent_ref: __MODULE__,
    text: "Hamburger Meile zur City Nord",
    videos: [
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011783", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011784", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011785", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011786", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011787", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011788", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011789", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011790", :start, :end}
    ]
  }

  backward_5N = %Video.Track{
    group: "5N",
    direction: :backward,
    from: "City Nord",
    to: "Hamburger Meile",
    parent_ref: __MODULE__,
    text: "City Nord zur Hamburger Meile",
    videos: [
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011792", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011793", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011794", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011795", :start, :end}
    ]
  }

  @tracks [forward, backward, forward_5N, backward_5N]
  def tracks(), do: @tracks
end
