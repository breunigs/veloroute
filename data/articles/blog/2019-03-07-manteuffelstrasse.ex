defmodule Data.Article.Blog.Manteuffelstrasse do
  use Article.Default

  def updated_at(), do: ~D[2024-03-08]
  def title(), do: "Manteuffelstraße (Radroute 1)"

  def summary(),
    do:
      "Die Manteuffelstraße wird Fahrradstraße. Die Humannstraße wird KFZ-Einbahnstraße in Richtung Blankenese und teils ebenfalls Fahrradstraße. Die Radroute erhält durchgängig Vorfahrt."

  def type(), do: :planned
  def start(), do: ~d[2024-10]

  def tags(), do: ["1", "A22", "A22.1", "A022.1"]

  def links(_assigns) do
    [
      {"Fertiger Entwurf (Bericht und Lagepläne)", "März 2024",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1015033"},
      {"Bauzeiträume", "Oktober 2023",
       "https://fragdenstaat.de/anfrage/planungsstand-zu-einem-teilstueck-der-veloroute-1-a22-vr-1-blankenese-sued/"},
      {"Zweiter Entwurf (veraltet, Bericht und Lagepläne)", "Oktober 2021",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1011851"},
      {"Erster Entwurf (veraltet, Bericht und Lagepläne)", "Februar 2020",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1009667"},
      {"Dokumentation zur 1. Infoveranstaltung (veraltet)",
       "https://www.steg-hamburg.de/files/Projekte/Veloroute%201%20Altona/2019-01_Veloroute-Altona_A22_Gesamtdokumentation_mit%20Anlagen.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand März 2024</h4>
    <p>Die fertige Planung passt die Kreuzung an der Eichendorffstraße nochmals an. Der Artikel wurde entsprechend angepasst. Die Planung soll noch vor Sommer 2024 öffentlich vorgestellt werden.</p>

    <h4>Alter Zustand</h4>
    <p>Die <.v bounds="9.833793,53.559164,9.835725,53.56012" lon={9.835165} lat={53.559551} dir="forward" ref="1">Kreuzung Manteuffelstraße / Eichendorffstraße / Humannstraße</.v> ist eine abknickende Vorfahrt, allerdings nicht entlang der Radroute. Richtung Innenstadt ist die Sicht etwas schwierig, sodass man sich im Kurvenbereich vorsichtig vortasten muss.</p>

    <p>Der Bereich um die <.v bounds="9.83056,53.559676,9.833336,53.560952" lon={9.833013} lat={53.560049} dir="forward" ref="1">Bushaltestellen Stauffenbergstraße</.v> ist für den Radverkehr nichts besonderes. Die Busbuchten erlauben auch ein Vorbeifahren bei wartenden Bussen.</p>

    <p>Selbiges gilt für die Kurve bzw. Bushaltestellen <.v bounds="9.826129,53.56068,9.829138,53.561733" lon={9.82849} lat={53.561308} dir="forward" ref="1">Domizil am Hirschpark</.v>.</p>

    <h4>Planung</h4>
    <p>Die Humannstraße und Manteuffelstraße sollen zu einer Fahrradstraße werden, die auch an der <.v bounds="9.833793,53.559164,9.835725,53.56012" lon={9.835165} lat={53.559551} dir="forward" ref="1">Kreuzung Manteuffelstraße / Eichendorffstraße / Humannstraße</.v> Vorfahrt erhält. Zusätzlich soll die <.v bounds="9.832976,53.558218,9.840328,53.560574" lon={9.835883} lat={53.559371} dir="forward" ref="1">Humannstraße</.v> im Abschnitt KFZ-Einbahnstraße Richtung Blankenese werden.</p>

    <p>Die Einmündungen anderer Straßen werden ebenfalls so umgebaut, dass die Fahrradstraße Vorrang erhält. Die Busbuchten der Haltestellen <.v bounds="9.83056,53.559676,9.833336,53.560952" lon={9.833013} lat={53.560049} dir="forward" ref="1">Stauffenbergstraße</.v> und <.v bounds="9.826129,53.56068,9.829138,53.561733" lon={9.82849} lat={53.561308} dir="forward" ref="1">Domizil am Hirschpark</.v> entfallen, sodass der Radverkehr an haltenden Bussen über die Gegenspur vorbeifahren kann bzw. muss.</p>

    <h4>Meinung</h4>
    <p>Nachdem man im ersten Entwurf nur das Nötigste ausbesserte, zeigt man im zweiten und dritten Entwurf deutlich mehr Gestaltungsfreude. Die Regelung an der Eichendorffstraße entschärft nicht nur die unübersichtliche Stelle, sondern hält auch gleich den KFZ-Schleichverkehr fern.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
