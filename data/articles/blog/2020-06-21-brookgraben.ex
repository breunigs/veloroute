defmodule Data.Article.Blog.Brookgraben do
  use Article.Default

  def name(), do: "#{created_at()}-brookgraben"
  def created_at(), do: ~D[2020-06-21]

  def title(), do: "Brookgraben (Veloroute 14)"
  def icon(), do: :nocargo

  def type(), do: :issue

  def tags(), do: [14]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    Die Absperrung verhindert je nach Zustand, das man hier mit einem Lastenrad ordentlich durchkommt. So wie sie im Bild zu sehen ist, musste ich sogar mit einem normalen Fahrrad absteigen um sicher zu passieren.
    """
  end
end
