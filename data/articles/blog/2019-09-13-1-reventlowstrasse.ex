defmodule Data.Article.Blog.Reventlowstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-1-reventlowstrasse"
  def created_at(), do: ~D[2019-09-13]
  def updated_at(), do: ~D[2019-12-08]
  def title(), do: "Reventlowstraße (Veloroute 1)"

  def start(), do: ~d[2020Q2]

  def type(), do: :planned

  def tags(), do: ["1", "a12"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand Dezember 2019:</strong> Nach umfangreichen Vorplanungen wurde nun der erste vollständige Entwurf versandt. Der Artikel wurde an diesen Stand angepasst und verworfene Ideen aus den Vorplanungen entfernt.</p>
    <p>Bisher ist die <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.555961, lon: 9.890466, zoom: 17}))}>Reventlowstraße</.m> vor allem auf den Autoverkehr ausgerichtet. Radwege oder -spuren gibt es nur wenige, die häufig im Nichts enden. Gerade an den Kreuzungen ist die Führung unklar, sodass man der Veloroute selbst mit Navi kaum folgen kann. Bereits im August 2018 gab es eine Infoveranstaltung mit ersten Ideen, die im Sommer 2019 umgesetzt werden sollten. Daraus ist zwar nichts geworden, aber die Zeit wurde gut genutzt – der Entwurf kann sich sehen lassen. Als Baubeginn ist aktuell das 2. Quartal 2020 angesetzt. Im Detail:</p>
    <p><strong><.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.555273, lon: 9.89066, zoom: 17})} ref="1">Einmündung Emkendorfstraße:</.m></strong> Hier ist ein Kreisel vorgesehen, der vor allem das problematische Linksabbiegen Richtung Innenstadt verbessert. Um das Tempo herauszunehmen wird er so gebaut, das keine Fahrtrichtung „geradeaus“ durch den Kreisel fahren bzw. abkürzen kann. Deswegen kann die <.m bounds="9.887993,53.555181,9.890848,53.555933">Olshausenstraße</.m> nicht direkt an den Kreisel angeschlossen werden, weil dieser sonst ungünstig liegen würde. An jedem Arm des Kreisels gibt es Zebrastreifen und bis auf in der Emkendorfstraße auch Mittelinseln um Überholvorgänge zu verhindern.</p>
    <p><strong><.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.556404, lon: 9.890172, zoom: 17})} ref="1">Walderseestraße:</.m></strong> Stadtauswärts (Richtung S-Othmarschen) ordnet sich der Radverkehr auf einem 2m Radfahrstreifen zwischen KFZ-Geradeaus/Links und KFZ-Rechts ein. Durch einen großzügigen Aufstellbereich vor den KFZ kann man direkt links in die Walderseestraße abbiegen bzw. muss beim Geradeausfahren nicht in den Abgasen warten. Auch im weiteren Verlauf bleibt man auf einem 2m breiten Radfahrstreifen mit guter Führung. In der Gegenrichtung gibt's ebenfalls zwei Meter und hier muss man auch nicht zwischen den KFZ-Spuren entlang fahren. Aus allen Richtungen ist direktes Linksabbiegen möglich.</p>
    <p><strong><.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.557468, lon: 9.889429, zoom: 17})} ref="1">Einmündung Jungmannstraße:</.m></strong> In Richtung Innenstadt bleibt es fast gleich – man fährt aus dem Mischverkehr auf einen Radfahrstreifen, statt auf einen Radweg. Dieser ist auch hier 2m breit. Das problematische Linksabbiegen mit Fahrtrichtung Flottbek wird sehr simpel gelöst. Der Radfahrstreifen teilt sich in zwei Spuren auf, wobei die Geradeaus einen kleinen Rechtsschlenker um die Linksabbiegerspur macht. Letztere erhält eine eigene Radampel. Erst in der Jungmannstraße müssen sich Radfahrende an dieser Kreuzung in den Mischverkehr einordnen. Hier wurde nur ein kurzes Stück Schutzstreifen als Orientierungshilfe eingezeichnet.</p>
    <p><strong>Strecke:</strong> Entlang des Verlaufs der Veloroute sind die Radfahrstreifen 2m breit. Im <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.555737, lon: 9.890197, zoom: 17.66})} ref="1">Bereich der Bushaltestelle</.m> werden diese jedoch aufgehoben und man teilt sich die Fläche mit KFZ und Bussen irgendwie. Teilweise werden schmale Schutzstreifen eingezeichnet um zu verdeutlichen, das sich der Radverkehr nicht in Luft auflösen braucht. Der Platz sollte ausreichen um auch bei Gegenverkehr an einem wartenden Bus vorbeifahren zu können.</p>
    <p><strong>Außerhalb der Veloroute:</strong> Auf dem <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.558244, lon: 9.88813, zoom: 17}))}>Teilstück Richtung S-Othmarschen</.m> werden die Radfahrstreifen beidseitig mit rund 1,85m Breite fortgeführt. Im <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.553842, lon: 9.889713, zoom: 17})} ref="1">südlichen Abschnitt</.m> wird Richtung Süden ein Radweg gebaut, Richtung Norden gibt es nur einen 1,5m schmalen Schutzstreifen. Die <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.552876, lon: 9.889788, zoom: 17}))}>Kreuzung mit dem Agathe-Lasch-Weg</.m> behält ihre Ampel, wird jedoch mit Radfahr- und Schutzstreifen im Vor- und Nachlauf ausgestattet. In Ost/West-Richtung gibt es Aufstellbereiche vor den KFZ, die direktes Linksabbiegen erlauben.</p>
    <p><strong>Meinung:</strong> Als kritikwürdig ist nur der Radfahrstreifen zwischen den KFZ-Spuren auf <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.556743, lon: 9.889908, zoom: 17})} ref="1">Höhe Walderseestraße</.m> einzustufen. Besser wäre hier KFZ-Rechts und Rad-Geradeaus eine getrennte Grünphase zu geben und den Radfahrstreifen immer rechts von den KFZ zu lassen, was den Gefahrenpunkt beim Einordnen der KFZ auf die Rechtsabbiegerspur entfernt. Der Erläuterungsbericht geht leider nicht darauf ein, ob diese Führung möglich wäre.<br>Auch fehlen noch Anlehnbügel zum Abstellen der Fahrräder, aber diese werden in Detailarbeit zum zweiten Entwurf sicher noch ergänzt.</p> <p>
    <.a href="https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1009394">Erläuterungsbericht und Lagepläne des ersten Entwurfs</.a>
    </p>
    """
  end
end
