defmodule Data.Article.Static.Freizeitroute9 do
  use Article.Static

  def id(), do: "FR9"
  def route_group(), do: :freizeit
  def title(), do: "Klövensteenradweg (FR9)"

  def color(), do: "#006106"

  def summary(),
    do: "Freizeitroute 9 führt zum Klövensteener Naturschutzgebiet"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Klövensteenradweg",
        direction: :forward,
        from: "Binnenalster",
        to: "Klövensteen",
        parent_ref: __MODULE__,
        text: "von der Binnenalster in den Klövensteen",
        videos: [
          {"2022-06-04-v4-v7-random/GX014184", "00:00:27.327", :end},
          {"2022-06-04-v4-v7-random/GX014213", :start, :end},
          {"2022-06-04-v4-v7-random/GX014214", :start, :end},
          {"2022-06-04-v4-v7-random/GX014215", :start, :end},
          {"2022-06-04-v4-v7-random/GX014216", :start, "00:00:59.059"},
          {"2021-08-01-freizeit9-anfang/GX012471", "00:00:23.457", :end},
          {"2021-08-01-freizeit9-anfang/GX012482", :start, :end},
          {"2021-08-01-freizeit9-anfang/GX012483", :start, :end},
          {"2021-08-01-freizeit9-anfang/GX012484", :start, :end},
          {"2021-08-01-freizeit9-anfang/GX012485", :start, :end},
          {"2021-08-08-fr9/GX012616", :start, :end},
          {"2021-08-08-fr9/GX012617", :start, :end},
          {"2021-08-08-fr9/GX012618", :start, "00:00:17.818"},
          {"2021-08-08-fr9/GX012619", :start, :end},
          {"2021-08-08-fr9/GX012620", :start, :end},
          {"2021-08-08-fr9/GX012621", :start, :end},
          {"2021-08-08-fr9/GX012622", :start, "00:00:01.568"},
          {"2021-08-08-fr9/GX012627", "00:01:44.571", "00:01:52.346"},
          {"2021-08-08-fr9/GX012622", "00:00:10.611", "00:04:11.718"},
          {"2021-08-08-fr9/GX012623", "00:00:03.003", :end},
          {"2021-08-08-fr9/GX012624", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Klövensteenradweg",
        direction: :backward,
        from: "Klövensteen",
        to: "Binnenalster",
        parent_ref: __MODULE__,
        text: "vom Klövensteen zur Binnenalster",
        videos: [
          {"2021-08-08-fr9/GX012625", :start, :end},
          {"2021-08-08-fr9/GX012626", :start, :end},
          {"2021-08-08-fr9/GX012627", :start, "00:01:37.698"},
          {"2021-08-08-fr9/GX012628", "00:00:02.402", :end},
          {"2021-08-08-fr9/GX012629", :start, :end},
          {"2021-08-08-fr9/GX012630", :start, :end},
          {"2021-08-08-fr9/GX012631", :start, :end},
          {"2021-08-08-fr9/GX012632", :start, :end},
          {"2021-08-08-fr9/GX012633", :start, "00:00:40.107"},
          {"2021-08-01-freizeit9-anfang/GX012465", "00:00:26.493", :end},
          {"2021-08-01-freizeit9-anfang/GX012466", :start, "00:00:16.884"},
          {"2021-08-01-freizeit9-anfang/GX012467", "00:00:00.033", :end},
          {"2021-08-01-freizeit9-anfang/GX012468", :start, :end},
          {"2021-08-01-freizeit9-anfang/GX012469", :start, "00:00:15.215"},
          {"2022-06-04-v4-v7-random/GX014182", "00:00:32.466", :end},
          {"2022-06-04-v4-v7-random/GX014183", :start, :end},
          {"2022-06-04-v4-v7-random/GX014211", :start, :end},
          {"2022-06-04-v4-v7-random/GX014212", :start, "00:00:01.835"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294582/radtour-city-altonaer-volkspark-kloevensteen/"},
      {"Komoot Routenplaner: zum Klövensteen", "https://www.komoot.de/tour/227480208"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/13069179"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 9 – Klövensteenradweg <.icon>FR9</.icon></h3>
    <span class="updated">Länge rund 24km</span>

    <p>Von der <.m bounds="9.987476,53.54961,10.001777,53.560906" lon="9.993161" lat="53.557804" dir="forward">Binnenalster</.m> aus folgt man grob den S-Bahn Schienen und unterquert sie dann beim <.m bounds="9.929162,53.563593,9.940515,53.5714" lon="9.934005" lat="53.566843" dir="forward">Bahnhof Diebsteich</.m>. An Friedhöfen, Kleingärten und Parks vorbei erreicht man den <.m bounds="9.881421,53.570559,9.913948,53.587249" lon="9.893442" lat="53.583026" dir="forward">Altonaer Volkspark</.m>, den man großzügig durchquert. Mit <.m bounds="9.83294,53.569843,9.883251,53.584979" lon="9.859954" lat="53.577295" dir="forward">Osdorf</.m> und <.m bounds="9.804282,53.572897,9.839631,53.588847" lon="9.824689" lat="53.583626" dir="forward">Iserbrook</.m> hat man zunächst wieder eine stadtnahe Führung, landet aber schließlich in <.m bounds="9.763706,53.580968,9.819149,53.603492" lon="9.807323" lat="53.587222" dir="forward">landwirtschaftlich genutzten Feldern</.m>. Ziel der Tour ist der <.m bounds="9.740574,53.591092,9.772729,53.613255" lon="9.767843" lat="53.606789" dir="forward">Klövensteener Wald</.m>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht ausgeschildert. Im Stadtbereich erschließt sich der Weg oft nicht und in den Grünflächen gibt es viele vergleichbare Wege zur Auswahl. Um der Strecke zu folgen ist daher ein Navi notwendig.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Wege sind meist befestigt, nur wenige Kilometer sind naturnaher Waldboden oder feiner Schotter. Entsprechend ist die Fahrt auch bei leichtem Regen unproblematisch. Bei schönem Wetter kann es auf den Wegen eng werden, schnelles Vorankommen ist dann nicht möglich. Dennoch sind die Wege meist breit genug um zu Überholen. Sollte dies nicht der Fall sein: sei exzellent zu Anderen und steige ab, bevor es eng wird.</p>

    <h4>Meinung</h4>
    <p>Wirklich schön wird die Tour erst nach dem Bahnhof Diebsteich. Davor führt die Tour durch überfüllte Parkwege oder an autolastigen Strecken an ihnen vorbei. Danach kommt man aber gut durchs Grün und kann die Route auch leicht anpassen. Viele der Wald- und Feldwege im Klövensteen sind gut ausgebaut und können zu einer längeren Tour kombiniert werden. Einige Hinweise:</p>

    <ul>
      <li>Um den Bahnhof Diebsteich ist alles eine Schiebestrecke. Statt dem Umweg über die Plöner Straße kann man besser durch die <.m bounds="9.932024,53.568109,9.935787,53.569918">Unterführung</.m> schieben.</li>
      <li>Die Ampelschaltungen am <.m bounds="9.917419,53.570301,9.926433,53.571956" lon="9.918299" lat="53.570861" dir="forward">Holstenkamp</.m> sind frech. Wer keine Probleme hat auf der Fahrbahn zu fahren spart viel Zeit.</li>
    </ul>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
