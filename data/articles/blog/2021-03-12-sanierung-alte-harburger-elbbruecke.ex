defmodule Data.Article.Blog.SanierungAlteHarburgerElbbruecke do
  use Article.Default

  def created_at(), do: ~D[2021-03-12]

  def title(), do: "Sanierung Alte Harburger Elbbrücke (Velorouten 10 und 11)"

  def start(), do: ~d[2021-03-15]
  def stop(), do: ~d[2021-12-31]

  def type(), do: :construction

  def tags(), do: ["10", "11", "FR5", "FR6"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Sanierung</h4>
    <p>Die Alte Harburger Elbbrücke weist Korrosionsschäden auf und muss saniert werden. Dies erfolgt unter Vollsperrung, der Radverkehr wird über die Brücke des 17. Juni umgeleitet.</p>

    <h4>Quelle</h4>
    <p><.a href="https://www.hamburg.de/pressearchiv-fhh/14959434/2021-03-11-bvm-alte-harburger-elbbruecke/">Pressemitteilung des LSBG</.a></p>
    """
  end
end
