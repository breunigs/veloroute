defmodule Data.Article.Blog.Kirchenstrasse do
  use Article.Default

  def created_at(), do: ~D[2022-05-05]
  def title(), do: "Kirchenstraße (Veloroute 13)"

  def type(), do: :intent

  def start(), do: ~d[2023-03]
  def stop(), do: ~d[2023-05]

  def tags(), do: ["13"]

  def links(_assigns) do
    [
      {"Baustellenkoordination Altona",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1012752"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radverkehr hat in der Kirchenstraße keine eigenen Wege und teilt sich Straße im <.ref>Mischverkehr</.ref> mit den KFZ.</p>

    <h4>Vorhaben</h4>
    <p>Es gibt noch keine öffentlichen Pläne. Der Abschnitt taucht jedoch schon in der Baustellenkoordinierung mit einem Zeitfenster von zwei Monaten im Frühjahr 2023 auf. Der Termin ist noch nicht fix.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
