defmodule Data.Article.Blog.DweerUndMittlererLandweg do
  use Article.Default

  def created_at(), do: ~D[2020-06-28]

  def title(), do: "Schranken am Dweerlandweg und Mittlerer Landweg (Veloroute 9)"
  def icon(), do: :nocargo

  def type(), do: :finished

  def tags(), do: ["9"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die Schranken halten den Autoverkehr aus diesem gut befahrbaren Stück Veloroute. Leider schießen sie etwas über's Ziel hinaus und erfordern ein erhebliches Abbremsen und vorbeischlängeln – mit einem normalen Fahrrad. Mit einem Lastenrad muss genau bugsiert werden, größere Gefährte kommen eventuell gar nicht durch. Das <.a href="https://sitzungsdienst-bergedorf.hamburg.de/bi/vo020.asp?VOLFDNR=1004275">Bezirksamt wurde bereits 2019 gebeten</.a> diese Stellen zu verbessern, leider sind mir bisher keine konkreten Pläne bekannt.</p>
    """
  end
end
