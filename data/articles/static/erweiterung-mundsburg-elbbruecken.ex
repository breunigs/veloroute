defmodule Data.Article.Static.ErweiterungMundsburgElbbruecken do
  use Article.Static

  def id(), do: "erweiterung-mundsburg-elbbruecken"
  def route_group(), do: :alltag
  def color(), do: "#888888"

  def title(), do: "Velorouten Erweiterung: Mundsburg ↔ Elbbrücken"

  def summary(),
    do: "Veloroutennetz soll um eine Verbindung von Mundsburg und Elbbrücken erweitert werden"

  def tags(), do: []

  def links(_assigns) do
    [
      {"Pressemitteilung BVM",
       "https://www.hamburg.de/bvm/medien/15646102/2021-11-29-bvm-radverkehr/"},
      {"Bündnis für den Fuß- und Radverkehr",
       "https://www.skyfish.com/p/fhh/2001119/52474395/download/media"}
    ]
  end

  def tracks(),
    do: [
      %Video.Track{
        renderer: 2,
        group: "veloroute",
        direction: :forward,
        from: "Mundsburg",
        to: "Elbbrücken",
        parent_ref: __MODULE__,
        text: "Fahrtrichtung Süden/Elbbrücken",
        videos: [
          {"2022-01-19-neue-veloroute/GX013183", "00:00:01.168", :end},
          {"2022-01-19-neue-veloroute/GX013184", :start, :end},
          {"2022-01-19-neue-veloroute/GX013185", :start, :end},
          {"2022-01-19-neue-veloroute/GX013186", :start, :end},
          {"2022-01-19-neue-veloroute/GX013187", :start, :end},
          {"2022-01-19-neue-veloroute/GX013188", :start, "00:00:31.064"}
        ]
      },
      %Video.Track{
        renderer: 2,
        group: "veloroute",
        direction: :backward,
        from: "Elbbrücken",
        to: "Mundsburg",
        parent_ref: __MODULE__,
        text: "Fahrtrichtung Norden/Mundsburg",
        videos: [
          {"2021-04-17-freizeitrouten-6und-7/GX011306", "00:00:40.774", :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011307", :start, "00:00:01.735"},
          {"2021-04-03-freizeitroute-5-zeitraffer/GX011129", "00:00:15.649", :end},
          {"2021-04-03-freizeitroute-5-zeitraffer/GX011130", :start, :end},
          {"2021-04-03-freizeitroute-5-zeitraffer/GX011131", :start, :end},
          {"2021-04-03-freizeitroute-5-zeitraffer/GX011132", :start, :end},
          {"2022-01-19-neue-veloroute/GX013178", :start, :end},
          {"2022-01-19-neue-veloroute/GX013179", :start, :end},
          {"2022-01-19-neue-veloroute/GX013181", :start, :end}
        ]
      }
    ]

  def text(assigns) do
    ~H"""
    <h4>Vorhaben</h4>
    <p>Die <.abbr>BVM</.abbr> möchte das Veloroutennetz erweitern, um die fehlende Anbindung mancher Stadtteile zu verbessern. Der Verlauf der Nord/Süd Verbindung vom <.m bounds="10.023539,53.566807,10.032159,53.571333" lon="10.026585" lat="53.56936" dir="forward">U-Bahnhof Mundsburg</.m> zu den <.m bounds="10.022407,53.528823,10.034761,53.538651" lon="10.030073" lat="53.537408" dir="forward">Elbbrücken</.m> wurde bereits konkretisiert:</p>
    <ul>
      <li><.m bounds="10.023511,53.564108,10.027097,53.568722" lon="10.025824" lat="53.567966" dir="forward">Schürbeker Straße</.m></li>
      <li><.m bounds="10.023431,53.563584,10.025206,53.566265" lon="10.024717" lat="53.56605" dir="forward">Kuhmühle</.m></li>
      <li><.m bounds="10.023405,53.556417,10.027275,53.564685" lon="10.024117" lat="53.563596" dir="forward">Mühlendamm</.m></li>
      <li><.m bounds="10.024524,53.551213,10.028068,53.557838" lon="10.026512" lat="53.556015" dir="forward">Bürgerweide</.m></li>
      <li><.m bounds="10.02397,53.540309,10.034974,53.552383" lon="10.026095" lat="53.550829" dir="forward">Heidenkampsweg</.m></li>
      <li><.m bounds="10.024761,53.531406,10.035654,53.542411" lon="10.032604" lat="53.540696" dir="forward">Billhorner Brückenstraße</.m></li>
    </ul>

    <h4>Aktueller Zustand</h4>
    <p>Die neue Veloroute ist bereits heute befahrbar und besteht aus <.ref>Hochbordradwegen</.ref> und einem kürzeren Abschnitt mit <.ref>Radfahrstreifen</.ref>. Die Wege sind meist 1,50m-1,60m breit, was den Mindestbreiten zum jeweiligen Bauzeitpunkt entspricht. Für Alltagsrouten strebt man künftig 2,50m Breite an, Bordsteine und andere Trennelemente nicht eingerechnet.</p>

    <p>Die Ampelschaltungen entlang der Route sind nicht auf den Radverkehr abgestimmt. Gerade im <.m bounds="10.02397,53.540309,10.034974,53.552383" lon="10.026095" lat="53.550829" dir="forward">Heidenkampsweg</.m> führt dies häufig zu einer roten Welle.</p>

    <p>Die Führung ist entlang einer 4 bis 8-spurigen KFZ-Hauptstraße. Stellenweise sind 60 km/h als Höchstgeschwindigkeit erlaubt. Beides erhöht den Lärmpegel an dieser Strecke.</p>

    <h4>Anschlüsse</h4>
    <p>Der neue Abschnitt bietet direkten Anschluss zu folgenden Routen:</p>
    <ul>
      <li><.a name="alltagsroute-5"><.icon>5</.icon></.a> Alltagsroute</li>
      <li><.a name="alltagsroute-7"><.icon>7</.icon></.a> Alltagsroute</li>
      <li><.a name="alltagsroute-9"><.icon>9</.icon></.a> Alltagsroute</li>
      <li><.a name="alltagsroute-10"><.icon>10</.icon></.a> Alltagsroute</li>
      <li><.a name="freizeitroute-5"><.icon>FR5</.icon></.a> Freizeitroute</li>
      <li><.a name="freizeitroute-6"><.icon>FR6</.icon></.a> Freizeitroute</li>
      <li><.a name="zweiter-gruener-ring"><.icon>FR11</.icon></.a> 2. Grüner Ring</li>
    </ul>
    <p>Die folgenden Routen verlaufen entweder über oder unter der neuen Route. Um die Höhenunterschiede auszugleichen ist daher ein kleiner Umweg notwendig:</p>
    <ul>
      <li><.a name="alltagsroute-6"><.icon>6</.icon></.a> Alltagsroute</li>
      <li><.a name="alltagsroute-8"><.icon>8</.icon></.a> Alltagsroute</li>
      <li><.a name="freizeitroute-3"><.icon>FR3</.icon></.a> Freizeitroute</li>
      <li><.a name="freizeitroute-4"><.icon>FR4</.icon></.a> Freizeitroute</li>
    </ul>

    <h4>Links</h4>
    <.structured_links gpx="true"/>
    """
  end
end
