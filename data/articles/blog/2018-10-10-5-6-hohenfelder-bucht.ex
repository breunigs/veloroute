defmodule Data.Article.Blog.HohenfelderBucht do
  use Article.Default

  def name(), do: "#{created_at()}-5-6-hohenfelder-bucht"
  def created_at(), do: ~D[2018-10-10]

  def title(), do: "Hohenfelder Bucht (Veloroute 5 und 6)"

  def start(), do: ~d[2020-03-09]
  def stop(), do: ~d[2025-12-31]

  def type(), do: :construction
  def construction_site_id_hh(), do: [6381]
  def tags(), do: [5, 6]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Im Vergleich zur aktuellen Situation rund um die <.m bounds="10.01607,53.562401,10.017253,53.563136">Hohenfelder Bucht</.m> verbessert die abgestimmte Planung an praktisch allen Wegen und Knotenpunkten die Situation für den Radverkehr. Auch wird die Aufenhaltsqualität um die Bucht durch mehr Grünflächen erhöht. Genauer umfasst die Planung die Straßen <.m bounds="10.002229,53.556733,10.015697,53.56271">An der Alster</.m>, <.m bounds="10.015019,53.558273,10.023467,53.562874">Sechslingspforte</.m>, <.m bounds="10.014756,53.560302,10.018078,53.562792">Barcastraße</.m>, <.m bounds="10.017244,53.562532,10.017678,53.56419">Buchtstraße</.m>, <.m bounds="10.01509,53.562342,10.01777,53.568488">Schwanenwik</.m> und den <.m bounds="10.016611,53.563873,10.027798,53.570305">Mundsburger Damm</.m>. Da die Planung für dieses Gebiet sehr umfangreich sind, gehe ich im Folgenden nur auf die für die Veloroute relevanten Änderungen ein. Für alle anderen Kreuzungen finden sich die Details in den PDFs.</p> <p><strong>Stadtauswärts, entlang der Straße:</strong> Die bisherigen Fahrtmöglichkeiten bleiben erhalten. D.h. man wird auch weiterhin durch die Unterführung (wie eingezeichnet) und an der Oberfläche über die <.m bounds="10.014756,53.560302,10.018078,53.562792">Barcastraße</.m> Richtung <.m bounds="10.016611,53.563873,10.027798,53.570305">Mundsburger Damm</.m> fahren können. Neu hinzu kommt eine echte geradeaus Möglichkeit. Abgesehen von einer kleinen Verschwenkung an der Einmündung der <.m bounds="10.015019,53.558273,10.023467,53.562874">Sechslingspforte</.m> fährt man zukünftig kerzengerade bis zum Altbestand im <.m bounds="10.016611,53.563873,10.027798,53.570305">Mundsburger Damm</.m>.</p> <p><strong>Stadtauswärts, entlang der Alster:</strong> Bislang ist es nicht möglich vom Radweg an der Alster Richtung <.m bounds="10.016611,53.563873,10.027798,53.570305">Mundsburger Damm</.m> zu fahren ohne an zig Ampeln warten zu müssen. Die Planung sieht jetzt eine viel direktere Querungsmöglichkeit vor: von der Alster einmal über den Schwanenwik (1. Ampel) und anschließend den Mundsburger Damm queren um auf der richtigen Straßenseite zu landen (2. Ampel) – das war's. Auch an die Fahrt in die <.m bounds="10.017244,53.562532,10.017678,53.56419">Buchtstraße</.m> wurde gedacht, sodass der Zweirichtungsradweg sich hier nirgens „in Luft auflöst“ und man raten muss wie man fahren soll.</p> <p><strong>Stadteinwärts:</strong> Diese Fahrtrichtung war auch bisher vergleichsweise unproblematisch, entsprechend wenig ändert sich. Die Querung des <.m bounds="10.01509,53.562342,10.01777,53.568488">Schwanenwik</.m> wird begradigt und die Einmündung zum Radweg an der Alster erhält einen besseren Winkel, sodass man leichter links abbiegen kann um der Veloroute zu folgen. Ich hoffe die Hecke wird auch zurückgeschnitten, sodass man Radler aus Richtung Innenstadt gut sieht.</p> <p><strong>Breiten:</strong> Der Radweg an der Alster soll mit 4,0m deutlich breiter werden als bisher, sodass 2,0m je Richtung zur Verfügung stehen. Radfahrstreifen haben meist 2,25m, Einrichtungsradwege sind mit 2,0m ebenfalls deutlich breiter als aktuell. Lediglich in der <.m bounds="10.014756,53.560302,10.018078,53.562792">Barcastraße</.m> gibt es nur Schutzstreifen (gestrichelte Linie) mit 1,50m Breite – allerdings wird die Straße künftig auch deutlich schmaler ausgeführt und sollte den Verkehr hoffentlich etwas beruhigen.</p> <p><strong>Fazit:</strong> Insgesamt wirkt die Planung gelungen: die Hohenfelder Bucht wird nicht nur grüner, sondern auch für den Radverkehr erheblich aufgewertet. Es ist zu wünschen, das auch der Rest der Veloroute so vorbildlich umgesetzt wird. Baubeginn soll 2020 sein (Angabe der Polizei, Stand Mai 2019).</p> <ul>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/11676036/af2c20b137dfedee3c0da0c4921e6173/data/hohenfelder-bucht-abgestimmte-planung-plan.pdf">abgestimmter Lageplan</.a>
    </li>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/11676030/a4b5eba8f88fcee157469e72b7857419/data/hohenfelder-bucht-abgestimmte-planung-bericht.pdf">Erläuterungsbericht zur Umgestaltung</.a>
    </li>
    </ul>
    """
  end
end
