defmodule Data.Article.Blog.HerbertWehnerPlatz do
  use Article.Default

  def created_at(), do: ~D[2021-09-30]

  def title(), do: "Umgestaltung Herbert-Wehner-Platz (Veloroute 11)"

  def summary(),
    do: "Teil des Harburger Rings soll bereits bis Ende 2022 veloroutentauglich werden"

  def start(), do: ~d[2021-11-08]
  def stop(), do: ~d[2022-06-07]
  def construction_site_id_hh(), do: [21187]

  def type(), do: :construction

  def tags(), do: ["11"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Man fährt auf schmalen <.ref>Hochbordradwegen</.ref>. Im gesamten Abschnitt herrscht reger Fußverkehr.</p>
    <h4>Planung</h4> <p>Im Baugebiet werden die <.ref>Radfahrstreifen</.ref> meist rund 2,0m breit. Ausnahme ist Fahrtrichtung aus dem Schloßmühlendamn auf den Harburger Ring: Rechtsabbieger erhalten hier nur 1,60m Mindestmaße; Linksabbieger müssen die Busspur mitbenutzen – <.ref>indirektes Linksabbiegen</.ref> ist nicht vorgesehen. Vom Harburger Ring ist dagegen eine extra Haltebucht mit eigener Ampel zum Linksabbiegen vorgesehen.</p>
    <p>An den Baugrenzen wird dem Radfahrenden die Wahl gelassen auf die alten Hochbordradwege aufzufahren oder weiter auf der Fahrbahn zu bleiben.</p>
    <p>Der Abschnitt ist Teil der <.a href="/article/2018-08-30-11-innenstadt-harburg">Planungen zur Harburger Innenstadt</.a>. Da der Herbert-Wehner-Platz umgestaltet werden soll, entschied man sich den rund 160m langen Straßenabschnitt ebenfalls mit umzubauen. Die anderen Abschnitte kommen erst in den folgenden Jahren.</p>
    <h4>Meinung</h4> <p>Die Probleme der Planung sind vor allem im Schloßmühlendamn zu verorten. Von dort links abzubiegen ist unkomfortabel, da man eine KFZ-Spur queren muss um die Busspur zu erreichen, was einige Übung erfordert. Beim Abbiegen vom Harburger Ring in den Schloßmühlendamm gibt es keine Sicherung des Radverkehrs gegen Schneiden durch den KFZ-Verkehr. Das Linksabbiegen vom Harburger Ring aus ist jedoch gut gelöst.</p>
    <p>Mit einer Breite von 2,0m sind die Radwege ordentlich breit. Das man auf Trennelemente („<.ref>Protected-Bike-Lane</.ref>“) verzichtet dürfte daran liegen, dass die Planung bereits einige Jahre alt ist.</p>
    <p>Die Vergabe erfolgt kurzfristig: das Bauzeitfenster ist von Oktober 2021 bis Dezember 2022 angesetzt.</p>
    <h4>Quelle</h4> <p><.a href="https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/eva/supplierportal/fhh/subproject/7120b399-c4b6-437c-a086-92c6e439cb15/details">Ausschreibung zum Umbau</.a></p>
    """
  end
end
