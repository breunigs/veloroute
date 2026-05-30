defmodule Data.Article.Blog.Rugenfeld do
  use Article.Default

  def title(), do: "Rugenfeld (Osdorfer Landstraße bis Am Osdorfer Born)"

  def summary(), do: "Radfahrstreifen soll zur Protected-Bike-Lane aufgewertet werden."

  def type(), do: :planned

  def tags(), do: []

  def map_image do
    {name(),
     [
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
     ]}
  end

  def tracks(),
    do: Data.Article.Blog.Rugenbarg.tracks()

  def links(_assigns) do
    [
      {"fertiger Entwurf, Erläuterung", ~d[2026-05],
       "https://lsbg.hamburg.de/resource/blob/1179148/f44ff95b82ab63d08e0650d11a5978e5/rugenfeld-nachruestung-protektionselemente-abgestimmte-planung-bericht-data.pdf"},
      {"fertiger Entwurf, Karte", ~d[2026-05],
       "https://lsbg.hamburg.de/resource/blob/1179150/aa5121487a23073b401992236822f951/rugenfeld-nachruestung-protektionselemente-abgestimmte-planung-plan-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In Richtung Osdorfer Born ist ein 1,70m breiter <.ref>Radfahrstreifen</.ref> vorhanden.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der Radfahrstreifen soll mittels Trennelementen besser vom KFZ-Verkehr abgegrenzt werden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
