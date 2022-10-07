defmodule Data.Article.Blog.UferstrasseZwLerchenfeldRichardstr do
  use Article.Default

  def updated_at(), do: ~D[2022-10-06]

  def title(), do: "Uferstraße (Lerchenfeld bis Richardstraße; Alltagsroute 6 und Wandseradweg)"

  def summary(),
    do:
      "Mehr Platz und bessere Oberflächen im Planungsabschnitt. Fahrradstraße leider nicht mehr durchgängig."

  def type(), do: :planned
  def start(), do: ~d[2023Q2]

  def tags(), do: ["6"]

  def links(_assigns) do
    [
      {"Fertige Planung", "2022",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1012181"},
      {"1. Entwurf", "2020, veraltet",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1009173"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Oktober 2022</h4>
    <p>Für einen Teilabschnitt liegt die abgeschlossene Planung vor, der Artikel wurde entsprechend überarbeitet.</p>

    <h4>Alter Zustand</h4>
    <p>Die Uferstraße wird im Abschnitt vom Rad- und Fußverkehr dominiert. Lediglich auf einem <.m bounds="10.029847,53.566372,10.038941,53.570645" lon={10.033246} lat={53.567736} dir="forward" ref="6">Teilstück</.m> sind KFZ sind zugelassen, die dort nur die anliegenden Gebäude bzw. Parkplätze erreichen können – eine Durchfahrt ist nicht möglich. Im gesamten Planungsgebiet teilen sich alle Verkehrsarten den verfügbaren Platz. Das Pflaster im gesamten Abschnitt ist eher uneben.</p>

    <h4>Planung</h4>
    <p>Bis zur Einmündung <.m bounds="10.031237,53.567264,10.035161,53.569063" lon={10.033542} lat={53.567906} dir="forward" ref="6">Finkenau</.m> soll eine gut 4,5m breite, asphaltierte Fahrradstraße entstehen. Die KFZ-Parkplätze werden längs ausgerichtet, um Gefährdungen beim Ausparken zu verringern. Die Fahrradstraße erhält gegenüber der Finkenau Vorfahrt.</p>

    <p>Im Anschluss schließt ein 4,0m breiter, gepflasteter Radweg an. Zum Baumerhalt <.m bounds="10.033556,53.568121,10.037134,53.569893" lon={10.035243} lat={53.568833} dir="forward" ref="6">verbleibt eine Engstelle</.m> mit 3,0m. Der Fußweg wird 2,5m bis 3,0m breit. Ursprünglich war eine durchgehende Asphaltierung angedacht, die aber wegen der stärkeren Versiegelung, den höheren Kosten bei Wurzelaufbrüchen und optischen Gründen („platzartigen Charakter … der stadträumlichen Gestaltung beibehalten“) abgelehnt wurde.</p>

    <p>Vor der <.m bounds="10.035655,53.568957,10.038308,53.570958" lon={10.037142} lat={53.569783} dir="forward" ref="6">Richardstraße</.m> endet der Radweg. Zur Fahrt entlang der Veloroute muss damit allem querenden Verkehr Vorrang gewährt werden, inklusive dem Fußverkehr. Die Poller werden in Richtung des <.ref>Radfahrstreifens</.ref> auf der Richardstraße verschoben.</p>

    <h5>Kreuzung mit der Richardstraße</h5>
    <p>Ursprünglich war diese ebenfalls Teil der Planung. Die Rückmeldungen von Ämtern und Vereinen machten jedoch eine Überarbeitung notwendig. Es fand sich keine vorteilhafte Variante, die auf die Kreuzung beschränkt bleibt. Um die Verbesserung der Uferstraße nicht weiter zu verzögern, entschied man sich die Kreuzung – und ggf. die Richardstraße – getrennt zu planen. Durch eine Änderung der Ampelschaltung wurden bereits vor einigen Jahren die Querungssituation für den Radverkehr verbessert (siehe <.a href="https://web.archive.org/web/20201001010812/https://hamburg.adfc.de/news/veloroute-6-verbesserung-an-den-ampeln-richardstrasse-und-wagnerstrasse/">Artikel des ADFC</.a>).</p>

    <h4>Meinung</h4>
    <p>Die Planung wird die Situation verbessern – besserer Belag und mehr Platz. Dass man die Fahrradstraße nicht durchgängig macht enttäuscht. Pflaster ist weniger komfortabel, zudem wird die fehlende optische Trennung eher zu unabsichtlichem Betreten führen. Die Stadt beugt Konflikten hier weniger vor als sie könnte.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
