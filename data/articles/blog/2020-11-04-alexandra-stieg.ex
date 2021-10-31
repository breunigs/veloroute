defmodule Data.Article.Blog.AlexandraStieg do
  use Article.Default

  def name(), do: "#{created_at()}-alexandra-stieg"
  def created_at(), do: ~D[2020-11-04]

  def title(), do: "Alexandra-Stieg / Entenwerder Stieg (Veloroute 9)"

  def start(), do: ~d[2021-04]
  def stop(), do: ~d[2021-09]

  def type(), do: :construction

  def tags(), do: [9, "M11", "M11.1a"]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Bestand</h4> <p>Der Radverkehr teilt sich auf dem <.m bounds="10.029211,53.531887,10.037401,53.534925">Alexandra-Stieg</.m> und im <.m bounds="10.029847,53.529604,10.040838,53.533604">Elbpark Entenwerder</.m> die Wege mit dem Fußverkehr. Im Park sind die Wege schmal und in feinem Schotter ausgeführt, sodass bereits Gegenverkehr problematisch ist. Sicher überholt werden kann nicht, sofern man nicht über den Rasen ausweicht. Auf dem <.m bounds="10.039818,53.529999,10.042953,53.530456">Entenwerder Stieg</.m> werden Radfahrende dagegen gemeinsam mit den KFZ auf der Fahrbahn geführt.</p>
    <h4>Planung</h4> <p>Die Planung geht von einem Baustart im November 2020 aus, also sehr zeitnah. Fertig werden sollen die Maßnahmen bis Juni 2021.</p> <p>Anders als heute soll der gesamte Abschnitt beleuchtet werden. Die Umfahrung <.m bounds="10.028537,53.533766,10.03352,53.534907" lon="10.0311426" lat="53.534112" dir="forward">der Treppe auf dem Alexandra-Stieg</.m> wird leicht angepasst, sodass der Umweg nicht mehr ganz so groß ausfällt, bleibt sonst aber grundlegend vorhanden. Auch die Führungsform „gemeinsamer Fuß- und Radweg“ bleibt hier bestehen.</p> <p>Wo man heute noch <.m bounds="10.032745,53.529832,10.043501,53.532325" lon="10.0371527" lat="53.5320398" dir="forward">in den Park abbiegt</.m> soll künftig ein 4,0m breiter, gepflasterter Radweg anschließen. Dieser verläuft parallel zur vorhandenen Zufahrt und mündet fast geradlinig <.m bounds="10.035986,53.529892,10.04186,53.531253" lon="10.0403136" lat="53.5304232" dir="forward">an dieser Stelle</.m> in den Entenwerder Stieg.</p> <p>Dort wird der Straßenteil Richtung Elbe entfernt und so der Park vergrößert. Vorhandene KFZ-Parkplätze werden ebenfalls verlegt, sodass dieser Abschnitt weitgehend autofrei ist. Wegen einer <.m bounds="10.038363,53.5297,10.041996,53.530542" lon="10.04081" lat="53.5302568" dir="forward">privaten Garage im Entenwerder Fährhaus</.m> wird die Zufahrt mit KFZ weiterhin möglich sein. Es sind jedoch zahlreiche Findlinge vorgesehen um illegales Parken zu unterbinden.</p> <p>Nach dem Fährhaus teilen sich Fahrräder und Autos wie bisher die Fahrbahn, wobei die <.m bounds="10.03969,53.529826,10.043323,53.530668" lon="10.0414756" lat="53.530066" dir="forward">Einmündung</.m> so umgebaut wird, das der Radverkehr entlang der Veloroute Vorfahrt hat. Zusätzlich wird noch das <.m bounds="10.040542,53.529869,10.044174,53.530711" lon="10.0425759" lat="53.5303212" dir="forward">Kopfsteinpflaster am Ende der Straße</.m> durch glatteren Asphalt ersetzt.</p>
    <h4>Meinung</h4> <p>Gerade im Bereich des Entenwerder Stieg und des Parks wird für den Radverkehr eine erhebliche Verbesserung erzielt. Die durchgängige Beleuchtung und neuen Anschließbügel sind ebenfalls sehr willkommen. Schade ist, das man den Entenwerder Stieg nur teilweise gegen dreiste KFZ-Fahrende sichern kann. Die Schikane an der <.m bounds="10.028537,53.533766,10.03352,53.534907" lon="10.0311426" lat="53.534112" dir="forward">Brücke auf dem Alexandra-Stieg</.m> bleibt ebenfalls nervig, eine lange Rampe und eine ebenerdige Kreuzung wären wünschenswerter.</p>
    <h4>Quelle</h4> <p><.a href="https://www.hamburg.de/mitte/strassenbau-und-verkehr/13920660/ausbau-veloroute-9/">Infoseite der Stadt</.a></p>
    """
  end
end
