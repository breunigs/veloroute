defmodule Data.Article.Blog.Valentinskamp do
  use Article.Default

  def name(), do: "#{created_at()}-valentinskamp"
  def created_at(), do: ~D[2021-05-06]

  def title(), do: "Valentinskamp (Verbindung Veloroute 1/2 mit Veloroute 3)"

  def start(), do: ~d[2021Q4]
  def stop(), do: ~d[20212Q2]

  def type(), do: :planned

  def tags(), do: [1, 2, 3, "M10.2a"]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Im Valentinskamp gibt es keine eigenen Wege für den Radverkehr. Dieser muss bei Tempo 50 im <ref>Mischverkehr</ref> die Fahrbahn mit den KFZ teilen.</p>
    <h4>Planung</h4> <p>Zukünftig soll der Radverkehr mindestens 1,60m breite <ref>Radfahrstreifen</ref> erhalten, teilweise ist auch mehr vorgesehen. An den Bushaltestellen wird der Radverkehr über die Wartefläche der Busse geführt, wobei genug Platz verbleibt um an einem haltenden Bus vorbeizufahren.</p>
    <p>Am <.m bounds="9.978669,53.554734,9.982303,53.55605">Johannes-Brahms-Platz</.m> müssen Radfahrende über die KFZ-Spur links abbiegen. Geradeaus und <ref name="indirekt">indirektes Linksabbiegen</ref> sind nicht vorgesehen.</p>
    <p>Die <.m bounds="9.982849,53.55528,9.985371,53.556091">Kreuzung mit der Caffamacherreihe</.m> wird leicht angepasst um die Fahrt Richtung Innenstadt entgegen der KFZ-Einbahnstraße zu verbessern. Zum Linksabbiegen sind teilweise breite Aufstellflächen vor den KFZ vorgesehen („ARAS“). Wer hier bei grün ankommt muss sich hinter den Autos einordnen und erst nach ihnen abbiegen. In Richtung bergauf gibt es einen <ref>Radfahrstreifen in Mittellage</ref> und in der Kreuzung eine Aufstelltasche zum <ref name="indirekt">indirekten Linksabbiegen</ref>. Der südliche Teil der Caffamacherreihe bleibt wie heute und wird nicht nochmal umgebaut.</p>
    <p><.m bounds="9.986118,53.555331,9.989073,53.556182">Richtung Gänsemarkt</.m> kann über einen <ref>Radfahrstreifen in Mittellage</ref> links abgebogen werden.</p>
    <p>Die <.m bounds="9.984068,53.553935,9.987987,53.555054">ABC-Straße und Neue ABC-Straße</.m> werden zu einer KFZ-Einbahnstraße vom Valentinskamp weg und werden entsprechend angepasst. Der Radverkehr kann weiterhin in beide Richtungen fahren. Die temporäre Mittelinsel über den Valentinskamp an dieser Stelle wird dauerhaft eingerichtet, um das Queren der Straße zu erleichtern.</p>
    <p>Viele neue Radanlehnbügel werden ebenfalls installiert.</p>
    <h4>Meinung</h4> <p>Die Planung löst die wichtigsten Probleme des Radverkehrs in der Straße, verpasst aber die Chance die Aufenthaltsqualität deutlich zu verbessern. Würde man auf die KFZ-Abbiegespuren an jeder Kreuzung verzichten, könnte die Fahrbahn deutlich kompakter werden. Ebenso könnten die KFZ auch kurz hinter den wenigen Bussen warten. So bleiben die Fußwege zu schmal für den heutigen Fußverkehr.</p>
    <p>Die <ref>Radfahrstreifen in Mittellage</ref> sind problematisch. Auch eine Sicherung gegen Falschparken fehlt, was heute leider dauerhaft gemacht wird. Die Engstelle mit nur 1,60m wurde mit Kanalrinne gemessen – der nutzbare Platz fällt also noch geringer aus. All dies lässt Zweifel aufkommen ob der Abschnitt künftig wirklich angenehm zu befahren sein wird.</p>
    <h4>Quelle</h4> <p><.a href="https://www.hamburg.de/mitte/strassenbau-und-verkehr/14991488/veloroute-1-ausbau/">Infoseite der Stadt</.a> (Die Seite enthält mehr als eine Baumaßnahme, ggf. scrollen)</p>
    """
  end
end
