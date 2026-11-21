defmodule Data.Article.Blog.Glockengiesserwall do
  use Article.Default

  def title(), do: "Nordseite Glockengießerwall (Ernst-Merck-Straße bis Ferdinandstor)"

  def summary(),
    do: "Radfahrstreifen Richtung Ferdinandstor soll zur Protected-Bike-Lane aufgewertet werden."

  def type(), do: :planned
  def start(), do: ~d[2027Q2]
  def stop(), do: ~d[2027Q2]

  def tags(), do: ["br-mitte-03", "1GR"]

  def map_image do
    {name(),
     [
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
     ]}
  end

  def tracks(), do: []

  def links(_assigns) do
    [
      {"fertiger Entwurf, Erläuterungen", ~d[2026-11],
       "https://lsbg.hamburg.de/resource/blob/1238054/361f9de1409c8a232200cbd585630284/glockengiesserwall-abgestimmte-planung-bericht-data.pdf"},
      {"fertiger Entwurf, Karte", ~d[2026-11],
       "https://lsbg.hamburg.de/resource/blob/1238066/3ef588fa651b1fffc4c070649fda1a1c/glockengiesserwall-abgestimmte-planung-plaene-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In Richtung Ferdinandstor ist ein 2,0m breiter <.ref>Radfahrstreifen</.ref> vorhanden.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der Radfahrstreifen soll mittels Trennelementen besser vom KFZ-Verkehr abgegrenzt werden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
