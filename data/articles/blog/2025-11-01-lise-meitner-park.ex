defmodule Data.Article.Blog.LiseMeitnerPark do
  use Article.Default

  def title(), do: "Lise-Meitner-Park (Radrouten 7 und 18; Zweiter Grüner Ring)"

  def summary(),
    do:
      "Radroute 7 wird asphaliert und erstmals befahrbar an den Stiegmütterchenweg angeschlossen. Radroute 18 bleibt Matschweg."

  def type(), do: :planned

  def tags(), do: ["radroute-7", "radroute-18", "FR11"]

  def links(_assigns) do
    [
      {"Lagepläne und Erläuterungen", ~d[2025-11],
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1017342"}
    ]
  end

  def map_image do
    {name(),
     [
       {"Bezirksamt Altona – Fachamt öffentlicher Raum",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/altona/bezirksamt/dezernat-wirtschaft-bauen-umwelt-50986"},
       {"SBI beratende Ingenieure für BAU-VERKEHR-VERMESSUNGS GmbH", "https://www.sbi.de/"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Im Lise-Meitner-Park gibt es nur Grandwege, die sich Fuß- und Radverkehr teilen. Seit einer Verbreiterung im Sommer 2024 sind die Wege bei Regen Schlammpisten.</p>

    <p>Es gibt keinen befahrbaren Anschluss an den <.v bounds="9.868549,53.57661,9.871781,53.578515" lon={9.869647} lat={53.577284} dir="forward" ref={Radroute7}>Stiefmütterchenweg</.v>. Wegen hohem Randstein und geparkten KFZ ist eine durchgehende Fahrt nur selten möglich.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Im Zuge der Erweiterung des <.a href="https://de.wikipedia.org/wiki/Deutsches_Elektronen-Synchrotron" title="Deutsches Elektronen-Synchrotron">DESY</.a> soll die Radroute 7 neue Wege erhalten. Der Weg verläuft dann leicht anders als heute. Befestigt werden soll der Weg erst nach Abschluss des Gebäudebaus.</p>

    <p>Vorgesehen ist ein 3,5m breiter, asphaltierter Radweg. Daneben verläuft ein 2,5m breiter gepflasterter Gehweg.</p>

    <p>An den Zufahrten ist eine Gehwegüberfahrt geplant, sodass der Radverkehr immer wartepflichtig ist. Am Stiefmütterchenweg soll durch ein Parkverbot die Sicht auf die Straße besser werden.</p>

    <h4>Meinung</h4>
    <p>Die Radroute wird mit dem Umbau erstmals als Alltagsroute brauchbar hergerichtet. Endlich!</p>

    <p>Warum man die <.v bounds="9.871355,53.576497,9.875283,53.580177" lon={9.87294} lat={53.577888} dir="forward" ref={Freizeitroute11}>Radroute 18</.v> nicht auch ertüchtigt bleibt offen. Zumindest am Abzweig hätte ein zukunftssicherer Übergang hergestellt werden können. Stattdessen bleibt es dort beim Matschweg.</p>

    <p>Dass das Parkverbot am Stiefmütterchenweg beachtet wird, darf bezweifelt werden. Eine <.ref ref={LexikonQuerungshilfe}>Wegvorstreckung</.ref> würde zumindest die Befahrbarkeit sicherstellen.</p>

    <p></p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
