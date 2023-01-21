defmodule Data.Article.Blog.FuhlsbuettelerDamm do
  use Article.Default

  def name(), do: "#{created_at()}-4-fuhlsbuetteler-damm"
  def created_at(), do: ~D[2019-01-03]
  def updated_at(), do: ~D[2019-12-02]
  def title(), do: "Fuhlsbütteler Damm (Veloroute 4)"

  def start(), do: ~d[2020-06-29]
  def stop(), do: ~d[2021-07-30]

  def type(), do: :finished
  def construction_site_id_hh(), do: [9209, 17805]
  def tags(), do: ["4"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand Dezember 2019:</strong> Die Planung ist abgeschlossen und wurde im Vergleich zur ersten Fassung leicht geändert. Der Text wurde an die neue Fassung angepasst. Mittlerweile geht man von einem Umbau in der zweiten Jahreshälfte 2020 aus.</p> <p>Der Fuhlsbütteler Damm ist eine schöne Allee, die auch künftig erhalten bleiben soll. Entsprechend fallen viele für den Radverkehr guten Umbauvarianten flach, da zu viele Bäume gefällt werden müssten. Weitere Möglichkeiten entfallen auf Grund des zu hohen KFZ-Parkplatzverlustes oder wegen ungünstiger Fahrstreifen Aufteilung, bei der etwa Schutzstreifen permanent von den Autos mitbenutzt würden. Nach dem Auschlussverfahren kommt man im ersten Entwurf so zu folgendem Kompromissvorschlag:</p> <p>Das Längs- und Schrägparken bleibt im Wesentlichen so wie jetzt, wird aber ordentlich gefasst. Die Tempolimits bleiben so wie bisher, d.h. erst ab Höhe <.m bounds="10.019089,53.624148,10.024571,53.627412">Kohlgarten</.m> gibt es eine Tempo-30-Zone. In diesem Abschnitt wird der Radverkehr gemeinsam mit den KFZ auf der Fahrbahn geführt. Richtung Innenstadt beginnt hier ein ca. 1,65m breiter Schutzstreifen, der von Autos überfahren und zum Halten (nicht Parken) verwendet werden darf. Der Schutzstreifen endet kurz vor dem neuen Kreisel <.m bounds="10.017647,53.622973,10.020387,53.624605">Kreisel Suhrenkamp / Fuhlsbütteler Damm / Olendörp / Röntgenstraße</.m>, der überall mit Zebrastreifen ausgestattet wird.</p> <p>Bei Fahrtrichtung stadtauswärts hat man nach dem Kreisel die Wahl auf den 2,0m breiten Hochbordradweg zu wechseln oder auf der Fahrbahn zu bleiben. Der Fußweg wird mit 2,15m auch deutlich breiter sein als bisher. Gut: es gibt keine Markierungen, die den Radverkehr auf den Hochbordradweg „abdrängen“. Ab Höhe <.m bounds="10.019089,53.624148,10.024571,53.627412">Kohlgarten</.m> wird man aber schon wieder auf die Fahrbahn geleitet, da hier wie erwähnt die Tempo-30-Zone beginnt. Der Kohlgarten selbst wird als Gehwegüberfahrt ausgeführt – der Radverkehr hat hier sowohl auf dem Hochbord als auch auf der Fahrbahn Vorfahrt.</p> <p>Insgesamt wirkt die Planung fair, auch wenn die je nach Fahrtrichtung unterschiedliche Bauweise den Radverkehr komplizierter macht als notwendig. Warum man auf einem Teilstück von ca. 300m weiterhin auf Tempo 50 besteht, obwohl durch den Kreisverkehr sowieso gebremst werden muss, ist unverständlich. Für den Radverkehr wird jedoch unstreitbar eine Verbesserung erzielt.</p> <p><.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1008974">Erläuterungsbericht und Lagepläne</.a> (unter Anlagen)</p>
    """
  end
end
