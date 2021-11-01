defmodule Data.Article.Blog.Veloroute10Bewertung do
  use Article.Default

  def name(), do: "#{created_at()}-veloroute-10-bewertung"
  def created_at(), do: ~D[2018-09-07]

  def title(), do: "Bewertung der Veloroute 10 Herbst 2018"

  def type(), do: nil

  def tags(), do: ["10"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Es fällt mir schwer die Veloroute 10 im aktuellen Zustand zu empfehlen: Wirklich ausgebaut ist die Route nirgends, auch wenn hier und da gute Ansätze erkennbar sind. So sind etwa in der <.m bounds="9.9803816,53.5300578,10.0315651,53.5469165">HafenCity</.m> durchgehend Radwege vorhanden, zumindest im bereits fertig gebauten Teil. Die Autobahnquerung (<.m bounds="10.024617,53.530516,10.027539,53.533262">Neue Elbbrücke</.m>) ist jedoch bereits zu schmal zum Überholen, obwohl es sich gerade hier anbieten würde. Die Führung auf der <.m bounds="10.013297,53.52171,10.023056,53.528653">Veddel</.m> wurde zwar überarbeitet, dann allerdings mit einer Bettelampel ausgestattet – unverständlich. Im weiteren Verlauf schleicht man vor allem hinter Autos auf Parkplatzsuche.</p>
    <p>In <.m bounds="10.021538,53.51046,10.021538,53.51046">Niedergeorgswerder</.m> und <.m bounds="10.014801,53.487806,10.014801,53.487806">Kirchdorf</.m> findet man noch alte Radwege, d.h. je nach Platz mal breit, mal schmal, aber eher ruppiger Oberfläche. Vor allem die Führung in der <.m bounds="10.007853,53.484021,10.027401,53.503764">Kirchdorfer Straße</.m> ist verwirrend: Ursprünglich war dort ein Zweirichtungsradweg mit Benutzungspflicht, die mittlerweile aufgehoben wurde. Je nachdem wo man auf die Schilder schaut darf man manchmal den Weg noch Richtung Norden benutzen, manchmal nicht. Auf der Straße fühlt man sich bei 50 km/h und hohem Autoverkehr auch nicht wirklich wohl.</p>
    <p>In <.m bounds="9.980139,53.456222,9.991336,53.464978">Harburg</.m> geht es im Wesentlichen auf alten und durchwachsenen Radwegen weiter: Die Unterführung am <.m bounds="9.980501,53.46337,9.983138,53.464867">electrum Museum</.m> muss man erst mal finden und dann zeichnet sie sich durch enge Kurven aus. Das ist im Wesentlichen auch für die zwei anderen Unterführungen im weiteren Verlauf so. Die <.m bounds="9.716988,53.457894,9.988781,53.520317">Buxtehuder Straße</.m> bzw. später die <.m bounds="9.806636,53.464579,9.9165,53.472814">Cuxhavener Straße</.m> sind wichtige Autoverbindungen. Das die Bettelampeln zum Queren teils zwei Minuten(!) Wartezeit haben ist dennoch inakzeptabel und dürfte zu einer hohen Quote Geisterradler beitragen.</p>
    <p>Übrigens: Das kurze Stück in der <.m bounds="9.962631,53.466636,9.972555,53.470204">Unterelbestraße</.m> ist noch <em>echtes</em> Kopfsteinpflaster – und entsprechend unangenehm.</p>
    <p>Zusammenfassend: Veloroute 10 hat überwiegend noch akzeptable Teile, viele schlechte Stellen und wenig Gute. Neueinsteiger suchen sich besser eine andere Route, bevor sie über das Fahrrad als Verkehrsmittel im Alltag urteilen.</p>
    <p><.a href="https://www.abendblatt.de/hamburg/article215567451/Der-Sprung-ueber-die-Elbe-hier-wird-er-zur-Mutprobe.html">Zeitungsartikel/Review vom 15.10.2018</.a></p>
    """
  end
end
