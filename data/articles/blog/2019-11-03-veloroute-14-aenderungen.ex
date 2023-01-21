defmodule Data.Article.Blog.Veloroute14Aenderungen do
  use Article.Default

  def created_at(), do: ~D[2019-11-03]

  def title(), do: "Änderungen Veloroute 14 von Mitte 2018 bis Mitte 2019"

  def type(), do: nil

  def tags(), do: ["14"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p><.a name="alltagsroute-14">Veloroute 14</.a> ist zwar die längste Route in Hamburg, aber dennoch sind mir nur wenige Änderungen aufgefallen.</p> <p>Zum einen wurde der Umbau der <.m bounds="9.864998,53.581252,9.886922,53.594308">Kreuzung Elbgaustraße / Luruper Hauptstraße</.m>  abgeschlossen. Statt Radwegen gibt es hier jetzt Radfahrstreifen, die ein gerades Queren der Kreuzun erlauben. Für den Radverkehr gilt jeweils die KFZ Ampel, es ist also deutlich länger Grün. Für's Linksabbiegen gibt es jeweils Aufstellbereiche mit eigener Ampel.</p> <p>Mittlerweile fertig sein dürfte auch der Umbau der Bushaltestelle <.m bounds="10.122529,53.599324,10.133117,53.60563">Rahlstedter Weg</.m>, die vor allem die Radanbindung der Schule verbessern soll und den Radverkehr nicht mehr durch den Einstiegsbereich der Busse leitet. <.a name="2019-07-13-14-rahlstedter-weg">Details hierzu</.a>.</p>
    <p>Hab ich was übersehen? <.mailto>Schreib mir</.mailto> gerne.</p>
    """
  end
end
