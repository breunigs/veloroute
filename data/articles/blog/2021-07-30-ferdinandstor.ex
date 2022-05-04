defmodule Data.Article.Blog.Ferdinandstor do
  use Article.Default

  def created_at(), do: ~D[2021-07-30]

  def title(), do: "Ferdinandstor"

  def start(), do: ~d[2021-07]
  def stop(), do: ~d[2025]

  def type(), do: :construction

  def tags(), do: ["5", "6", "FR2", "FR3"]

  def tracks(), do: []

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Baustelle</h4>
    <p>Die Deutsche Bahn erneuert die Bahnbrücken um das Ferdinandstor, sodass Rad- und Fußverkehr hier ortsnah umgeleitet werden. Bis auf einige rund 14-tägige Vollsperrungen bleibt die Unterführung aber in beide Richtungen offen. Die Zeiträume für diese stehen noch nicht genau fest, die Bahn gibt hier Oktober 2022, Juli/August 2023, sowie 2024 und 2025 an.</p>

    <h4>Quelle</h4>
    <p>
    <.a href="https://bauprojekte.deutschebahn.com/p/hamburg-ferdinandstor/pdf">Baustelleninfo der Bahn</.a>
    </p>
    """
  end
end
