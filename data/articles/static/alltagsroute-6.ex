defmodule Data.Article.Static.Alltagsroute6 do
  use Article.Static

  def id(), do: "6"
  def route_group(), do: :alltag
  def name(), do: "alltagsroute-6"
  def title(), do: "Alltagsroute 6"

  def color(), do: "#2a3283"

  def summary(),
    do: "Alltagsroute 6 führt vom Rathaus nach Volksdorf"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        group: "6",
        direction: :forward,
        from: "Innenstadt",
        to: "Volksdorf",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Volksdorf",
        videos: [
          {"2021-06-22-velo7-und-pauli-altona/GX011937", "00:00:45.812", "00:00:48.682"},
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011826", "00:00:15.782", :end},
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011827", :start, "00:00:22.389"},
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011779", "00:00:00.834", :end},
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011780", :start, :end},
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011781", :start, "00:00:18.285"},
          {"2021-04-18-freizeitroute3/GX011334", "00:00:01.201", :end},
          {"2021-04-18-freizeitroute3/GX011335", :start, :end},
          {"2021-04-18-freizeitroute3/GX011336", :start, :end},
          {"2021-06-19-veloroute6/GX011850", :start, :end},
          {"2021-06-19-veloroute6/GX011855", :start, :end},
          {"2021-06-19-veloroute6/GX011856", :start, :end},
          {"2021-06-19-veloroute6/GX011857", :start, "00:00:15.282"},
          {"2021-09-26-velo6-rsw-ahrensburg/GX012954", "00:00:46.713", "00:01:11.138"},
          {"2021-06-19-veloroute6/GX011858", "00:00:06.974", :end},
          {"2021-06-19-veloroute6/GX011859", :start, :end},
          {"2021-06-19-veloroute6/GX011860", :start, :end},
          {"2021-06-19-veloroute6/GX011861", :start, :end},
          {"2021-06-19-veloroute6/GX011862", :start, :end},
          {"2021-06-19-veloroute6/GX011863", :start, "00:01:56.000"}
        ]
      },
      %Video.Track{
        group: "6",
        direction: :backward,
        from: "Volksdorf",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Volksdorf in die Innenstadt",
        videos: [
          {"2021-06-19-veloroute6/GX011864", "00:00:15.449", :end},
          {"2021-06-19-veloroute6/GX011865", :start, :end},
          {"2021-06-19-veloroute6/GX011866", :start, :end},
          {"2021-06-19-veloroute6/GX011867", :start, :end},
          {"2021-06-19-veloroute6/GX011868", :start, :end},
          {"2021-09-26-velo6-rsw-ahrensburg/GX012973", :start, :end},
          {"2021-09-26-velo6-rsw-ahrensburg/GX012974", :start, :end},
          {"2021-09-26-velo6-rsw-ahrensburg/GX012975", :start, :end},
          {"2021-09-26-velo6-rsw-ahrensburg/GX012976", :start, "00:00:32.399"},
          {"2021-06-19-veloroute6/GX011872", "00:00:02.536", :end},
          {"2021-04-18-freizeitroute3/GX011360", :start, "00:01:59.920"},
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011821", "00:00:02.636", :end},
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
    ]

  def links() do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/426692/veloroute-6/"},
      {"Komoot Routenplaner: nach Volksdorf", "https://www.komoot.de/tour/204279360"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/227477"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="14" style="background-image: url(/images/route6.svg)">
          <.icon>6</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9915695,53.5499061,9.9931782,53.5509096">Rathaus</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>5</.icon>
        </td>
        <td><.m bounds="9.9974811,53.5497575,10.0264608,53.5652488">St. Georg</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>5</.icon>
        </td>
        <td><.m bounds="10.0038075,53.5652488,10.0378378,53.582101">Uhlenhorst</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0082327,53.5563894,10.037771,53.5665697">Hohenfelde</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>13</.icon>
        </td>
        <td><.m bounds="10.0440274,53.5707023,10.0441274,53.5708023">Auenviertel</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0573709,53.5764469,10.0574709,53.5765469">Friedrichsberg</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0531511,53.5758428,10.0755084,53.5910451">Dulsberg</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0693469,53.5873256,10.0793469,53.5973256">Wandsbek-Gartenstadt</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0978727,53.593434,10.1078727,53.603434">Trabrennbahn Farmsen</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>14</.icon>
        </td>
        <td><.m bounds="10.1127994,53.602222,10.1227994,53.612222">Farmsen</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>14</.icon>
        </td>
        <td><.m bounds="10.1349662,53.6220857,10.1449662,53.6320857">Berne</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.1368101,53.6342243,10.1988518,53.6760647">Volksdorf</.m></td>
      </tr>
      <tr>
        <td></td>
        <td class="dir"><.m bounds="10.1699771,53.6333794,10.3156737,53.7051402">(Ahrensburg)</.m></td>
      </tr>
    </table>

    <h3>Externe Links</h3>
    <.structured_links gpx="yes"/>
    """
  end
end
