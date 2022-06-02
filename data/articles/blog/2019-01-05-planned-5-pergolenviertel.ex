defmodule Data.Article.Blog.Planned5Pergolenviertel do
  use Article.Default

  def created_at(), do: ~D[2019-01-05]

  def title(), do: "Pergolenviertel (Veloroute 5N)"

  def type(), do: :finished

  def tags(), do: ["5", "5N"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Das Pergolenviertel befindet sich bereits im Bau und die für die Veloroute eingerichtete Umleitung sollte man nicht als Maßstab zum Vergleich heranziehen. Die Neuplanung sieht nämlich einen weitestgehend eigenständigen Radweg vor, dessen grober Verlauf in grau auf der Karte angedeutet ist. Dieser ist in der Tat so schlangenlinienartig angedacht, wobei die Kurven meist großzügig genug erscheinen um sie auch mit 30 km/h nehmen zu können. Für die Überwege an der <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.609394, lon: 10.024593, zoom: 17}))}>Sengelmannstraße</.m> bzw. <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.599627, lon: 10.030674, zoom: 17}))}>Saarlandstraße</.m> gilt das natürlich nicht.</p>
    <p>Der Radweg hat nicht immer einen begleitenden Fußweg. Im Norden sollen Zufußgehende den <.m bounds="10.027138,53.602851,10.029667,53.605986">Limaweg</.m> verwenden, Richtung Süden ist offenbar die namensgebende „Pergola“ (ein <.a href="https://de.wikipedia.org/wiki/Pergola">überdachter bzw. überwachsener Fußweg</.a>) vorgesehen. Da die Fußwege teils in einigem Abstand verlaufen, bleibt abzuwarten ob der Radweg nicht doch als Abkürzung, zum Jogging o.ä. mitbenutzt wird. Im Gegenzug wird auch versucht den Radverkehr von den Fußwegen fernzuhalten, was sinnvoll ist. Ausnahme bildet der nördliche Teil des Limaweges, der mit „Fahrrad frei“ als Anbindung zur <.m bounds="10.02476,53.605246,10.039522,53.608922">Hebebrandstraße</.m> erhalten bleibt.</p>
    <p>Bis auf am Anfang und Ende des neuen Radweges gibt es nur eine Kreuzung: auf Höhe des ebenfalls umzubauenden <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.603048, lon: 10.029802, zoom: 18}))}>Dakarweg</.m> wird es eine Rechts-vor-Links Situation geben. Veloroute und Dakarweg werden gleichberechtigt sein. Der Dakarweg stellt einen Hauptzugang zum Viertel bereit, wickelt also den Anlieger- und Lieferverkehr ab. Der Radverkehr wird auf ihm im Mischverkehr geführt. Alle anderen Straßen werden unterfahren.</p>
    <p>Am kritikwürdigsten dagegen ist der forcierte Zweirichtungsradweg entlang der <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.60760, lon: 10.02638, zoom: 17}))}>Sengelmannstraße</.m>. Richtung Süden entledigt sich man des Problem des zu schmalen Radwegs einfach, indem man ihn aufhebt und stattdessen nur „Fahrrad frei“ beschildert. Damit lassen sich Ziele über <.m bounds="10.02476,53.605246,10.039522,53.608922">Hebebrandstraße</.m> schlechter erreichen als heute und man müsste weiträumig ausweichen. In der Praxis werden Radfahrende sich einfach nicht an die Schrittgeschwindigkeit halten. Folgt man der Veloroute muss man zweimal im rechten Winkel bei engen Kurvenradien abbiegen. Besser wäre die Furt nach Süden zu verschieben und diagonal anzulegen. Das würde nicht nur höhere Geschwindigkeiten erlauben, sondern auch die Strecke des Zweirichtungsradweges verkürzen. Letztere erziehen praktisch zum „Geisterradeln“ und sind gerade in Kreuzungsbereichen sehr unfallträchtig. Immerhin gibt es kurz nach <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.606234, lon: 10.028738, zoom: 18}))}>der Unterführung der Hebebrandstraße</.m> eine Anbindung ins Viertel, die eine brauchbare Alternative sein könnte.</p>
    <p>Im Süden schließt der neue Radweg an die beidseitig geführten Einrichtungsradwege der <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.599627, lon: 10.030674, zoom: 17}))}>Saarlandstraße</.m> an. Stadteinwärts hat man nur noch einen rechten Winkel, ansonsten stellt sich diese Furt besser dar als ihr Pendant im Norden.</p>
    <p>Beide Überwege werden mit Bettelampeln ausgestattet. Die <.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1006595">Begründung (Frage 4)</.a> warum man Radfahrende nicht automatisch erkennen und so direkt Grün anfordern kann überzeugt nicht. Immerhin soll die Ampel schneller umschalten, wenn gerade kein KFZ-Verkehr herrscht.</p>
    <p>Insgesamt erscheint die Planung durchwachsen. Natürlich dürfte der eigenständig geführte Radweg ein Highlight auf der Strecke werden, obgleich er sich etwas schlängelt. Gerade stadteinwärts stellt sich die Anbindung mittels zweier Bettelampeln jedoch fahrradfeindlich dar. Ich hoffe die Stadt besinnt sich eines Besseren und ergänzt Kameras oder ähnliche Systeme. Das dies durchaus möglich ist sieht man z.B. an der <.a name="2018-12-31-10-veddeler-marktplatz">Bettelampel am Veddeler Marktplatz</.a>.</p>
    <p>
    <.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1006314">Erläuterungsbericht und Pläne</.a> (unter Anlagen)<br>
    <.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1006595">Überarbeitete Fassung zu Plan/Blatt 2, weitere Erläuterungen</.a>
    </p>
    """
  end
end
