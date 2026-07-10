defmodule Data.Article.Blog.ElbparkEntenwerder do
  use Article.Default

  def title(), do: "Elbpark Entenwerder"

  def summary(),
    do:
      "Im Elbpark Entenwerder wird der Weg zwischen der neuen Brücke und Richtung Alexandrastieg von 2,5m auf 4,0m verbreitert."

  def type(), do: :planned

  def tags(), do: ["FR5"]

  def map_image do
    {name(),
     [
       {"Bezirksamt Hamburg-Mitte, Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/mitte/bezirksamt/bezirksamtsstruktur/dezernat-wirtschaft-bauen-umwelt-66718"}
     ]}
  end

  def links(_assigns) do
    [
      {"Erläuterungen und Lageplan", ~d[2026-07],
       "https://sitzungsdienst-hamburg-mitte.hamburg.de/bi/vo020.asp?VOLFDNR=1020358"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der vorhandene Weg zwischen der neuen Brücke und der Bestandsbrücke Richtung Alexandrastieg ist rund 2,5m breit.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der Weg wird auf 4,0m verbreitert und die Oberfläche erneuert. Es bleibt beim Grand. Die Wegführung orientiert sich am historischen Verlauf.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
