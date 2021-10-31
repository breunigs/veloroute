defmodule Data.Article.Blog.RahlstedterBahnhofstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-7-rahlstedter-bahnhofstrasse"
  def created_at(), do: ~D[2018-10-21]

  def title(), do: "Rahlstedter Bahnhofstraße (Veloroute 7, Abschnitt W27)"

  def start(), do: ~d[2021-04-12]
  def stop(), do: ~d[2021-11-30]

  def type(), do: :construction
  def construction_site_id_hh(), do: [15097]
  def tags(), do: [7, "w27"]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die <.m bounds="10.151449,53.598702,10.155432,53.605196">Rahlstedter Bahnhofstraße</.m> zwischen <.m bounds="10.130026,53.599606,10.151909,53.600756">Scharbeutzer Straße</.m> und <.m bounds="10.152454,53.596018,10.164817,53.603916">Amtsstraße</.m> ist momentan vor allem für den Autoverkehr ausgelegt. Stadteinwärts ist die Radverkehrsführung nur ein kurzes Stück vorhanden und es gibt keine klare Führung wie weitergefahren werden soll. In der Gegenrichtung ist der vorhandene Radweg zwar etwas länger, fängt aber genauso unvermittelt an.</p> <p>In der vorliegenden Planung soll der Radverkehr künftig zwischen <.m bounds="10.15235,53.601441,10.154041,53.601572">Merowingerweg</.m> und <.m bounds="10.152454,53.596018,10.164817,53.603916">Amtsstraße</.m> beidseitig auf 1,80m breiten Schutzstreifen (gestrichelte Linie) geführt werden. Die Kreuzung mit der <.m bounds="10.152454,53.596018,10.164817,53.603916">Amtsstraße</.m> wird nicht umgebaut, aber es gibt stadtauswärts einen Aufstellbereich vor den Autos. Das freie Rechtsabbiegen entfällt aber.</p> <p>Das Teilstück stadteinwärts ab dem <.m bounds="10.15235,53.601441,10.154041,53.601572">Merowingerweg</.m> ist etwas komplizierter: Richtung Innenstadt wird die Veloroute 7 künftig durch die <.m bounds="10.153955,53.599922,10.156185,53.601382">Wilhelm-Grimm-Straße</.m> und in der <.m bounds="10.13773,53.575625,10.197788,53.606086">Rahlstedter Straße</.m> auf den Radfahrstreifen geleitet. Dafür wird an dieser Stelle eine eigene Linksabbiegerspur eingerichtet. Die Alternative wäre im Mischverkehr (keine eigenen Radspuren) auf der <.m bounds="10.151449,53.598702,10.155432,53.605196">Rahlstedter Bahnhofstraße</.m> zu verbleiben und dann erst an der Ampel links abzubiegen.</p> <p>Richtung Rahlstedt Bahnhof gibt es auch einen Schutzstreifen, der hier allerdings nur 1,50m breit ist. Die Vorbeiführung an der Ampel an der <.m bounds="10.130026,53.599606,10.151909,53.600756">Scharbeutzer Straße</.m> bleibt.</p> <p>Unterm Strich wirkt die Planung ausgewogen: die durchgängige Radverkehrsführung ist viel besser als das heutige Stückwerk, auch wenn der Platz nur für Schutzstreifen reicht. Immerhin bleibt die Anzahl der Parkplätze gleich, sodass dieser nicht zugeparkt wird. Die Führung durch die weniger befahrene <.m bounds="10.153955,53.599922,10.156185,53.601382">Wilhelm-Grimm-Straße</.m> ist angesichts des Platzmangels eine gute Lösung.</p> <p>Umgebaut werden soll im Sommer 2019.</p> <ul> <li><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1009129">Erläuterungsbericht zur Umgestaltung mit vorläufigem Lageplan</.a> (2018, unter Anlagen)</li> <li><.a href="https://suche.transparenz.hamburg.de/dataset/8d6a7602-e3d5-4564-a950-b4b3e6238d24">Bauvertrag</.a> (November 2020)</li> <li><.a href="https://www.hamburg.de/wandsbek/strassenbaustellen/14989182/rahlstedter-bahnhofstrasse/">Baustellen Info</.a></li> </ul>
    """
  end
end
