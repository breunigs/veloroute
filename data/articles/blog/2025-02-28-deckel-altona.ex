defmodule Data.Article.Blog.DeckelAltona do
  use Article.Default

  def title(), do: "Autobahndeckel Altona"

  def summary(), do: "Lageplan zur Flächennutzung des Deckel Altona"

  def type(), do: :intent
  def tags(), do: ["radroute-concept-b", "radroute-7", "rsw-elmshorn", "FR9"]

  def links(_assigns) do
    [
      {"Öffentlichkeitsbeteiligung zur Gestaltung des Autobahndeckels", ~d[2025-01],
       "https://bauleitplanung.hamburg.de/verfahren/e4d9f2cc-ecd2-4ceb-9b16-190e9e869a22/public/detail#"},
      {"Infoseite des Freiraums-Planungsbüro",
       "https://arbos-landscape.de/project/parklandschaft-auf-dem-deckel-der-bundesautobahn-7-hamburg"}
    ]
  end

  def map_image do
    {name(), [{"arbos Freiraumplanung", "https://arbos-landscape.de/"}]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Wegen der Autobahn ist kein durchgängiger Rad- oder Fußweg vorhanden.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}>Vorhaben</.h4_planning>
    <p>Nach dem Bau des Deckels sollen auf ihm Grünflächen und Kleingärten angelegt werden. Daneben bzw. mitten durch soll ein neuer Geh- und Radweg verlaufen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
