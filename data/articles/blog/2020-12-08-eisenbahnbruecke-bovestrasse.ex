defmodule Data.Article.Blog.EisenbahnbrueckeBovestrasse do
  use Article.Default

  def created_at(), do: ~D[2020-12-08]

  def title(), do: "Eisenbahnbrücke Bovestraße (Veloroute 7)"

  def start(), do: ~d[2020-12]

  def type(), do: :construction

  def tags(), do: ["7", "s4"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Der Radverkehr hat hier die Möglichkeit in Schrittgeschwindigkeit auf den 1,5m bis 2,0m breiten Fußwegen mitzufahren oder sich unter den Autoverkehr zu mischen. Keine der Möglichkeiten ist attraktiv.</p>
    <h4>Planung</h4> <p>Im Zuge der S4 wird die Eisenbahnbrücke über die Bovestraße verbreitert und eine S-Bahn-Haltestelle gebaut. Direkt unter der Brücke soll ein Umstieg zum Busnetz möglich werden, entsprechend werden hier beidseitig Bushaltestellen eingerichtet. Laut Plan ist vorgesehen pro Richtung ist jeweils eine Spur für jede Verkehrsart vorgesehen: KFZ, Rad, Bus und Fuß werden so getrennt. In die Busspur und Fußwege sind jeweils auch die Halte bzw. Warteflächen integriert. </p> <p>Kurious: wenige Meter entfernt plant der LSBG ebenfalls eine <.a href="/article/2020-05-31-heykenaubrook">Bushaltestelle in der Bovestraße</.a> einzurichten. Mir ist unklar, ob einer der beiden Pläne veraltet ist, oder ob die Haltestelle verlegt wird wenn die S4 fährt, oder ob beide Haltestellen erhalten bleiben.</p> <p>Der Umbau hat bereits begonnen. Zur Zeit ist eine Einbahnstraße Richtung Süden eingerichtet, wobei die Fahrtrichtung Innenstadt wohl zu einer Schiebestrecke über den Fußweg oder durch den Bahnhof Wandsbek wird.</p>
    <h4>Meinung</h4> <p>Eigene Radspuren klingt erstmal gut, aber wenn diese zwischen KFZ- und Busspur gezwängt werden ist dies wenig attraktiv. Ohne Pläne ist eine Beurteilung schwierig.</p>
    <h4>Quelle</h4> <p>
    <.a href="https://www.eba.bund.de/SharedDocs/Downloads/DE/PF/Beschluesse/Hamburg/51_Hamburg-BadOldesloe_S4_PFA_1.html">Planfeststellungsverfahren 1 S-Bahn Linie 4 Hamburg</.a> (Eisenbahnbundesamt)
    </p>
    """
  end
end
