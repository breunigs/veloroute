defmodule Data.Article.Blog.Veloroute12Aenderungen do
  use Article.Default

  def name(), do: "#{created_at()}-veloroute-12-aenderungen"
  def created_at(), do: ~D[2019-10-31]

  def title(), do: "Änderungen Veloroute 12 von Mitte 2018 bis Mitte 2019"

  def type(), do: nil

  def tags(), do: [12]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Wie viele andere Routen profitiert auch die <.a href="/12">Veloroute 12</.a> vom <.a href="/12#16.55/53.548405/9.987425/xof30qcm6nYA_wwYGoobOg">Umbau des Rödingmarktes</.a>. Statt Baustelle gibt es jetzt überall eine Radverkehrsführung mit sinnvollen Ampeln und ebenem Straßenbelag. Abbiegen ist weiterhin aus allen und in alle Richtungen möglich.</p> <p>Außerdem lässt sich jetzt komfortabler von den Landungsbrücken ins Portugiesenviertel abbiegen. Mit der Fertigstellung des Hochwasserschutzes wurde auch ein <.a href="/12#16.76/53.545634/9.973433/MxDOEMPkVagqGHJnxO3AQA">eigener Aufstellbereich für indirektes Linksabbiegen</.a> eingerichtet.</p>
    <p>Wenn ich etwas übersehen habe, <mailto>schreib mir</mailto> bitte.</p>
    """
  end
end
