defmodule Data.Article.Blog.OttoBrennerStrasse do
  use Article.Default

  def created_at(), do: ~D[2020-06-08]
  def updated_at(), do: ~D[2021-10-16]
  def title(), do: "Otto-Brenner-Straße (Veloroute 10)"

  def start(), do: ~d[2022Q3]

  def type(), do: :planned

  def tags(), do: ["10", "M12.2"]

  def links(_assigns) do
    [
      {"Präsentation Veloroute 10 auf Wilhelmsburg (Mai 2021)",
       "https://sitzungsdienst-hamburg-mitte.hamburg.de/bi//to020.asp?TOLFDNR=1028260"},
      {"Planungsstand Anfang Oktober 2020",
       "https://sitzungsdienst-hamburg-mitte.hamburg.de/bi/vo020.asp?VOLFDNR=1013483"},
      {"Infoseite der Stadt", "noch keine Pläne für diese Maßnahme",
       "https://www.hamburg.de/mitte/strassenbau-und-verkehr/13884848/veloroute-10-ausbau-veddel-wilhelmsburg/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Oktober 2021</h4> <p>Aus einer Präsentation vom Mai 2021 gehen Details zur Umplanung hervor, sodass der Artikel konkretisiert wurde. Die vollständigen Berichte wurden noch nicht veröffentlicht.</p>
    <h4>Alter Zustand</h4> <p>In der <.m bounds="10.007467,53.481221,10.021906,53.492219" lon={10.018672} lat={53.487064} dir="forward">Otto-Brenner-Straße</.m> gibt es nur teilweise <.ref>Hochbordradwege</.ref>, die zudem in sehr schlechtem Zustand sind. In vielen Abschnitten ist ein Fußweg mit „<.ref>Fahrrad frei</.ref>“ beschildert, auf den der Radverkehr gelenkt wird. Eine Ableitung auf die Fahrbahn erfolgt nicht.</p>
    <h4>Planung</h4> <p>Es ist vorgesehen je eine KFZ-Spur zu einem <.ref>Radfahrstreifen</.ref> umzuwidmen und diesen stellenweise als <.ref>Protected-Bike-Lane</.ref> auszuführen. Neben KFZ-Parkplätzen und an Bushaltestellen sind keine Schutzelemente vorgesehen; bei den Haltestellen muss der Radverkehr entweder hinter dem Bus warten oder sich in den KFZ-Verkehr einordnen.</p>
    <p>An der <.m bounds="10.013404,53.488846,10.024662,53.494314" lon={10.018595} lat={53.491694} dir="forward">Einmündung Kirchdorfer Straße</.m> bleibt der Radfahrstreifen jeweils rechts der KFZ-Spuren. In Fahrtrichtung Süden soll die Ampel so geschalten werden, das der Radverkehr sicher links abbiegen kann – also vermutlich eine eigene Ampelphase erhalten. An den Einmündungen sind zumindest teilweise sowohl <.ref>indirektes</.ref> als auch <.ref>direktes</.ref> Linksabbiegen vorgesehen.</p>
    <h4>Meinung</h4> <p>Für den Rad- und Fußverkehr wäre dieser Umbau vorteilhaft, da diese Verkehrsarten hier erstmals ordentlich getrennt werden. Das der Radweg an Bushaltestellen einfach aufhört oder die Schutzelemente nicht durchgängig vorhanden sind gehört leider zum Hamburger Standard. Eine vollständige Bewertung bleibt schwierig, da die Präsentation nur kleine Ausschnitte aus den Plänen enthält.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
