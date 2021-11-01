defmodule Data.Article.Blog.Alsenplatz do
  use Article.Default

  def name(), do: "#{created_at()}-alsenplatz"
  def created_at(), do: ~D[2018-12-18]

  def title(), do: "Alsenplatz (Veloroute 13)"

  def type(), do: :finished

  def tags(), do: ["13"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die Führung am <.m bounds="9.950782,53.56524,9.952958,53.567014">Alsenplatz</.m> ist etwas umständlich, da man mit dem Fahrrad am liebsten über den Parkplatz abkürzen möchte. Die Einbahnstraßenregelung gilt aber auch für den Radverkehr und in der freigegebenen Richtung hilft sie wenig, da man im Anschluss die <.m bounds="9.948636,53.56234,9.951386,53.56633">Alsenstraße</.m> nicht queren kann.</p> <p>Mit dem Umbau wird der Wunsch „direkt“ fahren zu können erfüllt. Dazu wird ein kleiner Kreisel eingerichtet, der die Vorfahrt neben der Hauptverkehrsstraße eindeutig regelt. Radverkehr Richtung Eimsbüttel folgt künftig der <.m bounds="9.948636,53.56234,9.951386,53.56633">Alsenstraße</.m> und biegt dann auf Höhe der <.m bounds="9.94388,53.56263,9.957689,53.569424">Langenfelder Straße</.m> ab. Dort folgt direkt im Anschluss der Kreisel, der auf dem <.m bounds="9.950782,53.56524,9.952958,53.567014">Alsenplatz</.m> Richtung <.m bounds="9.953019,53.56629,9.957126,53.567169">Waterloostraße</.m> verlassen wird. In der Gegenrichtung fährt man vom <.m bounds="9.950782,53.56524,9.952958,53.567014">Alsenplatz</.m> in den Kreisel ein und verlässt ihn auf einem eigenen Fahrradweg – erst auf Höhe der <.m bounds="9.941787,53.565114,9.951345,53.565837">Augustenburger Straße</.m> wechselt man auf die normale Fahrbahnseite. KFZ stehen deutlich weniger Möglichkeiten zur Verfügung, sodass nicht mit hohem Verkehrsaufkommen gerechnet werden muss. Hauptsächlich dürfte es sich um Rechtsabbieger aus der <.m bounds="9.948636,53.56234,9.951386,53.56633">Alsenstraße</.m> handeln, die künftig schon hier einbiegen.</p> <p>An den anderen Knoten rund um den <.m bounds="9.950782,53.56524,9.952958,53.567014">Alsenplatz</.m> wurde der Radverkehr auch ordentlich untergebracht. Linksabbiegen wird zwar nur indirekt möglich sein, dafür ist es aber auch überall möglich. Selbst wenn man seine Abfahrt verpasst, hat man in wenigen Metern nochmal die Möglichkeit ohne großen Umweg zu korrigieren.</p> <p>Bei der Kreuzung <.m bounds="9.948818,53.564226,9.959645,53.569806">Eimsbütteler Straße</.m> mit der <.m bounds="9.953019,53.56629,9.957126,53.567169">Waterloostraße</.m> ist eine leicht versetzte Kreuzung vorgesehen, die mit Rechts-vor-Links geregelt wird. D.h. hier ändert sich wenig an der Geometrie.</p> <p>Wermutstropfen: Im weiteren Verlauf der <.m bounds="9.948636,53.56234,9.951386,53.56633">Alsenstraße</.m> Richtung Altona bleiben die Radfahrstreifen mit 1,62m am absoluten Mindesmaß. Immerhin sollen erheblich mehr Fahrradbügel aufgestellt werden.</p> <p>Die Maßnahme wird aktuell umgesetzt und soll im Juli 2019 abgeschlossen sein.</p> <p><.a href="https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1006205">Erläuterungsbericht zur Umgestaltung mit Lageplan</.a> (unter Anlagen)</p>
    """
  end
end
