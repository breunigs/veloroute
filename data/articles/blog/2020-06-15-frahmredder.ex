defmodule Data.Article.Blog.Frahmredder do
  use Article.Default

  def created_at(), do: ~D[2020-06-15]

  def title(), do: "Frahmredder (Veloroute 5)"

  def type(), do: :intent

  def tags(), do: ["5"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die Führung der Veloroute 5 wurde kürzlich in den <.m bounds="10.087663,53.64684,10.109781,53.651953" lon="10.098874" lat="53.6488415" dir="forward">Frahmredder</.m> verlegt. Bislang zeichnet sich dieser durch mangelhafte Radverkehrsanlagen aus, die häufig über Fußwege geleitet werden und allesamt baufällig sind. Stellenweise sind auch keine Radwege vorhanden.</p> <p>Der Bezirk Wandsbek plant dies mit dem Projekt „Projekt VR 5, Abschnitt W06.2“ zu verbessern, zu dem mir leider keine Veröffentlichungen bekannt sind.</p> <p><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1012022">Änderung der Führung</.a></p>
    """
  end
end
