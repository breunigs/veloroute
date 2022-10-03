defmodule Data.Article.Blog.AgatheLaschUndOthmarscherKirchenweg do
  use Article.Default

  def created_at(), do: ~D[2022-03-28]

  def title(), do: "Kreuzung Agathe-Lasch-Weg und Orthmarscher Kirchenweg (Alltagsroute 1)"

  def summary(),
    do: "Anfang 2023 soll ein Kreisverkehr die Kreuzung ersetzen."

  def type(), do: :planned
  def tags(), do: ["1"]

  def start(), do: ~d[2023Q1]
  def stop(), do: ~d[2023Q1]

  def links(_assigns) do
    [
      {"Erläuterung und Lageplan", "1. Entwurf",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1012617"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>An der weitläufigen Kreuzung gilt rechts vor links. Sie ist schlecht einsehbar und die KFZ werden häufig zu schnell gefahren.</p>

    <h4>Planung</h4>
    <p>Es soll ein kleiner Kreisverkehr entstehen. Vom <.m bounds="9.897899,53.553148,9.899323,53.553901" lon={9.898166} lat={53.553405} dir="backward" ref="1">Groth Park kommend</.m> wird der gemeinsame Rad- und Fußweg aufgeteilt und der Radverkehr gleichberechtigt zum Kreisel geführt. Der Fußverkehr wird links bzw. rechts von der Radspur zu Zebrastreifen über die Straße geführt. Die Zebrastreifen sind an allen Einmündungen vorhanden, auch über die Radspur.</p>

    <p>Zusätzlich werden im <.m bounds="9.898349,53.553045,9.898794,53.553425">Holmbrook</.m> noch eine Querungshilfe vor der Schule und mehrere Fahrradanlehnbügel gebaut. Diese sollen auch den KFZ-Verkehr zwingen die Höchstgeschwindigkeit einzuhalten.</p>

    <h4>Meinung</h4>
    <p>Der Kreisverkehr ermöglicht dem Radverkehr ein deutlich angenehmeres Queren. Leider ist nicht ersichtlich warum man der Veloroute keine Vorfahrt gibt und den gesamten Othmarscher Kirchenweg als Fahrradstraße ausweist. Das Rasen ließe sich sicher auch mit anderen Maßnahmen reduzieren, etwa einer deutlich stärkeren Einengung der Fahrbahn.</p>

    <p>Ohne Kreisverkehr müsste man auch die Bäume am Eingangsportal des Groth Parks nicht fällen und neu pflanzen.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
