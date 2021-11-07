defmodule Data.Article.Blog.VeddelerMarktplatz do
  use Article.Default

  def name(), do: "#{created_at()}-10-veddeler-marktplatz"
  def created_at(), do: ~D[2018-12-31]

  def title(), do: "Veddeler Marktplatz (Veloroute 10)"

  def type(), do: :ampel

  def tags(), do: ["10"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Update:</strong> Die Kreuzung wurde um einen Bewegungsmelder für Radfahrende ergänzt, welcher automatisch Grün anfordert wenn sich Fahrräder nähern. Die Anforderung wird für die ganze Kreuzung gemacht, sodass man jetzt in einem Rutsch über die Kreuzung kommt. Leider schaltet die Ampel auch in Nebenzeiten nicht schnell genug um „rollend“ durchzufahren.</p> <p>Damit die automatisch Erkennung funktioniert, sollte man sich möglichst an die vorgesehene Radführung halten. Zur Überprüfung kann man auf den Taster für Zufußgehende schielen: leuchtet dieser auf wurde für den Radfahrenden Grün angefordert. Besser wäre eine klare Anzeige mit „Signal kommt“ am Signalgeber. So wäre die Chance größer durch Langsamfahren nicht absteigen zu müssen.</p> <p><s>Die Kreuzung wurde erst kürzlich umgestaltet, wobei der Fokus nach wie vor auf dem motorisiertem Verkehr liegt. Dies ist bei einer Auf- bzw. Auffahrt einer Autobahn auch wenig verwunderlich. Völlig unklar ist jedoch, warum man die Querungen als Bettelampeln ausgeführt hat. An dieser Stelle werden wohl die meisten in die Falle tappen und ewig warten, bevor sie den Taster einige Meter weiter links sehen. Die Schaltzeiten sind auch nicht besonders schnell – man erhält also nicht kurz nach Betätigung grün. Mindestens sollte ein weiterer Taster in Radwegnähe installiert werden.</s></p>
    """
  end
end
