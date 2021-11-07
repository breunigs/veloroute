defmodule Data.Article.Blog.StormarnerStrasseEulenkamp do
  use Article.Default

  def name(), do: "#{created_at()}-6-stormarner-strasse-eulenkamp"
  def created_at(), do: ~D[2019-10-18]
  def updated_at(), do: ~D[2019-12-08]
  def title(), do: "Stormarner Straße und Eulenkamp West (Veloroute 6)"

  def start(), do: ~d[2021-03-22]
  def stop(), do: ~d[2022-04-30]

  def type(), do: :construction
  def construction_site_id_hh(), do: [15014]
  def tags(), do: ["6", "w13"]

  def tracks(),
    do: [
      %Video.Track{
        group: "detour",
        direction: :forward,
        from: "",
        to: "",
        parent_ref: __MODULE__,
        text: "Umleitung",
        videos: [
          {"2021-06-19-veloroute6/GX011852", :start, :end},
          {"2021-06-19-veloroute6/GX011853", :start, :end}
        ]
      }
    ]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand Dezember 2019:</strong> Die Planung wurde zwar im September 2019 abgeschlossen, nach Kritik von ADFC und Seniorenbeirat jedoch nochmals überarbeitet. Das Meckern hat sich gelohnt, die neueste Planung ist für den Radverkehr erheblich sicherer als nach dem vorigen Stand. Der Artikel wurde an den aktuellen Plan angepasst.</p>

    <p>Die Fahrradroute in der <.m bounds="10.05852,53.575489,10.064509,53.578955">Stormarner Straße</.m> bzw. <.m bounds="10.064109,53.578588,10.109514,53.591743">Walddörferstraße</.m> krankt an den geringen Breiten der Radfahrstreifen, die nahe der Kreuzungen auch unvermittelt aufhören. In der <.m bounds="10.059697,53.578874,10.065269,53.585348">Elsässer Straße</.m> und dem <.m bounds="10.064856,53.579146,10.075162,53.589051">Eulenkamp</.m> kommt jeweils noch das unkomfortable Kopfsteinpflaster hinzu. Für Radfahrende, die von der  <.a href="/#18/53.579033/10.064739">Walddörferstraße</.a> links in die <.a href="/#18/53.579033/10.064739">Elsässer Straße</.a> abbiegen möchten, gibt es bisher auch keine klare Führung.</p>

    <p>Mit dem Umbau wird die Situation deutlich besser. Für den Radverkehr gibt es überall Asphalt als Oberfläche. Meist werden Radfahrstreifen von Rund 1,60m Breite eingesetzt, was hauptsächlich dem Parkplatzerhalt geschuldet ist – die Sicherheitsabstände zu Türen und beim Ausparken reduzieren die verfügbare Breite merklich. Ausnahmen sind das <.a href="/6#18/53.576888/10.060035/rPYM0kVC8OnkzOgmJVTUnw">Teilstück Stormarner Straße zwischen S-Bahnhof und Wandsbeker Königstraße</.a>, wo es 2m breite Radfahrstreifen gibt. Stadteinwärts sogar durch einen extra Randstein geschützt um illegales Überfahren bei KFZ-Rückstau zu verhindern. Dies war der eingangs erwähnte Streitpunkt. Zwei Meter Breite gibt's auch ab der <.a href="/6#18/53.580515/10.067433/sBCERCJOggm-lQ5GyrUZVg">Hultschiner Straße</.a>. In der <.a href="/6#18/53.578937/10.06505/fNfn7HqxYsypP6nY0cks2w">Elsässer Straße</.a> gibt's dagegen nur 1,6m Breite Schutzstreifen. Zum Glück handelt es sich um ein sehr kurzes Stück.</p>

    <p>Bei den Kreuzungen gibt es auch Verbesserungen: Die völlig überdimensionierte Kreuzung <.a href="/6#18/53.580513/10.066269/cTwyFHywht-QOaUqVexXbg">Lengereckestraße/Hultschiner Straße</.a> wird deutlich enger gefasst um Tempo herauszunehmen. An der <.a href="/6#18/53.579033/10.064739/hKqa3YJlOQvTcTBwzVqspw">Einmündung Elsässer Straße in die Walddörferstraße</.a> wird auf Anregung des ADFC eine kleine Verkehrsinsel eingerichtet, damit rechtsabbiegende KFZ Platz für den Radverkehr lassen. In der Gegenrichtung wird zusätzlich eine indirekte Linksabiegemöglichkeit über die Fußampel geschaffen. Diese rückt dazu näher an die Kreuzung und erkennt Radfahrende mittels Wärmebild, schaltet aber immer nur nach Anforderung bzw. Erkennung.</p>
    <ul>
    <li><.a href="https://www.hamburg.de/wandsbek/strassenbaustellen/14941782/stormarner-strasse-eulenkamp/">Infoseite der Stadt zum Umbau</.a></li>
    <li><.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1008509">Erläuterungsbericht zum Umbau</.a></li>
    <li><.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1008955">Lagepläne</.a></li>
    <li><.a href="https://suche.transparenz.hamburg.de/dataset/9e5fb528-3285-45e7-ba35-ba13aff4556f">Vergabe des Umbaus</.a> (Bauzeitraum auf Seite 21)</li>
    </ul>
    """
  end
end
