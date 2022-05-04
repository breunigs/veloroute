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
        renderer: 3,
        group: "5",
        direction: :forward,
        from: "Innenstadt",
        to: "Duvenstedt",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Duvenstedt",
        videos: [
          {"2022-04-30-velo5-u-12innenstadt/GX013576", "00:00:38.872", :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013577", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013578", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013579", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013580", :start, "00:00:31.431"},
          {"2022-04-30-velo5-u-12innenstadt/GX013581", "00:00:22.256", :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013582", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013583", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013584", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013585", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013586", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013587", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013588", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013591", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013592", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013594", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013595", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013596", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013597", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013598", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "5",
        direction: :backward,
        from: "Duvenstedt",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "von Duvenstedt in die Innenstadt",
        videos: [
          {"2022-04-30-velo5-u-12innenstadt/GX013599", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013600", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013601", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013602", :start, "00:02:08.695"},
          {"2022-04-30-velo5-u-12innenstadt/GX013603", "00:00:08.041", "00:00:54.454"},
          {"2022-04-30-velo5-u-12innenstadt/GX013603", "00:01:07.067", :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013604", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013605", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013606", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013607", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013608", :start, "00:00:16.383"},
          {"2022-04-30-velo5-u-12innenstadt/GX013608", "00:00:17.951", :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013609", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013611", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013612", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013614", :start, "00:00:03.070"},
          {"2022-04-30-velo5-u-12innenstadt/GX013626", "00:00:20.587", :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013627", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013628", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013629", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013630", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013631", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013632", :start, "00:00:09.042"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "5N",
        direction: :forward,
        from: "Hamburger Meile",
        to: "City Nord",
        parent_ref: __MODULE__,
        text: "Hamburger Meile zur City Nord",
        videos: [
          {"2022-04-30-velo5-u-12innenstadt/GX013615", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013616", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013617", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013618", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013619", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013620", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013621", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "5N",
        direction: :backward,
        from: "City Nord",
        to: "Hamburger Meile",
        parent_ref: __MODULE__,
        text: "City Nord zur Hamburger Meile",
        videos: [
          {"2022-04-30-velo5-u-12innenstadt/GX013622", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013624", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013625", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013626", :start, "00:00:19.987"}
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
