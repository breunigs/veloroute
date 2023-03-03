defmodule Data.Article.Blog.AgatheLaschUndOthmarscherKirchenweg do
  use Article.Default

  def updated_at(), do: ~D[2023-02-01]

  def title(), do: "Agathe-Lasch-Weg / Kreuzung Othmarscher Kirchenweg (Alltagsroute 1)"

  def summary(),
    do: "Anfang 2023 soll ein Kreisverkehr die Kreuzung ersetzen."

  def type(), do: :planned
  def tags(), do: ["1"]

  def start(), do: ~d[2023Q3]
  def stop(), do: ~d[2023Q3]

  def links(_assigns) do
    [
      {"2. Entwurf: Erläuterung und Lageplan", "Februar 2023",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1013675"},
      {"1. Entwurf: Erläuterung und Lageplan", "April 2022",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1012617"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Februar 2023</h4>
    <p>Die Planung wurde auf den Park ausgeweitet und sieht dort eine Fahrradstraße vor. Der Artikel wurde angepasst.</p>

    <h4>Alter Zustand</h4>
    <p>An der <.v bounds="9.897647,53.552809,9.899316,53.553774" lon={9.898682} lat={53.553483} dir="forward" ref="1">weitläufigen Kreuzung</.v> gilt rechts vor links. Sie ist schlecht einsehbar und die KFZ werden häufig zu schnell gefahren. Auf dem <.v bounds="9.896968,53.552848,9.898637,53.553813" lon={9.89778} lat={53.55341} dir="forward" ref="1">Autobahndeckel</.v> müssen sich Fuß- und Radverkehr auf dem rund 3,5m breiten Weg arrangieren.</p>

    <h4>Planung</h4>
    <p>An der Kreuzung soll ein kleiner Kreisverkehr entstehen. Auf der Parkseite schließt eine 4m breite, asphaltierte Fahrradstraße an. KFZ werden nicht zugelassen. Auf deren Nordseite wird ein 2,65m breiter Gehweg gebaut, der in einem größeren Radius um den Kreisverkehr herumführt. Zum Queren sind überall Zebrastreifen geplant.</p>

    <p>Im Park kommen neue Sitzbänke hinzu, sowie Ersatz für die gefällten Bäume. Zusätzlich wird im <.m bounds="9.898349,53.553045,9.898794,53.553425">Holmbrook</.m> noch eine Querungshilfe vor der Schule gebaut.</p>

    <h4>Meinung</h4>
    <p>Der Kreisverkehr ermöglicht dem Radverkehr ein deutlich angenehmeres Queren, auch wenn eine durchgehende Fahrradstraße noch angenehmer wäre. Die wurde verworfen, weil man mehr Nord-Süd-Radverkehr erwartet, sobald die Autobahndeckel fertig sind. Das klingt plausibel.</p>

    <p>Die Trennung der Verkehrsarten im Park war überfällig. Die Fahrradstraße ist für den Radverkehr eine sehr attraktive Lösung.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
