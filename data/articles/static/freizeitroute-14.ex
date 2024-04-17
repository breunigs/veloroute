defmodule Data.Article.Static.Freizeitroute14 do
  use Article.Static

  def id(), do: "FR14"
  def route_group(), do: :freizeit
  def title(), do: "Alter Elbtunnel (FR14)"

  def color(), do: "#006106"
  def color_faded(), do: "#77ba7b"

  def summary(),
    do: "Video und Beschreibung zur Freizeit Radroute „Alter Elbtunnel“ (FR14)"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "Alter Elbtunnel",
        direction: :forward,
        from: "Landungsbrücken",
        to: "Harburger Berge",
        parent_ref: __MODULE__,
        text: "von den Landungsbrücken in die Harburger Berge",
        historic: %{
          "88c91689b9d94320997ba36a25a4de1e" => ~d[2024-03],
          "6c0d87a58b3ee203f19f16261ce7a6a6" => ~d[2022-03]
        },
        videos: [
          {"2024-03-17-fr14/GX016893", "00:00:51.018", :end},
          {"2024-03-17-fr14/GX016894", :start, "00:00:32.199"},
          {"2024-03-17-fr14/GX016894", "00:00:42.910", :end},
          {"2024-03-17-fr14/GX016895", :start, :end},
          {"2024-03-17-fr14/GX016896", :start, "00:03:55.736"},
          {"2024-03-17-fr14/GX016897", "00:00:00.167", :end},
          {"2024-03-17-fr14/GX016898", :start, :end},
          {"2024-03-17-fr14/GX016899", :start, "00:01:13.507"},
          {"2024-03-17-fr14/GX016899", "00:01:34.761", "00:03:45.559"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "Alter Elbtunnel",
        direction: :backward,
        from: "Harburger Berge",
        to: "Landungsbrücken",
        parent_ref: __MODULE__,
        text: "aus den Harburger Bergen zu den Landungsbrücken",
        historic: %{
          "c31f1c2f57c40d79d5bc3f3f48cf0396" => ~d[2024-03],
          "a62f87a1ceba8f93681c0383240779da" => ~d[2022-03]
        },
        videos: [
          {"2024-03-17-fr14/GX016899", "00:03:46.560", :end},
          {"2024-03-17-fr14/GX016900", :start, :end},
          {"2024-03-17-fr14/GX016901", :start, :end},
          {"2024-03-17-fr14/GX016902", :start, :end},
          {"2024-03-17-fr14/GX016903", :start, :end},
          {"2024-03-17-fr14/GX016904", :start, "00:01:05.599"},
          {"2024-03-17-fr14/GX016905", :start, :end},
          {"2024-03-17-fr14/GX016906", :start, :end},
          {"2024-03-17-fr14/GX016907", "00:00:03.737", "00:00:07.274"},
          {"2024-03-17-fr14/GX016907", "00:00:17.851", "00:00:50.550"},
          {"2024-03-17-fr14/GX016907", "00:00:55.923", :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294590/radtour-alter-elbtunnel-hafen-harburger-berge/"},
      {"Komoot Routenplaner", "https://www.komoot.com/de-de/tour/227483916"},
      {"Ausflugsziel: Freilichtmuseum Kiekeberg", "https://www.kiekeberg-museum.de/"},
      {"Ausflugsziel: Wildpark Schwarze Berge", "https://www.wildpark-schwarze-berge.de/"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/9064655"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 14 – Alter Elbtunnel <.icon>FR14</.icon></h3>
    <span class="updated">Länge rund 17km</span>

    <p>Von den <.v bounds="9.962511,53.544164,9.974792,53.547104" lon={9.969296} lat={53.545929} dir="forward" ref={@ref}>Landungsbrücken</.v> geht es zunächst durch den namensgebenden <.v bounds="9.965052,53.541958,9.967904,53.546768" lon={9.966613} lat={53.54485} dir="forward" ref={@ref}>Alten Elbtunnel</.v>. Nach der Industrieromantik im <.v bounds="9.938681,53.482323,9.982442,53.54399" lon={9.967438} lat={53.501741} dir="forward" ref={@ref}>Hafen</.v> mit seinen beweglichen Brücken wird es <.v bounds="9.922685,53.474615,9.953051,53.498767" lon={9.933631} lat={53.485836} dir="forward" ref={@ref}>um Moorburg</.v> etwas grüner und dörflicher. Sobald mein sein Rad durch die <.v bounds="9.928686,53.469877,9.936878,53.473502" lon={9.932741} lat={53.471489} dir="forward" ref={@ref}>Bahnunterführung</.v> gehievt hat, ist man schon in den <.v bounds="9.891561,53.450266,9.937537,53.471251" lon={9.933181} lat={53.468323} dir="forward" ref={@ref}>Harburger Bergen</.v> und kann die Steigungen im Wald genießen.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht ausgeschildert und es gibt einige Abzweigungen die man leicht verpasst. Ein Navi ist daher hilfreich, man kann ich sich die komplizierteren Stellen aber auch einprägen und frei fahren.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Tour lässt sich zweiteilen: Im Hafen gibt es befestigte Wege as Asphalt oder Pflaster, auf denen man auch bei Regen ohne Probleme vorankommt. Ausnahme ist das Stück am <.v bounds="9.968074,53.516569,9.97458,53.525438" lon={9.971491} lat={53.521606} dir="forward" ref={@ref}>Roßdamm</.v>, aber hier kann man alternativ den straßennahen Radweg nutzen.</p>
    <p>Nach der <.v bounds="9.928686,53.469877,9.936878,53.473502" lon={9.932741} lat={53.471489} dir="forward" ref={@ref}>Bahnunterführung</.v> gibt es nur noch naturnahe Waldwege von unterschiedlicher Qualität. Neben gut benutzbarem feinen Schotter (Grand) gibt es auch matschige oder sandige Stellen, die eher Mountain-Bike als Stadtrad freundlich sind.</p>
    <p>Mit Stau ist nicht zu rechnen und die problematischen Stellen lassen sich lassen sich meist leicht umfahren:</p>
    <ul>
      <li><.v bounds="9.925591,53.478743,9.974645,53.525962" lon={9.971491} lat={53.521606} dir="forward" ref={@ref}>Roßmoordamm</.v>: Richtung Süden einfach der Straße bzw. dem Radweg weiter folgen. Stadteinwärts frühzeitig auf den Ellerholzweg abbiegen.</li>
      <li><.v bounds="9.924622,53.476387,9.935152,53.481196" lon={9.925591} lat={53.478743} dir="forward" ref={@ref}>Bahnübergang Hafenbahn</.v>: stattdessen Moorburger Hinterdeich, Moorburger Hauptdeich, Fürstenmoordamm.</li>
      <li><.v bounds="9.932011,53.470696,9.939396,53.473589" lon={9.932741} lat={53.471489} dir="forward" ref={@ref}>Bahnunterführung</.v>: stattdessen Borstelbeker Damm, Moorburger Bogen, Stader Straße</li>
    </ul>

    <h4>Meinung</h4>
    <p>Die Route ist in sich stimmig und meist gut befahrbar. Man muss sich im Klaren sein, das sie ihren Charakter zwischendurch völlig ändert und ggf. nur die bevorzugten Abschnitte befahren. Wer dem <.v bounds="9.903895,53.443683,9.91895,53.446607" lon={9.915194} lat={53.445611} dir="forward" ref={@ref}>Harburger Stadtweg</.v> noch etwas folgt erreicht jedoch gleich zwei sehenswerte Ziele: das <.m bounds="9.898042,53.435587,9.907859,53.441744">Freilichtmuseum Kiekberg</.m> und den <.m bounds="9.875153,53.439804,9.891907,53.44849">Wildpark Schwarze Berge</.m>.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
