defmodule Data.Article.Blog.ZOBHarburg do
  use Article.Default

  def created_at(), do: ~D[2022-01-15]
  def title(), do: "Busbahnhof Harburg und anliegende Kreuzung"

  def start(), do: ~d[2022-03]
  def stop(), do: ~d[2025]

  def type(), do: :planned

  def summary(),
    do:
      "Jahre alte Planung soll umgesetzt werden. Schmale Radfahrstreifen verlaufen ungeschützt über die riesige Kreuzung."

  def tags(), do: ["11", "rsw-lueneburg"]

  def links(_assigns) do
    [
      {"Zeitungsartikel mit Visualisierung (2021)",
       "https://www.elbe-wochenblatt.de/2021/02/12/heftige-kritik-am-geplanten-umbau-des-harburger-busbahnhofs/"},
      {"Zeitungsartikel zum Bauzeitraum (2021)",
       "https://www.abendblatt.de/hamburg/harburg/article231356884/Harburgs-Zentraler-Busbahnhof-wird-drei-Jahre-geschlossen.html"},
      {"Bestätigung der Pläne des Verkehrssenators (2022)",
       "https://twitter.com/anjes_tjarks/status/1482231808209129474"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Kreuzung wird vom Autoverkehr dominiert. Wer zu Fuß unterwegs ist und auf ebenerdige Wege angewiesen ist, muss teils riesige Umwege in Kauf nehmen: der <.m bounds="9.989281,53.457167,9.992087,53.457861" lon="9.989458" lat="53.457387" dir="forward" ref="rsw-lueneburg">Walter-Dudek-Brücke</.m> fehlt eine solche Querungsmöglichkeit.</p>

    <p>Dem Radverkehr machen die Ampelschaltungen zu schaffen. Die Fahrt entlang der <.a href="/alltagsroute-11">Alltagsroute 11</.a> von der <.m bounds="9.986975,53.456788,9.988792,53.457455" lon="9.987975" lat="53.457055" dir="backward" ref="11">Moorstraße</.m> auf die <.m bounds="9.988803,53.457817,9.990229,53.458536" lon="9.989208" lat="53.457934" dir="backward" ref="11">Hannoversche Brücke</.m> dauert knapp zwei Minuten, für nur rund 150m. Die Radwege selbst sind <.ref>Hochbordradwege</.ref>, aber ein Großteil der Wege besteht aus den langen Querungsfurten.</p>
    <p>Am Busbahnhof wiederum fehlen Busstiege um die hohe Anzahl der hier haltenden Busse abfertigen zu können.</p>

    <h4>Planung</h4>
    <p>Die bereits einige Jahre alte Planung soll hauptsächlich die Situation für den Busverkehr verbessern. Dazu wird eine weitere Haltestelle in der Straßenmitte im <.m bounds="9.988674,53.456337,9.989551,53.457146">südlichen Teil der Hannoverschen Straße</.m> gebaut.</p>
    <p>Für den Radverkehr sind <.ref>Radfahrstreifen</.ref> vorgesehen. Da die Planung älter ist als der die Einigung mit dem <.a href="https://radentscheid-hamburg.de/">Radentscheid Hamburg</.a> kommen auch solche in <.ref>Mittellage</.ref> zum Einsatz. Sie sind nach Augenmaß eher schmal.</p>
    <p>Die für den <.a href="/rsw-lueneburg">Radschnellweg Lüneburg</.a> wichtige Verbindung von der <.m bounds="9.988558,53.457245,9.990438,53.458471" lon="9.988818" lat="53.45805" dir="forward" ref="rsw-lueneburg">Hannoverschen zur Walter-Dudek-Brücke</.m> scheint künftig ohne den Zweirichtungs-Radweg auf der Bahnseite auskommen zu müssen. Es muss hier also entweder Geschoben oder die Kreuzung zweimal gequert werden.</p>

    <h4>Meinung</h4>
    <p>Eine Beurteilung fällt ohne die genauen Pläne schwierig. Es ist klar das der Busverkehr in der Planung im Vordergrund stand, für den es eine spürbare Verbesserung geben sollte. Beim Radverkehr stellen die schmalen, ungeschützen Radfahrstreifen auf einer riesigen, sechsspurigen Kreuzung eher eine Verschlechterung dar.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
