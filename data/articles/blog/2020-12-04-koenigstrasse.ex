defmodule Data.Article.Blog.Koenigstrasse do
  use Article.Default

  def created_at(), do: ~D[2020-12-04]
  def updated_at(), do: ~D[2022-06-01]

  def title(), do: "Königstraße (Veloroute 13)"

  def summary(),
    do: "Meist 2,5m breite geschützte Radfahrstreifen; Hochbordradwege an zwei Stellen."

  def start(), do: ~d[2023-08]
  def stop(), do: ~d[2025-04]

  def type(), do: :planned

  def tags(), do: ["12"]

  def links(_assigns) do
    [
      {"Baustellenkoordination", "September 2022",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1013155"},
      {"Lageplan", "2022",
       "https://lsbg.hamburg.de/contentblob/16224442/0df518579cb81fd9aad17132d1760192/data/koenigstrasse-von-max-brauer-allee-bis-reeperbahn-%E2%80%93-abgestimmte-planung-plan.pdf"},
      {"Erläuterungsbericht des LSBG", "2022",
       "https://lsbg.hamburg.de/contentblob/16224444/fad3c760bc4e73557db6a0f16550563b/data/koenigstrasse-von-max-brauer-allee-bis-reeperbahn-%E2%80%93-abgestimmte-planung-bericht.pdf"},
      {"veralteter Lageplan 1", "2020, Max-Brauer-Allee bis Elmenhorststraße",
       "https://lsbg.hamburg.de/contentblob/14709018/92aa529400e37c930df274ef190e69ab/data/vr-12-koenigstrasse-abstimmungsunterlage-plan-1.pdf"},
      {"veralteter Lageplan 2", "2020, Elmenhorststraße bis Reeperbahn",
       "https://lsbg.hamburg.de/contentblob/14709020/bca1d90a258782db6e8711831aafe311/data/vr-12-koenigstrasse-abstimmungsunterlage-plan-2.pdf"},
      {"veralteter Erläuterungsbericht des LSBG", "2020",
       "https://lsbg.hamburg.de/contentblob/14709016/c7c3b200a22adcb1e70a84325e6b54d6/data/vr-12-koenigstrasse-abstimmungsunterlage-bericht.pdf"},
      {"Details zum Vorabradweg (Popup-Radweg)",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1011737"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Juni 2022</h4>
    <p>Ein überarbeiteter Entwurf wurde veröffentlicht und der Artikel an den neuen Stand angepasst. Zum vorigen Entwurf ergeben sich grob folgende Änderungen:</p>
    <ul>
      <li>Beidseitig Radfahrstreifen in der <.m bounds="9.946251,53.548112,9.951837,53.550342" lon={9.947273} lat={53.549343} dir="backward" ref="12">Mörkenstraße</.m> (statt Bushaltestelle in Richtung Hafen und <.ref>Protected-Bike-Lane</.ref> in Gegenrichtung).</li>
      <li>Die Eltern-Taxi Station für den im Bau befindlichen Schulcampus entfällt ersatzlos.</li>
      <li>Der Gehweg vor dem Schulcampus ist nicht mehr für den Radverkehr freigeben (statt Freigabe in Gegenrichtung bis zur nächsten Ampel).</li>
      <li>Der Radverkehr in Richtung Reeperbahn wird am <.m bounds="9.949265,53.548861,9.951264,53.5496">Bushalt Blücherstraße</.m> auf einem Hochbordradweg hinter den ein- und aussteigenden Fahrgästen geführt.</li>
      <li>Zwischen <.m bounds="9.937576,53.547442,9.940694,53.548256" lon={9.939898} lat={53.547884} dir="forward" ref="12">Biernatzkistraße</.m> und <.m bounds="9.937576,53.547442,9.940694,53.54825" lon={9.93805} lat={53.547827} dir="forward" ref="12">Schillerstraße</.m> wird der Radverkehr entlang der Veloroute über einen <.ref>Hochbordradweg</.ref> geführt (statt ungeschützer Radfahrstreifen um KFZ-Parkplätze erhalten zu können). Die neue Variante ermöglicht weitere Baumpflanzungen.</li>
      <li>Die <.m bounds="9.944258,53.547985,9.947441,53.549126" lon={9.945649} lat={53.548614} dir="forward" ref="12">Bushaltestelle S-Königstraße</.m> bleibt, beide Fahrtrichtungen halten östlich der Elmenhorststraße.</li>
    </ul>

    <h4>Alter Zustand</h4>
    <p>Die Königstraße wird bezogen auf die Veloroute nur Richtung Westen genutzt. Hier ergeben sich im Wesentlichen drei Abschnitte: die <.m bounds="9.947246,53.5484,9.94991,53.549603" lon={9.947896} lat={53.5491083} dir="backward">Kreuzung um die Kirchenstraße</.m> sowie <.m bounds="9.940406,53.546983,9.944712,53.548929" lon={9.9429891} lat={53.5482241} dir="forward">vor</.m> bzw. <.m bounds="9.939486,53.546928,9.943793,53.548873" lon={9.9401791} lat={53.5478972} dir="forward">nach</.m> dem Schleepark.</p>

    <p>In der Kreuzung sind zwar teilweise eigene Radwege vorhanden, die aber nicht aus allen Fahrtrichtungen gut zu erreichen sind. Kurz nach der Kreuzung enden diese, sodass man bis zur <.m bounds="9.939518,53.547279,9.945404,53.548643" lon={9.9419285} lat={53.5480872} dir="forward">Kreuzung am Schleepark</.m> mit dem Autoverkehr die Spur teilt. Danach schließen alte, schmale <.ref name="hochbordradweg">Hochbordradwege</.ref> an, die dann bis zur <.m bounds="9.933276,53.547405,9.939163,53.548769" lon={9.9365983} lat={53.5479089} dir="forward">Max-Brauer-Allee</.m> reichen. In der Gegenrichtung gibt es einen durchgehenden Radweg.</p>

    <h4>Planung</h4>
    <h5>Streckenabschnitte</h5>
    <p>Die Planung geht etwas über die Veloroute hinaus und schließt an die bereits umgebaute <.m bounds="9.951588,53.548804,9.956809,53.550984">Kreuzung mit der Reeperbahn</.m> an. Von dort an sollen für beide Fahrtrichtungen meist geschütze Radfahrstreifen eingerichtet werden. Diese werden durch rund 50cm breite Bordsteine oder Poller vom Autoverkehr abgetrennt. Die nutzbare Breite des Radfahrstreifen beträgt mindestens 2,10m, meist jedoch 2,50m. Die Trennung wird für Einfahrten, Bushaltestellen oder Parkplätze rechts des Radfahrstreifen regelmäßig unterbrochen, auch über weite Strecken. An zwei Stellen wird der Radverkehr als <.ref>Hochbordradweg</.ref> rechts der KFZ-Parkplätze bzw. einer Bushaltestelle geführt.</p>

    <h5>Kreuzung um die Kirchenstraße</h5>
    <p>Die Fahrt in Richtung Altona stellt sich wie folgt dar: <.m bounds="9.946967,53.548149,9.950596,53.549664" lon={9.949425} lat={53.5486964} dir="forward">in der Kirchenstraße</.m> kann man sich zum Linksabbiegen vor den wartenden KFZ einordnen. Von dort fährt man auf den geschützten Radfahrstreifen und hat wie bisher eine <.m bounds="9.946945,53.548831,9.950137,53.54957" lon={9.9487235} lat={53.5490628} dir="forward">weitere Ampel an der Mörkenstraße</.m>. Über eine rot markierte Furt quert man diese und fährt kurz danach wieder auf einem geschützten Radfahrstreifen. Rechtsabbiegende KFZ und Geradeaus-Rad erhalten gleichzeitig grün. Man geht davon aus, das die geradlinige Führung im Knotenpunkt weitgehend ausreicht um problematische Situationen an dieser Stelle zu verhindern.</p>
    <p>In Fahrt Richtung Hafen werden <.m bounds="9.946346,53.548611,9.949576,53.54996" lon={9.9476595} lat={53.5491887} dir="backward">in der Mörkenstraße</.m> beidseitig rund 2m breite Radfahrstreifen aufgemalt. Von der Ampel geht es auf einer rot markierten, leicht gebogenen Furt quer über die Kreuzung. Vor der Kirchstraße gibt es eine weitere Ampel. Entlang der Veloroute soll ein „Grünpfeil“ eine Weiterfahrt ermöglichen. Wer dagegen Richtung Reeperbahn möchte muss hier nochmals halten. In der Kirchenstraße selbst gibt es noch ein kurzes Stück Radfahrstreifen mit rund 2,0m Breite, bevor es im Mischverkehr weitergeht.</p>

    <h5>Sonstiges</h5>
    <p>An der <.m bounds="9.944258,53.547985,9.947441,53.549126" lon={9.945649} lat={53.548614} dir="forward" ref="12">Bushaltestelle S-Königstraße</.m> wird der Radverkehr durch die Wartefläche des Busses geführt und muss entweder hinter ihm warten, oder sich in den KFZ-Verkehr einordnen.</p>
    <p>Wo möglich wird <.ref name="abbiegen">indirektes Linksabbiegen</.ref> ermöglicht. Bei vorhandenen Einbahnstraßen wird darauf geachtet, dass der Radverkehr gut in Gegenrichtung fahren kann.</p>
    <p>Die KFZ-Fahrstreifen der Königstraße werden meist auf einen pro Fahrtrichtung reduziert. Teilweise war dies schon heute der Fall, da die rechte Fahrspur ausschließlich als KFZ-Parkplatz verwendet wurde. Ausnahme bleibt der Abschnitt ab der <.m bounds="9.947246,53.5484,9.94991,53.549603" lon={9.947896} lat={53.5491083} dir="backward">Kreuzung um die Kirchenstraße</.m> Richtung Reeperbahn: hier bleibt es bei zwei KFZ-Spuren.</p>
    <p>Einige Straßeneinmündungen werden als Gehwegüberfahrt gestaltet, sodass der Fußverkehr hier Vorrang vor Rad und KFZ bekommt.</p>

    <h4>Meinung</h4>
    <p>Die Lösung kann sich sehen lassen. Die durch den <.a href="https://radentscheid-hamburg.de/">Radentscheid Hamburg</.a> geforderte getrennte Führung des Radverkehrs findet hier Beachtung, auch wenn diese leider durch Längsparkplätze u.ä. über lange Strecken unterbrochen wird. Weitere Kritik bezieht sich vor allem auf Details. Etwa:</p>
    <ul>
      <li>Im <.m bounds="9.947246,53.5484,9.94991,53.549603" lon={9.947896} lat={53.5491083} dir="backward">Kreuzungsbereich um die Kirchenstraße</.m> könnten weitere Verkehrsinseln verhindern, das der Autoverkehr die Wege des Radverkehrs schneidet.</li>
      <li>Die Situation beim KFZ-Rechtsabbiegen in die <.m bounds="9.94563,53.548527,9.949529,53.550155" lon={9.9486257} lat={53.5490439} dir="forward">Mörkenstraße</.m> stellt den KFZ-Fluss weiterhin über die Sicherheit des Radverkehrs.</li>
    </ul>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
