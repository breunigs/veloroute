defmodule Data.Article.Blog.TangstedterLandstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-4-tangstedter-landstrasse"
  def created_at(), do: ~D[2019-06-29]

  def title(), do: "Tangstedter Landstraße (Veloroute 4)"

  def start(), do: ~d[2020-09-01]
  def stop(), do: ~d[2021-06-29]

  def type(), do: :finished
  def construction_site_id_hh(), do: [12311]
  def tags(), do: ["4"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Änderungen:</strong> Die Umplanung liegt nun in der Schlussfassung vor. Im Vergleich zur vorigen Version entfallen im Wesentlichen die Ampeln zum indirekten Linksabbiegen in den <.m bounds="10.007196,53.652868,10.024705,53.65531">Wördenmoorweg</.m>. Die Beschreibung wurde entsprechend angepasst. </p> <p>Die <.m bounds="10.012524,53.646179,10.037518,53.688708">Tangstedter Landstraße</.m> besitzt im aktuellen Zustand unbenutzbare Radwege, die in den Punkten Führung, Breite und Oberfläche durchweg mangelhaft sind. Geübte Radfahrende sind daher besser im Mischverkehr auf den sehr breiten Fahrspuren aufgehoben.</p> <p>Der Plan sieht vor die alten Radwege zu entfernen und den Fußwegen zuzuschlagen. Der Radverkehr wird stattdessen geradlinig – auch in den Kreuzungsbereichen – auf ca. 2m breiten Radfahrstreifen geführt. Zur besseren Abgrenzung zum KFZ Verkehr soll zwischen Rad- und Autospur sowohl die Regenrinne als auch ein niedriger Randstein von 2-3cm Höhe gelegt werden. In Hamburg ist dies stellenweise an der <.m bounds="9.996371,53.540561,10.00705,53.541574">Überseeallee</.m> so umgesetzt und sorgt für ein sichereres Fahrgefühl. Der ADFC berichtet aber von häufigeren Stürzen, da diese Kante für viele unerwartet ist.</p> <p>In die Einmündung <.m bounds="10.019434,53.64979,10.027526,53.653294">Am Schulwald</.m> kann man direkt über eine gemischte KFZ/Rad-Spur rechts abbiegen. Auf der Gegenseite ist eine Aufstelltasche mit eigener Radampel zum Linksabbiegen vorgesehen. Der Verkehr, der aus der Straße <.m bounds="10.019434,53.64979,10.027526,53.653294">Am Schulwald</.m> kommt, sortiert sich wie bisher frühzeitig ca. 60m vor der Einmündung. Neu ist hier der 2,25m breite Radfahrstreifen für Linksabbieger, der zwischen KFZ-Links und gemeinsamer Rechtsabbiegerspur angeordnet ist. Zusätzlich findet sich am Ende ein Aufstellbereich über die gesamte Breite der KFZ- und Radlinksabbiegerspuren. Für den rechtsabbiegenden Radverkehr Richtung Norden bleibt es beim Mischverkehr, wobei die Einordnung aber bequem gestaltet ist. Im <.m bounds="10.007196,53.652868,10.024705,53.65531">Wördenmoorweg</.m> gibt es keine Abbiegehilfen für den Radverkehr. Es ist vorgesehen das Linksabbieger zwischen den beiden Fahrtrichtungen des Wördenmoorwegs die KFZ-Geradeausspur queren und sich in der gemeinsamen Linksabbiegerspur einordnen. Ohne gute Ortskenntnis dürfte das misslingen, da die Pfeile dafür viel zu spät aufgemalt werden.</p> <p>Die Bushaltestelle Wördenmoorweg wird von einer Busbucht zum Halten am Fahrbahnrad umgebaut. Der Radweg verläuft über die Haltefläche der Busse, sodass sich Radfahrende hier in den fließenden KFZ-Verkehr einordnen müssen, wenn sie nicht hinter dem Bus warten möchten.</p> <p>Der Plan wirkt sehr gut, auch wenn Optimierungen zu Lasten des Radverkehrs unterbleiben. Etwa werden die Radspuren einige Male über die Regenrinne geführt, wobei nichtmal versprochen wird, das diese ohne Rand auskommt. Der KFZ-Verkehr muss sich mit diesen Unebenheiten nicht herumschlagen. Fraglich ist auch das Linksabbieger-Konzept in den Wördenmoorweg – viele werden chaotisch indirekt über die Fußfurt Linksabbiegen, weil eine Einordnung in den fließenden Verkehr nicht bequem ist. Mir ist nicht klar, warum man die indirekte Abbiegemöglichkeit mit Radampel verworfen hat.</p> <p>Umgesetzt werden soll die Maßnahme 2020.</p> <p><.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1007975">Erläuterungsbericht und Lagepläne des ersten Entwurfs</.a> (unter Anlagen).</p>
    """
  end
end
