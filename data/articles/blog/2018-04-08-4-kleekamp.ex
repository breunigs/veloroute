defmodule Data.Article.Blog.Kleekamp do
  use Article.Default

  def name(), do: "#{created_at()}-4-kleekamp"
  def created_at(), do: ~D[2018-04-08]

  def title(), do: "Kleekamp (Veloroute 4)"

  def start(), do: ~d[2020-09-28]
  def stop(), do: ~d[2021-09-30]

  def type(), do: :finished
  def construction_site_id_hh(), do: [12308]
  def tags(), do: ["4"]

  def links(_assigns) do
    [
      {"Erläuterungsbericht zum Schlussentwurf",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1008211"},
      {"Beschreibung der Bauabschnitte und -zeiten",
       "https://web.archive.org/web/20230925235208/https://www.hamburg.de/hamburg-nord/14243888/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p><strong>Update:</strong> Der Plan liegt mittlerweile in der Schlussfassung vor und nimmt nur Detailanpassungen vor. Weil die Hochbahn an der Bahnstrecke baut, verschiebt sich die Umsetzung um ca. drei Monate in den Herbst.</p> <p>Im <.m bounds="10.024948,53.632038,10.025892,53.637734">Kleekamp</.m> soll sich nur wenig ändern: die Parkplätze werden stellenweise so angepasst, das sie beim Ausparken weniger lang „blind“ den Radverkehr gefährden könnten. Der Fahrbahnbelag soll ebenfalls erneuert werden.</p> <p>Die wesentliche Verbesserung für den Radverkehr ist der Vorschlag die Ampel an der <.m bounds="10.022014,53.633418,10.027496,53.636682">Kreuzung Kleekamp/Hummelsbütteler Kirchenweg</.m> durch einen kleinen Kreisel zu ersetzen. Durch den hier passierenden Busverkehr könnte der HVV aber noch Bedenken anmelden. Da es sich nur um einen ersten Entwurf handelt, sind Änderungen also sogar wahrscheinlich.</p> <p>Bei den Tempolimits bleibt auch alles beim alten: Um die U-Bahn Station 50 km/h, ansonsten 30 km/h. Es ist etwas kurios das die 50 km/h beibehalten werden sollen, obwohl sie laut Bericht nur selten erreicht werden. Eine Reduzierung könnte hier deutlich den Druck Radfahrende noch irgendwie zu überholen deutlich senken. Auch der Regionalausschuss hatte darauf hingewiesen, das rund 25% der Radfahrenden heute den Gehweg nutzen und durch 30 km/h die Fahrbahn attraktiver gemacht werden könne.</p> <p>Der Kreisel und die Belagerneuerung sind zu begrüßen, ebenso die zusätzlichen Abstellbügel. Warum man unbedingt an den 50 km/h festhalten will ist jedoch verwunderlich. Umgesetzt werden sollten die Maßnahmen ab Herbst 2019 – es wurde aber Herbst 2020 daraus.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
