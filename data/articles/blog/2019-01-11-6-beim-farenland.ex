defmodule Data.Article.Blog.BeimFarenland do
  use Article.Default

  def name(), do: "#{created_at()}-6-beim-farenland"
  def created_at(), do: ~D[2019-01-11]

  def title(), do: "Beim Farenland (Veloroute 6)"

  def start(), do: ~d[2020-11-02]
  def stop(), do: ~d[2021-04-16]

  def type(), do: :finished
  def construction_site_id_hh(), do: [12524]
  def tags(), do: [6]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Fährt man hier in den Nebenzeiten oder am Wochenende, gibt es wenig auszusetzen, da man praktisch alleine unterwegs ist. Zu Stoßzeiten ist es jedoch schwierig eine Lücke zu finden, da <.m bounds="10.134709,53.63109,10.138003,53.637531">Beim Farenland</.m> 50 km/h erlaubt und kerzengerade ist.</p> <p>Um das Queren zu erleichtern soll eine Ampel errichtet werden, die aus den Nebenstraßen jeweils angefordert werden muss. Für KFZ und Fahrräder erfolgt die Anforderung automatisch, für Zufußgehende gibt's Handtaster. Die Bushaltestelle wird aus dem Zwischenbereich Richtung Süden hinter <.m bounds="10.129874,53.633725,10.136229,53.634925">De Beern</.m> verschoben.</p> <p>Laut Bericht soll die Ampel je nach Verkehrsaufkommen schalten. Es ist also zu hoffen, das die Ampel in den Nebenzeiten praktisch sofort wechselt und man „durchrollen“ kann.</p> <p>Aufgrund der geringen Breite der Straße an dieser Stelle, wird es keine eigenen Radspuren geben. Aufgestellt werden soll die Ampel 2019.</p> <p><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1009505">Erläuterung und Pläne zum ersten Entwurf</.a> (unter Anlagen)<br><.a href="https://www.hamburg.de/wandsbek/strassenbaustellen/14492110/beim-farenland/">Infoseite der Stadt zur Baustelle</.a></p>
    """
  end
end
