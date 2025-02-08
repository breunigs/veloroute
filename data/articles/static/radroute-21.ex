defmodule Data.Article.Static.Radroute21 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-21"
  def display_name(), do: "21"
  def title(), do: "Radroute 21 (Konzept)"
  def color(), do: "#833e5d"

  def summary(),
    do:
      "Die geplante Radroute soll von der Spreehafenbrücke über eine noch zu bauende Radbrücke nach Moorfleet führen. Durch die Lücke ist die Route aktuell uninteressant."

  def tags(), do: [id()]

  def tracks(), do: []

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>In Arbeit.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
