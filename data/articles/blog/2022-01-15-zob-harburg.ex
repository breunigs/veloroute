defmodule Data.Article.Blog.ZOBHarburg do
  use Article.Default

  def created_at(), do: ~D[2022-01-15]
  def updated_at(), do: ~D[2022-10-05]
  def title(), do: "Busbahnhof Harburg und anliegende Kreuzungen"

  def start(), do: ~d[2023-05]
  def stop(), do: ~d[2025-05]

  def type(), do: :planned

  def summary(),
    do:
      "Jahre alte Planung soll umgesetzt werden. Schmale Radfahrstreifen verlaufen ungeschützt über die riesige Kreuzung."

  def tags(), do: ["11", "rsw-lueneburg", "rsw-tostedt", "FR11"]

  def links(_assigns) do
    [
      {"Erläuterungsbericht", "2022",
       "https://web.archive.org/web/https://lsbg.hamburg.de/contentblob/16551808/397e26c533c773e2cf6c89bf13906fdd/data/veloroute-11-harburg-innenstadt-zob-harburg-abgestimmte-planung-bericht.pdf"},
      {"Lageplan – 1. Abschnitt – 1. Blatt – Busbahnhof", "2022",
       "https://web.archive.org/web/https://lsbg.hamburg.de/contentblob/16551814/53163fdf6324038753edb3181727f77e/data/veloroute-11-harburg-innenstadt-zob-harburg-abgestimmte-planung-plan-1.pdf"},
      {"Lageplan – 1. Abschnitt – 2. Blatt – Bahnhof bis Schlachthofbrücke", "2022",
       "https://web.archive.org/web/https://lsbg.hamburg.de/contentblob/16551816/02158a5285c000e0e1b8ccb20288e1cf/data/veloroute-11-harburg-innenstadt-zob-harburg-abgestimmte-planung-plan-2.pdf"},
      {"Zeitungsartikel mit veralteter Visualisierung (2021)",
       "https://www.elbe-wochenblatt.de/2021/02/12/heftige-kritik-am-geplanten-umbau-des-harburger-busbahnhofs/"},
      {"Zeitungsartikel zum Bauzeitraum (2021)",
       "https://www.abendblatt.de/hamburg/harburg/article231356884/Harburgs-Zentraler-Busbahnhof-wird-drei-Jahre-geschlossen.html"},
      {"Bestätigung der Pläne des Verkehrssenators (2022)",
       "https://twitter.com/anjes_tjarks/status/1482231808209129474"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Oktober 2022</h4>
    <p>Die Planungsunterlagen wurden veröffentlicht und der Artikel entsprechend angepasst.</p>

    <h4>Alter Zustand</h4>
    <p>Die Kreuzung vorm Busbahnhof wird vom Autoverkehr dominiert. Wer zu Fuß unterwegs ist und auf ebenerdige Wege angewiesen ist, muss teils riesige Umwege in Kauf nehmen: der <.v bounds="9.989281,53.457167,9.992087,53.457861" lon={9.989458} lat={53.457387} dir="forward" ref="rsw-lueneburg">Walter-Dudek-Brücke</.v> fehlt eine solche Querungsmöglichkeit.</p>

    <p>Dem Radverkehr machen die Ampelschaltungen zu schaffen. Die Fahrt entlang der <.a name="alltagsroute-11">Alltagsroute 11</.a> von der <.v bounds="9.986975,53.456788,9.988792,53.457455" lon={9.987975} lat={53.457055} dir="backward" ref="11">Moorstraße</.v> auf die <.v bounds="9.988803,53.457817,9.990229,53.458536" lon={9.989208} lat={53.457934} dir="backward" ref="11">Hannoversche Brücke</.v> dauert knapp zwei Minuten, für nur rund 150m. Die Radwege selbst sind <.ref>Hochbordradwege</.ref>, aber ein Großteil der Wege besteht aus den langen Querungsfurten.</p>
    <p>Am Busbahnhof wiederum fehlen Busstiege um die hohe Anzahl der hier haltenden Busse abfertigen zu können.</p>

    <p>In Richtung Schlachthofbrücke gibt es meist <.ref>Hochbordradwege</.ref>, die teils für beide Richtungen freigegeben sind. Ausnahme: <.v bounds="9.987512,53.454469,9.992079,53.457617" lon={9.990594} lat={53.455038} dir="backward" ref="rsw-tostedt">vor dem Busbahnhof und Zugbahnhof </.v> gibt es nur einen geteilten Rad- und Fußweg auf der Stadtseite. Der Radweg auf Bahnseite endet vor dem Bahnhof.</p>

    <h4>Planung</h4>
    <p>Die Planung ist bereits älter und soll vor allem die Situation für den Busverkehr verbessern. Sie wurde in zwei Abschnitte aufgeteilt: von der <.v bounds="9.99062,53.453352,9.992999,53.455082" lon={9.991602} lat={53.454027} dir="forward" ref="rsw-tostedt">Brücke über den Seevekanal</.v> bis einschließlich des <.v bounds="9.988104,53.455951,9.990621,53.457435" lon={9.988852} lat={53.457105} dir="forward" ref="rsw-tostedt">Busbahnhofs</.v> ist Abschnitt 1. Diese Planung wurde bereits abgeschlossen. Die <.v bounds="9.987878,53.456819,9.990353,53.458594" lon={9.98893} lat={53.45813} dir="forward" ref="11">große Kreuzung</.v> („Doppelknoten“) ist Abschnitt 2 und liegt nur als Entwurf vor, könnte also noch angepasst werden.</p>

    <h5>Doppelknoten (Abschnitt 2, Entwurf)</h5>
    <p>Es sind 1,60m bis 2,0m breite <.ref>Radfahrstreifen</.ref> geplant. Eine Trennung zum KFZ-Verkehr erfolgt nicht, auch Kurvenschneiden wird nicht verhindert. Linksabbiegen ist bis auf eine Ausnahme nur <.ref>indirekt</.ref> vorgesehen.</p>

    <p>Entlang der Veloroute 11 Richtung Harburg quert man zunächst die <.v bounds="9.987878,53.456819,9.990353,53.458594" lon={9.989262} lat={53.458262} dir="forward" ref="11">KFZ-Rechtsabbieger auf der Brücke</.v>, dann die Spuren der <.v bounds="9.987878,53.456819,9.990353,53.458594" lon={9.988851} lat={53.458098} dir="forward" ref="11">Buxtehuder Straße</.v>. Auf der anderen Straßenseite angekommen, ordnet man sich auf einem <.ref>Schutzstreifen</.ref> gemeinsam mit den KFZ auf der Rechtsabbieger Spur ein. In der <.v bounds="9.987878,53.456819,9.990353,53.458594" lon={9.988535} lat={53.457421} dir="forward" ref="11">Moorstraße</.v> schließt wieder ein Radfahrstreifen an. In die andere Richtung <.v bounds="9.987878,53.456819,9.990353,53.458594" lon={9.988293} lat={53.4571} dir="backward" ref="11">startet</.v> man von einem <.ref>Radfahrstreifen in Mittellage</.ref> und biegt dann <.ref>direkt</.ref> in einem großen Bogen nach links ab. Dann nochmal <.v bounds="9.987878,53.456819,9.990353,53.458594" lon={9.989118} lat={53.457689} dir="backward" ref="11">rechts abbiegen</.v> und man folgt wie heute der <.v bounds="9.987878,53.456819,9.990353,53.458594" lon={9.98941} lat={53.458059} dir="backward" ref="11">Hannoverschen Straße</.v>.</p>

    <p>Entlang des künftigen Radschnellweg nach Tostedt quert man die <.v bounds="9.987878,53.456819,9.990353,53.458594" lon={9.988851} lat={53.458098} dir="forward" ref="11">Buxtehuder Straße</.v> genau wie im vorigen Absatz beschrieben. Statt rechts in die Moorstraße abzubiegen, fährt man gerade aus auf einem Radfahrstreifen in Mittellage weiter. In der Gegenrichtung bleibt der Radfahrstreifen rechts der KFZ-Spuren.</p>

    <p>Entlang des künftigen Radschnellweg nach Lüneburg entfällt die Führung auf der Bahnseite. D.h. man quert zunächst wie vorher beschrieben, biegt dann aber zusätzlich nochmal indirekt links ab um die Walter-Dudek-Brücke zu erreichen. Die Gegenrichtung ist deutlich einfacher: zwei mal rechts abbiegen.</p>

    <p>Zwischen den <.v bounds="9.98858,53.457216,9.990344,53.458257" lon={9.989153} lat={53.457595} dir="backward" ref="11">beiden Brücken und Bahngleis</.v> soll ein Fahrradparkhaus entstehen. Eine Fußampel soll das ebenerdige Queren der <.v bounds="9.988797,53.456933,9.990562,53.457975" lon={9.98914} lat={53.4575} dir="forward" ref="rsw-lueneburg">Walter-Dudek-Brücke</.v> ermöglichen.</p>

    <h5>Busbahnhof und Zugbahnhof (Abschnitt 1, Planung abgeschlossen)</h5>
    <p>Zwischen heutigem <.m bounds="9.988877,53.456468,9.990531,53.457379">Busbahnhof</.m> und dem <.m bounds="9.986535,53.455713,9.98908,53.457055">Phoenix Center</.m> soll in der Straßenmitte weitere Bushaltestellen entstehen. Ein gemeinsames Dach soll dabei beide Busstiege überspannen, unter dem auch der KFZ-Verkehr in Richtung der Kreuzung geführt wird.</p>

    <p>Für den Radverkehr sind 1,60m bis 2,0m breite <.ref>Radfahrstreifen</.ref> vorgesehen. An einer Engstelle sogar nur 1,50m. Bis auf ein kurzes Stück nach der großen Kreuzung auf <.v bounds="9.985416,53.455697,9.990053,53.457591" lon={9.988877} lat={53.457046} dir="forward" ref="rsw-tostedt">der Seite des Phoenix Center</.v> ist keine Trennung vom KFZ-Verkehr vorgesehen. Der Radfahrstreifen nach Norden ist dabei durchgängig bis zur <.v bounds="9.987853,53.456458,9.992908,53.457892" lon={9.990521} lat={53.457543} dir="backward" ref="rsw-lueneburg">Walter-Dudek-Brücke</.v>.</p>

    <h5>Um die Schlachthofbrücke (Abschnitt 1, Planung abgeschlossen)</h5>
    <p>In Fahrtrichtung Tostedt wird man ab <.v bounds="9.987512,53.454469,9.992079,53.457617" lon={9.990055} lat={53.455359} dir="forward" ref="rsw-tostedt">Höhe Einfahrt Bahnhof</.v> auf den vorhandenen Hochbordradweg aufgeleitet. Linksabbiegen zum Bahnhof ist nur <.ref>direkt</.ref> möglich, wer sich das nicht traut muss absteigen und über die Fußampel schieben. In der Gegenrichtung wird man vor der <.v bounds="9.987688,53.45423,9.992254,53.457378" lon={9.991322} lat={53.45444} dir="backward" ref="rsw-tostedt">Schlachthofbrücke</.v> auf den Radfahrstreifen geleitet. Die Einfahrt zum Bahnhof ist als Radfahrstreifen in Mittellage geplant.</p>

    <p>Die Breiten fallen mit 1,63m bis 2,0m unterschiedlich aus.</p>

    <h4>Meinung</h4>
    <p>Die Situation auf dem Doppelknoten ist katastrophal – man wirft den Radverkehr ungeschützt in eine bis zu 8-spurige Kreuzung. Beim Rechtsabbiegen in die Moorburger Straße reicht es noch nicht mal für eigene Wege – ein Alibi-Schutzstreifen soll's richten. Die Führung entlang des Radschnellwegs nach Lüneburg ist so umständlich, dass eine angedachte neue Brücke über die Bahngleise weiter nördlich praktisch zur Pflicht wird.</p>

    <p>Die Führung entlang des Radschnellwegs Tostedt hat ähnliche Probleme. Radfahrstreifen mit nur 1,60m Breite oder in Mittellage – immerhin nicht beides gleichzeitig. Das man dem Radverkehr eine Engstelle aufbürdet nur um eine KFZ-Ampel unterzubringen zeigt klar die Prioritäten der Planung. Fairerweise muss man sagen, dass zum Zeitpunkt der Planung dieser Abschnitt noch nicht als Radschnellweg gedacht war.</p>

    <p>Positiv ist, dass man erstmals entlang der Hannoverschen Straße nach Norden durchfahren kann ohne die Straßenseite wechseln zu müssen. Dass die undurchsichtigen Zweirichtungs-Radwege entfallen ist ebenfalls gut. Und obwohl auch die neue Führung der Veloroute 11 sicher nicht optimal ist, sind die Kurvenradien deutlich angenehmer zu befahren als heute.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
