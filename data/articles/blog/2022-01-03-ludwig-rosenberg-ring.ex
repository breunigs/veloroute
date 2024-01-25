defmodule Data.Article.Blog.LudwigRosenbergRing do
  use Article.Default

  def updated_at(), do: ~D[2024-01-25]

  def title(), do: "Ludwig-Rosenberg-Ring (Radroute 8)"

  def start(), do: ~d[2023-09]
  def stop(), do: ~d[2024-03]

  def type(), do: :planned

  def summary(),
    do:
      "Es sollen für einen kurzen Abschnitt 2,25m breite Kopenhagener Radwege gebaut werden. Die Engstelle an der Bushaltestelle Sander Markt bleibt."

  def tags(), do: ["8"]

  def links(_assigns) do
    [
      {"Lagepläne und Erläuterungen", "Februar 2023",
       "https://fragdenstaat.de/anfrage/ludwig-rosenberg-ring/#nachricht-869544"},
      {"Baustellenkoordination", "Januar 2023",
       "https://sitzungsdienst-bergedorf.hamburg.de/bi/to020.asp?TOLFDNR=1025381"},
      {"Haushaltsplan 2022 Bezirk Bergedorf (Entwurf)",
       "https://sitzungsdienst-bergedorf.hamburg.de/bi/vo020.asp?VOLFDNR=1006315"},
      {"Zeitungsartikel zur Umbauplanung", "März 2022",
       "https://www.abendblatt.de/hamburg/bergedorf/lohbruegge/article234886721/Ludwig-Rosenberg-Ring-Lohbruegge-Bergedorf-mehr-Platz-fuer-Radfahrer.html"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Im betrachteten Abschnitt des Ludwig-Rosenberg-Rings wird der Radverkehr auf <.ref>Hochbordradwegen</.ref> geführt. Es besteht aber auch die Möglichkeit auf der <.ref>Fahrbahn</.ref> zu fahren.</p>

    <h4>Planung</h4>
    <p>Ab dem Zebrastreifen an der <.v bounds="10.206869,53.491928,10.210407,53.494994" lon={10.208428} lat={53.494394} dir="forward" ref="8">Walter-Freitag-Straße</.v> sollen 2,25m breite <.ref>Kopenhagener Radwege</.ref> eingerichtet werden. Zur Fahrbahn mit 8cm Höhenunterschied, zum Gehweg mit 3cm. Die Radwege sollen asphaltiert werden. An der Einmündung <.v bounds="10.206869,53.491928,10.210407,53.494994" lon={10.208811} lat={53.4932} dir="forward" ref="8">Sander Markt</.v> werden sie auf die vorhandenen Radwege übergeleitet.</p>

    <p><.v bounds="10.206869,53.491928,10.210407,53.494994" lon={10.209081} lat={53.493983} dir="backward" ref="8">Höhe Hausnummer 5</.v> verbleibt der Radweg Richtung <.v bounds="10.206869,53.491928,10.210407,53.494994" lon={10.208941} lat={53.4942} dir="backward" ref="8">Lohbrügger Markt</.v> hinter den KFZ-Parkplätzen, wo 50cm Sicherheitsabstand gegen <.ref>Dooring</.ref> vorgesehen sind. Die Gehwege werden ebenfalls breiter.</p>

    <h4>Meinung</h4>
    <p>Schön, dass wenigstens auf einem Teilstück ordentliche Radwege geschaffen werden. Frech, dass man die untermaßigen Radwege <.v bounds="10.206869,53.491928,10.210407,53.494994" lon={10.208466} lat={53.492699} dir="forward" ref="8">im weiteren Verlauf der Straße</.v> ignoriert.</p>

    <p>Besonders dreist: die Behörden finden diese Engstelle sogar gut, da der Radverkehr verlangsamt würde und sich daher die Sicherheit an der <.v bounds="10.206869,53.491928,10.210407,53.494994" lon={10.208381} lat={53.492361} dir="backward" ref="8">Bushaltestelle Sander Markt</.v> verbessere. Auf die Idee den Bus auf der 3,25m breiten Fahrbahn halten zu lassen und Fahrgästen, Radfahrern und Fußgängern mehr als die Reste zu geben kommt man nicht.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
