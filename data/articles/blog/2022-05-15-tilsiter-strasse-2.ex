defmodule Data.Article.Blog.TilsiterStrasse2 do
  use Article.Default

  def created_at(), do: ~D[2022-05-14]
  def updated_at(), do: ~D[2023-11-27]

  def title(), do: "Tilsiter Straße (Ost, ab Voßkulenweg, Veloroute 6)"
  def summary(), do: "Beidseitig Schutzstreifen geplant."

  def type(), do: :planned

  def tags(), do: ["6", "w16.3", "w16"]

  def links(_assigns) do
    [
      {"Erläuterung und Pläne des 2. Entwurfs", "Oktober 2023",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1019659"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In diesem Abschnitt der Tilsiter Straße gibt es keine eigenen Radwege. Der Radverkehr teilt sich im <.ref>Mischverkehr</.ref> die Fahrbahn mit den KFZ.</p>

    <h4>Planung</h4>
    <p>Es sollen beidseitig <.ref>Schutzstreifen</.ref> angelegt werden. Dafür müssen 31 Bäume gefällt werden, die nicht direkt an der Straße sondern nur in näherer Umgebung Ersatz bekommen.</p>

    <h4>Meinung</h4>
    <p>Schutzstreifen sind keine brauchbare Führungsform für den Radverkehr, weil sie knappes Überholen fördern. Durch die breitere Fahrbahn kann auch eher gerast werden. Man fällt also etliche Bäume für eine Maßnahme, die die Situation für den Radverkehr <em>nicht</em> verbessert. Eine KFZ-Einbahnstraße in Richtung Innenstadt oder eine <.ref name="Modalfilter">KFZ-Durchfahrtssperre</.ref> zwischen <.v bounds="10.086088,53.589859,10.094587,53.593562" lon={10.088168} lat={53.591461} dir="forward" ref="6">Voßkulen</.v> und <.v bounds="10.086088,53.589859,10.094587,53.593562" lon={10.088168} lat={53.591461} dir="forward" ref="6">Angerburger Straße</.v> wäre günstiger und effektiver.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
