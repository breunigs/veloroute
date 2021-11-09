defmodule Data.Article.Blog.Hirschgraben do
  use Article.Default

  def name(), do: "#{created_at()}-13-hirschgraben"
  def created_at(), do: ~D[2019-09-13]

  def title(), do: "Hirschgraben (Veloroute 13)"

  def start(), do: ~d[2020-08-03]
  def stop(), do: ~d[2021-02-14]

  def type(), do: :finished
  def construction_site_id_hh(), do: [9971]
  def tags(), do: ["13"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Der <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.56224, lon: 10.042317, zoom: 16}))}>Hirschgraben</.m> ist eine wenig befahrene Wohnstraße, auf der der Radverkehr prinzipiell gut vorankommt. Allerdings stört das Kopfsteinpflaster am <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.561455, lon: 10.042733, zoom: 17})} ref="13">südlichen Ende</.m> und die großzügigen Kurven an der Kreuzung mit der <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.561945, lon: 10.042969, zoom: 17}))}>Marienthaler Straße</.m> verunsichern etwas bezüglich gefahrener Geschwindigkeiten.</p> <p>Die für Frühjahr 2020 angesetzten Umbauten erneuern die Oberfläche auf dem gesamten Abschnitt, sodass auch das Kopfsteinpflaster entfällt. Die Kreuzungen werden jeweils enger gefasst, sodass sich für die Zufußgehenden eine klarere Stelle zum Queren ergibt. Man hofft durch diese Einengung auch Falschparker fernzuhalten um die Einsicht zu verbessern. Da Rechts-vor-Links beibehalten wird ist dies wünschenswert um nicht unnötig bremsen zu müssen.</p> <p>Die Planung endet vor den Kreuzungen mit der <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.560688, lon: 10.041861, zoom: 17}))}>Sievekingsallee</.m> und der <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.563658, lon: 10.042922, zoom: 17}))}>Hasselbrookstraße</.m>, die in anderen Maßnahmen überarbeitet werden. Es erfolgte jedoch eine Abstimmung, sodass am Ende eine durchgehende Radroute entstehen sollte.</p> <p>Die Verbesserungen auf dem ca. 300m langen Abschnitt sind willkommen und in Anbetracht der geringen Verkehrsstärke auch völlig ausreichend. Diese lassen sich sogar ohne großen Einfluss auf KFZ-Parkplätze oder Baumbestand umsetzen.</p> <p><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1010750">Erläuterungsbericht und Lagepläne</.a><br><.a href="https://www.hamburg.de/wandsbek/pressemitteilungen/14215188/">Infoseite der Stadt zur Baustelle</.a><br><.a href="https://lsbg.hamburg.de/contentblob/14757424/bc7be123086f36ee52153bd637ca47b8/data/hirschgraben-ausbau-veloroute-13-09-20-bis-02-21.pdf">Anwohnerinformation Dezember 2020</.a></p>
    """
  end
end
