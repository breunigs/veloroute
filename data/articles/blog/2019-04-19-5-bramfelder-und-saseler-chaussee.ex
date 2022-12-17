defmodule Data.Article.Blog.BramfelderUndSaselerChaussee do
  use Article.Default

  def name(), do: "#{created_at()}-5-bramfelder-und-saseler-chaussee"
  def created_at(), do: ~D[2019-04-19]
  def updated_at(), do: ~D[2020-06-15]
  def title(), do: "Bramfelder und Saseler Chaussee (Veloroute 5)"

  def start(), do: ~d[2021-04-12]
  def stop(), do: ~d[2021-08-31]

  def type(), do: :finished
  def construction_site_id_hh(), do: [15290]
  def tags(), do: ["5"]

  def links(_assigns) do
    [
      {"Änderung der Führung", "2020",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1012022"},
      {"Ausschreibung des Umbaus mit Lagenplänen", "2020",
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/eva/supplierportal/fhh/subproject/e41d0d93-ab1f-44d6-b517-613afa373007/details"},
      {"Lagepläne und Erläuterungsbericht zum ersten Entwurf", "2019",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1010137"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand 2020:</strong> Man hat aufgegeben die Führung um die  <.m bounds="10.095821,53.640909,10.098561,53.642541">Bushaltestelle Pfeilshofer Weg</.m> so zu verbessern, das man problemlos links in den <.m bounds="10.089331,53.641309,10.100578,53.643909">Pfeilshofer Weg</.m> abbiegen kann. Dies sei „<.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1012022">aus verkehrlichen Gründen</.a>“ nicht möglich. Die Veloroute 5 wird nun stattdessen weiter entlang der <.m lon={10.101425} lat={53.645965} dir="forward" bounds="10.085654,53.641002,10.116392,53.648107">Saseler Chaussee</.m> geführt um über den <.m bounds="10.087663,53.64684,10.109781,53.651953" lon={10.098874} lat={53.6488415} dir="forward">Frahmredder</.m> zur ursprünglichen Route zurückzuführen. Dazu sollen die Rad- und Fußwege erneuert werden. Wo möglich, wird der Radweg auf Mindestmaße verbreitert. Dies erfolgt auf Kosten von Grünflächen, Parkplätzen, des Fußwegs oder des Sicherheitsabstands zu KFZ, je nach lokaler Situation. Die Erneuerung erfolgt jeweils ohne die vorhandenen Bordsteine anzupassen, weswegen weiterhin Engstellen verbleiben.</p>
    <p>Die Fahrradwege entlang der <.m bounds="10.058741,53.593319,10.090246,53.633302">Bramfelder Chaussee</.m> und der <.m lon={10.101425} lat={53.645965} dir="forward" bounds="10.085654,53.641002,10.116392,53.648107">Saseler Chaussee</.m> sind nicht schlecht. Man merkt ihnen jedoch an, das sie gebaut wurden als das Fahrrad noch weniger Stellenwert genoss als heute. Meistens sind die Radwege nur 1,5m breit, was heute so gar nicht mehr neu geplant werden dürfte – die Mindestmaße betragen 1,6m zuzüglich Bodenindikatoren für Seheingeschränkte. An Engstellen werden die Wege erheblich schmäler oder gehen lapidar in „gemeinsame Rad- und Fußwege“ über, was insbesondere an Bushaltestellen problematisch ist.</p>
    <p>Die vorliegende Umplanung ist eine Sparvariante. Statt die Wege auf gesamter Länge dem Mindeststandard anzupassen, werden nur die schlimmsten Stellen verbessert. Somit ist das Überholen von Lastenrädern praktisch nur an Ampeln oder illegal über die Fußwege möglich.</p> <p>Konkret wird in Fahrtrichtung stadtauswärts die Engstelle zwischen <.m bounds="10.082772,53.62249,10.085512,53.624122">Nüßlerkamp und der Königsberger Straße</.m> entschärft. Dort halten die Busse künftig direkt auf der Straße statt in einer Busbucht. Somit entsteht genug Platz um den Fahrradweg hinter dem Einstiegsbereich fortführen zu können.</p>
    <p>In der Saseler Chaussee, ebenfalls stadtauswärts, werden <.m bounds="10.091371,53.636828,10.096853,53.640092">zwei weitere Engstellen</.m> entschärft. Man fällt (und ersetzt) hier einige Bäume bzw. entfernt einige Parkplätze um einen durchgehenden Radweg zu ermöglichen.</p>
    <p>Die vorliegende Planung verbessert in der Tat die Situation an den schlimmsten Engstellen. Im Umkehrschluss heißt dies aber auch, das etliche Engstellen verbleiben, die den Komfort sowohl für Rad- als auch für Fußverkehr erheblich einschränken. Hinzu kommt die zu geringe Breite auf fast gesamter Länge. Besonders fragwürdig ist etwa warum die <.m bounds="10.08252,53.622386,10.08526,53.624018">Bushaltestelle Königsberger Straße</.m> nur stadtauswärts verbessert wird, wenn in Gegenrichtung exakt die gleiche Problematik herrscht. Sogar die Lösung, das der Bus auf der Straße statt in einer Busbucht hält würde hier Linderung verschaffen. Insgesamt kann ich aufgrund dieser homöopathischen Verbesserung nur den Kopf schütteln.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
