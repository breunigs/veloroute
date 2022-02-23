defmodule Data.Article.Blog.Frahmredder do
  use Article.Default

  def created_at(), do: ~D[2020-06-15]
  def updated_at(), do: ~D[2022-02-11]

  def title(), do: "Frahmredder (Alltagsroute 5)"

  def summary(),
    do:
      "beidseitig je 1,75m breite Schutzstreifen geplant, ab Stadtbahnstraße Tempo-20 im Mischverkehr"

  def type(), do: :planned
  def start(), do: ~d[2023Q1]
  def stop(), do: ~d[2023]

  def tags(), do: ["5"]

  def links(_assigns) do
    [
      {"Pressemitteilung des Bezirks Wandsbek",
       "https://www.hamburg.de/wandsbek/pressemitteilungen/15851134/2022-02-04-neu-und-umbau-frahmredder-planung/"},
      {"Lagepläne und Erläuterungsbericht",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1016065"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In der Frahmredder gibt es im Bereich der Veloroute keine eigenen Radwege. Stellenweise sind alte Stummel vorhanden, die aber nicht sinnvoll genutzt werden können.</p>

    <h4>Planung</h4>
    <p>Zwischen <.m bounds="10.096379,53.646221,10.103101,53.650658" lon="10.102065" lat="53.647286" dir="forward" ref="5">Saseler Chaussee</.m> und <.m bounds="10.096379,53.646221,10.103101,53.650658" lon="10.097876" lat="53.650221" dir="forward" ref="5">Stadtbahnstraße</.m> sollen beidseitig 1,75m breite <.ref>Schutzstreifen</.ref> aufgemalt werden. In diesem Bereich bleibt Tempo-50 erhalten.</p>

    <p>Der Abschnitt zwischen <.m bounds="10.095262,53.650099,10.098211,53.651693" lon="10.097774" lat="53.650397" dir="forward" ref="5">Stadtbahnstraße</.m> und <.m bounds="10.095262,53.650099,10.098211,53.651693" lon="10.095544" lat="53.65146" dir="forward" ref="5">Langenstücken</.m> soll zu einem „verkehrsberuhigten Geschäftsbereich“ umgebaut werden. Dazu wird Tempo-20 eingerichtet und die Straße neu asphaltiert. Am <.m bounds="10.095262,53.650099,10.098211,53.651693" lon="10.096947" lat="53.651119" dir="forward" ref="5">Baggesenstieg</.m> wird der Fußweg durchgängig.</p>

    <p>Über das Planungsgebiet hinweg kommen Radanlehnbügel dazu. Am <.m bounds="10.095262,53.650099,10.098211,53.651693" lon="10.095622" lat="53.651447" dir="forward" ref="5">Langenstücken</.m> zusätzlich eine StadtRAD Station.</p>

    <p>Die Pläne sollen am 17. Februar 2022 in einer öffentlichen Sitzung erläutert werden (<.mailto email="bezirksversammlung@wandsbek.hamburg.de">Anmeldung erforderlich</.mailto>).</p>

    <h4>Meinung</h4>
    <p>Schwierige Sache: die Straße ist nicht breit genug für zeitgemäße Radwege. Eine KFZ-Einbahnstraßenregelung wurde geprüft, aber wegen des Busverkehrs verworfen. Damit bleiben nicht mehr viele Möglichkeiten, wenn nur lokal Änderungen vorgenommen werden sollen.</p>

    <p>Weder Polizei noch das Planungsbüro gehen davon aus, dass die 1,50m Überholabstand KFZ / Fahrrad in der Praxis eingehalten werden. Der Umbau verfehlt daher weitestgehend das Ziel eine gute Route für den Radverkehr zu schaffen.</p>

    <p>Stattdessen müsste ein weiträumiges Verkehrskonzept entstehen, sodass die Frahmredder keine vorteilhafte Strecke für den KFZ-Verkehr darstellt. Dies könnte durch Diagonalsperren an der Stadtbahnstraße oder einer Sackgasse ohne Wendemöglichkeit im Frahmredder geschehen. Jeweils natürlich mit Ausnahmeregelung für den HVV oder die Stadtreinigung.</p>

    <p>Es bleiben Details: Der verkehrsberuhigte Bereich ist eine gute Sache, das Aufheben von „<.ref>Fahrrad frei</.ref>“ auf den Gehwegen, Radanlehnbügel und Sitzbänke. Auch das die Frahmredder erstmals eine eindeutige Radführung erhält ist positiv, auch wenn die Führung selbst mangelhaft ist.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
