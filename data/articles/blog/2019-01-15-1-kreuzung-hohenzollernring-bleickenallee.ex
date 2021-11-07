defmodule Data.Article.Blog.KreuzungHohenzollernringBleickenallee do
  use Article.Default

  def name(), do: "#{created_at()}-1-kreuzung-hohenzollernring-bleickenallee"
  def created_at(), do: ~D[2019-01-15]
  def updated_at(), do: ~D[2019-12-05]
  def title(), do: "Kreuzung Hohenzollernring / Bleickenallee (Veloroute 1)"

  def start(), do: ~d[2020-07-06]
  def stop(), do: ~d[2020-11-30]

  def type(), do: :finished
  def construction_site_id_hh(), do: [9437]
  def tags(), do: ["1", "a10"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand Dezember 2019:</strong> Vom ersten Entwurf zur finalen Fassung hat sich einiges geändert. Der Artikel wurde an den aktuellen Stand angepasst.</p> <p>In Richtung Ottensen ist die Kreuzung auch bisher schon recht einfach zu benutzen: man fährt entweder aus dem Mittelstreifen „über Eck“ oder direkt aus dem Mischverkehr auf <.a href="/#18/53.551169/9.918608">ein Stück Radweg in der Bleickenallee</.a>, bei guten Grünzeiten. Die Gegenrichtung ist nicht so einfach: entweder man quetscht sich an der Bushaltestelle auf den Radweg und hat dann nur 8 Sekunden um den Hohenzollernring zu queren, oder man ordnet sich vorher in den Mischverkehr ein.</p> <p>Für die Umplanung der Kreuzung wurden etliche Variantenuntersucht, wobei sich nun Folgendes ergeben hat. In Fahrtrichtung stadtauswärts wird die Bushaltestelle in den Hohenzollernring verlegt. Ebenso entfällt die Möglichkeit für KFZ hier direkt links oder geradeaus zu fahren – stattdessen muss zuerst rechts abgebogen und dann auf <.a href="/#17/53.552454/9.917697">Höhe Holstentwiete</.a> gewendet werden. Der gewonnene Platz wird dem Fußweg und dem Radfahrstreifen zugeschlagen. Dieser ist knapp 2m breit und teilt sich an der Kreuzung in eine Geradeaus- und Rechtsabbiegerspur auf, jeweils mit eigener Ampel. Die Grünzeit für den Radverkehr wird mit 19s geplant – das ist zwar kürzer als die Gegenrichtung, aber besser als momentan.</p> <p>Stadteinwärts (Richtung Ottensen) wird das kurze Stück Radweg entfernt und stattdessen durch einen Radfahrstreifen ersetzt. Dieser ist durch Verkehrsinseln von KFZ und Bussen getrennt, geht aber kurz nach der Kreuzung in die Bushaltestelle über. Der Radverkehr kann problemlos an einem wartenden Bus vorbeifahren ohne sich in die KFZ-Spur einordnen zu müssen. Auch in dieser Fahrtrichtung gibt's eine eigene Radampel und die lange Grünphase bleibt größtenteils erhalten (rund 44s).</p> <p>Die Führung entlang der Veloroute ist jeweils geradlinig, was eine deutliche Verbesserung darstellt. <.a href="https://de.wikipedia.org/wiki/Abbiegen_(Stra%C3%9Fenverkehr)#Direktes_und_indirektes_Abbiegen">Indirektes Linksabbiegen</.a> ist immer möglich. Die Warteflächen sind entweder durch Verkehrsinseln gesichert oder liegen nicht im „Abbiegeradius“ der KFZ. Hier sind immer eigene Radampeln angebracht. Direktes Linksabbiegen ist möglich wenn man sich auf den KFZ-Spuren einordnet. Entsprechend entfällt es, wenn man von Ottensen auf den Hohenzollernring Richtung Süden möchte.</p> <p>Der vorliegende Plan ist gut. Natürlich nur unter der Annahme, das auch in der <.a href="/#18/53.551205/9.916772">Bleickenallee West</.a> das Kopfsteinpflaster durch einen angenehmeren Belag ersetzt wird. Denn wie bisher ist auch künftig nicht vorgesehen, das man bequem auf den Mittelstreifen auffahren kann – was aber die Regel sein dürfte, wenn es bei einem holprigen Belag bleibt.</p> <p>Angesetzt ist der Umbau für Frühjahr 2020, wobei dieser Termin maßgeblich durch andere Baumaßnahmen beeinflusst wird (A7-Deckel, <.m bounds="9.934273,53.555587,9.936073,53.555831">Lessingtunnel</.m>).</p> <p><.a href="https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1009396">Erläuterungsbericht mit Lageplan</.a> (unter Anlagen)</p>
    """
  end
end
