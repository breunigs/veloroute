defmodule Data.Article.Blog.ObererLandweg do
  use Article.Default

  def created_at(), do: ~D[2022-01-03]

  def title(), do: "Oberer Landweg (Alltagsroute 9, RSW Geesthacht)"

  def start(), do: ~d[2023-08-07]
  def stop(), do: ~d[2024-04-12]
  def construction_site_id_hh(), do: [444_856]

  def type(), do: :construction

  def summary(),
    do: "Planung 2022, Umbau bis 2023"

  def tags(), do: ["9", "rsw-geesthacht", "rsw"]

  def links(_assigns) do
    [
      {"Zeitungsartikel zum Umbaustart", "Juli 2023",
       "https://www.abendblatt.de/hamburg/bergedorf/article239022931/Oberer-Landweg-Neun-Monate-Baustelle-fuer-die-Veloroute.html"},
      {"Baustellenkoordination", "Januar 2023",
       "https://sitzungsdienst-bergedorf.hamburg.de/bi/to020.asp?TOLFDNR=1025381"},
      {"Haushaltsplan 2022 Bezirk Bergedorf (Entwurf)",
       "https://sitzungsdienst-bergedorf.hamburg.de/bi/vo020.asp?VOLFDNR=1006315"},
      {"Zeitungsartikel zur Umbauplanung", "Oktober 2021",
       "https://www.abendblatt.de/hamburg/bergedorf/article233661837/oberer-landweg-einspurig-auto-verkehr-hamburg-nettelnburg-radfahrer-fussgaenger.html"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Im Oberen Landweg gibt es für den Radverkehr <.ref>Hochbordradwege</.ref>. Stellenweise ist der Radverkehr in beide Richtungen vorgesehen, was aber häufig nur schlecht zu erkennen ist. Bei der Bahnunterführung müssen sich Fuß- und Radverkehr irgendwie arrangieren.</p>

    <h4>Vorhaben</h4>
    <p>Laut Haushaltsentwurf 2022 befindet sich der Abschnitt zur Zeit in Planung und könnte ab 2023 umgesetzt werden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
