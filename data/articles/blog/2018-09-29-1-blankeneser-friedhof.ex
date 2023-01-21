defmodule Data.Article.Blog.BlankeneserFriedhof do
  use Article.Default

  def name(), do: "#{created_at()}-1-blankeneser-friedhof"
  def created_at(), do: ~D[2018-09-29]
  def updated_at(), do: ~D[2022-01-03]

  def title(), do: "Friedhof Blankenese (Alltagsroute 1)"
  def icon(), do: :nocargo

  def summary(),
    do: "Friedhofsdurchfahrt soll getrennter Rad- und Fußweg werden"

  def start(), do: ~d[2023Q2]
  def stop(), do: ~d[2023Q3]

  def type(), do: :intent

  def tags(), do: ["1", "a15.1"]

  def links(_assigns) do
    [
      {"Zeitungsartikel",
       "https://www.abendblatt.de/hamburg/article234200157/stadtplanung-abendblatt-serie-altona-hamburg-stadtentwicklung-bauvorhaben-planung-ottensen.html"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Am <.m bounds="9.796375,53.572692,9.805467,53.577368">Friedhof Blankenese</.m> gibt es an beiden Zugangsstellen sehr enge Drängelgitter. Diese sind bereits mit einem normalen Fahrrad kaum zu passieren, mit Anhänger oder Lastenrad kommt man vermutlich überhaupt nicht durch. Allgemein erscheint die Führung durch den Friedhof fragwürdig, liegt doch der <.m bounds="9.793264,53.56325,9.812449,53.586809">Sülldorfer Kirchenweg</.m> knapp daneben. Vermutlich traute man sich nicht den KFZ Verkehr dort einzudämmen.</p>

    <h4>Vorhaben</h4>
    <p>Laut einem Zeitungsartikel soll der Weg in diesem Abschnitt zu einem getrennten Rad- und Fußweg umgebaut werden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
