defmodule Data.Article.Blog.BbhMeiendorferStrasse do
  use Article.Default

  def title(), do: "Meiendorfer Straße – Busbetriebshof (Freizeitroute 2)"

  def summary(),
    do: "Kreuzung entlang der Freizeitroute bekommt Ampel mit einseitiger Furt über den Hauptarm."

  def type(), do: :planned

  def start(), do: ~d[2026Q4]
  def stop(), do: ~d[2026Q4]

  def tags(), do: ["FR2"]

  def map_image do
    {name(),
     [
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
     ]}
  end

  def links(_assigns) do
    [
      {"fertiger Entwurf, Erläuterungen", ~d[2026-01],
       "https://lsbg.hamburg.de/resource/blob/1130736/4799ab46a4d07fd6c151d02708965a67/meiendorfer-strasse-bbh-erschliessung-abgestimmte-planung-bericht-data.pdf"},
      {"fertiger Entwurf, Karte", ~d[2026-01],
       "https://lsbg.hamburg.de/resource/blob/1130738/1e7ec6dd30fb47dc3181189874908dc1/meiendorfer-strasse-bbh-erschliessung-abgestimmte-planung-plan-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Das Queren der Meiendorfer Straße ist bisher nur durch abpassen einer Lücke aus beiden Fahrtrichtungen möglich. Wegen der hohen Geschwindigkeiten und Breite der Straße wartet man teils lang.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die Kreuzung erhält eine Ampel als <.ref>Querungshilfe</.ref>. Über den Hauptarm wird nur auf der Nordseite eine Furt angelegt. Wer von <.v bounds="10.17315,53.63033,10.201365,53.639664" lon={10.178637} lat={53.637228} dir="forward" ref={Freizeitroute2}>Meiendorf</.v> Richtung <.v bounds="10.178771,53.628113,10.223325,53.647196" lon={10.209293} lat={53.63366} dir="forward" ref={Freizeitroute2}>Stellmoorer Tunneltal</.v> will und auf den Radwegen fährt, muss also leicht kurvig fahren.</p>

    <p>Die Zuwegung auf Meiendorfer Seite erfolgt über 2,25m breite <.ref>Hochbordradwege</.ref>. Der Feldweg bleibt wie heute ohne getrennte Führung.</p>

    <p>Die Zufahrt zum Busbetriebshof erfolgt jeweils über Gehweg bzw. Radwegüberfahren. Hauptsächlich über den <.v bounds="10.186716,53.634626,10.189826,53.635813" lon={10.187906} lat={53.635276} dir="backward" ref={Freizeitroute2}>Nebenarm beim Strommast</.v>. <.m bounds="10.18874,53.63517,10.192253,53.637266" highlight="Nornenweg">Höhe des Nornenwegs</.m> wird eine Notzufahrt eingerichtet.</p>

    <h4>Meinung</h4>
    <p>Man gab die klare Führung mit zwei Furten über den Hauptarm auf, um den Durchsatz vom Busbetriebshof zu erhöhen. Nicht ideal, für reinen Freizeitverkehr aber okay.</p>

    <p>Unverständlich ist die Lösung entlang des Hauptarms: nur Kombi-Fuß-Rad-Ampeln, die dem Radverkehr unnötig lange Rot geben. Auch ist die Zweirichtungsfurt nicht gegen unachtsame Linksabbieger gesichert. So verhindert man eine attraktive Radführung, weil auch „Fast-Unfälle“ davon abhalten, das Fahrrad zu nutzen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
