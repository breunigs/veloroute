defmodule Data.Article.Blog.WandsbekerBahnhofstrasse do
  use Article.Default

  def created_at(), do: ~D[2022-05-14]

  def title(), do: "Wandsbeker Bahnhofstraße (Alltagsroute 7)"
  def summary(), do: "Möglicher Bautermin in 2025. Noch keine Pläne bekannt."

  def start(), do: ~d[2025]
  def stop(), do: ~d[2025]

  def type(), do: :intent

  def tags(), do: ["7", "w14"]

  def links(_assigns) do
    [
      {"Möglicher Bautermin", "Stand 2022",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1016643"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In der Wandsbeker Bahnhofstraße gibt es in Richtung stadtauswärts ein kurzes Stück <.ref>Hochbordradweg</.ref>, der dann im Nichts endet. In der Gegenrichtung fährt man ausschließlich im <.ref>Mischverkehr</.ref> mit den KFZ auf der Fahrbahn.</p>

    <h4>Vorhaben</h4>
    <p>Der Abschnitt wurde in die Baustellenplanung aufgenommen. Pläne sind noch nicht bekannt.</p>

    <p>Verwirrenderweise wird von „bis zur <.v bounds="10.083609,53.569948,10.088526,53.57224" lon={10.085961} lat={53.571845} dir="backward" ref="7">Tratzigerstraße</.v>“ gesprochen, die ein ganzes Stück weit weg ist. Möglicherweise handelt es sich um Lückenschlüsse sobald der <.a name="2020-12-08-eisenbahnbruecke-bovestrasse">Umbau für die S4</.a> abgeschlossen ist.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
