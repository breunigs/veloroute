defmodule Data.Article.Static.Alltagsroute5 do
  use Article.Static

  def id(), do: "5"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 5"

  def color(), do: "#078a3d"

  def summary(),
    do:
      "Alltagsroute 5 führt vom Rathaus zum Flughafen bzw. nach Duvenstedt. Die Route spaltet sich dazu an der Hamburger Meile auf."

  def tags(), do: [id(), "5N"]

  def tracks(),
    do: [
      %Video.Track{
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
      },
      %Video.Track{
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
      },
      %Video.Track{
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
      },
      %Video.Track{
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
    ]

  def links(assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/426674/veloroute-5/"},
      ~H{Komoot Routenplaner: <.a href="https://www.komoot.de/tour/228654173">zum Flughafen</.a> oder <.a href="https://www.komoot.de/tour/204278537">nach Duvenstedt</.a>},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/226032"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="14" style="background-image: url(/images/route5.svg)">
          <.icon>5</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9915695,53.5499061,9.9931782,53.5509096">Rathaus</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>6</.icon>
        </td>
        <td><.m bounds="9.9974811,53.5497575,10.0264608,53.5652488">St. Georg</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>6</.icon>
        </td>
        <td><.m bounds="10.0038075,53.5652488,10.0378378,53.582101">Uhlenhorst</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0270067,53.5690949,10.0277571,53.5695479">Mundsburg</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>13</.icon>
        </td>
        <td><.m bounds="10.0190335,53.5696406,10.057332,53.5853664">Barmbek-Süd</.m></td>
      </tr>
      <tr>
        <td><.m bounds="10.0035957,53.5909785,10.0317813,53.6002849">Stadtpark</.m></td>
        <td><.m bounds="10.0399416,53.5823864,10.0499416,53.5923864">Bahnhof Barmbek</.m></td>
      </tr>
      <tr>
        <td><.m bounds="10.0116846,53.593643,10.0316846,53.613643">City Nord</.m></td>
        <td><.m bounds="10.0321363,53.5830349,10.0700204,53.6083635">Barmbek-Nord</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>4</.icon> <.m bounds="9.9563463,53.6143894,10.0092691,53.6582832">Flughafen</.m>
        </td>
        <td><.m bounds="10.0431609,53.6013656,10.0742537,53.6205409">Steilshoop</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0547826,53.5919627,10.1231403,53.6359402">Bramfeld</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0564914,53.6283935,10.1118998,53.6476259">Wellingsbüttel</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0517108,53.6405808,10.1016828,53.6797629">Poppenbüttel</.m>
          <.icon>14</.icon>
        </td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.1038415,53.6542993,10.1505365,53.6916966">Bergstedt</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.1344308,53.6970479,10.1348092,53.6972659">Duvenstedt</.m></td>
      </tr>
    </table>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
