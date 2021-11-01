defmodule Data.Article.Blog.AmLuisenhof do
  use Article.Default

  def name(), do: "#{created_at()}-am-luisenhof"
  def created_at(), do: ~D[2021-05-22]

  def title(), do: "Am Luisenhof"

  def start(), do: ~d[2023]

  def type(), do: :planned

  def tags(), do: []

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Der Radverkehr wird auf <ref>Hochbordradwegen</ref> unterschiedlicher Breiten, Oberflächen und Ebenheiten geführt.</p>
    <h4>Planung</h4> <p>Im Zuge der Busbeschleunigung werden am Luisenhof Warteflächen für Busse angelegt. Der <ref>Hochbordradweg</ref> im Süden bleibt in seiner Lage im Wesentlichen gleich, wird aber auf 2,0m verbreitert. Der Radweg auf der Nordseite wird ebenfalls so breit, in seinem Verlauf aber deutlich nach Norden verschoben. Dies gilt analog auch für die Fußwege, die auf rund 2,65m verbreitert werden.</p>
    <p>Die <.m bounds="10.112885,53.606964,10.115808,53.608041">Einmündung des Bramfelder Weges</.m> wird mit einer Ampel ausgestattet. Zum Queren des Luisenhof ist auf der Ostseite eine kombinierte Rad/Fußfurt mit Mittelinsel vorgesehen. Auf der Westseite ist dagegen nur eine Radampel geplant; die zu querende Strecke ist hier deutlich länger und ohne Mittelinsel. Die Querung des Bramfelder Weges selbst erfolgt geradliniger als heute.</p>
    <h4>Meinung</h4> <p>Der erste Entwurf enthält noch einige Planungsfehler, etwa das manche Ampeln ohne Fahrrad-Piktogramme daherkommen, obwohl diese sehr wahrscheinlich auch für den Radverkehr gedacht sind. Insgesamt ist die Planung aber gut. Die Breite und Führung der neuen Radwege ist ansprechend. Konflikte mit anderen Verkehrsarten bleiben wie bisher minimal, bzw. werden sogar geringer weil alle genug Verkehrsfläche bekommen.</p>
    <h4>Quelle</h4> <ul>
    <li><.a href="https://via-bus.hamburg.de/contentblob/15281608/d1cae26dbce99ad0e8ffb5c9b2a774a6/data/01-mb26-u-farmsen-erste-verschickung.pdf">Erläuterungsbericht des zweiten Entwurfs</.a></li>
    <li><.a href="https://via-bus.hamburg.de/contentblob/15281612/e19c11e020c6d864beb80869581424a0/data/02-mb26-u-farmsen-erste-verschickung-ueberarbeiteter-lageplan-ueberliegerplaetze.pdf">Lageplan des zweiten Entwurfs</.a></li>
    </ul>
    """
  end
end
