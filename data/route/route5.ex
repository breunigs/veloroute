defmodule Data.Route.Route5 do
  @behaviour Route.Behaviour

  def id(), do: "5"
  def type(), do: :alltag
  def color(), do: "#078a3d"
  def name(), do: "Alltagsroute 5"
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/226032"

  forward = %Video.Track{
    group: "5",
    direction: :forward,
    from: "Innenstadt",
    to: "Duvenstedt",
    parent_ref: __MODULE__,
    text: "aus der Innenstadt nach Duvenstedt",
    videos: [
      {"2021-06-22-velo7-und-pauli-altona/GX011937", "0:00:45.812", "0:00:48.682"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011826", "0:00:15.782", :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011827", :start, "0:00:22.389"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011779", "0:00:00.834", :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011780", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011781", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011782", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011783", :start, "0:00:01.502"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011796", "0:00:00.567", :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011797", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011798", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011799", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011800", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011801", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011802", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011803", :start, "0:01:25.185"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011804", "0:00:00.801", :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011805", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011807", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011808", :start, "0:02:45.766"},
      {"2021-05-29-freizeitroute1/GX011488", "0:04:12.519", :end},
      {"2021-05-29-freizeitroute1/GX021488", :start, "0:00:31.465"}
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
      {"2021-05-29-freizeitroute1/GX021488", "0:00:32.399", "0:00:55.055"},
      {"2021-05-29-freizeitroute1/GX011488", "0:00:29.062", "0:01:41.868"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011808", "0:02:57.444", :end},
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
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011829", "0:00:13.947", :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011830", :start, :end},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011831", :start, "0:00:02.336"},
      {"2021-06-13-veloroute-5-5a-und-13rein/GX011826", "0:00:09.610", "0:00:14.348"}
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
