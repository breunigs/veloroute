defmodule Data.Article.Blog.TonndorferHauptstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-14-tonndorfer-hauptstrasse"
  def created_at(), do: ~D[2018-10-21]

  def title(), do: "Kreuzung Am Pulverteich / Tonndorfer Hauptstraße / Auerhahnweg (Veloroute 14)"

  def start(), do: ~d[2019]

  def type(), do: :planned

  def tags(), do: [14]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die Querung der <.m bounds="10.134721,53.591379,10.140588,53.593508">Tonndorfer Hauptstraße</.m> entlang der Veloroute 14 ist mit der leicht versetzten Ampel etwas verwirrend. In der vorliegenden Vorentwurtsplanung wird die Kreuzung begradigt, indem die Straße <.m bounds="10.132118,53.591975,10.13846,53.597157">Am Pulverhof</.m> und der <.m bounds="10.137375,53.590477,10.14023,53.592828">Auerhahnweg</.m> entsprechend vorher verschwenkt werden.</p> <p>Das Planungsgebiet umfasst auch die weitere Führung in der <.m bounds="10.13773,53.575625,10.197788,53.606086">Rahlstedter Straße</.m>, bis diese am <.m bounds="10.137837,53.586898,10.146716,53.594387">Ellerneck</.m> an die Veloroute 7 anschließt.</p> <p><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1006831">Vorentwurf/Vorschlag Lageplan (unter Anlagen, Blatt 1)</.a></p>
    """
  end
end
