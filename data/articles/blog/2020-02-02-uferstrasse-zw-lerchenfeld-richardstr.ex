defmodule Data.Article.Blog.UferstrasseZwLerchenfeldRichardstr do
  use Article.Default

  def name(), do: "#{created_at()}-uferstrasse-zw-lerchenfeld-richardstr"
  def created_at(), do: ~D[2020-02-02]

  def title(), do: "Uferstraße (Zwischen Lerchenfeld und Richardstraße Veloroute 6)"

  def type(), do: :planned

  def tags(), do: ["6"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Dieses Teilstück der Uferstraße zeichnet sich durch hohen Fuß- und Radverkehr aus. KFZ sind kaum vorhanden und dürfen hier auch meist gar nicht fahren. Problematisch sind vor allem der unebene Straßenbelag und der viel zu schmale und gemischte Rad- und Fußweg.</p> <p>Der vorliegende erste Entwurf sieht daher eine durchgängige Fahrradstraße vor, die meist mit 4m Breite gebaut wird. Nur an einer Engstelle wird sie auf 3m reduziert um Bäume erhalten zu können. Die Gehwege auf beiden Seiten werden befestigt und fallen mit meist 2,50m auch brauchbar breit aus – der Platzgewinn für den Radverkehr wird hauptsächlich aus den Grünflächen gewonnen. Die Fahrradstraße wird in Asphalt ausgeführt und ist gegenüber der <.a href="/6#18.08/53.568137/10.03302/3MT8msUl4xfFzceBg4JX4g">Finkenau</.a> vorfahrtsberechtigt.</p> <p>Eine kniffelige Stelle ist die Führung über die <.a href="/6#18/53.569807/10.036601/THzcLXuVjAdkes6HhC9IXA">Richardstraße</.a>, an der der Fußverkehr Vorrang hat. Die Planunug lässt die Fahrradstraße vorher enden und richtet einen kleinen Aufstellbereich zwischen Gehweg und Radfahrstreifen auf der Richardstraße ein. Taktile Bodenindikatoren säumen den durchgängigen Fußweg und sollen verdeutlichen, das der Radverkehr gegenüber zu Fuß Gehenden wartepflichtig ist.</p> <p>Die Fußampel rückt näher an die Querung heran und erhält zwei Haltelinien für KFZ. Vor der Ampel und zusätzlich vor der Kreuzung mit der Uferstraße, damit die KFZ die Veloroute bei Rot freihalten. Die Ampelschaltung wurde bereits vor einiger Zeit angepasst um dem Radverkehr Lücken zum Queren zu schaffen (siehe <.a href="https://web.archive.org/web/20201001010812/https://hamburg.adfc.de/news/veloroute-6-verbesserung-an-den-ampeln-richardstrasse-und-wagnerstrasse/" target="_blank">Artikel des ADFC</.a>), die zweite Haltelinie aber bisher abgelehnt.</p> <p>Die Fahrradstraße selbst wirkt gelungen und sollte den Komfort für Rad und Fußverkehr erhöhen. Die Querung der Richardstraße bleibt hingegen kompliziert. Die kleine Aufstellfläche zwischen Fußweg und Fahrspuren verhindert jeweils die Sicht auf eines der beiden, wenn Radfahrende dort warten. Ähnlich verhält es sich mit wartenden KFZ bei roter Ampel. Da unklar ist wann die Ampel die Richardstraße wieder freigibt, wird der Radverkehr angehalten die Kreuzung eher schnell zu passieren. Ich zweifle ob hier jeder ausreichend auf den Fußweg achtet. Eine vollwertige Ampel wie bei der <.a href="/6#17/53.567678/10.031033/PDtm7ol4rT2XWyVEhsIDMQ">Kreuzung mit dem Lerchenfeld</.a> wurde verworfen, weil man von häufiger Missachtung wegen der dichten Ampelfolge ausging. </p> <p>
    <.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1009173">Erläuterungen und Lagepläne zum ersten Entwurf</.a>
    </p>
    """
  end
end
