defmodule Data.Article.Blog.Papenreye1 do
  use Article.Default

  def title(), do: "Papenreye – Anschluss Gewerbegebiet (Bezirksroute N8)"

  def summary(),
    do:
      "Zur besseren Erreichbarkeit des erweiterten Gewerbegebiets soll eine neue Ampel gebaut werden."

  def type(), do: :planned
  def tags(), do: ["br-nord-n8"]

  def links(_assigns) do
    [
      {"fertiger Entwurf – Karten und Erläuterung", ~d[2022-10],
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1012139"}
    ]
  end

  def map_image do
    {name(),
     [
       {"Bezirksamt Hamburg-Nord – Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/hamburg-nord/wirtschaft-bauen-umwelt-70292"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es sind durchgängige <.ref>Hochbordradwege</.ref> vorhanden.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Vor der Ampel sollen die Radwege auf rund 2,25m breite <.ref>Radfahrstreifen</.ref> geleitet werden. Zum Linksabbiegen ins Gewerbegebiet ist <.ref>indirektes Linksabbiegen</.ref> vorgesehen.</p>

    <p>Im Gewerbegebiet gibt es keine eigenen Radwege – es soll im <.ref>Mischverkehr</.ref> gefahren werden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
