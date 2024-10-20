defmodule Data.Article.Blog.Parkstrasse do
  use Article.Default

  def created_at(), do: ~D[2022-04-15]

  def title(), do: "Parkstraße / Groß Flottbeker Straße (Alltagsroute 1 und 14)"
  def summary(), do: "Baustelle Fernwärmeleitung"

  def start(), do: ~d[2022-01-18]
  def stop(), do: ~d[2025-06-27]
  def construction_site_id_hh(), do: [370_339, 377_924]

  def type(), do: :construction

  def tags(), do: ["1", "14"]

  def tracks(), do: []

  def text(assigns) do
    ~H"""
    <h4>Baustelle</h4>
    <p>Bau einer Fernwärmeleitung. Die Umleitungen sind ausgeschildert.</p>
    """
  end
end
