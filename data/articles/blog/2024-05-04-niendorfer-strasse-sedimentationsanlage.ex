defmodule Data.Article.Blog.NiendorferStrasseSedimentationsanlage do
  use Article.Default

  def title(), do: "Niendorfer Straße Höhe Bahnbrücke (Radroute 3)"

  def summary(),
    do:
      "Wegen Bau einer Regenwasserreinigungsanlage wird der Radverkehr nach Norden über den Heckenrosenweg umgeleitet."

  def type(), do: :construction
  def start(), do: ~d[2024-05-06]
  def stop(), do: ~d[2024-09-03]

  def tags(), do: ["3"]

  def links(_assigns) do
    [
      {"Baustellenbeschreibung", "Mai 2024", "https://www.hamburg.de/baustellen"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Baustelle</h4>
    <p>Wegen Bau einer Vorreinigungsanlage für das von der Straße anfallende Regenwasser wird die Niendorfer Straße auf Höhe der Bahnbrücke teilweise gesperrt. Radverkehr nach Norden soll über den <.v bounds="9.954506,53.60422,9.963537,53.608" lon={9.955628} lat={53.605893} dir="backward" ref="3">Heckenrosenweg</.v> umgeleitet werden. Die Fahrt nach Süden soll weiter entlang der Veloroute möglich bleiben.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
