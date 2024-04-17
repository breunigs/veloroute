defmodule Data.Article.Static.Freizeitroute9 do
  use Article.Static

  def id(), do: "FR9"
  def route_group(), do: :freizeit
  def title(), do: "Klövensteenradweg (FR9)"

  def color(), do: "#006106"
  def color_faded(), do: "#77ba7b"

  def summary(),
    do: "Freizeitroute 9 führt zum Klövensteener Naturschutzgebiet"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "Klövensteenradweg",
        direction: :forward,
        from: "Binnenalster",
        to: "Klövensteen",
        parent_ref: __MODULE__,
        text: "von der Binnenalster in den Klövensteen",
        historic: %{
          "9625541ead77a037b9140ce62c8ee21a" => ~d[2024-04],
          "5141851d916405c80b47caff151cb4f9" => ~d[2022-06]
        },
        videos: [
          {"2024-03-26-fr5/GX016966", "00:00:32.766", :end},
          {"2024-03-26-fr5/GX016967", :start, :end},
          {"2024-03-26-fr5/GX016968", :start, :end},
          {"2024-03-26-fr5/GX016969", :start, :end},
          {"2024-03-26-fr5/GX016970", :start, "00:00:41.508"},
          {"2024-03-26-fr5/GX016971", :start, :end},
          {"2024-03-26-fr5/GX016972", :start, :end},
          {"2024-03-26-fr5/GX016973", "00:00:02.302", "00:00:33.500"},
          {"2024-03-26-fr5/GX016973", "00:01:04.031", "00:01:17.244"},
          {"2024-04-08-fr9/GX017120", "00:00:16.950", "00:00:35.102"},
          {"2024-04-08-fr9/GX017121", "00:00:06.874", :end},
          {"2024-04-08-fr9/GX017122", :start, :end},
          {"2024-04-08-fr9/GX017123", :start, :end},
          {"2024-04-08-fr9/GX017124", :start, "00:00:23.056"},
          {"2024-04-08-fr9/GX017126", "00:00:00.133", :end},
          {"2024-04-08-fr9/GX017127", :start, :end},
          {"2024-04-08-fr9/GX017128", :start, :end},
          {"2024-04-08-fr9/GX017129", :start, :end},
          {"2024-04-08-fr9/GX017130", :start, "00:00:01.235"},
          {"2024-04-08-fr9/GX017133", "00:00:00.767", "00:06:16.243"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "Klövensteenradweg",
        direction: :backward,
        from: "Klövensteen",
        to: "Binnenalster",
        parent_ref: __MODULE__,
        historic: %{
          "1fde148676643b8cb4a8adde007df9e1" => ~d[2024-04],
          "8d37ba4ceb1c8d968ddfb053dedc0309" => ~d[2022-06]
        },
        text: "vom Klövensteen zur Binnenalster",
        videos: [
          {"2024-04-08-fr9/GX017133", "00:06:17.611", :end},
          {"2024-04-08-fr9/GX017134", :start, "00:00:01.401"},
          {"2024-04-08-fr9/GX017141", "00:00:00.968", :end},
          {"2024-04-08-fr9/GX017142", :start, :end},
          {"2024-04-08-fr9/GX017143", :start, :end},
          {"2024-04-08-fr9/GX017144", :start, :end},
          {"2024-04-08-fr9/GX017145", :start, :end},
          {"2024-04-08-fr9/GX017146", :start, :end},
          {"2024-04-08-fr9/GX017147", :start, :end},
          {"2024-04-08-fr9/GX017148", :start, :end},
          {"2024-04-08-fr9/GX017149", :start, :end},
          {"2024-04-08-fr9/GX017150", :start, :end},
          {"2024-04-08-fr9/GX017151", :start, "00:00:03.737"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294582/radtour-city-altonaer-volkspark-kloevensteen/"},
      {"Komoot Routenplaner: zum Klövensteen", "https://www.komoot.com/de-de/tour/227480208"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/13069179"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 9 – Klövensteenradweg <.icon>FR9</.icon></h3>
    <span class="updated">Länge rund 24km</span>

    <p>Von der <.v bounds="9.987476,53.54961,10.001777,53.560906" lon={9.993161} lat={53.557804} dir="forward" ref={@ref}>Binnenalster</.v> aus folgt man grob den S-Bahn Schienen und unterquert sie dann beim <.v bounds="9.929162,53.563593,9.940515,53.5714" lon={9.934005} lat={53.566843} dir="forward" ref={@ref}>Bahnhof Diebsteich</.v>. An Friedhöfen, Kleingärten und Parks vorbei erreicht man den <.v bounds="9.881421,53.570559,9.913948,53.587249" lon={9.893442} lat={53.583026} dir="forward" ref={@ref}>Altonaer Volkspark</.v>, den man großzügig durchquert. Mit <.v bounds="9.83294,53.569843,9.883251,53.584979" lon={9.859954} lat={53.577295} dir="forward" ref={@ref}>Osdorf</.v> und <.v bounds="9.804282,53.572897,9.839631,53.588847" lon={9.824689} lat={53.583626} dir="forward" ref={@ref}>Iserbrook</.v> hat man zunächst wieder eine stadtnahe Führung, landet aber schließlich in <.v bounds="9.763706,53.580968,9.819149,53.603492" lon={9.807323} lat={53.587222} dir="forward" ref={@ref}>landwirtschaftlich genutzten Feldern</.v>. Ziel der Tour ist der <.v bounds="9.740574,53.591092,9.772729,53.613255" lon={9.767843} lat={53.606789} dir="forward" ref={@ref}>Klövensteener Wald</.v>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht ausgeschildert. Im Stadtbereich erschließt sich der Weg oft nicht und in den Grünflächen gibt es viele vergleichbare Wege zur Auswahl. Um der Strecke zu folgen ist daher ein Navi notwendig.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Wege sind meist befestigt, nur wenige Kilometer sind naturnaher Waldboden oder feiner Schotter. Entsprechend ist die Fahrt auch bei leichtem Regen unproblematisch. Bei schönem Wetter kann es auf den Wegen eng werden, schnelles Vorankommen ist dann nicht möglich. Dennoch sind die Wege meist breit genug um zu Überholen. Sollte dies nicht der Fall sein: sei exzellent zu Anderen und steige ab, bevor es eng wird.</p>

    <h4>Meinung</h4>
    <p>Wirklich schön wird die Tour erst nach dem Bahnhof Diebsteich. Davor führt die Tour durch überfüllte Parkwege oder an autolastigen Strecken an ihnen vorbei. Danach kommt man aber gut durchs Grün und kann die Route auch leicht anpassen. Viele der Wald- und Feldwege im Klövensteen sind gut ausgebaut und können zu einer längeren Tour kombiniert werden. Einige Hinweise:</p>

    <ul>
      <li>Um den Bahnhof Diebsteich ist alles eine Schiebestrecke.</li>
      <li>Die Ampelschaltungen am <.v bounds="9.917419,53.570301,9.926433,53.571956" lon={9.918299} lat={53.570861} dir="forward" ref={@ref}>Holstenkamp</.v> sind frech. Wer keine Probleme hat auf der Fahrbahn zu fahren spart viel Zeit.</li>
    </ul>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
