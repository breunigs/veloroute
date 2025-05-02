defmodule Data.Article.Blog.GarstedterWeg do
  use Article.Default

  def title(),
    do: "Garstedter Weg (Radroute 19)"

  def updated_at(), do: ~D[2025-05-02]

  def summary(),
    do:
      "Zweirichtungsweg wird bis Vierenkamp verlängert. Ab dort beidseitig Protected-Bike-Lanes bis kurz vorm neuen Kreisel am Moorrand. Danach Mischverkehr."

  def start(), do: ~d[2026-01]
  def stop(), do: ~d[2026-09]

  def type(), do: :planned
  def tags(), do: ["radroute-19", "14"]

  def map_image do
    {name(),
     [
       {"Sweco GmbH", "https://www.sweco-gmbh.de/kontakt/kontakt-verkehr-und-infrastruktur/"},
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
     ]}
  end

  def links(_assigns) do
    [
      {"fertiger Entwurf, Erläuterungsbericht", ~d[2025-05],
       "https://lsbg.hamburg.de/resource/blob/1054232/e186f95bbb06d63bc545b5aa8fc095e7/veloroute-14-garstedter-weg-abgestimmte-planung-bericht-data.pdf"},
      {"fertiger Entwurf, Karte", ~d[2025-05],
       "https://lsbg.hamburg.de/resource/blob/1054234/556785c70806bd55330f94ba49b9449f/veloroute-14-garstedter-weg-abgestimmte-planung-plan-data.pdf"},
      {"1. Entwurf, Erläuterungsbericht", "Januar 2023",
       "https://lsbg.hamburg.de/resource/blob/784382/8a2db564da8b6cbd2cafabc6c0800122/veloroute-14-garstedter-weg-abschnitt-nord-abstimmungsunterlage-bericht-data.pdf"},
      {"1. Entwurf, Karte", "Januar 2023",
       "https://lsbg.hamburg.de/resource/blob/784384/1a716fa35d477a2502567c641dd34053/veloroute-14-garstedter-weg-abschnitt-nord-abstimmungsunterlage-plan-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Mai 2025</h4>
    <p>Der Artikel wurde an den fertigen Entwurf angepasst. Der Kreisel bleibt, aber die sonstige Führung hat sich verändert.</p>

    <h4>Alter Zustand</h4>
    <p>Stellenweise sind schmale <.ref>Hochbordradwege</.ref> vorhanden, die jedoch unvermittelt aufhören und zu reinen Gehwegen werden. Aus dem <.v bounds="9.971391,53.642904,9.976052,53.64581" lon={9.972351} lat={53.643417} dir="forward" ref="radroute-19">Moorrand</.v> ist das Linksabbiegen häufig schwierig. In der Gegenrichtung ist die Weiterfahrt <.v bounds="9.971391,53.642904,9.976052,53.64581" lon={9.975374} lat={53.645562} dir="backward" ref="radroute-19">vom Zweirichtungsradweg</.v> unklar und benötigt Ortskenntnisse.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der <.v bounds="9.973331,53.6437,9.978224,53.646511" lon={9.975557} lat={53.645643} dir="backward" ref="radroute-19">vom Flughafentunnel kommende Zweirichtungsradweg</.v> wird bis zum <.v bounds="9.971391,53.642904,9.976052,53.64581" lon={9.973854} lat={53.64472} dir="backward" ref="radroute-19">Vierenkamp</.v> verlängert. Nach der Einmündung soll an der Ampel die Straßenseite gewechselt werden um dort auf einer 2,35m breiten <.ref>Protected-Bike-Lane</.ref> Richtung Niendorf zu kommen.</p>

    <p>Weil die <.v bounds="9.971354,53.642528,9.974672,53.644132" lon={9.972748} lat={53.643552} dir="backward" ref="radroute-19" highlight="Moorrand">Einmündung Moorrand</.v> zu einem Kreisverkehr umgebaut wird, geht der Radweg vorher in den <.ref>Mischverkehr</.ref> mit den KFZ über. Er behält dabei bis zum Reißverschlussverfahren die gleiche Breite.</p>

    <p>In Richtung Flughafen erfolgt die <.m bounds="9.969894,53.641631,9.974204,53.644366" highlight="Garstedter Weg">Ableitung im Garstedter Weg</.m> vom Hochbordradweg in den Mischverkehr nach dem gleichen Prinzip. Vorm <.v bounds="9.971828,53.643239,9.976538,53.645589" lon={9.973826} lat={53.644353} dir="forward" ref="radroute-19">Vierenkamp</.v> schließt eine Protected-Bike-Lane an, die an der Ampel auf den Zweirichtungsradweg führt.</p>

    <h4>Meinung</h4>
    <p>Nachdem der erste Entwurf nur mäßig war, kann sich die neue Fassung sehen lassen. Der Kreisverkehr erleichtert das Abbiegen in jede Richtung enorm. Die Überleitungen in den Mischverkehr drängen den Radverkehr außerdem nicht mehr an die Seite – sehr gut!</p>

    <p>Die Verlängerung des Zweirichtungsradwegs macht das Queren des Garstedter Wegs deutlich übersichtlicher. Schade ist, dass die Furt dazu auf der „falschen“ Seite bleibt – so muss man den Vierenkamp entgegen der normalen Fahrtrichtung Queren, was wegen unachtsamen Autofahrern eine Unfallquelle ist.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
