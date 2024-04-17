defmodule Data.Article.Blog.SaarlandstrasseNord do
  use Article.Default

  def updated_at(), do: ~D[2023-11-09]

  def start(), do: ~d[2025]
  def stop(), do: ~d[2025]

  def title(), do: "Saarlandstraße (nördlicher Teil, Alltagsroute 5N, Bezirksroute Nord N6)"

  def summary(),
    do:
      "Mischverkehr beim Stadtpark; Protected-Bike-Lane U-Bahn ↔ Hellbrookstraße; sonst 2m breite Hochbordradwege"

  def type(), do: :planned

  def tags(), do: ["5N", "5", "br-nord-n6"]

  def links(_assigns) do
    [
      {"2. Entwurf: Lageplan", "November 2023",
       "https://lsbg.hamburg.de/resource/blob/784298/63926bcfe317cec76a91b34d76a57618/saarlandstrasse-jahnring-bis-u-saarlandstrasse-zweite-verschickung-bericht-data.pdf"},
      {"2. Entwurf: Erläuterungsbericht", "November 2023",
       "https://lsbg.hamburg.de/resource/blob/784300/cca79323aa381417b7d9cf1988ec48b3/saarlandstrasse-jahnring-bis-u-saarlandstrasse-zweite-verschickung-plan-data.pdf"},
      {"1. Entwurf: Lageplan", "veraltet, 2022",
       "https://lsbg.hamburg.de/resource/blob/784304/b2611e739891f75cd6c0575e50a01438/saarlandstrasse-jahnring-bis-u-saarlandstrasse-abstimmungsunterlage-plan-data.pdf"},
      {"1. Entwurf: Erläuterungsbericht", "veraltet, 2022",
       "https://lsbg.hamburg.de/resource/blob/784302/bffb2fc6b60188f749402d38bef405cb/saarlandstrasse-jahnring-bis-u-saarlandstrasse-abstimmungsunterlage-bericht-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand November 2023</h4>
    <p>Der 2. Entwurf wurde veröffentlicht. Er verbessert viele Detailprobleme, bleibt aber beim Konzept des 1. Entwurfs. Die größte Neuerung ist, dass die <.v bounds="10.031316,53.5905,10.034083,53.592561" lon={10.032391} lat={53.591737} dir="backward" ref="5">Stadthallenbrücke</.v> zu einer Fahrradstraße ohne KFZ-Verkehr werden soll. Der Artikel wurde an den neuen Entwurf angepasst.</p>

    <h4>Alter Zustand</h4>
    <p>Auf der östlichen Seite gibt es ausschließlich <.ref>Hochbordradwege</.ref>, die stellenweise schmaler als ein normales Fahrrad sind.</p>

    <p>Auf der Seite des Stadtparks fährt der Radverkehr ebenfalls meist über Hochbordradwege. Ausnahme ist ein <.a name="2019-12-16-freilichtbuehne-saarlandstrasse">bereits sanierter Abschnitt im Norden</.a>. Dort wird man auch teilweise durch den KFZ-Parkplatz im <.ref>Mischverkehr</.ref> geführt.</p>

    <h4>Planung – Ostseite</h4>
    <p>Unter der <.v bounds="10.031917,53.58829,10.034429,53.5915" lon={10.033382} lat={53.588995} dir="forward" ref="5">Bahnbrücke</.v> bis zur <.v bounds="10.031917,53.58829,10.034429,53.5915" lon={10.033033} lat={53.590672} dir="forward" ref="5">Hellbrookstraße</.v> soll eine 2,25m breite <.ref>Protected-Bike-Lane</.ref> entstehen. Ab dort wird der bestehende Hochbordradweg auf 2,0m verbreitert. Der Platz kommt von den KFZ-Fahrspuren und den Fußwegen, die jeweils etwas schmaler werden. Der Grünstreifen verschiebt sich dadurch leicht in Richtung Stadtpark.</p>

    <h4>Planung – Stadtpark-Seite</h4>
    <p>Auf Stadtparkseite setzt man das Prinzip des bereits sanierten Abschnitts fort und führt den Radverkehr im Bereich der KFZ-Parkplätze im Mischverkehr. Außerhalb dieser Stellen werden die vorhandenen Hochbordradwege auf rund 2,00m verbreitert.</p>

    <p>Im Bereich der Einmündung <.v bounds="10.029996,53.594193,10.034084,53.597878" lon={10.031112} lat={53.596564} dir="backward" ref="5">Alte Wöhr</.v> wird der Radverkehr auf einer Protected-Bike-Lane geführt. Vor der südlichen Querungsfurt wird die Protected-Bike-Lane in eine Links- und Geradeausspur zu je 1,3m Breite aufgeteilt. Hier sind jeweils eigene Radampeln vorgesehen.</p>

    <p>Am <.v bounds="10.030867,53.590678,10.034133,53.594416" lon={10.0318} lat={53.593647} dir="backward" ref="5">Südring</.v> wird der Radverkehr auf einen eigenen Radweg gelenkt. Durch spezielle Wurzelschutzsysteme soll der Radweg ebenerdig bleiben und erst nach der Einmündung mittels einer kurzen Rampe auf einen <.ref>Hochbordradweg</.ref> geleitet werden. Trotz Spezialsystem bleibt dieser Abschnitt eine Engstelle.</p>

    <p>An der <.v bounds="10.031316,53.5905,10.034083,53.592561" lon={10.032391} lat={53.591737} dir="backward" ref="5">Stadthallenbrücke</.v> bleibt der Radweg durchgängig. Er verbreitert sich auf 3,0m damit bis zur <.v bounds="10.031094,53.589468,10.035345,53.593052" lon={10.032572} lat={53.591129} dir="backward" ref="5">Hellbrookstraße</.v> der Radverkehr in beide Richtungen fahren kann. Im Kreuzungsbereich beginnt eine 2,25m breite <.ref>Protected-Bike-Lane</.ref> bis zur Eisenbahnbrücke.</p>

    <h4>Planung – Querung Südring / Stadthallenbrücke / Hellbrookstraße</h4>
    <p>Die Konzeption dieser verteilten Kreuzung wird völlig überarbeitet. Die <.v bounds="10.029137,53.589979,10.034458,53.593855" lon={10.032391} lat={53.591737} dir="backward" ref="5">Stadthallenbrücke</.v> wird zu einer Fahrradstraße ohne KFZ-Freigabe. Im <.v bounds="10.029137,53.589979,10.034458,53.593855" lon={10.0318} lat={53.593647} dir="backward" ref="5" highlight="Südring">nördlichen Ast des Südrings</.v> entfällt die Einbahnstraße. Aus ihm kann nur nach Süden abgebogen werden. Der Grünstreifen in der Saarlandstraße wird hier durchgängig und bekommt neue Bäume. Radverkehr der aus dem Süden zum Stadtpark möchte wechselt bereits an der <.v bounds="10.029137,53.589979,10.034458,53.593855" lon={10.033013} lat={53.590618} dir="forward" ref="5">Hellbrookstraße</.v> die Straßenseite und erreicht über ein kurzes Stück Zweirichtungsradweg die Stadthallenbrücke.</p>

    <h4>Meinung</h4>
    <p>Die Umgestaltung der Stadthallenbrücke zu einer Fahrradstraße ist hervorragend. Man kann den Stadtpark so viel direkter erreichen. Gleichzeitig wird durch die fehlende Möglichkeit für KFZ nach Norden abzubiegen auch der Schleichverkehr aus dem Südring herausgehalten. </p>

    <p>Auch die Ostseite ist gelungen. Die wenigen Probleme aus dem 1. Entwurf wurden behoben.</p>

    <p>Die Parkseite wird leider nicht ganz so gut. Die Führung durch die Parkplätze im <.ref>Mischverkehr</.ref> ist für den Radverkehr unattraktiv. Es bleiben fragwürdige Detailentscheidungen:</p>
    <ul>
      <li>Die <.v bounds="10.029644,53.598003,10.033024,53.600148" lon={10.030987} lat={53.599544} dir="backward" ref="5">enge 90° Kurve</.v> aus Richtung Pergolenviertel bleibt. Eine breitere Auffahrt würde bequemeres Abbiegen ermöglichen.</li>
      <li>Die <.v bounds="10.02997,53.597407,10.032435,53.599404" lon={10.031136} lat={53.598449} dir="backward" ref="5">Einfahrt zum Parkplatz</.v> stellt nicht sicher, dass KFZ die Vorfahrt des Radverkehrs beachten. Dies sollte durch enge Kurven und ggf. Bodenschwellen sichergestellt werden.</li>
      <li>Der Radverkehr nach Süden muss an der Einmündung <.v bounds="10.029996,53.594193,10.034084,53.597878" lon={10.031112} lat={53.596564} dir="backward" ref="5">Alte Wöhr</.v> zunächst vor der Kreuzung  Autoampel beachten, und in der Kreuzung dann nochmal eine eigene Radampel. Kompliziert, und je nach genauer Schaltung auch lange Wartezeiten für Rad oder Fuß. Ein abgesetzter Radweg mit Zebrastreifen wäre besser.</li>
      <li>Bei der Einfahrt zum zweiten Parkplatz bestehen die gleichen Probleme wie bei der Ersten. Da der die Protected-Bike-Lane zu früh aufhört, kann man zusätzlich noch geschnitten werden.</li>
    </ul>

    <p>Trotzdem stellt die Planung auf Parkseite eine Verbesserung dar – das war im ersten Entwurf noch fraglich.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
