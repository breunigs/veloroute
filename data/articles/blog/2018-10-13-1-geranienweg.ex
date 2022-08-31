defmodule Data.Article.Blog.Geranienweg do
  use Article.Default

  def name(), do: "#{created_at()}-1-geranienweg"
  def created_at(), do: ~D[2018-10-13]

  def title(), do: "Geranienweg (Veloroute 1)"

  def type(), do: :planned

  def tags(), do: ["1", "A23.2"]

  def links(_assigns) do
    [
      {"Sachstand Velorouten", "März 2022; S. 8",
       "https://sitzungsdienst-altona.hamburg.de/bi//to020.asp?TOLFDNR=1037758"},
      {"Beschreibung Bebauungplan", "Juni 2018; Anlage 4, S. 35",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1007546"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand März 2022</h4>
    <p>Der Umbau des Geranienwegs soll ausgeschrieben worden sein.</p>

    <h4>Alter Zustand</h4>
    <p>Sowohl stadteinwärts als auch stadtauswärts darf man der Veloroute auf einem kurzen Stück des <.m bounds="9.864044,53.577147,10.176731,53.604158">Geranienweg</.m> nicht folgen – die Einfahrt ist von beiden Richtungen untersagt. Absteigen und zu Fuß queren ist zwar legal, aber einer Veloroute unwürdig. Die Verwaltung weiß von dem Problem und es soll im Zuge einer Umbaumaßnahme behoben werden.</p>

    <h4>Planung</h4>
    <p>Die Straße soll im Zuge einer neuen Wohnsiedlung überarbeitet werden, sodass eine Durchfahrt legal möglich ist. Die Straße wird zugunsten breiterer Gehwege etwas schmäler und behält ihren verkehrsberuhigten Charakter.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
