defmodule Data.Article.Blog.AmStadtrandMitte do
  use Article.Default

  def title(), do: "Am Stadtrand (Tilsiter Straße bis Friedrich-Ebert-Damm)"

  def summary(),
    do:
      "2,0m breite Radfahrstreifen statt 1,2m breiter Hochbordradwege. Kreuzungen werden nicht umgebaut."

  def type(), do: :planned

  def start(), do: ~d[2024-04]
  def stop(), do: ~d[2024-11]

  def tags(), do: []

  def links(_assigns) do
    [
      {"Möglicher Bauzeitraum", "Oktober 2023",
       "https://www.hamburg.de/contentblob/17478198/45637de486c239222d1f49e5b6771152/data/oktober-26-2023-bezirksamt-wandsbek.pdf"},
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
