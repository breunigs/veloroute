defmodule Data.Article.Blog.OttoBrennerStrasse do
  use Article.Default

  def created_at(), do: ~D[2020-06-08]
  def updated_at(), do: ~D[2021-10-16]
  def title(), do: "Otto-Brenner-Straße (Radroute 23)"

  def type(), do: :planned
  def start(), do: ~d[2026-03-01]
  def stop(), do: ~d[2027-08-31]
  def construction_site_id_hh(), do: [1_439_880]

  def tags(), do: ["radroute-23", "10", "M12.2"]

  def links(_assigns) do
    [
      {"Erläuterungsbericht und Karten", ~d[2025-07],
       "https://fragdenstaat.de/anfrage/otto-brenner-strasse-veloroute-10-neuenfelder-strasse-bis-kornweide-1/#nachricht-1014279"},
      {"Präsentation Veloroute 10 auf Wilhelmsburg (Mai 2021)",
       "https://sitzungsdienst-hamburg-mitte.hamburg.de/bi//to020.asp?TOLFDNR=1028260"},
      {"Planungsstand Anfang Oktober 2020",
       "https://sitzungsdienst-hamburg-mitte.hamburg.de/bi/vo020.asp?VOLFDNR=1013483"},
      {"Infoseite der Stadt", "noch keine Pläne für diese Maßnahme",
       "https://www.hamburg.de/mitte/strassenbau-und-verkehr/13884848/veloroute-10-ausbau-veddel-wilhelmsburg/"}
    ]
  end

  def map_image do
    {name(),
     [
       {"SBI beratende Ingenieure für BAU-VERKEHR-VERMESSUNGS GmbH", "https://www.sbi.de/"},
       {"Bezirksamt Hamburg-Mitte, Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/mitte/bezirksamt/bezirksamtsstruktur/dezernat-wirtschaft-bauen-umwelt-66718"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In der <.v bounds="10.007467,53.481221,10.021906,53.492219" lon={10.018672} lat={53.487064} dir="forward" ref={@ref}>Otto-Brenner-Straße</.v> gibt es nur teilweise <.ref>Hochbordradwege</.ref>, die zudem in sehr schlechtem Zustand sind. In vielen Abschnitten ist ein Fußweg mit „<.ref>Fahrrad frei</.ref>“ beschildert, auf den der Radverkehr gelenkt wird. Eine Ableitung auf die Fahrbahn erfolgt nicht.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Es ist vorgesehen je eine KFZ-Spur zu einem <.ref>Radfahrstreifen</.ref> umzuwidmen und diesen stellenweise als <.ref>Protected-Bike-Lane</.ref> auszuführen. Neben KFZ-Parkplätzen und an Bushaltestellen sind keine Schutzelemente vorgesehen; bei den Haltestellen muss der Radverkehr entweder hinter dem Bus warten oder sich in den KFZ-Verkehr einordnen.</p>

    <p>An der <.v bounds="10.013404,53.488846,10.024662,53.494314" lon={10.018595} lat={53.491694} dir="forward" ref={@ref}>Einmündung Kirchdorfer Straße</.v> bleibt der Radfahrstreifen jeweils rechts der KFZ-Spuren. In Fahrtrichtung Süden soll die Ampel so geschalten werden, das der Radverkehr sicher links abbiegen kann – also vermutlich eine eigene Ampelphase erhalten. An den Einmündungen sind zumindest teilweise sowohl <.ref>indirektes</.ref> als auch <.ref>direktes</.ref> Linksabbiegen vorgesehen.</p>
    <h4>Meinung</h4> <p>Für den Rad- und Fußverkehr wäre dieser Umbau vorteilhaft, da diese Verkehrsarten hier erstmals ordentlich getrennt werden. Das der Radweg an Bushaltestellen einfach aufhört oder die Schutzelemente nicht durchgängig vorhanden sind gehört leider zum Hamburger Standard. Eine vollständige Bewertung bleibt schwierig, da die Präsentation nur kleine Ausschnitte aus den Plänen enthält.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
