defmodule Data.Article.Blog.Frahmredder do
  use Article.Default

  def created_at(), do: ~D[2020-06-15]
  def updated_at(), do: ~D[2021-02-05]

  def title(), do: "Frahmredder (Alltagsroute 5)"

  def type(), do: :planned

  def tags(), do: ["5"]

  def links(_assigns) do
    [
      {"Pressemitteilung des Bezirks Wandsbek",
       "https://www.hamburg.de/wandsbek/pressemitteilungen/15851134/2022-02-04-neu-und-umbau-frahmredder-planung/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In der Frahmredder gibt es im Bereich der Veloroute keine eigenen Radwege. Stellenweise sind alte Stummel vorhanden, die aber nicht sinnvoll genutzt werden können.</p>

    <h4>Planung</h4>
    <p>Zwischen <.m bounds="10.096379,53.646221,10.103101,53.650658" lon="10.102065" lat="53.647286" dir="forward" ref="5">Saseler Chaussee</.m> und <.m bounds="10.096379,53.646221,10.103101,53.650658" lon="10.097876" lat="53.650221" dir="forward" ref="5">Stadtbahnstraße</.m> sollen beidseitig <.ref>Schutzstreifen</.ref> aufgemalt werden.</p>

    <p>Der Abschnitt zwischen <.m bounds="10.095262,53.650099,10.098211,53.651693" lon="10.097774" lat="53.650397" dir="forward" ref="5">Stadtbahnstraße</.m> und <.m bounds="10.095262,53.650099,10.098211,53.651693" lon="10.095544" lat="53.65146" dir="forward" ref="5">Langenstücken</.m> soll zu einem „verkehrsberuhigten Geschäftsbereich“ umgebaut werden. Was das genau bedeutet, soll am 17. Februar 2022 in einer öffentlichen Sitzung erläutert werden (<.mailto email="bezirksversammlung@wandsbek.hamburg.de">Anmeldung erforderlich</.mailto>).</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
