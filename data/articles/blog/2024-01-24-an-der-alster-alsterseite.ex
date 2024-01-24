defmodule Data.Article.Blog.AnDerAlsterAlsterseite do
  use Article.Default

  def title(), do: "An der Alster (Alsterseite; Radrouten 5 und 6, Freizeitrouten 2 und 3)"

  def summary(),
    do:
      "Der LSBG sucht ein Planungsbüro für die Umgestaltung der alsterseitigen Radwege an der Straße „An der Alster“ zwischen Lohmühlenstraße und Kennedybrücke."

  def type(), do: :intent
  def start(), do: ~d[2025-09]

  def tags(), do: ["5", "6", "FR2", "FR3"]

  def links(_assigns) do
    [
      {"Ausschreibung Planungsarbeit", "Januar 2024",
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/api/external/deeplink/subproject/81cf665c-1923-40d2-a228-2c46c508914f"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Alsterseitig befindet sich ein gepflasterter Zweirichtungsradweg, der teilweise durch die Grünanlage oder als <.ref>Hochbordradweg</.ref> geführt wird. Der häufig direkt daneben laufende Gehweg mit Grandoberfläche („fester Sand“) ist nicht allwettertauglich.</p>

    <p>Rad- und Gehweg sind stark frequentiert. Bedingt durch geringe Breite, kurvige Führung und häufigen Gegenverkehr ist Überholen nur selten möglich, zu Hauptverkehrszeiten gar nicht. Dies gilt auch für Nebeneinanderfahren.</p>

    <p>Da der Gehweg ebenfalls häufig überlastet oder von Pfützen überschwemmt ist, weichen zusätzlich Fußgänger auf den Radweg aus.</p>

    <p>Ein kurzer <.v bounds="10.00859,53.558581,10.017368,53.562921" lon={10.013484} lat={53.561373} dir="backward" ref="5" highlight="Lohmühlenstraße">Abschnitt Höhe Lohmühlenstraße</.v> wurde im Zuge <.a name="2021-02-19-an-der-alster">einer Zwischenmaßnahme</.a> bereits umgestaltet.</p>

    <h4>Vorhaben</h4>
    <p>Der <.abbr>LSBG</.abbr> sucht ein Planungsbüro um die alsterseitigen Wege zwischen <.v bounds="9.997805,53.55474,10.007577,53.559502" lon={10.002845} lat={53.557455} dir="backward" ref="5">Kennedybrücke</.v> und <.v bounds="10.00859,53.558581,10.017368,53.562921" lon={10.013662} lat={53.561541} dir="backward" ref="5">Lohmühlenstraße</.v> umzugestalten. Dabei sollen Fuß- und Radwege stellenweise angepasst werden, um die Situation für den Radverkehr zu verbessern. Natürlich unter Berücksichtigung der vorhandenen Grünanlage.</p>

    <p>Angepeilter Baustart ist ab September 2025.</p>


    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
