defmodule Data.Article.Blog.BernerHeerweg do
  use Article.Default

  def name(), do: "#{created_at()}-6-berner-heerweg"
  def created_at(), do: ~D[2019-03-19]
  def updated_at(), do: ~D[2020-11-28]
  def title(), do: "Berner Heerweg (Veloroute 6)"

  def start(), do: ~d[2025]
  def stop(), do: ~d[2026]

  def type(), do: :intent

  def tags(), do: ["6", "w18"]

  def links(_assigns) do
    [
      {"Möglicher Bautermin", "Stand 2022",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1016643"},
      {"Entschiedung zur kompletten Neuplanung", "2020",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1013329"},
      {"Lagepläne und Erläuterungen", "veraltet, 2019",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1009931"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Dezember 2020</h4> <p>Man hat sich <.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1013329">kurzfristig entschieden</.a> die bisher geplante Variante nicht umzusetzen. Stattdessen soll ein neuer Plan gemacht werden, bei dem die KFZ-Fahrspuren reduziert werden um dem Rad- und Fußverkehr eine höhere Aufenthaltsqualität zu bieten. Auch die Trennwirkung der Straße soll so reduziert werden. Statt dem Umbau ab Frühjahr 2021 geht man nun frühestens von 2022 aus.</p> <p><strong>Meinung:</strong> Die Straße grundlegend zu ändern bietet großes Potenial diese hässliche Autobahn für andere Verkehrsarten angenehm zu gestalten. Die Verzögerung um ein bis zwei Jahre ist zwar bedauernswert, aber akzeptabel wenn das Ergebnis danach stimmt. Die bisherigen Pläne stellten zwar eine Verbesserung für den Radverkehr dar, setzten den Fokus aber wie bisher auf das Auto.</p>
    <h4>Beschreibung (alte Planung)</h4> <p>Der <.m bounds="10.109514,53.591743,10.147123,53.634562">Berner Heerweg</.m> ist im akutellen Zustand brauchbar befahrbar. Der Radweg ist halbwegs eben und breit genug um Schlaglöchern auszuweichen. Zum Überholen reicht der Platz allerdings kaum. Problematisch sind vor allem die Kreuzungen, die <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.606594, lon: 10.119401, zoom: 18})} ref="6">Slalom</.m> oder <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.613456, lon: 10.124158, zoom: 17})} ref="6">schlechte Sicht</.m> bieten. Zum <.m bounds="10.098,53.613146,10.123548,53.617024">Neusurenland</.m> hin muss außerdem um Grün gebettelt werden.</p> <p><strong>Strecke:</strong> Die Umplanung sieht vor die Radwege als Radfahrstreifen mit Asphalt auszuführen. Sie sollen meist ca. 2,15m breit sein, wobei sie durch Markierung und Sicherheitsabstand zu parkenden KFZ rechts (Türunfälle, „Dooring“) ggf. breiter wirken. Gut: Die Regenrinne soll jeweils links der Markierung verlaufen und so den gefühlten Abstand zu KFZ nochmals erhöhen. Die <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.612828, lon: 10.123993, zoom: 17.39}))}>Engstelle südlich der Stargarder Straße</.m> wird nicht gelöst – stattdessen sind die Radfahrstreifen hier beidseitig mit rund 1,75m deutlich schmaler.</p> <p><strong><.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.61624, lon: 10.122829, zoom: 17}))}>Einmündung Neusurenland</.m>:</strong> Stadteinwärts wird der Radweg kurz vor der Kreuzung auf einen Radfahrstreifen abgeleitet (vgl. <.a name="2018-10-17-6-neusurenland">Neusurenland (Abschnitt W19)</.a>), der mit der KFZ-Ampel signalisiert wird. Eine Möglichkeit frei Rechts abzubiegen ist nicht vorgesehen. Wer Linksabbiegen möchte wird geradeaus auf die andere Straßenseite geschickt um dann im 90° Winkel auf dem Radfahrstreifen die Richtung zu ändern.<br>Ins Neusurenland ist der Überweg jetzt deutlich zur Kreuzung gerückt, sodass man weniger umständlich abbiegen muss. Neu ist eine Aufstelltasche rechts des Geradeausverkehrs, die allerdings keine eigene Schaltung erhalten soll – d.h. es wären wie aktuell kombinierte Rad/Fußampeln, was nicht zeitgemäß ist. Direktes Linksabbiegen ist nicht vorgesehen.</p> <p><strong><.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.613107, lon: 10.123974, zoom: 17}))}>Einmündung Stargarder Straße</.m>:</strong> Stadtauswärts führt der Radfahrstreifen künftig geradlinig über die Kreuzung. Beim Rechtsabbiegen in die Stargarder Straße muss man sich nach wie vor in den Mischverkehr einordnen.<br>Stadteinwärts wird eine indirekte Linksabbiege Möglichkeit geschaffen. Dazu wird die Einmündung um eine Fußampel an der Südseite ergänzt, die wohl auch vom Radverkehr mitbenutzt werden soll. Leider ist die Planung hier fehlerhaft, sodass nicht zu erkennen ist wie die Ampel genau gestaltet werden soll.</p> <p><strong><.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.613107, lon: 10.123974, zoom: 17}))}>Kreuzung August-Krogmann-Straße / Rahlstedter Weg</.m>:</strong> Folgt man der Veloroute stadtauswärts bleibt man rechts der KFZ-Rechts spur. Die Planung geht leider nicht auf die Ampelschaltung ein, sodass hier der Konfliktpunkt Geradeaus-Rad / Rechts-KFZ im Kreuzungsbereich bleiben wird. Entlang der Veloroute stadteinwärts wird er dagegen vorgezogen: die Rad-Geradeaus Spur befindet sich hier zwischen den KFZ-Geradeausspuren und der Rechtsabbiegerspur.<br>Vom und zum Rahlstedter Weg und der August-Krogmann-Straße bleiben die freie Rechtsabbieger, die auf die dort vorhandenen Hochbordradwege aufleiten. Zum indirekten Linksabbiegen sind jeweils kleine Aufstelltaschen vorgesehen, deren Signalisierung wohl mit der Fußampel erfolgt. Direktes Linksabbiegen ist nicht vorgesehen.</p> <p><strong>Fazit:</strong> Die breiteren Radwege sind zu begrüßen, obgleich sie als Radfahrstreifen ein gemischtes Bild abgeben – <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.612828, lon: 10.123993, zoom: 17.39}))}>Engstelle südlich der Stargarder Straße</.m> ergibt sich auch aus dem Kurvenverhalten von LKW die ggf. den Radfahrstreifen überfahren würden, wenn er breiter wäre.<br>Die Einmündung der Stargarder Straße wird für Radfahrende und Zufußgehende aufgewertet, da beide Seiten jetzt eine Ampel erhalten und so auch Linksabbiegen vom Norden kommend möglich wird.<br>An der <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.613107, lon: 10.123974, zoom: 17}))}>Kreuzung August-Krogmann-Straße / Rahlstedter Weg</.m> findet im Wesentlichen nur eine Anpassung an die Radfahrstreifen statt, was aber immerhin bedeutet das der Radweg Richtung Innenstadt nun gerade ist. Da sowohl hier als auch am <.m bounds="10.098,53.613146,10.123548,53.617024">Neusurenland</.m> Details zur Ampelschaltung fehlen, ist davon auszugehen das hier keine Verbesserung für den Radverkehr vorgenommen wird.</p>
    <h4>Quellen</h4>
    <.structured_links/>
    """
  end
end
