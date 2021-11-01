defmodule Data.Article.Blog.KreuzungGaertnerstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-3-kreuzung-gaertnerstrasse"
  def created_at(), do: ~D[2018-09-19]

  def title(), do: "Kreuzung Gärtnerstraße (Veloroute 3)"

  def type(), do: :ampel

  def tags(), do: ["3"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Stadtauswärts muss eine Bettelampel betätigt werden um die <.m bounds="9.741041,53.577852,9.970311,53.669619">Gärtnerstraße</.m> zu queren. Immerhin ist diese gut sichtbar und es ist klar erkennbar, das man sie benutzen muss.</p>
    """
  end
end
