defmodule Data.Article.Blog.UppenhofUndEulenkrugstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-6-uppenhof-und-eulenkrugstrasse"
  def created_at(), do: ~D[2019-04-20]
  def updated(), do: ~D[2019-12-01]
  def title(), do: "Uppenhof und Eulenkrugstraße (Veloroute 6)"

  def start(), do: ~d[2020-11-16]
  def stop(), do: ~d[2021-04-02]

  def type(), do: :finished
  def construction_site_id_hh(), do: [13141]
  def tags(), do: ["6"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand Dezember 2019:</strong> Offenbar wurde die Tempo-30-Regelung für den Uppenhof wieder verworfen, was vom <.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1010875">ADFC kritisiert wurde</.a>. Leider ist mir die genaue Begründung nicht bekannt, laut ADFC wird aber wohl die unten genannte Rechts-vor-Links Problematik angeführt.</p>
    <p>Kurz vorm Ende der Veloroute 6 wird das Abbiegen nochmal knifflig. Um in
    den <.m bounds="10.160169,53.646428,10.163081,53.649604">Uppenhof</.m> zu kommen muss man im Bereich der Bahnbrücke auf die Straße
    wechseln und sich gleich links einordnen. Vielen ist das offenbar zu gefährlich
    und sie fahren stattdessen auf der falschen Seite auf dem Fußweg. Dabei ist die
    Einmündung ein Unfallschwerpunkt – als Sofortmaßnahme ließ die Polizei Stop-Schilder
    aufstellen.</p>
    <p>Der <.m bounds="10.160169,53.646428,10.163081,53.649604">Uppenhof</.m> selbst ist eine gemischte Wohn- und Geschäftsstraße
    mit hohem Parkverkehr.</p>
    <p>Um die Situation für den Radverkehr zu verbessern
    soll der <.m bounds="10.160169,53.646428,10.163081,53.649604">Uppenhof</.m> als Tempo-30-Zone ausgewiesen werden. In der Regel trägt
    die reduzierte Geschwindigkeit zu einem angenehmeren Verkehrsfluss, weil Autofahrende
    weniger häufig zwanghaft überholen. Im Gegenzug gilt an den Nebenstraßen <.m bounds="10.16125,53.646706,10.163987,53.647853">Groten Hoff</.m> und der <.m bounds="10.163081,53.648625,10.167434,53.651929">Claus-Ferck-Straße</.m> Rechts-vor-Links, was dem Radverkehr
    nicht unbedingt dienlich ist.</p>
    <p>Konkrekt umgebaut wird aber nur die <.a href="/#17/53.646625/10.160273">Einmündung zur Eulenkrugstraße</.a>. Richtung Volksdorf wird nach der
    Aufleitung unter der Bahnbrücke ein 1,5m breiter Schutzstreifen bis nach der Einmündung
    angelegt. Außerdem wird eine Querungshilfe in Form einer kleinen Verkehrsinsel gebaut,
    sodass die Eulenkrugstraße in zwei Zügen gequert werden kann. Wer so Linksabbiegen
    möchte erhält auf der Waldseite zusätzlich eine kleine Aufstellfläche um den Schutzstreifen
    nicht zu blockieren. Von der Mittelinsel aus fährt man dann direkt auf der Fahrbahn
    im Uppenhof.</p>
    <p>Richtung Innenstadt bleibt es bei der aktuellen Situation. D.h.
    es bleibt beim Fußweg mit „Fahrrad frei“ bzw. beim Stop-Schild und kurzem Umweg
    über die Fahrbahn der Eulenkrugstraße. Die Einmündung wird für den KFZ Verkehr eingeengt,
    sodass sich nur noch ein Auto gleichzeitig aufstellen kann. Dies soll die häufigen
    Unfälle an dieser Stelle reduzieren.</p>
    <p>Die Verbesserungen im <.m bounds="10.160169,53.646428,10.163081,53.649604">Uppenhof</.m>
    und in Fahrtrichtung Volksdorf sind akzeptabel. Da hier kein starker Radverkehr
    herrscht und die Situation auch heute vergleichsweise angenehm ist, wäre große Umbauten
    zum aktuellen Zeitpunkt fehl am Platz. Warum man in Richtung Innenstadt den Hochbordradweg
    aber nicht bis an die Einmündung zieht ist unverständlich. Man weiß sehr genau das
    sich Radfahrende hier durchmogeln werden und fördert dies auch mit dem „Fahrrad
    frei“ Gehweg. Solche halbgaren Lösungen haben entlang einer Veloroute nichts zu
    suchen.</p>
    <p>
    <.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1011413">Erläuterungsbericht und Lagepläne des finalen Entwurfs</.a><br>
    Siehe auch: <.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1010875">Stellungnahme ADFC zum neueren Entwurf</.a><br>
    <.a href="https://www.hamburg.de/wandsbek/strassenbaustellen/14574482/eulenkrugstrasse-uppenhoff/">Infoseite der Stadt zur Baustelle</.a>
    </p>
    """
  end
end
