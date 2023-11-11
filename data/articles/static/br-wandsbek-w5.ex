defmodule Data.Article.Static.BrWandsbekW5 do
  use Article.Static

  def id(), do: "br-wandsbek-w5"
  def display_id(), do: "W5"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Wandsbek – W5 – City-Nord ↔ Rahlstedt"

  # def color(), do: "#89b375"
  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „W5 – City-Nord ↔ Rahlstedt“ in Wandsbek verläuft in Ost-West-Richtung zwischen den genannten Stadtteilen."

  def tags(), do: [id(), display_id(), "br-wandsbek"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "w5",
        direction: :backward,
        from: "City-Nord",
        to: "Rahlstedt Süd",
        parent_ref: __MODULE__,
        text: "Bezirksroute Wandsbek „W5“ → Rahlstedt",
        videos: [
          {"2023-03-28-w1-w5-w8sud/GX015321", "00:00:10.644", :end},
          {"2023-03-28-w1-w5-w8sud/GX015322", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015323", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015324", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015325", :start, "00:00:20.187"},
          {"2023-03-28-w1-w5-w8sud/GX015326", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015327", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015328", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015329", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015330", :start, "00:00:09.109"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "w5",
        direction: :forward,
        from: "Rahlstedt Süd",
        to: "City-Nord",
        parent_ref: __MODULE__,
        text: "Bezirksroute Wandsbek „W5“ → City-Nord",
        videos: [
          {"2023-03-28-w1-w5-w8sud/GX015331", "00:00:01.134", :end},
          {"2023-03-28-w1-w5-w8sud/GX015332", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015333", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015353", :start, "00:00:27.995"},
          {"2022-12-27-neumarkt-krogmann/GX015071", "00:00:00.734", "00:00:02.970"},
          {"2023-03-28-w1-w5-w8sud/GX015310", "00:00:36.737", :end},
          {"2023-03-28-w1-w5-w8sud/GX015311", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015312", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015313", :start, :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Beteiligungsverfahren", "2023", "https://radverkehr-wandsbek.beteiligung.hamburg"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Bezirksroute Wandsbek – City-Nord ↔ Rahlstedt <.icon>W5</.icon></h3>

    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „W5 – City-Nord ↔ Rahlstedt“ künftig verlaufen könnte. Noch bis zum 30.04.2023 läuft ein Beteiligungsverfahren wo Rückmeldungen zum Routenverlauf gegeben werden können. Auch andere Anmerkungen zum Thema Fahrradverkehr sind möglich.</p>

    <%= Data.Article.Shared.bezirksroute(:wandsbek) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
