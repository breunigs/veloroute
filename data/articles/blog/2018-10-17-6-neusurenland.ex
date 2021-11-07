defmodule Data.Article.Blog.Neusurenland do
  use Article.Default

  def name(), do: "#{created_at()}-6-neusurenland"
  def created_at(), do: ~D[2018-10-17]

  def title(), do: "Neusurenland (Veloroute 6)"

  def start(), do: ~d[2020-06-22]
  def stop(), do: ~d[2021-04-09]

  def type(), do: :finished
  def construction_site_id_hh(), do: [8311]
  def tags(), do: ["6", "w19"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Aktuell ist die Führung der Veloroute 6 auf dem <.m bounds="10.098,53.613146,10.123548,53.617024">Neusurenland</.m> unbrauchbar: stadtauswärts endet der Radweg einfach in der Bushaltestelle und in der Gegenrichtung kann man gar nicht ordentlich auf den Radweg auffahren, weil sich die Busbucht davor befindet.</p> <p>Die Neuplanung sieht stadtauswärts einen Schutzstreifen in Minimalausführung vor, in der Gegenrichtung bleibt es beim Radweg, der aber etwas verbreitert wird. Die größte Änderung ist die Versetzung der Bushaltestellen hinter die Einmündungen vom <.m bounds="9.99617,53.613746,10.12261,53.711397">Hermelinweg</.m> und <.m bounds="10.115823,53.616185,10.121817,53.622506">An der Berner Au</.m>, was die Konflikte etwas entschärft.</p> <p>Der große Wurf ist die Planung nicht: Im Kurvenbereich wird der „neue“ Radweg ebenfalls nur 1,75m breit, weil man den KFZ nicht mehr Platz nehmen möchte. Der Schutzstreifen ist inkl. Markierung und Kanalrinne nur 1,50m breit, was zwar den Vorgaben entspricht, an dieser Stelle aber auch nicht wirklich einladend wirkt. Auch wenn man jetzt erstmals von <.m bounds="10.115823,53.616185,10.121817,53.622506">An der Berner Au</.m> auf den Radweg im <.m bounds="10.098,53.613146,10.123548,53.617024">Neusurenland</.m> auffahren kann, muss man entweder eine „S-Kurve“ beim Queren der Straße nehmen oder mit einem kleinen Kurvenradius am Anfang des Radweges leben. Beides senkt die Geschwindigkeit etwas. Die Planung behebt alle kritischen Punkte, wenn auch nur die Mindestanforderungen umgesetzt werden.</p> <p>In den aktuellen Unterlagen wird noch kein Zeitraum für die Umsetzung genannt. Zur Einmündung in den Berner Heerweg siehe <.a href="/article/2019-03-19-6-berner-heerweg">Berner Heerweg (Abschnitt W18)</.a>.</p> <p><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1008836">Erläuterungsbericht zur Umgestaltung mit vorläufigem Lageplan</.a> (unter Anlagen)<br><.a href="https://www.hamburg.de/wandsbek/strassenbaustellen/14296884/">Infoseite der Stadt zur Baustelle</.a></p>
    """
  end
end
