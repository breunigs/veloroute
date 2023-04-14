defmodule Data.Article.Blog.Hoeltigbaum do
  use Article.Default

  def title(),
    do: "Höltigbaum (Alter Zollweg bis Eichberg, Bezirksroute W3)"

  def summary(),
    do:
      "Radwege im Straßenzug Berner Straße (ab Alter Zollweg), Oldenfelder Stieg und Höltigbaum (bis Eichberg) sollen saniert werden."

  def type(), do: :planned
  def tags(), do: ["br-wandsbek-w3"]

  def links(_assigns) do
    [
      {"1. Entwurf, Erläuterungsbericht", "Dezember 2016",
       "https://lsbg.hamburg.de/resource/blob/634166/0532c3505429d692b0ce6d5d35a234db/hoeltigbaum-bremer-strasse-eichberg-bis-alter-zollweg-abstimmungsunterlage-bericht-data.pdf"},
      {"1. Entwurf, Lagepläne", "Dezember 2016",
       "https://lsbg.hamburg.de/resource/blob/634168/7fd3d1952772c4f5204a6b55c9bfd277/hoeltigbaum-bremer-strasse-eichberg-bis-alter-zollweg-abstimmungsunterlage-plaene-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radverkehr fährt auf rund 1,0m breiten, maroden <.ref>Hochbordradwegen</.ref>.</p>

    <h4>Planung</h4>
    <p>In den Abschnitten <.v bounds="10.152943,53.613543,10.157862,53.615275" lon={10.153914} lat={53.614682} dir="forward" ref="br-wandsbek-w3">Berner Straße</.v> und <.v bounds="10.155021,53.612993,10.160368,53.615061" lon={10.156777} lat={53.614214} dir="forward" ref="br-wandsbek-w3">Oldenfelder Stieg</.v> sollen <.ref>Radfahrstreifen</.ref> eingerichtet werden. Diese sind meist 1,60m breit, stellenweise etwas breiter. Im Abschnitt <.v bounds="10.159283,53.612423,10.177588,53.617076" lon={10.164629} lat={53.614215} dir="forward" ref="br-wandsbek-w3">Höltigbaum</.v> sind 2,0m breite Hochbordradwege geplant. Damit das Naturschutzgebiet besser erreicht werden kann, wird der nördliche Radweg von <.v bounds="10.159041,53.613356,10.16301,53.615031" lon={10.159998} lat={53.613791} dir="backward" ref="br-wandsbek-w3">Krögerstraße</.v> bis <.v bounds="10.160159,53.613317,10.172459,53.619823" lon={10.162374} lat={53.614081} dir="backward" ref="br-wandsbek-w3">zum Naturschutzgebiet</.v> ein Zweirichtungsradweg und etwas breiter.</p>

    <p>In der Kreuzung mit der <.v bounds="10.153529,53.613321,10.158894,53.616035" lon={10.156315} lat={53.614592} dir="backward" ref="br-wandsbek-w3">Meiendorfer Straße</.v> / <.v bounds="10.153529,53.613321,10.158894,53.616035" lon={10.155827} lat={53.614265} dir="forward" ref="br-wandsbek-w3">Bargteheider Straße</.v> sind in Ost/West Richtung jeweils <.ref>Radfahrstreifen in Mittellage</.ref> vorgesehen. In Nord/Süd Richtung werden die vorhandenen Hochbordradwege kurz vor der Kreuzung zu Radfahrstreifen, verbleiben jedoch rechts der KFZ-Spuren. Linksabbiegen ist immer <.ref>indirekt</.ref> möglich. <.ref>Direktes</.ref> Abbiegen geht nur in Ost-West Richtung.</p>

    <p>Die Ampel an der <.v bounds="10.15825,53.612877,10.161712,53.614919" lon={10.159498} lat={53.613679} dir="forward" ref="br-wandsbek-w3">Krögerstraße</.v> bleibt einseitig und in ihrer Lage unverändert. Die Zweirichtungsfurt wird für den Radverkehr aber ersichtlicher gestaltet.</p>

    <p>An der Kreuzung <.v bounds="10.173256,53.613941,10.176635,53.615545" lon={10.173973} lat={53.614706} dir="forward" ref="br-wandsbek-w3">Eichberg</.v> wird der Anschluss des eigenständigen Rad- und Fußwegs leicht angepasst. In <.v bounds="10.173256,53.613941,10.176635,53.615545" lon={10.174535} lat={53.614355} dir="backward" ref="br-wandsbek-w3">Fahrtrichtung Norden</.v> müssen weiterhin zwei Furten gequert werden, eine direkte („diagonale“) Weiterfahrt ist nicht möglich.</p>

    <h4>Meinung</h4>
    <p>Der beschriebene erste Entwurf ist von 2016 – und man merkt ihm sein Alter sofort an. Es ist unwahrscheinlich, dass dieser so umgesetzt wird. Die <.a name="2022-12-24-berner-strasse">Planung Berner Straße</.a> wurde ebenfalls überarbeitet um die Radfahrstreifen in Mittellage loszuwerden. Diese wären auch der größte Kritikpunkt; gefolgt von der mit 1,60m arg geringen Breite der Radfahrstreifen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
