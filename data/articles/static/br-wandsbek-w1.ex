defmodule Data.Article.Static.BrWandsbekW1 do
  use Article.Static

  def id(), do: "br-wandsbek-w1"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Wandsbek – W1 – Eilbek ↔ Wolfsdorf (↔ Ahrensburg)"

  def color(), do: "#89B375"

  def summary(),
    do:
      "Die Vorschlag zur Bezirksroute „W1 – Eilbek ↔ Wolfsdorf (↔ Ahrensburg) in Wandsbek verläuft nach Nord-Osten."

  def tags(), do: [id(), "br-wandsbek"]

  def tracks(),
    do: []

  def links(_assigns) do
    [
      {"Beteiligungsverfahren", "2023", "https://radverkehr-wandsbek.beteiligung.hamburg"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „W1 – Eilbek ↔ Wolfsdorf (↔ Ahrensburg)“ künftig verlaufen könnte. Noch bis zum 30.04.2023 läuft ein Beteiligungsverfahren wo Rückmeldungen zum Routenverlauf gegeben werden können. Auch andere Anmerkungen zum Thema Fahrradverkehr sind möglich.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
