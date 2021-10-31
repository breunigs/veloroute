defmodule Data.Article.Blog.KreuzungLuruperHauptstrasseElbgaustrasse do
  use Article.Default

  def name(), do: "#{created_at()}-kreuzung-luruper-hauptstrasse-elbgaustrasse"
  def created_at(), do: ~D[2018-12-22]

  def title(), do: "Kreuzung Luruper Hauptstraße / Elbgaustraße"

  def type(), do: :finished

  def tags(), do: [14]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Zur Zeit wird die Kreuzung umgebaut. Künftig wird der Radverkehr aus allen Knotenarmen vom Hochbordradweg auf einen Radfahrstreifen mit ca. 1,80m Breite aufgeleitet und geradlinig über die Kreuzung geführt. Für indirektes Linksabbiegen gibt es jeweils Aufstelltaschen mit eigener Ampel. An den Bushaltestellen fährt man künftig links vorbei.</p> <p><.a href="https://via-bus.hamburg.de/contentblob/10531724/95df8b1be14671dbb2cbb01107ee4080/data/51-sv-luruper-hauptstr-elbgaustr.pdf">Lageplan und Erläuterungen</.a></p>
    """
  end
end
