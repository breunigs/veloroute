defmodule Data.Article.Blog.GarstedterWeg do
  use Article.Default

  def title(),
    do: "Garstedter Weg (Alltagsroute 14)"

  def summary(),
    do:
      "Kreisel am Moorrand. Sonst unkomfortabler und teils gefährlicher Mix verschiedener Radwegarten."

  def start(), do: ~d[2025]
  def stop(), do: ~d[2025]

  def type(), do: :planned
  def tags(), do: ["14"]

  def links(_assigns) do
    [
      {"1. Entwurf, Erläuterungsbericht", "Januar 2023",
       "https://lsbg.hamburg.de/contentblob/16837794/5e073fd067b4a0973a63d8d0511c3e29/data/veloroute-14-abschnitt-nord-garstedter-weg-krohnstieg-abstimmungsunterlage-bericht.pdf"},
      {"1. Entwurf, Lageplan", "Januar 2023",
       "https://lsbg.hamburg.de/contentblob/16837796/96b476098c3fd33165271f8f12045f8d/data/veloroute-14-abschnitt-nord-garstedter-weg-krohnstieg-abstimmungsunterlage-plan.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Stellenweise sind schmale <.ref>Hochbordradwege</.ref> vorhanden, die jedoch unvermittelt aufhören und zu reinen Gehwegen werden. Aus dem <.v bounds="9.971391,53.642904,9.976052,53.64581" lon={9.972351} lat={53.643417} dir="forward" ref="14">Moorrand</.v> ist das Linksabbiegen häufig schwierig. In der Gegenrichtung ist die Weiterfahrt <.v bounds="9.971391,53.642904,9.976052,53.64581" lon={9.975374} lat={53.645562} dir="backward" ref="14">vom Zweirichtungsradweg</.v> unklar und benötigt Ortskenntnisse.</p>

    <h4>Planung</h4>
    <p>Die Einmündung Moorrand wird zu einem Kreisverkehr umgebaut.</p>

    <p>In Richtung Flughafen folgt ein Stück <.ref>Mischverkehr</.ref>, dann <.ref>Kopenhagener Radweg</.ref>, dann <.ref>Radfahrstreifen</.ref> um die Einmündung <.v bounds="9.971391,53.642904,9.976052,53.64581" lon={9.97395} lat={53.644436} dir="forward" ref="14">Vierenkamp</.v>, und schließlich ein Hochbordradweg – bis auf den Abschnitt im Mischverkehr alle rund 2,60m breit.</p>

    <p>In der Gegenrichtung soll weiterhin am <.v bounds="9.971391,53.642904,9.976052,53.64581" lon={9.974647} lat={53.645383} dir="backward" ref="14">Swebenweg</.v> die Straßenseite gewechselt werden, die Kreuzung wird nicht umgebaut. Zunächst fährt man über die Wartefläche des Busses, dann ein Stück <.ref>Schutzstreifen</.ref> (2,0m breit), Kopenhagener Radweg (2,60m), Radfahrstreifen um die Einmündung <.v bounds="9.971391,53.642904,9.976052,53.64581" lon={9.973854} lat={53.64472} dir="backward" ref="14">Vierenkamp</.v> (2,60m), Kopenhagener Radweg (zunächst 2,60m, verengt sich auf 1,60m) und schließlich ein Schutzstreifen der in den Mischverkehr überleitet. Die Gestaltung ist dabei so, dass die Radspur immer schmaler wird, die KFZ-Spur hingegen durchgehend gleich breit bleibt.</p>

    <p>Außerhalb der Veloroute wird die <.v bounds="9.97162,53.642338,9.973019,53.643597" lon={9.972921} lat={53.643491} dir="forward" ref="14">Bushaltestelle in Richtung Flughafen</.v> vor den Kreisverkehr gelegt. An ihr führt ein 2,5m breiter Radfahrstreifen vorbei. Die Gestaltung ist dabei so, dass die Radspur gleich breit bleibt und die KFZ-Spur immer schmaler wird, bis es in den Mischverkehr für den Kreisel übergeht.</p>

    <p>Es kommen einige Radanlehnbügel und Sitzbänke hinzu.</p>

    <h4>Meinung</h4>
    <p>Die Planung ist mangelhaft:</p>
    <ul>
      <li>Der Radverkehr in Richtung Moorreihe wird regelrecht an die Seite gedrängt. Es ist realitätsfern anzunehmen, dass Reißverschlussverfahren oder Überholabstände eingehalten werden, sodass hier eine neue Gefahrenstelle geschaffen wird.</li>
      <li>Die ständigen Auf- und Ableitungen machen den Radweg zu einer Huckelpiste. Außerdem setzt man weiterhin auf Pflastersteine statt besser befahrbarem Asphalt.</li>
      <li>Die fehlende Überleitung vom Zweirichtungsradweg wird schlimmer, da der Hochbord breiter wird als bisher. Es ist daher nicht ersichtlich, dass am Swebenweg gequert werden soll und nicht erst am Vierenkamp. Dort darf man dann auch nicht mehr legal die Ampel queren, was heute noch erlaubt ist.</li>
    </ul>

    <p>Diese eklatanten Probleme kann auch der gelungene Kreisverkehr nicht mehr wettmachen. Es ist zu hoffen, dass dieser erste Entwurf stark überarbeitet wird und eine sichere und komfortable Lösung für den Radverkehr geschaffen wird.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
