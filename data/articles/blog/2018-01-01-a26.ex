defmodule Data.Article.Blog.A26 do
  use Article.Default

  def name(), do: "#{created_at()}-a26"
  def created_at(), do: ~D[2018-01-01]

  def title(), do: "A26 (Freizeitroute 11 und 13)"

  def type(), do: :construction

  def tags(), do: ["FR11", "FR13"]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Baustelle</h4> <p>Bedingt durch den Bau der A26 durch das Alte Land sind die <.a href="/freizeitroute-13">Freizeitroute 13</.a> und der <.a href="/zweiter-gruener-ring">2. Grüne Ring</.a> durchschnitten.</p>
    <p>Die Umleitungen sind meist ausgeschildert und erfordern eine weiträumige Umfahrung. Im Osten ist dies entlang der <.m bounds="9.896188,53.476411,9.912562,53.49684">Waltershofer Straße</.m> und im Westen über den <.m bounds="9.776924,53.484684,9.79749,53.516718">Nincoper Deich</.m></p>
    """
  end
end
