defmodule Data.Article.Blog.BekassinenauNord do
  use Article.Default

  def title(), do: "Bekassinenau – Fünfstück bis Stargarder Straße"

  def summary(),
    do:
      "Hochbordradweg nach Süden wird auf 1,5m verbreitert und erneuert. KFZ-Dooring-Gefahr entfällt nach Umbau."

  def type(), do: :planned

  def start(), do: ~d[2027Q4]

  def tags(), do: []

  def links(_assigns) do
    [
      {"1. Entwurf: Erläuterung und Lageplan", ~d[2026-07],
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1025727"}
    ]
  end

  def map_image do
    {name(),
     [
       {"Bezirksamt Wandsbek, Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/wandsbek/ihr-bezirksamt/aufgaben-und-struktur/dezernat-wirtschaft-bauen-umwelt-75138"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In der Bekassinenau sind beidseitig <.ref>Hochbordradwege</.ref> vorhanden. In Fahrtrichtung Norden wurde er um 2013 erneuert und ist 1,5m breit. In Richtung Süden ist er nur 1,1m breit, uneben und mit wechselnden Belägen. Sicherheitabstände gegen <.ref>Dooring</.ref> fehlen.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der Radweg in Richtung Süden wird auf 1,5m verbreitert. Auch der Gehweg wird mit 2,0m breiter als heute. Die KFZ-Parkplätze ohne Sicherheitsabstand zum Radweg entfallen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
