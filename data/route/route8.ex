# defmodule Data.Route.Route8 do
#   use Route.Parser,
#     id: "8"
# end

defmodule Data.Route.Route8 do
  @behaviour Route.Behaviour

  @name "Alltagsroute 8"

  def id(), do: "8"
  def color(), do: "#e20612"
  def name(), do: @name
  def osm_relation_ref(), do: "https://www.openstreetmap.org/relation/229623"

  forward_bergedorf = %Video.Track{
    group: "8 Bergedorf",
    direction: :forward,
    from: "Innenstadt",
    to: "Bergedorf",
    parent_text: @name,
    text: "aus der Innenstadt nach Bergedorf",
    videos: [
      {"2021-07-03-veloroute10/GX012051", :start, "0:00:03.770"},
      {"2021-06-27-veloroute9/GX012023", "0:00:56.356", :end},
      {"2021-04-25-freizeitroute4/GX011376", "0:00:10.377", :end},
      {"2021-04-25-freizeitroute4/GX011377", :start, "0:00:06.473"},
      {"2021-06-25-velo8/GX011969", "0:00:06.974", :end},
      {"2021-06-25-velo8/GX011970", :start, :end},
      {"2021-06-25-velo8/GX011971", :start, :end},
      {"2021-06-25-velo8/GX011972", :start, :end},
      {"2021-06-25-velo8/GX011973", :start, :end},
      {"2021-06-25-velo8/GX011975", :start, "0:01:16.009"},
      {"2021-06-25-velo8/GX011979", "0:00:21.021", :end},
      {"2021-06-25-velo8/GX011980", :start, :end},
      {"2021-06-25-velo8/GX011981", :start, :end},
      {"2021-06-25-velo8/GX011982", :start, :end},
      {"2021-06-25-velo8/GX011983", :start, :end},
      {"2021-06-25-velo8/GX011984", :start, "0:00:19.753"},
      {"2021-06-25-velo8/GX011985", "0:03:14.828", :end},
      {"2021-06-25-velo8/GX011986", :start, :end},
      {"2021-06-25-velo8/GX011987", :start, :end},
      {"2021-06-25-velo8/GX011988", :start, "0:00:10.744"}
    ]
  }

  backward_bergedorf = %Video.Track{
    group: "8 Bergedorf",
    direction: :backward,
    from: "Bergedorf",
    to: "Innenstadt",
    parent_text: @name,
    text: "aus Bergedorf in die Innenstadt",
    videos: [
      {"2021-06-25-velo8/GX011989", "0:00:01.368", :end},
      {"2021-06-25-velo8/GX011990", :start, :end},
      {"2021-06-25-velo8/GX011991", :start, :end},
      {"2021-06-25-velo8/GX011992", :start, :end},
      {"2021-06-25-velo8/GX011993", :start, :end},
      {"2021-06-25-velo8/GX011994", :start, :end},
      {"2021-06-25-velo8/GX011995", :start, :end},
      {"2021-06-25-velo8/GX011996", :start, :end},
      {"2021-06-25-velo8/GX011997", :start, :end},
      {"2021-06-25-velo8/GX011998", :start, :end},
      {"2021-06-25-velo8/GX011999", :start, :end},
      {"2021-06-25-velo8/GX012000", :start, :end},
      {"2021-06-25-velo8/GX012001", :start, :end},
      {"2021-06-22-velo7-und-pauli-altona/GX011937", :start, "0:00:47.180"}
    ]
  }

  # videos are only the short segments, GPX should be the full tracks
  forward_mmb = %Video.Track{
    group: "8 Mümmelmannsberg",
    direction: :forward,
    from: "Innenstadt",
    to: "Mümmelmannsberg",
    parent_text: @name,
    text: "aus der Innenstadt zum Mümmelmannsberg",
    videos: [
      {"2021-06-25-velo8/GX011984", "0:00:19.753", :end},
      {"2021-06-25-velo8/GX011985", :start, "0:01:33.226"}
    ]
  }

  backward_mmb = %Video.Track{
    group: "8 Mümmelmannsberg",
    direction: :backward,
    from: "Mümmelmannsberg",
    to: "Innenstadt",
    parent_text: @name,
    text: "vom Mümmelmannsberg in die Innenstadt",
    videos: [
      {"2021-06-25-velo8/GX011985", "0:01:33.226", "0:03:12.592"}
    ]
  }

  @tracks Enum.map(
            [
              forward_bergedorf,
              backward_bergedorf,
              forward_mmb,
              backward_mmb
            ],
            &Video.Track.with_rendered_ref/1
          )
  def tracks(), do: @tracks

  # legacy
  def parsed() do
    %{{id(), ""} => []}
  end

  def index() do
    %{}
  end
end
