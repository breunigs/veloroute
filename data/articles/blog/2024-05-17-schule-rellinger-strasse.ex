defmodule Data.Article.Blog.SchuleRellingerStrasse do
  use Article.Default

  def title(), do: "Rellinger Straße – Höhe Grundschule (Bezirksroute E6)"

  def summary(),
    do:
      "Abschnitt vor der Schule (Spengelweg bis Grädenerstraße) wird autofrei. Dadurch wird Queren der Straße möglich und die Gefahr durch Eltern-Taxis und Durchgangsverkehr geringer."

  def type(), do: :construction
  def start(), do: ~d[2026-01-12]
  def stop(), do: ~d[2026-05-15]
  def construction_site_id_hh(), do: [2_065_729]

  def tags(), do: ["br-eimsbuettel-sued"]

  def links(_assigns) do
    [
      {"Lagepläne und Erläuterungen, 1. Entwurf", "Mai 2024",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1009359"}
    ]
  end

  def map_image do
    {name(),
     [
       {"Bezirksamt Eimsbüttel, Dezernat Wirtschaft, Bauen und Umwelt",
        "https://www.hamburg.de/eimsbuettel/dezernat-wirtschaft-bauen-umwelt/80034/fachamt-management-des-oeffentlichen-raumes/"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In der Wohnstraße stellen Rad- und Fußverkehr den größten Anteil am Verkehr. Radfahren findet im <.ref>Mischverkehr</.ref> statt.</p>

    <p>Die Fahrgasse ist durch beidseitig geparkte KFZ teils schmaler als Feuerwehrautos. An den Straßeneinmündungen sind Querungsmöglichkeiten durch KFZ oder Büsche verdeckt, bzw. gar nicht vorhanden.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der Abschnitt zwischen <.v bounds="9.941809,53.573188,9.943982,53.574933" lon={9.943009} lat={53.573722} dir="forward" ref={BrEimsbuettelSued}>Spengelweg</.v> und <.v bounds="9.941809,53.573188,9.943982,53.574933" lon={9.94243} lat={53.574295} dir="forward" ref={BrEimsbuettelSued}>Grädenerstraße</.v> wird autofrei. Das wird durch Poller jeweils an beiden Enden sichergestellt.</p>

    <p><.v bounds="9.941809,53.573188,9.943982,53.574933" lon={9.942795} lat={53.573919} dir="forward" ref={BrEimsbuettelSued}>Vor der Grundschule</.v> wird die Fahrbahn verschwenkt und mit Rüttelstreifen versehen, um den Radverkehr auf angemessenes Tempo zu verlangsamen. Auch wird so Platz vor dem Schulausgang geschaffen.</p>

    <h5>Hinweis</h5>
    <p>Die bisherige Planung umfasst nur die Verkehrsführung. Die Gestaltung der Gehwege bzw. Platzfläche steht noch aus.</p>

    <h4>Meinung</h4>
    <p>Schulstraßen sind eine hervorragende Sache, damit die Kleinen alleine und sicher zur Schule kommen.</p>

    <p>Der Abschnitt glich bisher eher einer KFZ-Halde als einem nutzbaren Schulweg. Gut, dass das Queren der <.ref>Fahrbahn</.ref> künftig einfacher bzw. überhaupt möglich wird. Dazu passt, dass der Durchgangs-Radverkehr langsam fahren soll.</p>

    <p>Leider soll der Rest der Rellinger Straße erst später umgestaltet werden, obwohl dort vergleichbare Probleme bestehen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
