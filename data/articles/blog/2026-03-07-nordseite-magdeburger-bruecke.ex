defmodule Data.Article.Blog.NordseiteMagdeburgerBruecke do
  use Article.Default

  def title(), do: "Nordseite Magdeburger Brücke (Radroute 3)"

  def summary(),
    do: "1,5m schmaler Schutzstreifen soll durch 3,0m breiten Radfahrstreifen ersetzt werden."

  def type(), do: :intent

  def tags(), do: ["radroute-3"]

  def tracks(), do: []

  def links(_assigns) do
    [
      {"Zeitungsartikel", ~d[2026-03],
       "https://www.abendblatt.de/hamburg/hamburg-mitte/article411383682/nach-toedlichem-rad-unfall-vor-dem-westfield-was-sich-dort-aendert.html"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Auf der Brücke ist ein 1,5m breiter Schutzstreifen vorhanden. Dieser geht aus dem Radfahrstreifen in der Überseeallee hervor und wird in Richtung KFZ-Fahrstreifen verschwenkt.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Laut Zeitungsberichten soll der Schutzstreifen durch einen 3,0m breiten Radfahrstreifen (zzgl. Markierung von 0,25m) ersetzt werden.</p>

    <h4>Meinung</h4>
    <p>Endlich wird diese Gefahrenstelle entschärft. Ich sehe die Politik am Zug dafür zu sorgen, dass das nicht immer mehrere Jahre dauert. Betonschweine (<.a href="https://rebmann-beton.de/produkte/hamburger-betonschwein/" rel="nofollow">Fotos</.a>) schaffen in wenigen Tagen eine <.ref>Protected-Bike-Lane</.ref>. Dass das gut funktioniert, sieht man an Paris. Sicherheit zuerst, hübsch sobald die Verwaltung Zeit hat.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
