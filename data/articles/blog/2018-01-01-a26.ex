defmodule Data.Article.Blog.A26 do
  use Article.Default

  def created_at(), do: ~D[2018-01-01]

  def start(), do: ~d[2018]
  def stop(), do: ~d[2025Q2]

  def title(), do: "A26 (Freizeitroute 11 und 13)"

  def summary(),
    do:
      "Unterbrechung der Freizeitrouten zwecks Bau der A26 soll voraussichtlich Sommer 2025 enden."

  def type(), do: :construction

  def tags(), do: ["FR11", "FR13"]

  def links(_assigns) do
    [
      {"Präsentation zur A26; Seite 19", "Januar 2024",
       "https://sitzungsdienst-harburg.hamburg.de/bi/vo020.asp?VOLFDNR=1011433"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Baustelle</h4> <p>Bedingt durch den Bau der A26 durch das Alte Land sind die <.a name="freizeitroute-13">Freizeitroute 13</.a> und der <.a name="zweiter-gruener-ring">2. Grüne Ring</.a> durchschnitten.</p>
    <p>Die Umleitungen sind meist ausgeschildert und erfordern eine weiträumige Umfahrung. Im Osten ist dies entlang der <.m bounds="9.896188,53.476411,9.912562,53.49684">Waltershofer Straße</.m> und im Westen über den <.m bounds="9.776924,53.484684,9.79749,53.516718">Nincoper Deich</.m></p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
