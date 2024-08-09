defmodule Data.Article.Blog.AmStadtrandMitte do
  use Article.Default

  def title(), do: "Am Stadtrand (Tilsiter Straße bis Friedrich-Ebert-Damm)"

  def summary(),
    do:
      "2,0m breite Radfahrstreifen statt 1,2m breiter Hochbordradwege. Kreuzungen werden nicht umgebaut."

  def type(), do: :planned

  def start(), do: ~d[2024-08]
  def stop(), do: ~d[2025-04]

  def tags(), do: []

  def links(_assigns) do
    [
      {"Infoseite der Stadt",
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/wandsbek/themen/verkehr/strassenbaustellen-im-bezirk-wandsbek/am-stadtrand-76724"},
      {"Bauvergabe", "Juni 2024",
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/api/external/deeplink/subproject/3d2e1f29-d54f-45c2-a6c1-fe8ddd397b1d"},
      {"1. Entwurf, Pläne und Erläuterungen", "April 2023",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1018605"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radverkehr kann auf rund 1,2m breiten <.ref>Hochbordradwegen</.ref> fahren, oder direkt auf der knapp 10m breiten <.ref>Fahrbahn</.ref>.</p>

    <h4>Planung</h4>
    <p>Es sind 2,0m breite <.ref>Radfahrstreifen</.ref> vorgesehen. Rechts der Radfahrstreifen werden Bäume gepflanzt und dazwischen KFZ-Parkplätze eingerichtet. An den Kreuzungen kann wahlweise auf die vorhandenen Radwege aufgefahren oder in den <.ref>Mischverkehr</.ref> gewechselt werden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
