defmodule Data.Article.Blog.VolksdorferWegBeiRecyclinghof do
  use Article.Default

  def title(), do: "Volksdorfer Weg – Höhe Stadtreinigung Recyclinghof (Bezirksroute W6)"

  def summary(),
    do:
      "Eine Sprunginsel in Straßenmitte soll das queren zu Fuß erleichtern. Durch sie erhält der Radverkehr auch die Möglichkeit in zwei Etappen links abzubiegen."

  def type(), do: :planned

  def tags(), do: ["br-wandsbek-w6"]

  def map_image do
    Data.MapImage.new(__MODULE__, {"BRW Ingenieurpartnerschaft mbB", "https://brw-ip.de/"}, {
      %{lat: 53.645888037, lon: 10.129844313},
      %{lat: 53.646204649, lon: 10.131303090},
      %{lat: 53.645690012, lon: 10.131621838},
      %{lat: 53.645373399, lon: 10.130163061}
    })
  end

  def links(_assigns) do
    [
      {"1. Entwurf", ~d[2024-07],
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1021175"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In einer S-Kurve führt eine <.v bounds="10.128393,53.64443,10.133244,53.647314" lon={10.130206} lat={53.645733} dir="forward" ref="br-wandsbek-w6">Nebenfahrbahn des Volksdorfer Wegs</.v> wieder auf den Hauptstrang. Durch die eingeschränkte Sicht ist Linksabbiegen unangenehm.</p>

    <p>Weil ein Gehweg auf der Südseite fehlt, wird dort auf einem Trampelpfad gelaufen und im Kurvenbereich so gequert.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>In Straßenmitte soll für den Fußverkehr eine Verkehrsinsel als <.ref>Querungshilfe</.ref> gebaut werden. Sie erlaubt das Queren der Straße in zwei Abschnitten, sodass jeweils nur auf eine Fahrtrichtung geachtet werden muss.</p>

    <p>Im Schatten der Verkehrsinsel bleibt eine kleine Aufstellfläche, sodass auch der Radverkehr auf zwei Mal links abbiegen kann. Die Fläche reicht für klassische Fahrräder, ist mit Anhängern oder einem Lastenrad jedoch knapp.</p>

    <h4>Meinung</h4>
    <p>Zum Erreichen des <.m bounds="10.129774,53.644045,10.136694,53.646479">Recyclinghofs</.m> liegt die Querungshilfe ungünstig. Außerdem muss wegen ihr die Fahrbahn stark verbreitert werden, was viele Baumfällungen zur Folge hat. Davon soll keiner ersetzt werden. Die vorgeschlagene Lösung überzeugt daher nicht.</p>

    <p>Eine einseitige Gehwegnase könnte einfacher umzusetzen sein und mit weniger Baumfällungen auskommen. Leider wurde dies gar nicht untersucht, obwohl im <.a name="2024-07-16-volksdorfer-weg-saseler-weg">weiteren Verlauf des Volksdorfer Weg</.a> ebenfalls einseitige Verkehrsinseln das Rasen reduzieren sollen.</p>

    <h4>Links</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
