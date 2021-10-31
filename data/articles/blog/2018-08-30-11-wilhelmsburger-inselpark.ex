defmodule Data.Article.Blog.WilhelmsburgerInselpark do
  use Article.Default

  def name(), do: "#{created_at()}-11-wilhelmsburger-inselpark"
  def created_at(), do: ~D[2018-08-30]

  def title(), do: "Wilhelmsburger Inselpark (Veloroute 11)"

  def type(), do: :issue

  def tags(), do: [11]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Dieses Teilstück durch den Wilhelmsburger Inselpark ist nachts gesperrt. Ich hatte dazu auch die Parkleitung gefragt, wie die Führung zwischen 0:00 und 5:00 Uhr ist, aber keine Antwort erhalten. Da aktuell die Autobahn (Wilhelmsburger Reichsstraße) verlegt wird, ändert sich die genaue Route aber vielleicht nochmal.</p>
    """
  end
end
