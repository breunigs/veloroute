defmodule Data.Article.Blog.SaselheiderStrasse do
  use Article.Default

  def created_at(), do: ~D[2021-12-11]
  def title(), do: "Saselheider Straße (Veloroute 6)"

  def type(), do: :issue
  def tags(), do: ["6"]

  def links(_assigns) do
    [
      {"Erläuterungen der Betroffenen (1)",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi//vo020.asp?VOLFDNR=1014640"},
      {"Erläuterungen der Betroffenen (2)",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi//vo020.asp?VOLFDNR=1014683"},
      {"Erläuterungen der Betroffenen (3)",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi//vo020.asp?VOLFDNR=1014684"},
      {"Diskussion im Mobilitätsausschuss",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi//to020.asp?TOLFDNR=1042014"}
    ]
  end

  def summary(),
    do:
      "Durchgangsverkehr in Wohngebiet macht Veloroute unattraktiv. Viele Autofahrende halten sich nicht an Tempo 30."

  def text(assigns) do
    ~H"""
    <h4>Sachverhalt</h4>
    <p>2021 wurde <.v bounds="10.135077,53.634305,10.137988,53.636035" lon={10.13611} lat={53.63489} dir="forward" ref="6">Beim Farenland</.v> eine Ampel eingerichtet, um die Querungsmöglichkeiten für Fuß- und Radverkehr zu verbessern (<.a name="2019-01-11-6-beim-farenland">Artikel</.a>). Seitdem berichten Ortsansässige von einer starken Zunahme des KFZ-Durchgangsverkehr, insbesondere auch von KFZ mit auswärtigem Kennzeichen. Sie bemängeln weiter, dass Viele sich nicht an die Verkehrsregeln halten und rasen oder Radfahrende abdrängen. Zudem befürchten die Betroffenen, dass ein geplanter Kreisverkehr am <.m bounds="10.134064,53.63707,10.135764,53.63814">Meiendorfer Mühlenweg</.m> die Situation verschlimmern könnte.</p>

    <p>Eine genaue Lösung gibt es noch nicht. Man überprüfe aber mögliche Änderungen um die Situation zu verbessern. Zur Einschätzung des Problems zähle die Polizei auch den Durchgangsverkehr.</p>

    <h4>Meinung</h4>
    <p>Es wirkt glaubhaft, dass Navis die Autofahrenden wegen weniger Sekunden Zeitersparnis durch Wohngebiete lenken. Wenn diese zusätzlich rasen und so die Fahrzeit weiter verkürzen, tritt ein verstärkender Effekt auf, sodass die Navis noch mehr Leute durchleiten. Die Politik muss hier auch die Navi-Hersteller in die Pflicht nehmen, Durchgangsverkehr nicht durch Wohngebiete zu schicken.</p>

    <p>Möglicherweise helfen auch einfache Maßnahmen wie „Anwohner frei“ Beschilderungen oder die Einrichtung von KFZ-Einbahnstraßen. Auch Poller die nur für Rad- und Fußverkehr passierbar sind wurden vorgeschlagen. Angeblich sei das jedoch rechtlich schwierig und die Prüfung daher langwierig. Das mag zwar so sein, sollte aber nicht verhindern frühzeitig Gegenmaßnahmen zu erproben.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
