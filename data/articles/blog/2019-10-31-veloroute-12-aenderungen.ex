defmodule Data.Article.Blog.Veloroute12Aenderungen do
  use Article.Default

  def created_at(), do: ~D[2019-10-31]

  def title(), do: "Änderungen Veloroute 12 von Mitte 2018 bis Mitte 2019"

  def type(), do: nil

  def tags(), do: ["12"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Wie viele andere Routen profitiert auch die <.a name="alltagsroute-12">Veloroute 12</.a> vom <.m bounds="9.983681,53.546176,9.991169,53.550634">Umbau des Rödingmarktes</.m>. Statt Baustelle gibt es jetzt überall eine Radverkehrsführung mit sinnvollen Ampeln und ebenem Straßenbelag. Abbiegen ist weiterhin aus allen und in alle Richtungen möglich.</p> <p>Außerdem lässt sich jetzt komfortabler von den Landungsbrücken ins Portugiesenviertel abbiegen. Mit der Fertigstellung des Hochwasserschutzes wurde auch ein <.m bounds="9.970196,53.543707,9.97667,53.547561">eigener Aufstellbereich für indirektes Linksabbiegen</.m> eingerichtet.</p>
    <p>Wenn ich etwas übersehen habe, <.mailto>schreib mir</.mailto> bitte.</p>
    """
  end
end
