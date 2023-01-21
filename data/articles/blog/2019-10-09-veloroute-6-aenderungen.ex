defmodule Data.Article.Blog.Veloroute6Aenderungen do
  use Article.Default

  def created_at(), do: ~D[2019-10-09]

  def title(), do: "Verbesserungen Veloroute 6 von Mitte 2018 bis Mitte 2019"

  def type(), do: nil

  def tags(), do: ["6"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Von ca. Mitte 2018 bis Mitte 2019 hat sich an der <.a name="alltagsroute-6">Veloroute 6</.a> einiges getan.</p>
    <p>Da sie zu Beginn gleich der Veloroute 5 verläuft, fällt auch hier die geänderte Führung <.m bounds="10.002414,53.555645,10.013376,53.562173">An der Alster</.m> auf – man fährt nun auf der ampelfreien Nebenstraße. Im Vergleich zum alten Radweg, der mittlerweile abgerissen wurde, ist diese Zwischenlösung eine deutliche Verbesserung – entfallen doch zwei in der Regel lange Rotphasen und sinnvoll Überholen ist jetzt auch drin. Idealerweise sollte die Straße noch als Fahrradstraße ausgewiesen werden, um ihre neue Rolle zu verdeutlichen.</p>
    <p>Etwas später, bei der <.m bounds="10.020861,53.565241,10.023601,53.566873">Hartwicusstraße</.m> ist dies schon passiert – sie wurde zu einer Fahrradstraße. Leider sind die Pfeile an den Fahrrad-Piktogrammen nicht an der Veloroute orientiert, sodass man etwa <.m bounds="10.022178,53.565225,10.024918,53.566857">die Abfahrt vor der Kuhmühlenbrücke</.m> leicht verpassen kann. Dies sollte mit den geplanten durchgängigen Markierungen für alle Velorouten aber besser werden – allerdings frühestens 2021.</p>
    <p>Da auf dem Immenhof regelmäßig Markt stattfindet, hat die Stadt fest Umleitungsschilder installiert, die alle gut verständlich sind (<.m bounds="10.028018,53.565245,10.0335,53.568509">stadtauswärts</.m>, stadteinwärts <.m bounds="10.028018,53.565245,10.0335,53.568509">vor</.m> und <.m bounds="10.028018,53.565245,10.0335,53.568509">nach</.m> der Kreuzung). Die Umleitung stadteinwärts ist deutlich größer als in der Gegenrichtung, aber gut befahrbar und leicht zu finden. Mir ist nicht klar, warum man nicht einfach hier die Veloroute ausgebaut hat – die beiden Seiten nehmen sich sonst nicht so viel.</p>
    <p>Direkt im Anschluss ermöglicht die nun fertiggestellte <.m bounds="10.028298,53.565293,10.03378,53.568557">Ampel ein sicheres Queren des Lerchenfelds</.m>. Bei den darauffolgenden Kreuzungen mit <.m bounds="10.035645,53.568952,10.041127,53.572216">Richardstraße</.m> und <.m bounds="10.035645,53.568952,10.041127,53.572216">Wagnerstraße</.m> sieht man die Änderungen dagegen nicht, man spürt sie nur: Die naheliegenden Fuß-Ampeln schalten tagsüber nun automatisch und geben dem Fußverkehr auch ohne Betteln grün. Als Nebeneffekt entstehen Lücken im zu kreuzenden KFZ-Fluss, sodass man auf der Veloroute nun schneller vorankommt. Der <.a href="https://web.archive.org/web/20201001010812/https://hamburg.adfc.de/news/veloroute-6-verbesserung-an-den-ampeln-richardstrasse-und-wagnerstrasse/">ADFC hat weitere Details</.a> dazu.</p>
    <p>Auch bei der Kreuzung mit der <.m bounds="10.063311,53.577668,10.074273,53.584196">Nordschleswiger Straße</.m> tut sich etwas. Stadteinwärts musste hier bisher eine Bettelampel betätigt werden, um kreuzen zu dürfen. Momentan wird noch gebaut, aber laut Plan teilen sich Rad- und KFZ Verkehr hier künftig die Spuren. Die Führung wäre stadteinwärts dann genauso, wie sie auch stadtauswärts bisher war.</p>
    <p>Kurz vorm Ende (oder Anfang) der Veloroute gab es noch zwei weitere Änderungen: zum einen erhielt der <.m bounds="10.142534,53.637025,10.15915,53.646921">Haselkamp</.m> einen neuen Asphaltbelag. Am Alten gab es bereits wenig auszusetzen, aber der Neue ist momentan makellos. Direkt danach, in der <.m bounds="10.142534,53.637102,10.15915,53.646998">Schemmannstraße</.m>, wurde die Verkehrsberuhigung überarbeitet. Statt den Radverkehr zwischen Verkehrsinsel und Randstein zu leiten, bleibt dieser jetzt in der Straßenmitte. Somit bleibt den Radfahrenden Platz wenn etwa Laub oder Stöcken ausgewichen werden muss, ohne „überraschend“ für den Autoverkehr links an der Verkehrsinsel vorbeizufahren. Auch suggeriert diese Führung nicht, das hier problemlos überholt werden kann – was sonst den Radverkehr ggf. ausbremsen kann.</p>
    <p>Wenn ich etwas übersehen habe, <.mailto>schreib mir</.mailto> bitte. Die Bilder sind ca. Juli 2019 entstanden.</p>
    """
  end
end
