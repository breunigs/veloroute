defmodule Data.Article.Blog.StGeorgZentralpark do
  use Article.Default

  def created_at(), do: ~D[2021-05-22]

  def title(), do: "St. Georg Zentralpark (Veloroute 8)"

  def start(), do: ~d[2021-04]

  def type(), do: :finished

  def tags(), do: ["8"]

  def links(_assigns) do
    [
      {"Infoseite der Stadt zum Ausbau der Veloroute 8",
       "„Sichere Querungen an der Adenauerallee und dem Nagelsweg“",
       "https://www.hamburg.de/mitte/strassenbau-und-verkehr/14892540/veloroute-08-ausbau/"},
      {"Hinweise der Polizei zur Unfallhäufung",
       "https://sitzungsdienst-hamburg-mitte.hamburg.de/bi/vo020.asp?VOLFDNR=1011801"},
      {"Umbau des Zentralparks",
       "http://root.urbanista.de/deinegeest_blog/2021/01/21/bauarbeiten-am-zentralpark-beginnen/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Die Querung des <.v bounds="10.013957,53.551932,10.017007,53.553045" lon={10.0156473} lat={53.5523843} dir="forward" ref={@ref}>Nagelswegs</.v> wird mit einer Ampel gesichert und ist nur für den Radverkehr Richtung Osten möglich. Die <.v bounds="10.016563,53.552054,10.019614,53.553167" lon={10.0180787} lat={53.552575} dir="forward" ref={@ref}>Adenauerallee</.v> wird ungesichert gequert und ist ebenfalls nur für den Radverkehr freigegeben. Dort werden Radfahrende häufig missachtet und (fast) umgefahren.</p>
    <h4>Planung</h4> <p>Zusammen mit der Umgestaltung des St. Georg Zentralparks sollen an beiden Stellen auch Querungsmöglichkeiten für den Fußverkehr geschaffen werden. Die Ampel am Nagelsweg wird entsprechend umgebaut. Bei der Adenauerallee wird eine Gehwegüberfahrt hergestellt um die geltenden Vorfahrtsregeln zu verdeutlichen und Autofahrende zu mäßiger Geschwindigkeit anzuhalten.</p>
    <h4>Meinung</h4> <p>Der eigentlich nur für Fahrtrichtung Osten gedachte Radweg wird in der Praxis wie ein gemeinsamer Rad- und Fußweg in beide Richtungen verwendet. Es war überfällig die Querung des Nagelwegs in beide Richtungen zu erlauben.</p>
    <p>Die Planung sah zunächst keine Änderung an der Gefahrenstelle Adenauerallee vor – obwohl sich Bürgerschaft, Straßenverkehrsbehörde und Polizei einig waren, das diese Stelle eine Umgestaltung erfordert. Es ist traurig, das man die Sicherheit von Rad- und Fußverkehr ignorierte, nur um dem Autoverkehr einen minimalen Vorteil zu verschaffen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
