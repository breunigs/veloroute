defmodule Data.Article.Blog.BarmbekerMarkt do
  use Article.Default

  def title(), do: "Barmbeker Markt – Dehnhaide (Radroute 5, Bezirksroute Nord N4)"

  def summary(),
    do:
      "Rad- und Gehwege sollen mit kleineren Maßnahmen verbessert werden. Das gelingt teilweise, behält den Charakter der Kreuzung als Autobahn aber leider bei."

  def type(), do: :planned
  def start(), do: ~d[2026-03]
  def stop(), do: ~d[2027-01]

  def tags(), do: ["radroute-5", "br-nord-n4"]

  def map_image do
    {name(), [{"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}]}
  end

  def links(_assigns) do
    [
      {"Präsentation zur Planung", ~d[2025-04],
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/to010.asp?SILFDNR=1003276"},
      {"Lageplan und Erläuterungen", ~d[2025-04],
       "https://fragdenstaat.de/anfrage/baumassnahme-knoten-351-dehnhaide-barmbeker-markt/#nachricht-995588"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die <.ref>Hochbordradwege</.ref> um die Kreuzung sind meist 1,25m breit. Auch die angrenzenden Gehwege sind schmal.</p>

    <p>Viele Ampeln haben lange Wartezeiten für Rad- und Fußverkehr. Die Aufstellbereiche sind vor allem unter der U-Bahn zu klein. Zudem sind die Ampeln je nach Fahrtrichtung häufig auf eine „rote Welle“ geschaltet.</p>

    <p>Die Fahrt entlang <.v bounds="10.037557,53.578181,10.043482,53.581993" lon={10.040184} lat={53.579431} dir="forward" ref="radroute-5">Radroute 5 nach Norden</.v> ist sehr umständlich. In <.v bounds="10.037127,53.577426,10.04214,53.580695" lon={10.039146} lat={53.578907} dir="backward" ref="radroute-5">Richtung Süden</.v> führt der Radweg über einen KFZ-Parkplatz. Weder der Übergang zum <.ref>Radfahrstreifen</.ref> mittendrin noch die Ausfahrt aus dem Parkplatz sind eine geradlinige Radführung.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Im Zuge der Ampelmodernisierung sollen auch kleinere Verbesserungen für den Rad- und Fußverkehr umgesetzt werden. Der Fokus liegt dabei auf kostengünstigen, leicht umsetzbaren Maßnahmen.</p>

    <ul>
      <li><.v bounds="10.035832,53.579753,10.040135,53.580833" lon={10.036511} lat={53.580212} dir="forward" ref="br-nord-n4">Weidestraße</.v>: beidseitige <.ref>Radfahrstreifen</.ref> (1,75m bis 3,0m breit). Kurze Abschnitte als <.ref>Protected-Bike-Lane</.ref>. Etwas breitere Gehwege und mehr Grünflächen.</li>
      <li><.m bounds="10.040521,53.579482,10.045212,53.582593">Barmbeker Markt</.m> nach Norden: 2,75m breiter Radfahrstreifen</li>
      <li><.v bounds="10.040447,53.578404,10.045659,53.580584" lon={10.044909} lat={53.579195} dir="backward" ref="br-nord-n4">Dehnhaide</.v> nach Westen: Radfahrstreifen, neue Grünfläche und mehr Platz für Fahrgäste an der Bushaltestelle</li>
      <li><.v bounds="10.038475,53.578693,10.041245,53.580802" lon={10.03992} lat={53.579223} dir="forward" ref="radroute-5" highlight="Hamburger Straße">Hamburger Straße nach Norden</.v>: Der <.ref>Hochbordradweg</.ref> wird vor der Kurve auf eine Protected-Bike-Lane abgeleitet</li>
      <li><.v bounds="10.037614,53.577851,10.041334,53.580106" lon={10.039969} lat={53.579931} dir="backward" ref="radroute-5" highlight="Hamburger Straße">Hamburger Straße nach Süden</.v>: Der alte Radfahrstreifen wird zur Grünfläche umgestaltet. Die Nebenfahrbahn wird zur Fahrradstraße, die in beide Richtungen befahren werden darf. Diese neue Verbindung wird als Zweirichtungs-Radweg bis in die <.v bounds="10.03762,53.579638,10.042492,53.58193" lon={10.040469} lat={53.580603} dir="forward" ref="radroute-5">Reesestraße</.v> fortgeführt.</li>
      <li>
        <.v bounds="10.039043,53.578945,10.043034,53.58134" lon={10.041246} lat={53.579926} dir="backward" ref="br-nord-n4">In der Kreuzung</.v>:
        <ul>
          <li>Rad- und Gehwege werden allgemein verbreitert</li>
          <li>Die Verbindung von der <.m bounds="10.038684,53.578608,10.043752,53.580982" highlight="Hamburger Straße,Barmbeker Markt">Hamburger Straße zum Barmbeker Markt</.m> wird geradliniger. Dadurch kann auch die Aufstelltasche zum Linksabbiegen entlang der Radroute 5 vergrößert werden.</li>
          <li>Durch den westlichen Zweirichtungsradweg ist die Fahrt von <.m bounds="10.035818,53.577512,10.040375,53.579154">Berthastraße</.m> bis <.v bounds="10.03762,53.579638,10.042492,53.58193" lon={10.040469} lat={53.580603} dir="forward" ref="radroute-5">Reesestraße</.v> nun ohne Umwege möglich.</li>
        </ul>
      </li>
    </ul>



    <h4>Meinung</h4>
    <p>Die Kreuzung ist eine Autohölle und bleibt es auch nach dem Umbau. Dafür reichen die genehmigten Mini-Maßnahmen bei weitem nicht aus. Salopp gesagt: der „Barmbeker Markt“ braucht mehr Markt und weniger Autobahn.</p>

    <p>Der neue Zweirichtungsradweg auf der Westseite der Hamburger Straße ist ein guter Anfang. Wenn die Stadt noch die Lücke zwischen <.v bounds="10.032171,53.573702,10.037081,53.577018" lon={10.035659} lat={53.575334} dir="backward" ref="radroute-5">Adolph-Schönfelder-Straße</.v> und <.v bounds="10.036727,53.577024,10.040228,53.579094" lon={10.038899} lat={53.578311} dir="backward" ref="radroute-5">Berthastraße</.v> schließt, entstünde eine attraktive Verbindung von der Hamburger Meile nach Norden.</p>

    <p>Die geplanten Begradigungen der Radwege und die Verbreiterung der Gehwege sind sinnvoll – ebenso die neue Begrünung. Leider gibt es diese Verbesserungen nur an einigen Stellen und nicht flächendeckend.</p>

    <p>Leider verlaufen die geplanten Radfahrstreifen häufig zwischen KFZ-Spur (links) und KFZ-Parkplätzen (rechts). Im <.v bounds="10.008117,53.55014,10.030998,53.559879" lon={10.01602} lat={53.555491} dir="backward" ref="radroute-7">Steindamm</.v> funktioniert dieses Konzept schlecht – hier könnte es ähnlich problematisch werden. Weitere Schwachstellen der Maßnahmen sind Slalomführung um die Einmündungen <.m bounds="10.042315,53.581083,10.045566,53.582633">Stückenstraße und Haferkamp</.m>. Zumindest im <.v bounds="10.042024,53.578863,10.04384,53.579619" lon={10.043329} lat={53.579162} dir="backward" ref="br-nord-n4">Kurvenbereich Dehnhaide</.v> sollten Trennelemente ergänzt werden, um das Schneiden der Kurve durch KFZ zu verhindern.</p>

    <p>Trotz aller Kritik: es wird besser als vorher. Auch <.v bounds="10.00184,53.556333,10.013899,53.56121" lon={10.00463} lat={53.557383} dir="forward" ref="radroute-6">An der Alster</.v> wurde die Infrastruktur Stück für Stück verbessert – vielleicht gelingt das auch hier.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
