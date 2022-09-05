defmodule Data.Article.Static.Alltagsroute1 do
  use Article.Static

  def id(), do: "1"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 1"

  def color(), do: "#7d8b2f"

  def summary(),
    do:
      "Alltagsroute 1 führt vom Rathaus nach Rissen bzw. zum Osdorfer Born. Die Route spaltet sich in Othmarschen."

  def tags(), do: [id(), "1a"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "1",
        direction: :forward,
        from: "Innenstadt",
        to: "Rissen",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Rissen",
        videos: [
          {"2022-04-22-velo2/GX013448", :start, :end},
          {"2022-04-22-velo2/GX013449", :start, :end},
          {"2022-04-22-velo2/GX013450", :start, "00:00:05.172"},
          {"2022-04-22-velo2/GX013451", :start, :end},
          {"2022-04-22-velo2/GX013452", :start, :end},
          {"2022-04-22-velo2/GX013453", :start, :end},
          {"2022-04-22-velo2/GX013454", :start, "00:00:07.941"},
          {"2022-04-22-velo2/GX013478", "00:00:07.140", :end},
          {"2022-04-22-velo2/GX013479", :start, "00:00:17.117"},
          {"2022-04-24-velo1-1a/GX013531", "00:00:05.072", :end},
          {"2022-04-24-velo1-1a/GX013532", :start, :end},
          {"2022-04-24-velo1-1a/GX013533", :start, :end},
          {"2022-04-24-velo1-1a/GX013534", :start, :end},
          {"2022-04-24-velo1-1a/GX013535", :start, :end},
          {"2022-04-24-velo1-1a/GX013536", :start, :end},
          {"2022-04-24-velo1-1a/GX013537", :start, :end},
          {"2022-04-24-velo1-1a/GX013539", :start, :end},
          {"2022-04-24-velo1-1a/GX013540", :start, :end},
          {"2022-04-24-velo1-1a/GX013541", :start, :end},
          {"2022-04-24-velo1-1a/GX013542", :start, :end},
          {"2022-04-24-velo1-1a/GX013543", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "1",
        direction: :backward,
        from: "Rissen",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Rissen in die Innenstadt",
        videos: [
          {"2022-04-24-velo1-1a/GX013544", "00:00:01.268", :end},
          {"2022-04-24-velo1-1a/GX013545", :start, :end},
          {"2022-04-24-velo1-1a/GX013546", :start, "00:01:05.198"},
          {"2022-04-24-velo1-1a/GX013547", "00:00:02.836", :end},
          {"2022-04-24-velo1-1a/GX013548", :start, "00:00:47.180"},
          {"2022-04-24-velo1-1a/GX013555", "00:00:31.765", :end},
          {"2022-04-24-velo1-1a/GX013556", :start, :end},
          {"2022-04-24-velo1-1a/GX013557", :start, :end},
          {"2022-04-24-velo1-1a/GX013558", :start, :end},
          {"2022-04-24-velo1-1a/GX013559", :start, :end},
          {"2022-04-24-velo1-1a/GX013560", :start, :end},
          {"2022-04-24-velo1-1a/GX013561", :start, "00:00:24.725"},
          {"2022-04-02-velo9/GX013390", "00:00:04.371", "00:00:14.681"},
          {"2022-04-23-velo3-velo12altona/GX013481", "00:00:01.368", "00:00:33.200"},
          {"2022-04-22-velo2/GX013443", "00:00:10.077", :end},
          {"2022-04-22-velo2/GX013444", :start, :end},
          {"2022-04-22-velo2/GX013445", :start, "00:00:16.316"},
          {"2022-04-22-velo2/GX013446", "00:00:00.901", :end},
          {"2022-04-22-velo2/GX013447", :start, "00:00:12.412"},
          {"2022-03-26-veloroute-4/GX013342", "00:00:30.764", "00:01:00.694"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "1a",
        direction: :forward,
        from: "Innenstadt",
        to: "Osdorfer Born",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt zum Osdorfer Born",
        videos: [
          {"2022-04-24-velo1-1a/GX013549", "00:00:04.605", :end},
          {"2022-04-24-velo1-1a/GX013550", :start, :end},
          {"2022-04-24-velo1-1a/GX013551", :start, :end},
          {"2022-04-24-velo1-1a/GX013552", :start, "00:00:56.256"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "1a",
        direction: :backward,
        from: "Osdorfer Born",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "vom Osdorfer Born in die Innenstadt",
        videos: [
          {"2022-04-24-velo1-1a/GX013553", "00:00:02.069", :end},
          {"2022-04-24-velo1-1a/GX013554", :start, :end},
          {"2022-04-24-velo1-1a/GX013555", :start, "00:00:33.600"}
        ]
      }
    ]

  def links(assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/418898/veloroute-1/"},
      ~H{Komoot Routenplaner: <.a href="https://www.komoot.de/tour/228243760">zum Osdorfer Born</.a> oder <.a href="https://www.komoot.de/tour/225147673">nach Rissen</.a>},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/194843"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="14" style="background-image: url(/images/route1.svg)">
          <.icon>1</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.988972,53.547905,10.001451,53.552928" lon="9.993714" lat="53.551028" dir="forward" ref="1">Rathaus</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>11</.icon>
          <.icon>12</.icon>
        </td>
        <td><.m bounds="9.983395,53.547382,9.990571,53.551659" lon="9.987737" lat="53.548638" dir="forward" ref="1">Rödingsmarkt</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.961206,53.550831,9.97826,53.559197" lon="9.9736" lat="53.556844" dir="forward" ref="1">Heiligengeistfeld</.m></td>
      </tr>
      <tr>
        <td><.icon>2</.icon></td>
        <td><.m bounds="9.94718,53.552172,9.976797,53.560891" lon="9.963071" lat="53.556828" dir="forward" ref="1">St. Pauli</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.93142,53.548879,9.961036,53.557599" lon="9.947007" lat="53.555567" dir="forward" ref="1">Altona-Altstadt</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.910939,53.546744,9.940556,53.555464" lon="9.93064" lat="53.5505" dir="forward" ref="1">Ottensen</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>14</.icon>
        </td>
        <td><.m bounds="9.867349,53.547993,9.918397,53.563768" lon="9.888057" lat="53.557353" dir="forward" ref="1">Othmarschen</.m></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon> <.m bounds="9.860821,53.559502,9.895486,53.573619" lon="9.878153" lat="53.564649" dir="forward" ref="1">Groß Flottbek</.m></td>
        <td><.m bounds="9.852981,53.548917,9.883378,53.563805" lon="9.863942" lat="53.557208" dir="forward" ref="1">Klein Flottbek</.m> <.icon>FR11</.icon></td>
      </tr>
      <tr>
        <td>
          <.icon>14</.icon> <.m bounds="9.845905,53.568566,9.883463,53.584532" lon="9.868849" lat="53.577374" dir="forward" ref="1">Osdorf</.m>
        </td>
        <td><.m bounds="9.824293,53.547423,9.870253,53.567174" lon="9.849254" lat="53.556615" dir="forward" ref="1">Nienstedten</.m></td>
      </tr>
      <tr>
        <td><.m bounds="9.840864,53.577504,9.870968,53.597109" lon="9.85197" lat="53.585443" dir="forward" ref="1">Osdorfer Born</.m></td>
        <td><.m bounds="9.789294,53.552567,9.840135,53.565533" lon="9.817201" lat="53.561758" dir="forward" ref="1">Blankenese</.m></td>
      </tr>
      <tr>
        <td class="dir"><.m bounds="9.7897061,53.5841903,9.8681548,53.6156231">(Schenefeld)</.m></td>
        <td><.m bounds="9.776786,53.568237,9.818757,53.586265" lon="9.793236" lat="53.578416" dir="forward" ref="1">Sülldorf</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.733138,53.574751,9.780336,53.593962" lon="9.758658" lat="53.583422" dir="forward" ref="1">Rissen</.m></td>
      </tr>
      <tr>
        <td></td>
        <td class="dir"><.m bounds="9.6333439,53.5575882,9.7592222,53.6187534">(Wedel)</.m></td>
      </tr>
    </table>

    <p>Die Alltagsroute 1 (auch: Veloroute 1) führt vom Rathaus grob in Richtung Westen. Sie macht dazu zunächst einen kleinen Umweg am Schanzenviertel vorbei. In Othmarschen teilt sich die Route:</p>
    <ul>
      <li><.icon link="no">1</.icon> führt <.m bounds="9.737287,53.548968,9.885129,53.588181" lon="9.880805" lat="53.558266" dir="forward" ref="1">weiter nach Westen</.m> und endet in Rissen</li>
      <li><.icon name="1" link="no">1a</.icon> knickt <.m bounds="9.847553,53.552424,9.904828,53.595271" lon="9.882076" lat="53.558455" dir="forward" ref="1">nach Norden</.m> ab und endet im Osdorfer Born</li>
    </ul>

    <h4>Auffindbarkeit</h4>
    <.roaddiagram src="temp_routing" width="100" alt="Beispiel eines vorläufigen Radwegweisers" class="right"/>
    <p>Die meisten Abschnitte der Route sind nicht ausgeschildert und erfordern daher Ortskenntnis oder ein Navi um ihr folgen zu können.</p>
    <p>Ab Ottensen wurden bis nach Rissen gelbe Baustellen-Wegweiser aufgestellt, die als zusätzliche Orientierungshilfe dienen können. Leider sind sie nicht zahlreich genug um alleine anhand der Schilder fahren zu können. Zusätzlich wird bei Umleitungen an Baustellen der selbe Schildertyp verwendent, sodass man auch widersprüchliche Wegweisung hat.</p>


    <h4>Befahrbarkeit</h4>
    <p>Die meisten Wege sind befestigt und allwettertauglich. Ausnahmen sind die noch nicht modernisierten Abschnitte in der <.m bounds="9.908084,53.547156,9.922823,53.55432" lon="9.917299" lat="53.551185" dir="forward" ref="1">Bleickenallee</.m> und durch den <.m bounds="9.866394,53.573567,9.876673,53.578734" lon="9.874045" lat="53.575509" dir="forward" ref="1">Lise-Meitner-Park</.m>. Bei letzterem gibt es auch keine ortsnahen Ausweichmöglichkeiten. Am <.m bounds="9.796555,53.567615,9.811059,53.575976" lon="9.80117" lat="53.573144" dir="forward" ref="1">Friedhof Blankenese</.m> ist eine Durchfahrt mit Lastenrädern nicht möglich.</p>

    <h4>Meinung</h4>
    <p>Manche der modernisierten Abschnitte sind gelungen, wie z.B. die <.m bounds="9.950381,53.555088,9.963928,53.558455" lon="9.960408" lat="53.556644" dir="forward" ref="1">Thadenstraße</.m>. Bei anderen hat sich im Vergleich zu vorher dagegen nichts verbessert, wie z.B. in der <.m bounds="9.92211,53.548454,9.935175,53.552139" lon="9.931826" lat="53.550367" dir="forward" ref="1">Klausstraße</.m>. Die noch nicht umgebauten Abschnitte lassen wenig überraschend ebenfalls zu wünschen übrig.</p>

    <p>Das Hauptproblem der Strecke sind vor allem am Straßenrand abgestellte PKW, durch die häufig auf Gegenverkehr gewartet werden muss. Das trifft vor allem auf die Außenbezirke zu, da im Innenstadtbereich einseits meist über die KFZ-Spur ausgewichen werden kann und andererseits die Ampeln stärker ins Gewicht fallen. Nach Ottensen hat man aber kaum noch Ampeln, sodass man trotz allem noch gut vorankommt.</p>

    <h4>Externe Links</h4>
    <.structured_links gpx="true"/>
    """
  end
end
