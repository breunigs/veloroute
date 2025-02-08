defmodule Data.Article.Static.Radroute11 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-11"
  def display_name(), do: "11"
  def title(), do: "Radroute 11"
  def color(), do: "#833e5d"

  def summary(),
    do: "FIXME"

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
