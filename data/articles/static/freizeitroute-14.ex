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

  def links(%{lang: "en"} = _assigns) do
    [
      {"official site of the city",
       "https://www.hamburg.de/radtour/6294590/radtour-alter-elbtunnel-hafen-harburger-berge/"},
      {"Komoot route planner", "https://www.komoot.com/tour/227483916"},
      {"Tourist attraction: open air museum Kiekeberg", "https://www.kiekeberg-museum.de/"},
      {"Tourist attraction: wildlife park Schwarze Berge",
       "https://www.wildpark-schwarze-berge.de/"},
      {"Route in OpenStreetMap", "https://www.openstreetmap.org/relation/9064655"}
    ]
  end

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

  def text(%{lang: "en"} = assigns) do
    ~H"""
    <h3 lang="en">Leisure Route 14 – Old <span lang="de">Elbe</span> tunnel <.icon>FR14</.icon></h3>
    <span class="updated" lang="en">length approx. 17km</span>

    <p lang="en">Starting at the <.v bounds="9.962511,53.544164,9.974792,53.547104" lon={9.969296} lat={53.545929} dir="forward" ref={@ref} lang="de" translate="no">Landungsbrücken</.v> you'll pass through the <.v bounds="9.965052,53.541958,9.967904,53.546768" lon={9.966613} lat={53.54485} dir="forward" ref={@ref}>old <span lang="de">Elbe</span> tunnel</.v>, whose offical name is <span lang="de" translate="no">St. Pauli Elbtunnel</span>. After the industrial flair in the <.v bounds="9.938681,53.482323,9.982442,53.54399" lon={9.967438} lat={53.501741} dir="forward" ref={@ref}>harbour</.v> with its movable bridges, there's more greenery starting at village <.v bounds="9.922685,53.474615,9.953051,53.498767" lon={9.933631} lat={53.485836} dir="forward" ref={@ref}>Moorburg</.v>. Once you've heaved your bike through the <.v bounds="9.928686,53.469877,9.936878,53.473502" lon={9.932741} lat={53.471489} dir="forward" ref={@ref}>rail underpass</.v>, you're in the <.v bounds="9.891561,53.450266,9.937537,53.471251" lon={9.933181} lat={53.468323} dir="forward" ref={@ref}>Harburger Berge</.v> and can enjoy the small hills and inclines.</p>

    <h4 lang="en">Following the route</h4>
    <p lang="en">There is no signage for this route. There are a few branches which are easily missed, so a satnav is useful, but not required. You can also commit the complicated sections to memory and cycle without a map or technical aid.</p>

    <h4 lang="en">Comfort / Quality</h4>
    <p lang="en">The tour can be split into two parts: In the harbour the paths are made of asphalt or paving, which can be used even in rainy weather. Sole exception is the section at <.v bounds="9.968074,53.516569,9.97458,53.525438" lon={9.971491} lat={53.521606} dir="forward" ref={@ref} lang="de" translate="no">Roßdamm</.v>, for which there's a close alternative alongside the bigger street.</p>

    <p lang="en">After the <.v bounds="9.928686,53.469877,9.936878,53.473502" lon={9.932741} lat={53.471489} dir="forward" ref={@ref}>rail underpass</.v> the paths are forest tracks of different qualities. There's good fine gravel, but also muddy or sandy sections that are more suited to a mountain bike than a city-bike.</p>

    <p lang="en">You're unlikely to get stuck in (car) traffic jams.</p>

    <h5 lang="en">Suggested alternatives for problematic sections</h5>
    <ul lang="en">
      <li><.v bounds="9.964756,53.514518,9.977424,53.52642" lon={9.971491} lat={53.521606} dir="forward" ref={@ref} lang="de" translate="no">Roßdamm</.v>: to the south, simply follow the road and don't cross the train tracks. Towards the city, switch to <.v bounds="9.96561,53.513309,9.975189,53.520974" lon={9.969019} lat={53.51485} dir="backward" ref="FR14" lang="de" translate="no">Ellerholzweg</.v> early on.</li>
      <li><.v bounds="9.924622,53.476387,9.935152,53.481196" lon={9.925591} lat={53.478743} dir="forward" ref={@ref}>dock railway crossing</.v>: take detour via <.m bounds="9.91561,53.477254,9.928643,53.482938" lang="de" translate="no">Moorburger Hinterdeich</.m>, <.m bounds="9.91561,53.477254,9.928643,53.482938" lang="de" translate="no">Fürstenmoordamm</.m></li>
      <li><.v bounds="9.932011,53.470696,9.939396,53.473589" lon={9.932741} lat={53.471489} dir="forward" ref={@ref}>rail underpass</.v>: take <.m bounds="9.929661,53.470212,9.94081,53.473728" lang="de" translate="no">Bostelbeker Damm</.m>, <.m bounds="9.929661,53.470212,9.94081,53.473728" lang="de" translate="no">Moorburger Bogen</.m>, <.m bounds="9.929661,53.470212,9.94081,53.473728" lang="de" translate="no">Stader Straße</.m> instead</li>
    </ul>

    <h4 lang="en">Opinion</h4>
    <p lang="en">It's a sensible route with most paths being cycling friendly. Take note of the route changing its character completely around the middle, though, and maybe only use the parts you like.</p>

    <p>If you continue along the <.v bounds="9.903895,53.443683,9.91895,53.446607" lon={9.915194} lat={53.445611} dir="forward" ref={@ref} lang="de" translate="no">Harburger Stadtweg</.v> you can reach two tourist attractions: the <.m bounds="9.898042,53.435587,9.907859,53.441744">open air museum <span lang="de" translate="no">Kiekeberg</span></.m> and the <.m bounds="9.875153,53.439804,9.891907,53.44849">wildlife park <span lang="de" translate="no">Schwarze Berge</span></.m>.</p>

    <h3 lang="en">External links</h3>
    <.structured_links ref={@ref} gpx={true} lang="en"/>
    """
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
    <p>Mit (KFZ-)Stau ist nicht zu rechnen.</p>

    <h5>Vorschläge zur Umfahrung problematischer Stellen</h5>
    <ul>
      <li><.v bounds="9.964756,53.514518,9.977424,53.52642" lon={9.971491} lat={53.521606} dir="forward" ref={@ref}>Roßdamm</.v>: Richtung Süden einfach der Straße bzw. dem Radweg weiter folgen. Stadteinwärts frühzeitig auf den <.v bounds="9.96561,53.513309,9.975189,53.520974" lon={9.969019} lat={53.51485} dir="backward" ref="FR14">Ellerholzweg</.v> abbiegen.</li>
      <li><.v bounds="9.924622,53.476387,9.935152,53.481196" lon={9.925591} lat={53.478743} dir="forward" ref={@ref}>Bahnübergang Hafenbahn</.v>: stattdessen <.m bounds="9.91561,53.477254,9.928643,53.482938">Moorburger Hinterdeich</.m> und <.m bounds="9.91561,53.477254,9.928643,53.482938">Fürstenmoordamm</.m>.</li>
      <li><.v bounds="9.932011,53.470696,9.939396,53.473589" lon={9.932741} lat={53.471489} dir="forward" ref={@ref}>Bahnunterführung</.v>: stattdessen <.m bounds="9.929661,53.470212,9.94081,53.473728">Bostelbeker Damm</.m>, <.m bounds="9.929661,53.470212,9.94081,53.473728">Moorburger Bogen</.m>, <.m bounds="9.929661,53.470212,9.94081,53.473728">Stader Straße</.m></li>
    </ul>

    <h4>Meinung</h4>
    <p>Die Route ist in sich stimmig und meist gut befahrbar. Man muss sich im Klaren sein, das sie ihren Charakter zwischendurch völlig ändert und ggf. nur die bevorzugten Abschnitte befahren. Wer dem <.v bounds="9.903895,53.443683,9.91895,53.446607" lon={9.915194} lat={53.445611} dir="forward" ref={@ref}>Harburger Stadtweg</.v> noch etwas folgt erreicht jedoch gleich zwei sehenswerte Ziele: das <.m bounds="9.898042,53.435587,9.907859,53.441744">Freilichtmuseum am Kiekeberg</.m> und den <.m bounds="9.875153,53.439804,9.891907,53.44849">Wildpark Schwarze Berge</.m>.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
