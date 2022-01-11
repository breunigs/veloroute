defmodule Data.Article.Static.Freizeitroute14 do
  use Article.Static

  def id(), do: "FR14"
  def route_group(), do: :freizeit
  def title(), do: "Alter Elbtunnel (FR14)"

  def color(), do: "#006106"

  def summary(),
    do: "Video und Beschreibung zur Freizeit Radroute „Alter Elbtunnel“ (FR14)"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        fade: :none,
        group: "Alter Elbtunnel",
        direction: :forward,
        from: "Landungsbrücken",
        to: "Harburger Berge",
        parent_ref: __MODULE__,
        text: "von den Landungsbrücken in die Harburger Berge",
        videos: [
          {"2021-07-04-veloroute11/GX012107", :start, :end},
          {"2021-07-04-veloroute11/GX012108", :start, :end},
          {"2021-07-04-veloroute11/GX012109", :start, :end},
          {"2021-08-03-fr14-noerdlich-kattwyk/GX012489", :start, :end},
          {"2021-08-03-fr14-noerdlich-kattwyk/GX012490", :start, :end},
          {"2021-08-03-fr14-noerdlich-kattwyk/GX012491", :start, :end},
          {"2021-03-28-kattwybruecke-from-photo/forward.mkv", "00:00:02.002", "00:00:14.414"},
          {"2021-08-04-fr13-fr14/GX012546", "00:02:00.220", :end},
          {"2021-08-04-fr13-fr14/GX012547", :start, :end},
          {"2021-08-04-fr13-fr14/GX012548", :start, :end},
          {"2021-08-04-fr13-fr14/GX012549", :start, :end},
          {"2021-08-04-fr13-fr14/GX012550", :start, :end}
        ]
      },
      %Video.Track{
        fade: :none,
        group: "Alter Elbtunnel",
        direction: :backward,
        from: "Harburger Berge",
        to: "Landungsbrücken",
        parent_ref: __MODULE__,
        text: "aus den Harburger Bergen zu den Landungsbrücken",
        videos: [
          {"2021-08-04-fr13-fr14/GX012540", "00:00:17.451", "00:01:25.385"},
          {"2021-08-04-fr13-fr14/GX012541", "00:00:36.637", :end},
          {"2021-08-04-fr13-fr14/GX012542", :start, :end},
          {"2021-08-04-fr13-fr14/GX012543", :start, :end},
          {"2021-08-04-fr13-fr14/GX012545", :start, :end},
          {"2021-08-04-fr13-fr14/GX012546", :start, "00:00:09.176"},
          {"2021-08-04-fr13-fr14/GX012546", "00:00:23.824", "00:01:59.219"},
          {"2021-03-28-kattwybruecke-from-photo/backward.mkv", "00:00:01.201", "00:00:11.211"},
          {"2021-08-03-fr14-noerdlich-kattwyk/GX012492", :start, :end},
          {"2021-08-03-fr14-noerdlich-kattwyk/GX012493", :start, :end},
          {"2021-08-03-fr14-noerdlich-kattwyk/GX012494", :start, :end},
          {"2021-08-03-fr14-noerdlich-kattwyk/GX012495", :start, :end},
          {"2021-08-03-fr14-noerdlich-kattwyk/GX012496", :start, :end},
          {"2021-08-03-fr14-noerdlich-kattwyk/GX012497", :start, :end},
          {"2021-08-03-fr14-noerdlich-kattwyk/GX012498", :start, :end},
          {"2021-08-03-fr14-noerdlich-kattwyk/GX012499", :start, :end},
          {"2021-07-04-veloroute11/GX012143", :start, :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294590/radtour-alter-elbtunnel-hafen-harburger-berge/"},
      {"Komoot Routenplaner", "https://www.komoot.de/tour/227483916"},
      {"Ausflugsziel: Freilichtmuseum Kiekeberg", "https://www.kiekeberg-museum.de/"},
      {"Ausflugsziel: Wildpark Schwarze Berge", "https://www.wildpark-schwarze-berge.de/"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/9064655"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 14 – Alter Elbtunnel <.icon>FR14</.icon></h3>
    <span class="updated">Länge rund 17km</span>

    <p>Von den <.m bounds="9.962511,53.544164,9.974792,53.547104" lon="9.969296" lat="53.545929" dir="forward">Landungsbrücken</.m> geht es zunächst durch den namensgebenden <.m bounds="9.965052,53.541958,9.967904,53.546768" lon="9.966613" lat="53.54485" dir="forward">Alten Elbtunnel</.m>. Nach der Industrieromantik im <.m bounds="9.938681,53.482323,9.982442,53.54399" lon="9.967438" lat="53.501741" dir="forward">Hafen</.m> mit seinen beweglichen Brücken wird es <.m bounds="9.922685,53.474615,9.953051,53.498767" lon="9.933631" lat="53.485836" dir="forward">um Moorburg</.m> etwas grüner und dörflicher. Sobald mein sein Rad durch die <.m bounds="9.928686,53.469877,9.936878,53.473502" lon="9.932741" lat="53.471489" dir="forward">Bahnunterführung</.m> gehievt hat, ist man schon in den <.m bounds="9.891561,53.450266,9.937537,53.471251" lon="9.933181" lat="53.468323" dir="forward">Harburger Bergen</.m> und kann die Steigungen im Wald genießen.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht ausgeschildert und es gibt einige Abzweigungen die man leicht verpasst. Ein Navi ist daher hilfreich, man kann ich sich die komplizierteren Stellen aber auch einprägen und frei fahren.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Tour lässt sich zweiteilen: Im Hafen gibt es befestigte Wege as Asphalt oder Pflaster, auf denen man auch bei Regen ohne Probleme vorankommt. Ausnahme ist das Stück am <.m bounds="9.968074,53.516569,9.97458,53.525438" lon="9.971491" lat="53.521606" dir="forward">Roßdamm</.m>, aber hier kann man alternativ den straßennahen Radweg nutzen.</p>
    <p>Nach der <.m bounds="9.928686,53.469877,9.936878,53.473502" lon="9.932741" lat="53.471489" dir="forward">Bahnunterführung</.m> gibt es nur noch naturnahe Waldwege von unterschiedlicher Qualität. Neben gut benutzbarem feinen Schotter (Grand) gibt es auch matschige oder sandige Stellen, die eher Mountain-Bike als Stadtrad freundlich sind.</p>
    <p>Mit Stau ist nicht zu rechnen und die problematischen Stellen lassen sich lassen sich meist leicht umfahren:</p>
    <ul>
      <li><.m bounds="9.925591,53.478743,9.974645,53.525962" lon="9.971491" lat="53.521606" dir="forward">Roßmoordamm</.m>: Richtung Süden einfach der Straße bzw. dem Radweg weiter folgen. Stadteinwärts frühzeitig auf den Ellerholzweg abbiegen.</li>
      <li><.m bounds="9.924622,53.476387,9.935152,53.481196" lon="9.925591" lat="53.478743" dir="forward">Bahnübergang Hafenbahn</.m>: stattdessen Moorburger Hinterdeich, Moorburger Hauptdeich, Fürstenmoordamm.</li>
      <li><.m bounds="9.932011,53.470696,9.939396,53.473589" lon="9.932741" lat="53.471489" dir="forward">Bahnunterführung</.m>: stattdessen Borstelbeker Damm, Moorburger Bogen, Stader Straße</li>
    </ul>

    <h4>Meinung</h4>
    <p>Die Route ist in sich stimmig und meist gut befahrbar. Man muss sich im Klaren sein, das sie ihren Charakter zwischendurch völlig ändert und ggf. nur die bevorzugten Abschnitte befahren. Wer dem <.m bounds="9.903895,53.443683,9.91895,53.446607" lon="9.915194" lat="53.445611" dir="forward">Harburger Stadtweg</.m> noch etwas folgt erreicht jedoch gleich zwei sehenswerte Ziele: das <.m bounds="9.898042,53.435587,9.907859,53.441744">Freilichtmuseum Kiekberg</.m> und den <.m bounds="9.875153,53.439804,9.891907,53.44849">Wildpark Schwarze Berge</.m>.</p>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
