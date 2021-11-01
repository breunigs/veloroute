defmodule Data.Article.Blog.QuerungBramfelderChaussee do
  use Article.Default

  def name(), do: "#{created_at()}-5-querung-bramfelder-chaussee"
  def created_at(), do: ~D[2018-10-25]

  def title(), do: "Querung Bramfelder Chaussee, Höhe Fabriciusstraße (Veloroute 5)"

  def type(), do: :planned

  def tags(), do: ["5"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Hinweis:</strong> Die Veloroute wird künftig durch die neue Straße <.m bounds="10.071774,53.614525,10.074022,53.615055">Am Dorfgraben</.m> geführt. Der Umbau der Ampel an diesem Knotenpunkt soll definitiv entfallen. Ob dies auch auf die sonstigen Verbesserungen zutrifft ist mir derzeit nicht bekannt. Für Details siehe bitte <.a href="/article/2018-10-25-5-am-dorfgraben">Neue Führung durch „Am Dorfgraben“</.a>.</p> <p>Stadtauswärts muss man absteigen um die Ampel zur Querung der <.m bounds="10.058741,53.593319,10.090246,53.633302">Bramfelder Chaussee</.m> legal zu erreichen – die Ampel an der Südseite ist nämlich ohne Überweg ausgeführt. Indes bewertet die Polizei diese Kreuzung bzw. Stelle als Unfallschwerpunkt.</p> <p>In er aktuellen Planung wird der Radweg an dieser Engstelle etwas verbreitert und das kurze Stück bis zur Ampel im Zweirichtungsverkehr freigegeben. Das macht die Führung der Veloroute wenigstens StVo-konform, für eine wirkliche Verbesserung ist aber ein Umbau der Kreuzung notwendig.</p> <p>Auch ist die Breite von stellenweise nur 2,0m einer Veloroute unwürdig, wäre aber auch nur durch eine Reduktion der angrenzenden Grünfläche verbreiterbar.</p> <p><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1008587">Erläuterungsbericht zur Umgestaltung mit vorläufigem Lageplan</.a> (unter Anlagen. „08_LP (5).pdf“ für Lageplan)</p>
    """
  end
end
