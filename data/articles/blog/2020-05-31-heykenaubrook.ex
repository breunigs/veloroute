defmodule Data.Article.Blog.Heykenaubrook do
  use Article.Default

  def name(), do: "#{created_at()}-heykenaubrook"
  def created_at(), do: ~D[2020-05-31]

  def title(), do: "Bahnübergang Heykenbaubrook (Veloroute 10)"
  def icon(), do: :nocargo

  def type(), do: :issue

  def tags(), do: ["10"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die Veloroute 10 für Lastenfahrräder hier nicht passierbar. Selbst mit einem normalen Fahrrad muss es teilweise um die Umlaufsperren heben.</p>
    """
  end
end
