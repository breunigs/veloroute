defmodule Data.Article.Blog.Sengelmannstrasse2 do
  use Article.Default

  def created_at(), do: ~D[2022-04-30]
  def title(), do: "Sengelmannstraße"
  def summary(), do: "Früherer Straßenseitenwechsel durch Baustelle nötig"
  def type(), do: :construction

  def tags(), do: ["5N", "5"]
  def tracks(), do: []

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Baustelle</h4>
    <p>Die Wohnstraße in Fahrtrichtung Süden ist voll gesperrt. Die Umleitung wurde nicht bzw. unvollständig ausgeschildert. Scheinbar soll man bereits am <.m bounds="10.020924,53.610433,10.024263,53.61177" lon={10.022868} lat={53.61122} dir="backward" ref="5">Heilholtkamp</.m> die Straßenseite wechseln.</p>
    """
  end
end
