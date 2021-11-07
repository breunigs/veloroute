defmodule Data.Article.Blog.QuerungDehnhaide do
  use Article.Default

  def created_at(), do: ~D[2020-06-21]

  def title(), do: "Querung Dehnhaide (Veloroute 5)"

  def type(), do: :ampel

  def tags(), do: ["5"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Um der Veloroute geradeaus folgen zu können, muss hier sehr umständlich gefahren werden. Die Ampel an der Furt hat teilweise sehr lange Wartezeiten (drei Minuten).</p>
    """
  end
end
