defmodule Data.Article.Blog.Parkstrasse do
  use Article.Default

  def created_at(), do: ~D[2022-04-15]

  def title(), do: "Bau Fernwärmeleitung (Radroute 1 und 18)"
  def summary(), do: "Baustelle Fernwärmeleitung"

  def start(), do: ~d[2022-01-18]
  def stop(), do: ~d[2025-06-27]
  def construction_site_id_hh(), do: [370_339, 377_924]

  def type(), do: :construction

  def tags(), do: ["radroute-1", "radroute-18", "1", "14"]

  def links(_assigns) do
    [
      {"Infoseite der Energiewerke",
       "https://www.hamburger-energiewerke.de/energiewende/baumassnahmen/suedleitung-mit-elbquerung"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Baustelle</h4>
    <p>Bau einer Fernwärmeleitung. Die Umleitungen sind teilweise ausgeschildert, ändern sich aber häufig.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
