defmodule Data.Article.Blog.TilsiterStrasse2 do
  use Article.Default

  def created_at(), do: ~D[2022-05-14]

  @spec title :: <<_::416>>
  def title(), do: "Tilsiter Straße (Ost, ab Voßkulenweg, Veloroute 6)"
  def summary(), do: "Möglicher Bautermin in 2023. Noch keine Pläne bekannt."

  def start(), do: ~d[2023Q1]
  def stop(), do: ~d[2023Q4]

  def type(), do: :intent

  def tags(), do: ["6", "w16.3", "w16"]

  def links(_assigns) do
    [
      {"Möglicher Bautermin", "Stand 2022",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1016643"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In diesem Abschnitt der Kuehnstraße gibt es keine eigenen Radwege. Der Radverkehr teilt sich im <.ref>Mischverkehr</.ref> die Fahrbahn mit den KFZ.</p>

    <h4>Vorhaben</h4>
    <p>Der Abschnitt wurde in die Baustellenplanung aufgenommen. Pläne sind noch nicht bekannt.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
