defmodule Data.Article.Blog.TilsiterStrasse do
  use Article.Default

  def created_at(), do: ~D[2021-04-23]

  def title(), do: "Tilsiter Straße (West, bis Voßkulen, Veloroute 6)"

  def start(), do: ~d[2022-10-17]
  def stop(), do: ~d[2023-06-30]
  def construction_site_id_hh(), do: [139_611]

  def type(), do: :construction

  def tags(), do: ["6", "w16.2", "w16"]

  def links(_assigns) do
    [
      {"Baustellenkoordination", "Stand 2022",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1016643"},
      {"Präsentation und Vorentwurf", "2021",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1014134"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Bisher verlief die Veloroute hier getrennt – stadtauswärts über die <.v bounds="10.074178,53.588655,10.102268,53.595079" lon={10.0827345} lat={53.5902896} dir="forward" ref={@ref}>Tilsiter Straße</.v>, stadteinwärts jedoch über die <.v bounds="10.071274,53.590953,10.099364,53.597376" lon={10.0830376} lat={53.5935215} dir="backward" ref={@ref}>Pillauer Straße</.v>.</p> <p>Keine der Fahrtrichtungen bietet Radfahrenden eigene Wege an, diese müssen sich mit KFZ im <.ref>Mischverkehr</.ref> die Fahrbahn teilen. Die an die <.v bounds="10.073932,53.588681,10.088139,53.593646" lon={10.0782479} lat={53.5892811} dir="forward" ref={@ref}>Lesserstraße</.v> angrenzenden Abschnitte sind etwas schmaler und daher Einbahnstraßen, jeweils in Fahrtrichtung der Veloroute. Die Höchstgeschwindigkeit beträgt überall 50 km/h.</p>
    <h4>Planung</h4> <p>Es ist geplant, die Veloroute länger über die <.v bounds="10.074178,53.588655,10.102268,53.595079" lon={10.0827345} lat={53.5902896} dir="forward" ref={@ref}>Tilsiter Straße</.v> verlaufen zu lassen. Grund dafür ist das die <.v bounds="10.071685,53.590386,10.084996,53.593429" lon={10.0799637} lat={53.5928299} dir="backward" ref={@ref}>Pillauer Straße</.v> zu eng sei um eine angemessende Radroute zu schaffen.</p>
    <p>Im Vorentwurf sind beidseitig Radfahrstreifen vorgesehen. Von der <.v bounds="10.069829,53.588808,10.084161,53.592085" lon={10.0782479} lat={53.5892811} dir="forward" ref={@ref}>Lesserstraße</.v> bis zur <.v bounds="10.078914,53.58964,10.086616,53.591401" lon={10.0827345} lat={53.5902896} dir="forward" ref={@ref}>Kreuzung mit der Stephanstraße</.v> sollen diese je rund 2,0m breit werden. Wie bisher bleibt dieser Teil für KFZ eine Einbahnstraße.</p> <p>Im nächsten Abschnitt bis zum <.v bounds="10.081257,53.589291,10.088943,53.592795" lon={10.0875778} lat={53.5913349} dir="forward" ref={@ref}>Voßkulen</.v> sind sie mit 1,5m Breite geplant. Vor der Einmündung des Voßkulen eine neue Ampel vorgesehen, um Leuten zu Fuß die Querung zu erleichtern. Die KFZ dürfen dieses Stück weiterhin in beide Richtungen befahren. Allerdings soll eine Verkehrsinsel auf Höhe der Ampel den KFZ-Durchgangsverkehr heraushalten. Hier sind viele neue Radanlehnbügel vorgesehen.</p> <p>Alle KFZ-Parkplätze entfallen ersatzlos. Auch für Straßenbäume ist im westlichen Teil kein Platz.</p>
    <h4>Meinung</h4> <p>Die vielen Änderungen erschweren Außenstehenden den Durchblick. Den Vorentwurf sollte man entsprechend rückhaltend bewerten. Da sich die Stadt und eine anliegende Genossenschaft noch über Grundstücksgrenzen streiten, ist der Sachverhalt nochmal komplizierter geworden. Man einigte sich auf einen Kompromiss, um den Umbau von der rechtlichen Klärung zu entkoppeln.</p> <p>Der Kompromiss sieht vor auf KFZ-Parkplätze zu verzichten und im Gegenzug die Vorgärten nicht anzufassen. Da der Radverkehrsanteil nicht hoch genug ist um eine Fahrradstraße einrichten zu dürfen, musste man auf Radfahrstreifen ausweichen. Damit diese eine brauchbare Breite erhalten, werden die Gehwege teils schmaler. Das Ergebnis ist für den Radverkehr eine Verbesserung, bleibt auf lange Sicht jedoch fraglich. <.v bounds="9.943338,53.555008,9.949739,53.556473" lon={9.9473166} lat={53.5557103} dir="forward" ref={@ref}>Diagonalsperren</.v> oder gegenläufige Einbahnstraßen würden den KFZ-Durchgangsverkehr ebenfalls heraushalten ohne vom Fußweg abzwacken zu müssen.</p> <p>Kurios wirkt der Abschnitt zwischen <.v bounds="10.078914,53.58964,10.086616,53.591401" lon={10.0827345} lat={53.5902896} dir="forward" ref={@ref}>Stephanstraße</.v> und <.v bounds="10.081257,53.589291,10.088943,53.592795" lon={10.0875778} lat={53.5913349} dir="forward" ref={@ref}>Voßkulen</.v>: die Radfahrstreifen werden für eine Veloroute viel zu schmal, damit genug Platz bleibt um KFZ die Fahrt in beide Richtungen zu ermöglichen. Die geplante Verkehrsinsel sperrt den Durchgangsverkehr jedoch aus, sodass die Fahrt Richtung Westen nur für Anlieger erlaubt ist. Das ausgerechnet diese so ein hohen Bedarf haben erscheint mir fraglich. Würde man darauf verzichten, könnte man stattdessen gute <.ref>Protected-Bike-Lane</.ref>s einrichten.</p> <p>Eine detaillierte Planung war für April 2021 vorgesehen, wurde aber leider noch nicht veröffentlicht.</p>
    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
