defmodule Data.Article.Blog.NorderelbbrueckeA1 do
  use Article.Default

  def title(),
    do: "Norderelbbrücke (Obergeorgswerder ↔ Moorfleet)"

  def summary(),
    do: "Neubau der bisher reinen Autobahnbrücke soll auch Rad- und Fußverkehr ermöglichen"

  def start(), do: ~d[2026]
  def stop(), do: ~d[2032]

  def type(), do: :intent
  def tags(), do: ["FR5"]

  def links(_assigns) do
    [
      {"Präsentation zur A26 Ost; Seite 17", "Januar 2024",
       "https://sitzungsdienst-harburg.hamburg.de/bi/vo020.asp?VOLFDNR=1011433"},
      {"Pläne und Erläuterungen; Planfeststellungsverfahren zum A1 Ausbau", "2023",
       "https://www.hamburg.de/bwi/np-aktuelle-planfeststellungsverfahren/17363612/ausbau-a1-nord/"},
      {"Deges Infoseite zum Umbau",
       "https://www.deges.de/projekte/projekt/a-1-achtstreifiger-ausbau-ad-hh-suedost-as-hh-harburg/#faq4"},
      {"Deges Broschüre zum Entwurfswettbewerb", "Mai 2019",
       "https://www.deges.de/wp-content/uploads/2019/12/dokumentation-realisierungswettbewerb-norderelbbruecke.pdf"},
      {"Wikipedia zur Geschichte der Brücke",
       "https://de.wikipedia.org/wiki/Norderelbbr%C3%BCcke_(K6)"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Autobahnbrücke aus den frühen 1960ern ist ausschließlich dem KFZ-Verkehr vorbehalten.</p>

    <h4>Planung</h4>
    <p>Der Neubau sieht einen kombinierten Rad- und Gehweg mit rund 4,0m nutzbarer Breite vor. Die <.v bounds="10.054883,53.503088,10.076745,53.515747" lon={10.062375} lat={53.509757} dir="forward" ref="FR5">Freizeitroute 5</.v> („Deich“) soll während der Bauzeit meistens benutzbar bleiben.</p>

    <p>Auf Wilhelmsburg erfolgt der Anschluss an den <.m bounds="10.048226,53.503834,10.060959,53.513411">Obergeorgswerder Hauptdeich</.m>. Dort soll ein Zweirichtungsradweg mit 4,0m Breite anschließen.</p>

    <p>Auf Moorfleeter Seite soll der Radweg mittels Rampe an den <.v bounds="10.058936,53.506639,10.06712,53.512435" lon={10.062389} lat={53.509931} dir="forward" ref="FR5">Kaltehofe-Hauptdeich</.v> angeschlossen werden. Eine direkte Verbindung in Richtung <.m bounds="10.064339,53.506929,10.077609,53.511799">Moorfleeter Deich</.m> ist nicht vorgesehen.</p>

    <h4>Meinung</h4>
    <p>Man sieht an den lächerlichen 4,0m Breite für den nicht motorisierten Verkehr im Vergleich zu den 51,5m (12 Fahrspuren plus Standstreifen) für KFZ- und LKW-Verkehr wo die Prioritäten lagen. Der in der Visualisierung gezeigte Lärmschutz ist entsprechend völlig unzureichend und dürfte ohne Nachbesserung die Nutzungszahlen gering halten.</p>

    <p>Zudem ist auf Moorfleeter Seite der Anschluss nur an die Freizeitroute vorgesehen. Für Alltagsverkehr sind die 1000m Umweg – rund ein Drittel mehr – unattraktiv.</p>

    <p>Immerhin wird dann eine Querung überhaupt möglich sein. Dass man die intensiv genutzte Freizeitroute entlang des Deiches bis auf einige Vollsperrungen benutzbar lassen möchte ist jedoch löblich. Beim Bau der Autobahn in der <.a name="2018-01-01-a26">Dritten Meile</.a> setzte man noch auf eine dauerhafte Vollsperrung.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
