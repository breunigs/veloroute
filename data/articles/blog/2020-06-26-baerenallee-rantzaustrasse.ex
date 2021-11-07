defmodule Data.Article.Blog.BaerenalleeRantzaustrasse do
  use Article.Default

  def created_at(), do: ~D[2020-06-26]

  def title(), do: "Bärenallee / Rantzaustraße (Veloroute 7)"

  def start(), do: ~d[2020Q3]
  def stop(), do: ~d[2020Q3]

  def type(), do: :changed_routing

  def tags(), do: ["7"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Man fand keine gute Lösung um den Radverkehr in beide Richtungen über die Bärenallee zu führen und entschied sich deswegen die Führung zu ändern. Die neue Führung ist bereits auf der Karte eingezeichnet.</p> <p>Stadtauswärts bleibt man <.m bounds="10.058885,53.568185,10.064811,53.570936" lon="10.062114" lat="53.5690371" dir="forward">zunächst auf der Bärenallee</.m> und teilt sich die Spur mit den KFZ. Über die <.m bounds="10.063953,53.568107,10.067881,53.56993">Freesenstraße</.m> gelangt man in die Rantzaustraße und kann der Route weiter folgen.</p> <p>Stadteinwärts fährt man bis zum <.m bounds="10.061953,53.566841,10.064649,53.568093">Ende der Rantzaustraße</.m>, dann über den Hochbordradweg in der <.m bounds="10.060378,53.567343,10.064295,53.569161">Hammer Straße</.m> um dann <.m bounds="10.061039,53.568639,10.062741,53.56943">im Kreuzungsbereich</.m> links in die Pappelallee abzubiegen.</p> <p>Dabei werden sowohl die <.m bounds="10.063953,53.568107,10.067881,53.56993">Freesenstraße</.m> als auch die Rantzaustraße als „Fahrradstraße, KFZ frei“ ausgeschildert. Letztere erhält außerdem einige Gehwegüberfahrten, damit die Veloroute hier Vorfahrt bekommt.</p> <p>An der <.m bounds="10.066989,53.568214,10.06974,53.569491" lon="10.0685186" lat="53.5689027" dir="forward">Kreuzung mit der Claudiusstraße</.m> wird die Fahrradstraße unterbrochen. Sogar die Stop-Schilder bleiben. Es gibt jedoch die Überlegung den Bahnübergang im Süden zu schließen und im Anschluss die Veloroute auch hier zu bevorrechtigen.</p> <p>Die Verlegung der Führung ist sinnvoll und umgeht so viele Autoschlangen. Das man die Fahrradstraßen jedoch nur halb umbaut und gedankenlos als „KFZ frei“ betitelt enttäuscht. Eine ordentliche Planung hätte  den KFZ-Schleichverkehr in diesen Wohnstraßen unterbunden und auf die nahen Hauptverkehrsstraßen verwiesen. Es bleibt zu hoffen das der Bahnübergang bald geschlossen wird, damit die Claudiusstraße gut gequert werden kann.</p> <p>Das Aufstellen der Schilder und das leichte Anpassen der Markierungen in der Bärenallee soll im Herbst 2020 passieren. Auch die Gehwegüberfahrten in der Rantzaustraße werden in diesem Zeitfenster gebaut.</p> <p><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1012155">Erläuterungsbereicht und Pläne</.a></p>
    """
  end
end
