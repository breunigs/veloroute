defmodule Data.Article.Blog.CuxhavenerStrasse do
  use Article.Default

  def name(), do: "#{created_at()}-10-cuxhavener-strasse"
  def created_at(), do: ~D[2018-11-09]

  def title(), do: "Cuxhavener Straße bis zum Dubben (neue Führung, Veloroute 10)"

  def start(), do: ~d[2019-10-21]
  def stop(), do: ~d[2020-12-31]

  def type(), do: :finished
  def construction_site_id_hh(), do: [2147]
  def tags(), do: [10, "H09"]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die vorliegende Planung verbessert die Radverkehrswege entlang der künftigen Führung der Veloroute 10: stadtauswärts geht es von „<.m bounds="9.900759,53.473868,9.904519,53.473989">Zum Dubben</.m>“ über die <.m bounds="9.898782,53.471056,9.912508,53.512353">Waltershofer Straße</.m> zur <.m bounds="9.806636,53.464579,9.9165,53.472814">Cuxhavener Straße</.m>. Dieser folgt man ein kurzes Stück bis man mittels der Bahnunterführung zur <.m bounds="9.889712,53.473014,9.894011,53.473223">Neehusenstraße</.m> gelangt. Die Unterführung wird im Rahmen der aktuellen Planung nicht angefasst.</p> <p><strong>Kreuzung <.m bounds="9.900759,53.473868,9.904519,53.473989">Zum Dubben</.m>/<.m bounds="9.898782,53.471056,9.912508,53.512353">Waltershofer Straße</.m>:</strong> hier soll in Zukunft eine Ampel sicheres Queren ermöglichen. Richtung Innenstadt Harburg wird man mit dem Fahrrad frei rechtsbbiegen können, da die Führung weiterhin einen gemischen Rad- und Fußweg vorsieht. In der Gegenrichtung gibt es einen Aufstellbereich vor den KFZ.</p> <p><strong><.m bounds="9.898782,53.471056,9.912508,53.512353">Waltershofer Straße</.m>:</strong> Stadteinwärts bleibt es wie bereits erwähnt beim gemischten Fuß- und Radweg. Richtung <.m bounds="9.806636,53.464579,9.9165,53.472814">Cuxhavener Straße</.m> wird offenbar die Leitplanke entfernt und durch eine reine Fahrbahnmarkierung ersetzt. Immerhin hat der Radweg in dieser Richtung dann eine Breite von ca. 2,00m. Der Bericht spricht zwar von 2,60m, rechnet aber die Kanalrinne und die (unbefahrbare) Fahrbahnmarkierung mit ein.</p> <p><strong>Kreuzung <.m bounds="9.898782,53.471056,9.912508,53.512353">Waltershofer Straße</.m>/<.m bounds="9.806636,53.464579,9.9165,53.472814">Cuxhavener Straße</.m>:</strong> Richtung Süden teilt sich der Radfahrstreifen je in eine eigene Links- und Rechtsabbiegerspur. Eine Verkehrsinsel soll dem KFZ-Verkehr klar machen, wohin der Radfahrende sich bewegt und hoffentlich auch zu frühes Abbiegen bzw. Schneiden verhindern. Beim Rechtsabbiegen im Kreuzungsbereich schützt eine weitere Verkehrsinsel den Radverkehr – welcher sich danach im Bereich einer Bushaltestelle befindet. Ein haltender Bus kann aber problemlos passiert werden ohne auf die KFZ-Spur wechseln zu müssen.<br>Die Gegenrichtung setzt auf eine Bettelampel um vom baulich getrennten Radweg die <.m bounds="9.806636,53.464579,9.9165,53.472814">Cuxhavener Straße</.m> queren zu können. Auch hier muss der Radfahrende durch eine Bushaltestelle fahren, die diesmal aber nicht breit genug ausgeführt ist um sicher am Bus vorbeifahren zu können. Laut Planung sei dies akzeptabel, weil die Haltestelle nur selten angefahren würde.</p> <p><strong><.m bounds="9.806636,53.464579,9.9165,53.472814">Cuxhavener Straße</.m>:</strong> Bis auf wenige Ausnahmen bleibt die Führung bei einem baulich getrenntem Radweg. Diese werden jedoch durchgängig auf 2,00m Breite ausgebaut. Leider ist dafür auf der Südseite Pflaster vorgesehen, was durch die Wurzeln und Witterung schnell uneben werden dürfe. Die momentan vorhandene Asphaltierung ist dagegen sehr gut befahrbar.</p> <p><strong><.m bounds="9.806636,53.464579,9.9165,53.472814">Cuxhavener Straße</.m> auf Höhe der Unterführung:</strong> Die Ampel wird so verlegt, das man direkt aus der Unterführung heraus queren kann. Die Bushaltestelle wird entsprechend verlegt und der nördliche Radweg führt nicht mehr durch den Wartebereich, sondern hinter diesem vorbei. Zur Unterführung selbst gibt es keine Verbesserungen und ihre Benutzung bleibt unbequem.</p> <p><strong>Fazit:</strong> Es handelt sich um eine klare Verbesserung im Vergleich zum Bestand, die auch die Sicherheit des Radverkehrs erheblich erhöht. Leider schweigt sich die Planung zu den unverschämten zwei Minuten Wartezeit an den Bettelampeln zum Queren der <.m bounds="9.806636,53.464579,9.9165,53.472814">Cuxhavener Straße</.m> aus. Sofern das nicht verbessert wird, dürfte man noch mehr Geisterradlern als heute begegnen. An der Nebenstraße <.m bounds="9.900759,53.473868,9.904519,53.473989">Zum Dubben</.m> geht die Planung ebenfalls von langen Wartezeiten aus.</p> <p>Langfristig sollte unbedingt eine Lösung gefunden werden, wie die Route nördlich der Bahnstrecke geführt werden kann. Die Umsetzung dieser mittelfristigen Maßnahmen ist aber zu begrüßen und soll 2019 stattfinden.</p> <p><.a href="https://sitzungsdienst-harburg.hamburg.de/bi/vo020.asp?VOLFDNR=1005816">Erläuterungsbericht zur Umgestaltung mit vorläufigem Lageplan</.a> (unter Anlagen)</p>
    """
  end
end
