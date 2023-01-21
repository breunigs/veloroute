defmodule Data.Article.Blog.Veloroute2Aenderungen do
  use Article.Default

  def created_at(), do: ~D[2019-08-26]

  def title(), do: "Verbesserungen Veloroute 2 von Mitte 2018 bis Mitte 2019"

  def type(), do: nil

  def tags(), do: ["2"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die <.a name="alltagsroute-2">Veloroute 2</.a> war auch vor einem Jahr brauchbar, hat gerade im Innenstadtbereich aber nochmals erheblich zugelegt. Die Anpassungen sind alle sinnvoll, eine Verschlimmbesserung oder gar Verschlechterung gibt es dabei nicht. Allerdings bleiben die Maßnahmen teils unter den Erwartungen, etwa wenn Kopfsteinpflaster durch geringfügig besseres Kopfsteinpflaster ersetzt wird.</p>
    <p><strong><.m bounds="9.982079,53.548293,9.989831,53.552909">Rödingsmarkt / Stadthausbrücke / Axel-Springer-Platz:</.m></strong> Vor einem Jahr wurde hier noch umgebaut, jetzt sind die Kreuzungen größtenteils fertig. Es gibt durchgehende Radfahrstreifen entlang der Strecke und in den Kreuzungen ist die Radverkehrsführung deutlich eingezeichnet. Am Axel-Springer-Platz ist das indirekte abbiegen Richtung Kaiser-Wilhelm-Allee allerdings etwas gewöhnungsbedürftig. Die Möglichkeit links in die Düsternstraße einzubiegen ist gelungen.</p>
    <p><strong><.m bounds="9.956225,53.561606,9.971727,53.570838">Sternschanze (Lagerstraße bis Weidenallee):</.m></strong> In diesem Abschnitt ist ein ganzes Maßnahmenpaket fertig geworden. Die <.m bounds="9.965762,53.561312,9.968502,53.562944">Lagerstraße</.m> hat Schutzstreifen (gestrichelte Linie, Park- aber kein Halteverbot für KFZ) erhalten, deren Platz durch Abschaffung der Abbiegespuren erreicht wurden. An der Einmündung in die Schanzenstraße regelt jetzt ein Kreisel die Vorfahrt – viel besser als die Ampel zuvor. Auf der <.m bounds="9.962701,53.562042,9.968783,53.565664">Schanzenstraße</.m> selbst schließen gute Radfahrstreifen (durchgezogene Linie, Halteverbot) an, die auch <.m bounds="9.96246,53.564319,9.968542,53.567941">an der Kreuzung zur Weidenallee</.m> eine klare Führung bieten. Früher wurde der Radverkehr auf zu schmalen Hochbordradwegen neben der Außengastronomie und den vielen Zufußgehenden geführt, was sehr konfliktreich war. In der <.m bounds="9.961101,53.566783,9.967183,53.570405">Weidenallee</.m> verhält es sich ähnlich, allerdings hat es hier nur zu Schutzstreifen gereicht.</p>
    <p><strong><.m bounds="9.961101,53.566783,9.967183,53.570405">Kreuzung Christuskirche:</.m></strong> Die deutlichste Verbesserung ist Richtung Eimsbüttel spürbar: man kann nun direkt von der Weidenallee in den Weidenstieg fahren. Zuvor musste man zwei Straßenzüge queren, nur um auf einen kaum nutzbaren Radweg zu landen, der dann im Nichts endete. In der Gegenrichtung ist das leider nicht gelungen, da man hier weiterhin an der Bellealliancestraße warten muss. Der Hauptgewinn ist hier, das die Führung nun klar verständlich ist und auch an Aufstelle/Wartebereiche vor der Ampel gedacht wurde. Vor einem Jahr musste man hier noch „irgendwie quer“ über eine Verkehrsinsel um danach Slalom um die Masten und Poller zu fahren.</p>
    <p><strong><.m bounds="9.957182,53.569541,9.962664,53.572805">Weidenstieg und Tornquiststraße:</.m></strong> Der Umbau ist noch nicht ganz abgeschlossen, aber die Tendenz ist erkennbar. Vorher unbrauchbares Kopfsteinpflaster und im Nichts endende bzw. beginnende Radwege. Der Weidenstieg wirkt ab Christuskirche heute dagegen sehr aufgeräumt und der Durchgangsverkehr Richtung Eimsbüttel ist auch unterbunden. Im zweiten Abschnitt wird das Kopfsteinpflaster noch erneuert, in der <.m bounds="9.957107,53.571425,9.959847,53.573057">Tornquiststraße</.m> kann man es schon testen. Noch ist es halbwegs eben, aber nach wenigen Jahren wird es genauso unbrauchbar wie das Alte (siehe etwa Lombardsbrücke an der Binnenalster). Die <.m bounds="9.95633,53.571605,9.95907,53.573237">Querung des Doormannwegs</.m> erfordert nun keinen umständlichen Schlenker mehr – sehr gut – aber den Bettelknopf stadtauswärts hat man immer noch – schade.</p>
    <p><strong><.m bounds="9.95097,53.572859,9.95371,53.574491">Tornquiststraße:</.m></strong> Der autofreie Teil wurde von 2,5m auf 4,0m verbreitert. Nebeneinanderfahren oder Überholen ist auf diesem Teilstück jetzt also problemlos möglich.</p>
    <p><strong><.m bounds="9.946331,53.572414,9.951813,53.575678">Querung Heußweg:</.m></strong> Vor dem Umbau war die Querung schwierig, da die leichte Kurve des Heußweg die Einsicht verschlechterte. Kombiniert mit hohen KFZ-Geschwindigkeiten musste man hier eine Lücke gut abpassen. Mit dem neu gebauten Kreisel sind beide Probleme gelöst und man kommt viel häufiger rollend über den Heußweg.</p>
    <p><strong><.m bounds="9.91062,53.601812,9.91336,53.603444">Kieler Straße:</.m></strong> Die Querung der Kieler Straße ist nun deutlich geradliniger möglich – zumindest stadteinwärts. Auch in der Gegenrichtung wurde die Führung angepasst, sodass die Kurve nun weniger stark ausfällt. Zusätzlich hat der Radverkehr in dieser Richtung jetzt <.m bounds="9.91062,53.601812,9.91336,53.603444">einen eigenen Bettelknopf</.m>. Schade: stadteinwärts fehlt immer noch die Freigabe des Radwegs entgegen der normalen Fahrtrichtung. Streng genommen muss hier abgestiegen und geschoben werden, was angesicht des 3m breiten Radweg absurd erscheint.</p>
    <p>Zu guter letzt: es sind noch <.a name="bau">weitere Umbauten geplant</.a>, d.h. in einem weiteren Jahr sollte Veloroute 2 nochmal besser zu befahren sein. Wenn ich etwas vergessen habe, <.mailto>schreib mir</.mailto> bitte.</p>
    """
  end
end
