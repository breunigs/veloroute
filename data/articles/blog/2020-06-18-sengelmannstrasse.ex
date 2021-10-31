defmodule Data.Article.Blog.Sengelmannstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-sengelmannstrasse"
  def created_at(), do: ~D[2020-06-18]

  def title(), do: "Sengelmannstraße (Veloroute 5N)"

  def type(), do: :finished

  def tags(), do: ["5N"]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Zur Zeit wird in der Sengelmannstraße gebaut. Fuß- und Radweg sind dabei vollständig gesperrt. Der Fußverkehr soll die Straßenseite wechseln, für den Radverkehr gibt es keine Hinweise. Angesichts der üppigen Straßenbreite wäre ein Ersatzfuß- und Radweg auf der gleichen Straßenseite problemlos einzurichten. Schade, dass hieran niemand gedacht hat. Leider sind mir keine weiteren Informationen über diese Baustelle bekannt.</p>
    """
  end
end
