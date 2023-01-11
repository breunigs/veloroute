defmodule Data.Article.Blog.LudwigRosenbergRing do
  use Article.Default

  def created_at(), do: ~D[2022-01-03]

  def title(), do: "Ludwig-Rosenberg-Ring (Alltagsroute 8)"

  def start(), do: ~d[2023-07]
  def stop(), do: ~d[2024-03]

  def type(), do: :intent

  def summary(),
    do: "Es sollen Radfahrstreifen eingerichtet werden."

  def tags(), do: ["8"]

  def links(_assigns) do
    [
      {"Baustellenkoordination", "Januar 2023",
       "https://sitzungsdienst-bergedorf.hamburg.de/bi/vo020.asp?VOLFDNR=1007110"},
      {"Haushaltsplan 2022 Bezirk Bergedorf (Entwurf)",
       "https://sitzungsdienst-bergedorf.hamburg.de/bi/vo020.asp?VOLFDNR=1006315"},
      {"Zeitungsartikel zur Umbauplanung", "März 2022",
       "https://www.abendblatt.de/hamburg/bergedorf/lohbruegge/article234886721/Ludwig-Rosenberg-Ring-Lohbruegge-Bergedorf-mehr-Platz-fuer-Radfahrer.html"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Im betrachteten Abschnitt des Ludwig-Rosenberg-Rings wird der Radverkehr auf <.ref>Hochbordradwegen</.ref> geführt. Es besteht aber auch die Möglichkeit auf der <.ref>Fahrbahn</.ref> zu fahren.</p>

    <h4>Vorhaben</h4>
    <p>Laut Haushaltsentwurf 2022 sollen noch im selben Jahr <.ref>Radfahrstreifen</.ref> eingerichtet werden.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
