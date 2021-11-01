defmodule Data.Article.Blog.Koenigstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-koenigstrasse"
  def created_at(), do: ~D[2020-12-04]

  def title(), do: "Königstraße (Veloroute 13)"

  def start(), do: ~d[2022Q4]
  def stop(), do: ~d[2023Q4]

  def type(), do: :planned

  def tags(), do: ["13"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Bestand</h4> <p>Die Königstraße wird bezogen auf die Veloroute nur Richtung Westen genutzt. Hier ergeben sich im Wesentlichen drei Abschnitte: die <.m bounds="9.947246,53.5484,9.94991,53.549603" lon="9.947896" lat="53.5491083" dir="backward">Kreuzung um die Kirchenstraße</.m> sowie <.m bounds="9.940406,53.546983,9.944712,53.548929" lon="9.9429891" lat="53.5482241" dir="forward">vor</.m> bzw. <.m bounds="9.939486,53.546928,9.943793,53.548873" lon="9.9401791" lat="53.5478972" dir="forward">nach</.m> dem Schleepark.</p> <p>In der Kreuzung sind zwar teilweise eigene Radwege vorhanden, die aber nicht aus allen Fahrtrichtungen gut zu erreichen sind. Kurz nach der Kreuzung enden diese, sodass man bis zur <.m bounds="9.939518,53.547279,9.945404,53.548643" lon="9.9419285" lat="53.5480872" dir="forward">Kreuzung am Schleepark</.m> mit dem Autoverkehr die Spur teilt. Danach schließen alte, schmale <ref name="hochbordradweg">Hochbordradwege</ref> an, die dann bis zur <.m bounds="9.933276,53.547405,9.939163,53.548769" lon="9.9365983" lat="53.5479089" dir="forward">Max-Brauer-Allee</.m> reichen. In der Gegenrichtung gibt es einen durchgehenden Radweg.</p>
    <h4>Planung</h4> <h5>Streckenabschnitte</h5> <p>Die Planung geht etwas über die Veloroute hinaus und schließt an die bereits umgebaute <.m bounds="9.951588,53.548804,9.956809,53.550984">Kreuzung mit der Reeperbahn</.m> an. Von dort an sollen für beide Fahrtrichtungen geschütze Radfahrstreifen eingerichtet werden. Diese werden durch rund 50cm breite Bordsteine oder Poller vom Autoverkehr abgetrennt. Die nutzbare Breite des Radfahrstreifen beträgt mindestens 2,10m, meist jedoch 2,50m. Die Trennung wird für Einfahrten, Bushaltestellen oder Parkplätze rechts des Radfahrstreifen regelmäßig unterbrochen, auch über weite Strecken.</p> <h5>Kreuzung um die Kirchenstraße</h5> <p>Die Fahrt in Richtung Altona stellt sich wie folgt dar: <.m bounds="9.946967,53.548149,9.950596,53.549664" lon="9.949425" lat="53.5486964" dir="forward">in der Kirchenstraße</.m> kann man sich zum Linksabbiegen vor den wartenden KFZ einordnen. Von dort fährt man auf den geschützten Radfahrstreifen und hat wie bisher eine <.m bounds="9.946945,53.548831,9.950137,53.54957" lon="9.9487235" lat="53.5490628" dir="forward">weitere Ampel an der Mörkenstraße</.m>. Über eine rot markierte Furt quert man diese und fährt kurz danach wieder auf einem geschützten Radfahrstreifen. Rechtsabbiegende KFZ und Geradeaus-Rad erhalten gleichzeitig grün. Man geht davon aus, das die geradlinige Führung im Knotenpunkt weitgehend ausreicht um problematische Situationen an dieser Stelle zu verhindern.</p> <p>In Fahrt Richtung Hafen fährt man <.m bounds="9.946346,53.548611,9.949576,53.54996" lon="9.9476595" lat="53.5491887" dir="backward">in der Mörkenstraße</.m> wie bisher im Mischverkehr. Neu ist, das eine Bushaltestelle kurz vor der Kreuzung eingerichtet wird. Eine Vorbeifahrt ist nicht legal möglich, da wartende Busse sich bereits an der Haltelinie zur Ampel befinden. Von dort geht es auf einer rot markierten, leicht gebogenen Furt quer über die Kreuzung. Vor der Kirchstraße gibt es eine weitere Ampel. Entlang der Veloroute soll ein „Grünpfeil“ eine Weiterfahrt ermöglichen. Wer dagegen Richtung Reeperbahn möchte muss hier nochmals halten. In der Kirchenstraße selbst gibt es noch ein kurzes Stück Radfahrstreifen mit rund 2,0m Breite. Dieser endet <.m bounds="9.947824,53.548238,9.951016,53.548978" lon="9.9493264" lat="53.548675" dir="backward">an einer Sperrfläche</.m> und erfordert das sich Radfahrende in den Mischverkehr einordnen.</p> <h5>Sonstiges</h5> <p>Die <.m bounds="9.946462,53.548729,9.949177,53.549863">Mörkenstraße in Richtung Große Bergstraße</.m> erhält ebenfalls einen geschützten Radfahrstreifen mit rund 2,10m Breite. Wo möglich wird <ref name="abbiegen">indirektes Linksabbiegen</ref> ermöglicht. Bei vorhandenen Einbahnstraßen wird darauf geachtet, dass der Radverkehr gut in Gegenrichtung fahren kann.</p> <p>Zwischen <.m bounds="9.944398,53.547732,9.94944,53.54936" lon="9.9493264" lat="53.548675" dir="forward">Elmenhorststraße und Kirchenstraße</.m> wird eine neue Schule gebaut. Dort wird eine extra Station für Eltern-Taxi eingerichtet und sonstige Stellen mittels einem Zaun gegen gefährliche Abholmanöver gesichert. Der breite Fußweg ist in diesem Bereich zusätzlich „<ref name="fahrrad-frei">Fahrrad frei</ref>“ um eine umwegfreie Fahrt von der Schule in Richtung Ottensen zu ermöglichen.</p> <p>Die KFZ-Fahrstreifen der Königstraße werden meist auf einen pro Fahrtrichtung reduziert. Teilweise war dies schon heute der Fall, da die rechte Fahrspur ausschließlich als KFZ-Parkplatz verwendet wurde. Ausnahme bleibt der Abschnitt ab der <.m bounds="9.947246,53.5484,9.94991,53.549603" lon="9.947896" lat="53.5491083" dir="backward">Kreuzung um die Kirchenstraße</.m> Richtung Reeperbahn: hier bleibt es bei zwei KFZ-Spuren.</p> <h5>Bauzeit</h5> <p>Geplant ist ab Sommer 2022 zu bauen und die Wartezeit bis dahin mit einem Popup-Radweg zu überbrücken. Dieser soll vom 27.09. bis 10.09.2021 eingerichtet werden.</p>
    <h4>Meinung</h4> <p>Die Lösung kann sich sehen lassen. Die durch den <.a href="https://radentscheid-hamburg.de/">Radentscheid Hamburg</.a> geforderte getrennte Führung des Radverkehrs findet hier Beachtung, auch wenn diese leider durch Längsparkplätze u.ä. über lange Strecken unterbrochen wird. Weitere Kritik bezieht sich vor allem auf Details. Etwa:</p> <ul>
    <li>die <.m bounds="9.947824,53.548238,9.951016,53.548978" lon="9.9493264" lat="53.548675" dir="backward">Übergangslösung in die Kirchenstraße</.m> überlässt es dem Einzelnen sich in den Mischverkehr einzuordnen. Hier sollte der Radverkehr entweder Vorfahrt oder sich zumindest gleichberechtigt einordnen dürfen.</li>
    <li>Die Eltern-Taxi Station erlaubt (zu) schnelle Ein- und Ausfahrten. Linksabbiegen ist zwar jeweils verboten, wird aber nicht durch einen Fahrbahntrenner sichergestellt. Eine bessere Variante wäre eine Einfahrt nur im 90° Winkel zu ermöglichen, um Schrittgeschwindigkeit zu erzwingen. Eine ähnliche Problemstelle gibt es bereits <.m bounds="9.951467,53.549043,9.953709,53.549978">an einer Tankstelle</.m>, die von einer ähnlichen Handhabung profitieren könnte.</li>
    <li>Im <.m bounds="9.947246,53.5484,9.94991,53.549603" lon="9.947896" lat="53.5491083" dir="backward">Kreuzungsbereich um die Kirchenstraße</.m> könnten weitere Verkehrsinseln verhindern, das der Autoverkehr die Wege des Radverkehrs schneidet.</li>
    <li>Die Situation beim KFZ-Rechtsabbiegen in die <.m bounds="9.94563,53.548527,9.949529,53.550155" lon="9.9486257" lat="53.5490439" dir="forward">Mörkenstraße</.m> stellt den KFZ-Fluss weiterhin über die Sicherheit des Radverkehrs.</li>
    </ul>
    <h4>Quelle</h4> <p>
    <.a href="https://lsbg.hamburg.de/contentblob/14709018/92aa529400e37c930df274ef190e69ab/data/vr-12-koenigstrasse-abstimmungsunterlage-plan-1.pdf">Lageplan 1</.a> (Max-Brauer-Allee bis Elmenhorststraße)<br>
    <.a href="https://lsbg.hamburg.de/contentblob/14709020/bca1d90a258782db6e8711831aafe311/data/vr-12-koenigstrasse-abstimmungsunterlage-plan-2.pdf">Lageplan 2</.a> (Elmenhorststraße bis Reeperbahn)<br>
    <.a href="https://lsbg.hamburg.de/contentblob/14709016/c7c3b200a22adcb1e70a84325e6b54d6/data/vr-12-koenigstrasse-abstimmungsunterlage-bericht.pdf">Erläuterungsbericht des LSBG</.a>
    <.a href="https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1011737">Details zum Vorabradweg (Popup-Radweg)</.a>
    </p>
    """
  end
end
