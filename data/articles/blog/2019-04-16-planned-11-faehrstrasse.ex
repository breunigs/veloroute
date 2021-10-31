defmodule Data.Article.Blog.Planned11Faehrstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-planned-11-faehrstrasse"
  def created_at(), do: ~D[2019-04-16]

  def title(), do: "Fährstraße (Veloroute 11)"

  def type(), do: :finished

  def tags(), do: [11]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die <.m bounds="9.979725,53.515339,9.994828,53.518387">Fährstraße</.m> ist bereits heute gut befahrbar, besitzt aber gerade im Anfangsteil einige Unebenheiten, die das Radfahren unangenehm machen. Insbesondere ist hier die alte Bahnstrecke hervorzuheben.</p> <p>Seit Mitte April bis vorraussichtlich Mitte Juli 2019 wird hier daher der Straßenbelag erneuert. Außerdem sollen Markierungsarbeiten stattfinden. Leider geht aus den Anliegerinformationen nicht hervor ob diese den aktuellen Stand wiederherstellen oder ob gravierendere Änderungen geplant sind.</p>
    """
  end
end
