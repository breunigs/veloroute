defmodule Data.Article.Blog.SaarlandstrasseNord do
  use Article.Default

  def updated_at(), do: ~D[2024-04-29]

  def start(), do: ~d[2025-07]
  def stop(), do: ~d[2025-07]

  def title(), do: "Saarlandstraße (nördlicher Teil, Alltagsroute 5N, Bezirksroute Nord N6)"

  def summary(),
    do:
      "Mischverkehr beim Stadtpark; Protected-Bike-Lane U-Bahn ↔ Hellbrookstraße; sonst 2m breite Hochbordradwege"

  def type(), do: :planned

  def tags(), do: ["5N", "5", "br-nord-n6"]

  def links(_assigns) do
    [
      {"fertiger Entwurf: Lageplan", "April 2024",
       "https://lsbg.hamburg.de/resource/blob/849998/0ea51745d993b76a305e4fb77838b460/saarlandstrasse-jahnring-bis-u-saarlandstrasse-abgestimmte-planung-plan-data.pdf"},
      {"fertiger Entwurf: Erläuterungsbericht", "April 2024",
       "https://lsbg.hamburg.de/resource/blob/849994/5b2465592f5586fb538e85852ff0e4ea/saarlandstrasse-jahnring-bis-u-saarlandstrasse-abgestimmte-planung-bericht-data.pdf"},
      {"2. Entwurf: Lageplan", "November 2023",
       "https://lsbg.hamburg.de/resource/blob/784300/cca79323aa381417b7d9cf1988ec48b3/saarlandstrasse-jahnring-bis-u-saarlandstrasse-zweite-verschickung-plan-data.pdf"},
      {"2. Entwurf: Erläuterungsbericht", "November 2023",
       "https://lsbg.hamburg.de/resource/blob/784298/63926bcfe317cec76a91b34d76a57618/saarlandstrasse-jahnring-bis-u-saarlandstrasse-zweite-verschickung-bericht-data.pdf"},
      {"1. Entwurf: Lageplan", "veraltet, 2022",
       "https://lsbg.hamburg.de/resource/blob/784304/b2611e739891f75cd6c0575e50a01438/saarlandstrasse-jahnring-bis-u-saarlandstrasse-abstimmungsunterlage-plan-data.pdf"},
      {"1. Entwurf: Erläuterungsbericht", "veraltet, 2022",
       "https://lsbg.hamburg.de/resource/blob/784302/bffb2fc6b60188f749402d38bef405cb/saarlandstrasse-jahnring-bis-u-saarlandstrasse-abstimmungsunterlage-bericht-data.pdf"}
    ]
  end

  @attrib [
    {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"},
    {"Battenberg & Koch", "https://www.bkplan.de/"},
    {"Fichtner Water & Transportation", "https://www.fwt.fichtner.de/kontakt/inland"},
    {"iwb Ingenieure", "https://www.iwb-ingenieure.de/"}
  ]
  def map_image do
    [
      Data.MapImage.new(__MODULE__, @attrib, 1, {
        %{lat: 53.599828317, lon: 10.032422347},
        %{lat: 53.59410691, lon: 10.03328210},
        %{lat: 53.59396707, lon: 10.03078955},
        %{lat: 53.599695271, lon: 10.029926345}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 2, {
        %{lat: 53.59410691, lon: 10.03328210},
        %{lat: 53.589191559, lon: 10.034031035},
        %{lat: 53.58905956, lon: 10.03153574},
        %{lat: 53.59396707, lon: 10.03078955}
      })
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand April 2024</h4>
    <p>Der dritte und letzte Entwurf wurde veröffentlicht. Er enthält vor allem Anpassungen im Detail. Der Artikel wurde entsprechend angepasst. Größere Änderungen:</p>
    <ul>
      <li>Bei den Einfahrten zu den KFZ-Parkplätzen/Fahrradstraßen sind jetzt Rampen, die die Wartepflicht des KFZ-Verkehrs hervorheben.</li>
      <li>Die <.ref>Protected-Bike-Lanes</.ref> zwischen Hellbrookstraße und Eisenbahnbrücke werden nun doch wieder <.ref>Hochbordradwege</.ref>. Dadurch entfällt die Ampel für den Geradeaus-Verkehr auf Stadtparkseite.</li>
    </ul>

    <h4>Alter Zustand</h4>
    <p>Auf der östlichen Seite gibt es ausschließlich <.ref>Hochbordradwege</.ref>, die stellenweise schmaler als ein normales Fahrrad sind.</p>

    <p>Auf der Seite des Stadtparks fährt der Radverkehr ebenfalls meist über Hochbordradwege. Ausnahme ist ein <.a name="2019-12-16-freilichtbuehne-saarlandstrasse">bereits sanierter Abschnitt im Norden</.a>. Dort wird man auch teilweise durch den KFZ-Parkplatz im <.ref>Mischverkehr</.ref> geführt.</p>


    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <h5> Ostseite</h5>
    <p>Ab der <.v bounds="10.031917,53.58829,10.034429,53.5915" lon={10.033382} lat={53.588995} dir="forward" ref="5">Bahnbrücke</.v> soll ein 2,0m breiter <.ref>Hochbordradweg</.ref> entstehen. Der Platz kommt von den KFZ-Fahrspuren und den Fußwegen, die jeweils etwas schmaler werden. Der Grünstreifen verschiebt sich dadurch leicht in Richtung Stadtpark. Nur vor der <.v bounds="10.031917,53.58829,10.034429,53.5915" lon={10.033033} lat={53.590672} dir="forward" ref="5">Hellbrookstraße</.v> ist ein kurzes Stück <.ref>Protected-Bike-Lane</.ref> vorgesehen.</p>

    <h5>Stadtpark-Seite</h5>
    <p>Auf Stadtparkseite setzt man das Prinzip des bereits sanierten Abschnitts fort und führt den Radverkehr im Bereich der KFZ-Parkplätze im Mischverkehr. Diese Abschnitte werden als Fahrradstraße beschildert. Außerhalb dieser Stellen werden die vorhandenen Hochbordradwege auf rund 2,00m verbreitert.</p>

    <p>Im Bereich der Einmündung <.v bounds="10.029996,53.594193,10.034084,53.597878" lon={10.031112} lat={53.596564} dir="backward" ref="5">Alte Wöhr</.v> wird der Radverkehr auf einer Protected-Bike-Lane geführt. Vor der südlichen Querungsfurt wird die Protected-Bike-Lane in eine Links- und Geradeausspur zu je 1,3m Breite aufgeteilt. Hier sind jeweils eigene Radampeln vorgesehen.</p>

    <p>Am <.v bounds="10.030867,53.590678,10.034133,53.594416" lon={10.0318} lat={53.593647} dir="backward" ref="5">Südring</.v> wird der Radverkehr auf einen eigenen Radweg gelenkt. Durch spezielle Wurzelschutzsysteme soll der Radweg größtenteils ebenerdig bleiben und ohne häufige Rampen auskommen. Die Ampel an dieser Einmündung entfällt.</p>

    <p>An der <.v bounds="10.031316,53.5905,10.034083,53.592561" lon={10.032391} lat={53.591737} dir="backward" ref="5">Stadthallenbrücke</.v> bleibt der Radweg durchgängig. Er verbreitert sich auf 3,0m damit bis zur <.v bounds="10.031094,53.589468,10.035345,53.593052" lon={10.032572} lat={53.591129} dir="backward" ref="5">Hellbrookstraße</.v> der Radverkehr in beide Richtungen fahren kann. Nach der Kreuzung verengt er sich wieder auf 2,25m breite und führt bis zur Eisenbahnbrücke.</p>

    <h5>Querung Südring / Stadthallenbrücke / Hellbrookstraße</h5>
    <p>Die Konzeption dieser verteilten Kreuzung wird völlig überarbeitet. Die <.v bounds="10.029137,53.589979,10.034458,53.593855" lon={10.032391} lat={53.591737} dir="backward" ref="5">Stadthallenbrücke</.v> wird zu einer Fahrradstraße ohne KFZ-Freigabe. Im <.v bounds="10.029137,53.589979,10.034458,53.593855" lon={10.0318} lat={53.593647} dir="backward" ref="5" highlight="Südring">nördlichen Ast des Südrings</.v> entfällt die Einbahnstraße. Aus ihm kann nur nach Süden abgebogen werden, wodurch der Grünstreifen in Straßenmitte durchgängig wird. Dort werden auch neue Bäume gepflanzt. Radverkehr der aus dem Süden zum Stadtpark möchte wechselt bereits an der <.v bounds="10.029137,53.589979,10.034458,53.593855" lon={10.033013} lat={53.590618} dir="forward" ref="5">Hellbrookstraße</.v> die Straßenseite und erreicht über ein kurzes Stück Zweirichtungsradweg die Stadthallenbrücke.</p>

    <h4>Meinung</h4>
    <p>Die Umgestaltung der Stadthallenbrücke zu einer Fahrradstraße ist hervorragend. Man kann den Stadtpark so viel direkter erreichen. Gleichzeitig wird durch die fehlende Möglichkeit für KFZ nach Norden abzubiegen auch der Schleichverkehr aus dem Südring herausgehalten. </p>

    <p>Auch die Ostseite ist gelungen.</p>

    <p>Die Parkseite wird leider nicht ganz so gut. Die Führung durch die Parkplätze im <.ref>Mischverkehr</.ref> ist für den Radverkehr unattraktiv. Es bleiben fragwürdige Detailentscheidungen:</p>
    <ul>
      <li>Die <.v bounds="10.029644,53.598003,10.033024,53.600148" lon={10.030987} lat={53.599544} dir="backward" ref="5">enge 90° Kurve</.v> aus Richtung Pergolenviertel bleibt. Eine breitere Auffahrt würde bequemeres Abbiegen ermöglichen.</li>
      <li>Der Radverkehr nach Süden muss an der Einmündung <.v bounds="10.029996,53.594193,10.034084,53.597878" lon={10.031112} lat={53.596564} dir="backward" ref="5">Alte Wöhr</.v> zunächst vor der Kreuzung  Autoampel beachten, und in der Kreuzung dann nochmal eine eigene Radampel. Kompliziert, und je nach genauer Schaltung auch lange Wartezeiten für Rad oder Fuß. Ein abgesetzter Radweg mit Zebrastreifen wäre besser.</li>
      <li>Die Rampe am <.v bounds="10.029947,53.593211,10.034798,53.597855" lon={10.031166} lat={53.596048} dir="backward" ref="5">Beginn des zweiten Parkplatzes</.v> muss auch vom Radverkehr überwunden werden. Eine schmalere Bodenschwelle zu den KFZ-Spuren hätte zu schnelles Einbiegen ebenfalls verhindert, ohne den Fahrkomfort auf dem Fahrrad zu verringern.</li>
    </ul>

    <p>Trotzdem stellt die Planung auf Parkseite eine Verbesserung dar – das war im ersten Entwurf noch fraglich.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
