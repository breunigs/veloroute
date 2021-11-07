defmodule Data.Article.Blog.ImmenhoevenFoorthkamp do
  use Article.Default

  def name(), do: "#{created_at()}-4-immenhoeven-foorthkamp"
  def created_at(), do: ~D[2018-12-29]

  def title(), do: "Immenhöven und Foorthkamp (Veloroute 4)"

  def type(), do: :finished

  def tags(), do: ["4"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Der Radverkehrsführung um die U-Bahn Station <.m bounds="10.017415,53.66076,10.017572,53.660976">Langenhorn Nord</.m> mangelt es vor allem an Klarheit. Dies soll ab Sommer 2019 durch im Wesentlichen Markierungsarbeiten behoben werden: Der <.m bounds="10.004155,53.656588,10.018239,53.661441">Foorthkamp</.m> bzw. die <.m bounds="10.018239,53.660279,10.025887,53.661753">Immenhöven</.m> erhalten durchgehende Schutzstreifen (gestrichelete Linie) von ca. 1,50m Breite, beginnend im Westen ab dem <.m bounds="10.015623,53.654603,10.01627,53.660687">Diekmoorweg</.m> bis zur Kreuzung mit der <.m bounds="10.012524,53.646179,10.037518,53.688708">Tangstedter Landstraße</.m>. Ausnahme: im Brückenbereich soll der Radverkehr auf ein kurzes Stück Hochbordradweg geleitet werden, damit man direkt zu den Abstellanlagen der U-Bahn Station fahren kann.</p> <p>Im Bereich der Veloroute ändert sich die Führung im <.m bounds="10.018239,53.661409,10.021276,53.669524">Laukamp</.m>: Stadtauswärts wird ein Radfahrstreifen eingerichtet und man erhält gegenüber dem nördlichen Teil der Immenhöven Vorfahrt. Stadteinwärts und an der Einmündung des <.m bounds="10.017453,53.654852,10.018842,53.661378">Borner Stieg</.m> bleibt alles wie bisher. Auch die Einbahnregelungen bleiben so wie im Bestand.</p> <p>Es ist schade, das man die Vorfahrt nicht konsequent entlag der Veloroute angepasst hat, sodass jeweils das Linksabbiegen die <.m bounds="10.018239,53.660279,10.025887,53.661753">Immenhöven</.m> ein Abbremsen erfordert. Da die Verkehrszahlen aber gering sind, insbesondere auch die des Radverkehrs, ist dies aber zu verschmerzen.</p> <p><.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1007798">Erläuterungsbericht und Lagepläne</.a> (unter Anlagen)</p>
    """
  end
end
