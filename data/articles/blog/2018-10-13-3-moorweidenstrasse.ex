defmodule Data.Article.Blog.Moorweidenstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-3-moorweidenstrasse"
  def created_at(), do: ~D[2018-10-13]

  def title(), do: "Moorweidenstraße (Veloroute 3)"

  def start(), do: ~d[2019Q3]

  def type(), do: :finished

  def tags(), do: [3]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die <.m bounds="9.985703,53.563735,9.993431,53.564192">Moorweidenstraße</.m> soll erneuert werden. Die Ausgestaltung bleibt im Wesentlichen so wie jetzt, aber die Parkplätze werden neu gefasst und die Straße asphaliert. Der Mischverkehr bleibt bestehen.</p> <p>Das Teilstück auf der <.m bounds="9.988395,53.56121,9.990183,53.581293">Rothenbaumchaussee</.m> ist je nach Fahrtrichtung unterschiedlich. Stadtauswärts gibt es ab dem <.m bounds="9.98985,53.560534,9.99089,53.561493">Theodor-Heuss-Platz</.m> einen durchgängigen Radfahrstreifen mit 1,65m Breite, wobei die Kanalrinne und die Markierung noch etwas mehr Platz verschaffen. Im Kreuzungsbereich wird direktes Linksabbiegen in die Moorweidenstraße ermöglicht und den AutofahrerInnen durch Piktogramme verdeutlicht. Zusätzlich wird es eine Aufstelltasche für indirektes Linksabbiegen geben, die wohl ohne eigene Ampel auskommen muss – unerfahrene Radfahrende orientieren sich dann an der Fußampel.</p> <p>In der Gegenrichtung kann man sich aus der <.m bounds="9.985703,53.563735,9.993431,53.564192">Moorweidenstraße</.m> kommend nicht mehr an der Ampel vorbeimogeln und muss warten. Danach hat man die Möglichkeit auf den alten Radweg zu wechseln oder im Mischverkehr auf der Straße weiterzufahren, was durch ein kurzes Stück Schutzstreifen angedeutet wird. Der Radweg bleibt wie jetzt bei 2,0m Breite. Kurz vor der Kreuzung am <.m bounds="9.98985,53.560534,9.99089,53.561493">Theodor-Heuss-Platz</.m> erhalten Radfahrende die sich vorher für die Straße entschieden haben nochmal eine Möglichkeit auf den Radweg zu wechseln und so die Straße zu queren.</p> <p>Die Richtungen die nicht der Veloroute folgen erhalten an der Kreuzung eine Anpassung an die neuen Gegebenheiten: Stadteinwärts entlang der <.m bounds="9.988395,53.56121,9.990183,53.581293">Rothenbaumchaussee</.m> gibt's kurz vor der Kreuzung ein Stück Radfahrstreifen und in der Gegenrichtung kurz nach der Kreuzung einen Schutzstreifen, wobei man wieder die Wahl hat auf dem existierenden Radweg oder der Straße im Mischverkehr weiterzufahren.</p> <p>Der Umbau ist ab Sommer 2019 vorgesehen.</p> <ul>
    <li><.a href="https://www.hamburg.de/eimsbuettel/schlueterstrasse/">Infoseite der Stadt zur Schlüterstraße und dem Teilstück in der Rothenbaumchaussee</.a></li>
    <li><.a href="https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1004339">vorläufiger Lageplan</.a></li>
    </ul>
    """
  end
end
