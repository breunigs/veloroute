defmodule Data.Article.Blog.Hirschgraben do
  use Article.Default

  def name(), do: "#{created_at()}-13-hirschgraben"
  def created_at(), do: ~D[2019-09-13]

  def title(), do: "Hirschgraben (Veloroute 13)"

  def start(), do: ~d[2020-08-03]
  def stop(), do: ~d[2021-02-14]

  def type(), do: :finished
  def construction_site_id_hh(), do: [9971]
  def tags(), do: [13]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Der <.a href="/#16/53.56224/10.042317">Hirschgraben</.a> ist eine wenig befahrene Wohnstraße, auf der der Radverkehr prinzipiell gut vorankommt. Allerdings stört das Kopfsteinpflaster am <.a href="/13#17/53.561455/10.042733/r2EqMBPyvw1yN9inuN-ipg">südlichen Ende</.a> und die großzügigen Kurven an der Kreuzung mit der <.a href="/#17/53.561945/10.042969">Marienthaler Straße</.a> verunsichern etwas bezüglich gefahrener Geschwindigkeiten.</p> <p>Die für Frühjahr 2020 angesetzten Umbauten erneuern die Oberfläche auf dem gesamten Abschnitt, sodass auch das Kopfsteinpflaster entfällt. Die Kreuzungen werden jeweils enger gefasst, sodass sich für die Zufußgehenden eine klarere Stelle zum Queren ergibt. Man hofft durch diese Einengung auch Falschparker fernzuhalten um die Einsicht zu verbessern. Da Rechts-vor-Links beibehalten wird ist dies wünschenswert um nicht unnötig bremsen zu müssen.</p> <p>Die Planung endet vor den Kreuzungen mit der <.a href="/#17/53.560688/10.041861">Sievekingsallee</.a> und der <.a href="/#17/53.563658/10.042922">Hasselbrookstraße</.a>, die in anderen Maßnahmen überarbeitet werden. Es erfolgte jedoch eine Abstimmung, sodass am Ende eine durchgehende Radroute entstehen sollte.</p> <p>Die Verbesserungen auf dem ca. 300m langen Abschnitt sind willkommen und in Anbetracht der geringen Verkehrsstärke auch völlig ausreichend. Diese lassen sich sogar ohne großen Einfluss auf KFZ-Parkplätze oder Baumbestand umsetzen.</p> <p><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1010750">Erläuterungsbericht und Lagepläne</.a><br><.a href="https://www.hamburg.de/wandsbek/pressemitteilungen/14215188/">Infoseite der Stadt zur Baustelle</.a><br><.a href="https://lsbg.hamburg.de/contentblob/14757424/bc7be123086f36ee52153bd637ca47b8/data/hirschgraben-ausbau-veloroute-13-09-20-bis-02-21.pdf">Anwohnerinformation Dezember 2020</.a></p>
    """
  end
end
