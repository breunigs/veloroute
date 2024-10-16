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
        renderer: 5,
        group: "1",
        direction: :forward,
        from: "Innenstadt",
        to: "Rissen",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Rissen",
        historic: %{
          "343799351ddb76ccb212673cffe25934" => ~d[2024-05],
          "b05f0d7755ab075d941b77121918930f" => ~d[2023-05],
          "7d3f8d6e0a969fdbc991207e0b991bad" => ~d[2022-04],
          "34ba5b0e9fa8e03e5beb5a243a9765f5" => ~d[2021-06]
        },
        videos: [
          {"2024-04-07-fr2/GX017109", "00:00:33.534", :end},
          {"2024-04-07-fr2/GX017110", :start, :end},
          {"2024-04-07-fr2/GX017111", :start, :end},
          {"2024-04-07-fr2/GX017112", :start, :end},
          {"2024-04-07-fr2/GX017113", :start, :end},
          {"2024-05-02-vr7/GX017401", :start, :end},
          {"2024-05-02-vr7/GX017402", :start, "00:00:40.541"},
          {"2024-05-06-vr9/GX017430", "00:00:00.367", :end},
          {"2024-05-06-vr9/GX017431", :start, :end},
          {"2024-05-03-vr1/GX017407", :start, :end},
          {"2024-05-03-vr1/GX017408", :start, "00:00:55.055"},
          {"2024-05-03-vr1/GX017422", "00:00:30.230", "00:01:04.131"},
          {"2024-05-03-vr1/GX017422", "00:01:07.501", :end},
          {"2024-05-03-vr1/GX017423", :start, :end},
          # meh connection
          {"2024-05-03-vr1/GX017408", "00:01:40.434", :end},
          {"2024-05-03-vr1/GX017409", :start, :end},
          {"2024-05-03-vr1/GX017410", :start, :end},
          {"2024-05-03-vr1/GX017411", :start, "00:02:35.791"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "1",
        direction: :backward,
        from: "Rissen",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Rissen in die Innenstadt",
        historic: %{
          "fd834aceeea97c6785fc300d7d36a9c1" => ~d[2024-05],
          "16dcd9bbc7fb5fbf4734af54ebef9f11" => ~d[2023-05],
          "a735c3683c40aa01fd3f01519628872d" => ~d[2022-04],
          "054abb2bb8fb4ede71bd63280610524b" => ~d[2021-06]
        },
        videos: [
          {"2024-05-03-vr1/GX017411", "00:02:38.460", :end},
          {"2024-05-03-vr1/GX017412", :start, :end},
          {"2024-05-03-vr1/GX017413", :start, :end},
          {"2024-05-03-vr1/GX017414", :start, "00:02:10.364"},
          # meh transition
          {"2024-05-03-vr1/GX017420", :start, :end},
          {"2024-05-03-vr1/GX017421", :start, :end},
          {"2024-05-03-vr1/GX017422", :start, "00:00:26.093"},
          # meh transition
          {"2024-05-03-vr1/GX017426", "00:00:25.492", :end},
          {"2024-05-03-vr1/GX017427", :start, :end},
          {"2024-05-03-vr1/GX017428", :start, :end},
          {"2024-05-06-vr9/GX017434", :start, :end},
          {"2024-05-06-vr9/GX017435", :start, :end},
          {"2024-05-06-vr9/GX017436", :start, :end},
          {"2024-05-06-vr9/GX017437", :start, :end},
          {"2024-05-06-vr9/GX017438", :start, "00:00:36.203"},
          {"2024-05-02-vr7/GX017364", "00:00:00.934", :end}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "1a",
        direction: :forward,
        from: "Innenstadt",
        to: "Osdorfer Born",
        parent_ref: __MODULE__,
        text: "von Othmarschen zum Osdorfer Born",
        historic: %{
          "d9c4e5b885c5f4eec817e5cd2dead124" => ~d[2024-05],
          "61a363ab12e68406847bcc2cebb9e516" => ~d[2023-05],
          "de9132e638235ffb2b1763b63710768a" => ~d[2022-04],
          "7be7c7ca7a2375acc2bc17992e56f356" => ~d[2021-06]
        },
        videos: [
          {"2024-05-03-vr1/GX017414", "00:02:11.431", "00:03:59.606"},
          {"2024-05-03-vr1/GX017415", "00:00:00.601", :end},
          {"2024-05-03-vr1/GX017416", :start, "00:01:01.228"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "1a",
        direction: :backward,
        from: "Osdorfer Born",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "vom Osdorfer Born in die Innenstadt",
        historic: %{
          "3324e2932c57f5457a6f8890a23221c2" => ~d[2024-05],
          "1062786250344e742cd29b6e766a68b6" => ~d[2023-05],
          "1a92dba06dbd921b14de77d2394a33d4" => ~d[2022-04],
          "b5b6321df014f2eda37e81f267870ddf" => ~d[2021-06]
        },
        videos: [
          {"2024-05-03-vr1/GX017416", "00:01:26.736", "00:02:30.984"},
          {"2024-05-03-vr1/GX017416", "00:02:34.187", :end},
          {"2024-05-03-vr1/GX017417", :start, :end},
          {"2024-05-03-vr1/GX017418", :start, "00:00:48.916"},
          {"2024-05-03-vr1/GX017418", "00:01:02.963", :end},
          {"2024-05-03-vr1/GX017424", :start, "00:00:01.835"}
        ]
      }
    ]

  def links(assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/418898/veloroute-1/"},
      ~H{Komoot Routenplaner: <.a href="https://www.komoot.com/de-de/tour/228243760">zum Osdorfer Born</.a> oder <.a href="https://www.komoot.com/de-de/tour/225147673">nach Rissen</.a>},
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
        <td><.v bounds="9.988972,53.547905,10.001451,53.552928" lon={9.993714} lat={53.551028} dir="forward" ref="1" highlight="Rathausmarkt">Rathaus</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>11</.icon>
          <.icon>12</.icon>
        </td>
        <td><.v bounds="9.983395,53.547382,9.990571,53.551659" lon={9.987737} lat={53.548638} dir="forward" ref="1">Rödingsmarkt</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.961206,53.550831,9.97826,53.559197" lon={9.9736} lat={53.556844} dir="forward" ref="1">Heiligengeistfeld</.v></td>
      </tr>
      <tr>
        <td><.icon>2</.icon></td>
        <td><.v bounds="9.94718,53.552172,9.976797,53.560891" lon={9.963071} lat={53.556828} dir="forward" ref="1">St. Pauli</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.93142,53.548879,9.961036,53.557599" lon={9.947007} lat={53.555567} dir="forward" ref="1">Altona-Altstadt</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.910939,53.546744,9.940556,53.555464" lon={9.93064} lat={53.5505} dir="forward" ref="1">Ottensen</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>14</.icon>
        </td>
        <td><.v bounds="9.867349,53.547993,9.918397,53.563768" lon={9.888057} lat={53.557353} dir="forward" ref="1">Othmarschen</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon> <.v bounds="9.860821,53.559502,9.895486,53.573619" lon={9.878153} lat={53.564649} dir="forward" ref="1">Groß Flottbek</.v></td>
        <td><.v bounds="9.852981,53.548917,9.883378,53.563805" lon={9.863942} lat={53.557208} dir="forward" ref="1">Klein Flottbek</.v> <.icon>FR11</.icon></td>
      </tr>
      <tr>
        <td>
          <.icon>14</.icon> <.v bounds="9.845905,53.568566,9.883463,53.584532" lon={9.868849} lat={53.577374} dir="forward" ref="1">Osdorf</.v>
        </td>
        <td><.v bounds="9.824293,53.547423,9.870253,53.567174" lon={9.849254} lat={53.556615} dir="forward" ref="1">Nienstedten</.v></td>
      </tr>
      <tr>
        <td><.v bounds="9.840864,53.577504,9.870968,53.597109" lon={9.85197} lat={53.585443} dir="forward" ref="1">Osdorfer Born</.v></td>
        <td><.v bounds="9.789294,53.552567,9.840135,53.565533" lon={9.817201} lat={53.561758} dir="forward" ref="1">Blankenese</.v></td>
      </tr>
      <tr>
        <td class="dir"><.m bounds="9.7897061,53.5841903,9.8681548,53.6156231">(Schenefeld)</.m></td>
        <td><.v bounds="9.776786,53.568237,9.818757,53.586265" lon={9.793236} lat={53.578416} dir="forward" ref="1">Sülldorf</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.733138,53.574751,9.780336,53.593962" lon={9.758658} lat={53.583422} dir="forward" ref="1">Rissen</.v></td>
      </tr>
      <tr>
        <td></td>
        <td class="dir"><.m bounds="9.6333439,53.5575882,9.7592222,53.6187534">(Wedel)</.m></td>
      </tr>
    </table>

    <p>Die Alltagsroute 1 (auch: Veloroute 1 oder Radroute 1) führt vom Rathaus grob in Richtung Westen. Sie macht dazu zunächst einen kleinen Umweg am Schanzenviertel vorbei. In Othmarschen teilt sich die Route:</p>
    <ul>
      <li><.icon link={false}>1</.icon> führt <.v bounds="9.737287,53.548968,9.885129,53.588181" lon={9.880805} lat={53.558266} dir="forward" ref="1">weiter nach Westen</.v> und endet in Rissen</li>
      <li><.icon name="1" link={false}>1a</.icon> knickt <.v bounds="9.847553,53.552424,9.904828,53.595271" lon={9.882076} lat={53.558455} dir="forward" ref="1">nach Norden</.v> ab und endet im Osdorfer Born</li>
    </ul>

    <h4>Auffindbarkeit</h4>
    <.roaddiagram src="temp_routing" width={100} alt="Beispiel eines vorläufigen Radwegweisers" class="right"/>
    <p>Die meisten Abschnitte der Route sind nicht ausgeschildert und erfordern daher Ortskenntnis oder ein Navi um ihr folgen zu können.</p>
    <p>Ab Ottensen wurden bis nach Rissen gelbe Baustellen-Wegweiser aufgestellt, die als zusätzliche Orientierungshilfe dienen können. Leider sind sie nicht zahlreich genug um alleine anhand der Schilder fahren zu können. Zusätzlich wird bei Umleitungen an Baustellen der selbe Schildertyp verwendent, sodass man auch widersprüchliche Wegweisung hat.</p>


    <h4>Befahrbarkeit</h4>
    <p>Die meisten Wege sind befestigt und allwettertauglich. Ausnahmen sind die noch nicht modernisierten Abschnitte in der <.v bounds="9.908084,53.547156,9.922823,53.55432" lon={9.917299} lat={53.551185} dir="forward" ref="1">Bleickenallee</.v> und durch den <.v bounds="9.866394,53.573567,9.876673,53.578734" lon={9.874045} lat={53.575509} dir="forward" ref="1">Lise-Meitner-Park</.v>. Bei letzterem gibt es auch keine ortsnahen Ausweichmöglichkeiten. Am <.v bounds="9.796555,53.567615,9.811059,53.575976" lon={9.80117} lat={53.573144} dir="forward" ref="1">Friedhof Blankenese</.v> ist eine Durchfahrt mit Lastenrädern nicht möglich.</p>

    <h4>Meinung</h4>
    <p>Manche der modernisierten Abschnitte sind gelungen, wie z.B. die <.v bounds="9.950381,53.555088,9.963928,53.558455" lon={9.960408} lat={53.556644} dir="forward" ref="1">Thadenstraße</.v>. Bei anderen hat sich im Vergleich zu vorher dagegen nichts verbessert, wie z.B. in der <.v bounds="9.92211,53.548454,9.935175,53.552139" lon={9.931826} lat={53.550367} dir="forward" ref="1">Klausstraße</.v>. Die noch nicht umgebauten Abschnitte lassen wenig überraschend ebenfalls zu wünschen übrig.</p>

    <p>Das Hauptproblem der Strecke sind vor allem am Straßenrand abgestellte PKW, durch die häufig auf Gegenverkehr gewartet werden muss. Das trifft vor allem auf die Außenbezirke zu, da im Innenstadtbereich einseits meist über die KFZ-Spur ausgewichen werden kann und andererseits die Ampeln stärker ins Gewicht fallen. Nach Ottensen hat man aber kaum noch Ampeln, sodass man trotz allem noch gut vorankommt.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
