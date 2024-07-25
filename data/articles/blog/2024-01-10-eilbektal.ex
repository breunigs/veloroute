defmodule Data.Article.Blog.Eilbektal do
  use Article.Default

  def title(), do: "Eilbektal"

  def updated_at(), do: ~D[2024-04-16]

  def summary(),
    do:
      "Nordseite: Ehemaliger Radweg wird wieder hergerichtet. Südseite: Gehwege werden breiter. Nur noch 1 KFZ-Spur und neue Querungshilfen."

  def type(), do: :planned
  def tags(), do: ["FV-W051"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "article",
        direction: :forward,
        from: "Mühlenstraße",
        to: "Friedrichsberger Straße",
        parent_ref: __MODULE__,
        text: "Eilbektal (stadteinwärts)",
        videos: [
          {"2024-05-09-vr6/GX017487", :start, "00:00:25.192"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"2. Entwurf, Lageplan und Erläuterung", "April 2024",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1020742"},
      {"1. Entwurf, Lageplan und Erläuterung", "Januar 2024",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1020084"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radverkehr soll vor allem im <.ref>Mischverkehr</.ref> bei Tempo-50 fahren. Der unbefestigte Gehweg durfte ebenfalls mit Schritttempo benutzt werden.</p>

    <h4>Planung</h4>
    <p>Der ehemalige <.ref>Hochbordradweg</.ref> wird wiederhergestellt und neu asphaltiert. Er wird ca. 1,80m bis 2,15m breit. An der <.m bounds="10.052007,53.57309,10.057514,53.575455">Seumestraße</.m> wird der Radverkehr mittels <.ref>Schutzstreifen</.ref> zum Altbestand übergeleitet. Die auf dem Radweg befindlichen KFZ-Parkplätze verschieben sich in Richtung Straßenmitte.</p>

    <p>Auf der Häuserseite wird der Gehweg auf 2,5m verbreitert. Die KFZ-Parkplätze, die den Gehweg momentan einschränken, verschieben sich ebenfalls in Richtung Straßenmitte.</p>

    <p>Durch beidseitiges KFZ-Parken verbleibt künftig noch eine Fahrspur.</p>

    <p>An <.m bounds="10.052007,53.57309,10.057514,53.575455">Kleiststraße</.m> und <.m bounds="10.052007,53.57309,10.057514,53.575455">Rückertstraße</.m> wird das KFZ-Parken unterbrochen, um das Linksabbiegen von bzw. in diese Nebenstraßen zu ermöglichen. Entlang der Eilbek wird eine Querungshilfe für den Fußverkehr geschaffen.</p>

    <h4>Meinung</h4>
    <p>Die Planung gibt dem Rad- und Fußverkehr seit Jahrzehnten erstmals wieder eigene, benutzbare Wege. Das ist gut. Allerdings nur auf einem kurzen Abschnitt und nicht entlang des gesamten Straßenzugs.</p>

    <p>Leider verzichtet man auch auf eine Vergrößerung des viel benutzten <.v bounds="10.049388,53.572512,10.060777,53.577844" lon={10.053647} lat={53.574778} dir="forward" ref="FR3">Friedrichsberger Park</.v> – es soll nur geringfügig umgebaut werden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
