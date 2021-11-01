defmodule Data.Article.Blog.BlankeneserFriedhof do
  use Article.Default

  def name(), do: "#{created_at()}-1-blankeneser-friedhof"
  def created_at(), do: ~D[2018-09-29]

  def title(), do: "Friedhof Blankenese (Veloroute 1)"
  def icon(), do: :nocargo

  def start(), do: ~d[2021Q4]

  def type(), do: :intent

  def tags(), do: ["1", "a15.1"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Am <.m bounds="9.796375,53.572692,9.805467,53.577368">Friedhof Blankenese</.m> gibt es an beiden Zugangsstellen sehr enge Drängelgitter. Diese sind bereits mit einem normalen Fahrrad kaum zu passieren, mit Anhänger oder Lastenrad kommt man vermutlich überhaupt nicht durch. Allgemein erscheint die Führung durch den Friedhof fragwürdig, liegt doch der <.m bounds="9.793264,53.56325,9.812449,53.586809">Sülldorfer Kirchenweg</.m> knapp daneben. Vermutlich traute man sich nicht den KFZ Verkehr dort einzudämmen.</p>
    <h4>Quelle</h4> <p><.a href="https://www.steg-hamburg.de/veloroute-altona.html">Baubeginn</.a> (rechte Seitenleiste)</p>
    """
  end
end
