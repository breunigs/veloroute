defmodule Data.Article.Blog.Boettcherkamp do
  use Article.Default

  def name(), do: "#{created_at()}-14-boettcherkamp"
  def created_at(), do: ~D[2018-09-02]

  def title(), do: "Böttcherkamp (Veloroute 14)"

  def start(), do: ~d[2019Q2]

  def type(), do: :finished

  def tags(), do: [14]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>An dieser Kreuzung kann man nur indirekt und in zwei Phasen linksabbiegen. Das wäre an dieser vielbefahrenen Straße sogar verständlich, allerdings lässt der Aufstellbereich Fragen aufkommen. Soll man den Radweg rechts blockieren oder lieber die Bushaltestelle? Außerdem scheint es sich um eine Bettelampel zu halten, die beim Machen der Fotos aber von Zufußgehenden auf der anderen Seite für mich betätigt wurde.</p> <p>In Zukunft werden die Radverkehre im Böttcherkamp im Mischverkehr bei 30 km/h Tempolimit geführt. An der Kreuzung zum Rugenbarg gibt es jeweils einen vorgezogenen Aufstellstreifen und die Aufstellbereiche für indirektes Linksabbiegen werden sinnvoll eingezeichnet. Die Maßnahme soll im Frühjahr 2019 umgesetzt werden.</p> <p><.a href="https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1007690">Erläuterungsbericht zur Umgestaltung mit vorläufigem Lageplan</.a> (unter Anlagen)</p>
    """
  end
end
