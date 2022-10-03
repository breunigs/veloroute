defmodule Data.Article.Blog.EulenkampUQuerungNordschleswiger do
  use Article.Default

  def name(), do: "#{created_at()}-6-eulenkamp-u-querung-nordschleswiger"
  def created_at(), do: ~D[2019-10-31]
  def updated_at(), do: ~D[2020-11-29]
  def title(), do: "Eulenkamp zw. Nordschleswiger Straße und Friedrich-Ebert-Damm (Veloroute 6)"

  def start(), do: ~d[2021-02-08]
  def stop(), do: ~d[2022-04-30]

  def type(), do: :finished
  def construction_site_id_hh(), do: [14470, 15779]
  def tags(), do: ["6", "w14"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand November 2020:</strong> Vorbereitende Bauarbeiten haben begonnen. Auch die <.a href="https://fragdenstaat.de/anfrage/lageplan-veloroute-6-abschnitt-w14/#nachricht-513506">Lagepläne sind mittlerweile veröffentlicht</.a> worden. Der Artikel wurde entsprechend angepasst.</p>

    <p>Auf dem Teilstück des Eulenkamps zwischen <.m bounds="10.066666,53.580161,10.070243,53.581776" lon={10.0684529} lat={53.5807801} dir="forward">Nordschleswiger Straße</.m> und <.m bounds="10.066757,53.580654,10.074466,53.584134" lon={10.071166} lat={53.5828111} dir="forward">Straßburger Straße / Friedrich-Ebert-Damm</.m> sollen künftig jeweils
    Radfahrstreifen von rund 1,60m Breite den Radverkehr aufnehmen. Im Vergleich zur
    bisherigen Führung als 1m breiter Radweg bzw. im Mischverkehr ist dies eine deutliche
    Verbesserung. Jeweils neben dem Radweg werden je nach Baumwurzeln Parkplätze eingerichtet,
    wobei ein ca. 65cm breiter Sicherheitsstreifen Radfahrende vor unachtsam geöffneten
    Autotüren schützen soll. Das Kopfsteinpflaster wird im gesamten Bereich durch Asphalt
    ersetzt und sollte damit hohen Fahrkomfort bieten.</p>
    <p>Der Kreuzungsbereich <.m
    bounds="10.066757,53.580654,10.074466,53.584134" lon={10.071166} lat={53.5828111} dir="forward">Straßburger
    Straße / Friedrich-Ebert-Damm / Eulenkamp</.m> soll nochmal ganzheitlich umgeplant
    werden, weswegen die Radverkehrsführung nur entlang der Veloroute 6 genauer geplant
    wurde. Für die anderen Beziehungen wurde eine minimale Übergangslösung gesucht.
    Entlang der Veloroute fährt man von den Radfahrstreifen über Radfurten über die
    Kreuzung. Hier werden auch jeweils Aufstelltaschen mit eigener Radampel für indirektes
    Linksabbiegen eingeplant.</p>
    <p><.m bounds="10.068792,53.583128,10.073973,53.584327" lon={10.0718666} lat={53.5835517} dir="backward">Nördlich der Kreuzung</.m> wird der Straßburger Stieg künftig für den
    Radverkehr in beide Richtungen befahrbar sein. Damit man ihn sinnvoll erreichen
    kann ist vorgesehen ein kurzes Stück Zweirichtungsradweg mit 2,50m Breite einzurichten.</p>
    <p>Das Tempolimit bleibt bei 50 km/h. In Fahrtrichtung stadtauswärts ist ein <.ref>Radfahrstreifen in Mittellage</.ref> vorgesehen, stadteinwärts bleibt der Radverkehr dagegen rechts der KFZ-Spuren.</p>
    <ul><li><.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1008513">Erläuterungsbericht
    und Lagepläne</.a> (finale Fassung)</li><li><.a href="https://suche.transparenz.hamburg.de/dataset/364dbf59-71fb-4d41-8873-779dd1dd758e">Auftragsvergabe</.a> (Bauzeiten)</li></ul>
    """
  end
end
