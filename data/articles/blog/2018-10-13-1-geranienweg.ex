defmodule Data.Article.Blog.Geranienweg do
  use Article.Default

  def name(), do: "#{created_at()}-1-geranienweg"
  def created_at(), do: ~D[2018-10-13]

  def title(), do: "Geranienweg (Veloroute 1)"

  def type(), do: :planned

  def tags(), do: ["1"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Sowohl stadteinwärts als auch stadtauswärts darf man der Veloroute auf einem kurzen Stück des <.m bounds="9.864044,53.577147,10.176731,53.604158">Geranienweg</.m> nicht folgen – die Einfahrt ist von beiden Richtungen untersagt. Absteigen und zu Fuß queren ist zwar legal, aber einer Veloroute unwürdig. Die Verwaltung weiß von dem Problem und es soll im Zuge einer Umbaumaßnahme behoben werden.</p> <p>Die Straße soll im Zuge einer neuen Wohnsiedlung überarbeitet werden, sodass eine Durchfahrt legal möglich ist. Die Zufahrt von der <.m bounds="9.864714,53.57165,9.87075,53.59295">Flurstraße</.m> bleibt dem Radverkehr vorbehalten, der hier einen 2m breiten, rot gepflasterten Radweg erhalten soll um sie vor entgegenkommenden KFZ zu schützen. Die Straße wird zugunsten breiterer Gehwege etwas schmäler und behält ihren verkehrsberuhigten Charakter.</p> <p><.a href="https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1007546">Details zur geplanten Gestaltung</.a> (Anlage 2, S. 35)</p>
    """
  end
end
