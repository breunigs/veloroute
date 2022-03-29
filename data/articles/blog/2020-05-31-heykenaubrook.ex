defmodule Data.Article.Blog.Heykenaubrook do
  use Article.Default

  def created_at(), do: ~D[2020-05-31]
  def updated_at(), do: ~D[2022-03-29]

  def title(), do: "Bahnübergang Heykenbaubrook (Veloroute 10)"
  def icon(), do: :nocargo

  def type(), do: :intent
  def start(), do: ~d[2024]
  def stop(), do: ~d[2024]

  def tags(), do: ["10", "H06"]

  def links(_assigns) do
    [
      {"Vergabe Bauplanung",
       "https://suche.transparenz.hamburg.de/dataset/812cb2ff-8d48-4e50-860a-5255b1990ff2"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Strecke führt hier ebenerdig über die Bahnschienen. Umlaufsperren stellen sicher, dass langsam gequert und in beide Richtungen geschaut wird. Die Umlaufsperren sind hier so eng, dass man selbst mit einem normalen Fahrrad Probleme hat durchzukommen. Mit dem Lastenrad kommt man gar nicht durch.</p>

    <h4>Vorhaben</h4>
    <p>Die <.abbr>HPA</.abbr> hat die Planung einer Bahnunterführung in Auftrag gegeben. Die Kurvenradien für die Veloroute sollen nach Möglichkeit großzügig ausfallen.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
