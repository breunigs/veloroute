defmodule Data.Article.Blog.TilsiterStrasse3 do
  use Article.Default

  def created_at(), do: ~D[2023-10-29]

  def title(), do: "Tilsiter Straße (Lesserstraße bis Stephanstraße, Radroute 6)"

  def summary(),
    do:
      "Möglicherweise soll der gegenläufige Radfahrstreifen zur Protected-Bike-Lane umgebaut werden."

  def type(), do: :intent

  def tags(), do: ["6", "w16"]

  def links(_assigns) do
    [
      {"Vorschlag Nachrüstung Trennelemente", "Oktober 2023",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1019654"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es gibt beidseitige <.ref>Radfahrstreifen</.ref>, die im Rahmen des Ausbaus der <.a name="6">Radroute 6</.a> hergerichtet wurden. Siehe dazu <.a name="2021-04-23-tilsiter-strasse">den alten Artikel zu dieser Planung</.a>.</p>

    <h4>Vorhaben</h4>
    <p>Es wird überlegt, den gegen die Einbahnstraße verlaufenden Radfahrstreifen zu einer <.ref>Protected Bike Lane</.ref> umzurüsten.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
