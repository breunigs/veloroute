defmodule Data.Article.Static.BrWandsbekW8 do
  use Article.Static

  def id(), do: "br-wandsbek-w8"
  def display_id(), do: "W8"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Wandsbek – W8 – Billstedt ↔ Glashütte"

  # def color(), do: "#75a6f1"
  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „W8 – Billstedt ↔ Glashütte“ verläuft sehr geradlinig in Nord-Süd Richtung zwischen den beiden Stadtteilen."

  def tags(), do: [id(), display_id(), "br-wandsbek"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "W8",
        direction: :forward,
        from: "Billstedt",
        to: "Glashütte",
        parent_ref: __MODULE__,
        text: "Bezirksroute Wandsbek „W8“ → Glashütte",
        videos: [
          {"2023-03-28-w1-w5-w8sud/GX015346", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015347", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015348", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015349", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015350", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015351", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015352", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015353", :start, "00:00:28.562"},
          {"2022-12-27-neumarkt-krogmann/GX015071", "00:00:01.268", :end},
          {"2022-12-27-neumarkt-krogmann/GX015072", :start, "00:01:13.206"},
          {"2023-04-06-br-wandsbek/GX015476", "00:00:03.070", :end},
          {"2023-04-06-br-wandsbek/GX015512", :start, :end},
          {"2023-04-06-br-wandsbek/GX015514", :start, "00:01:00.060"},
          {"2023-04-06-br-wandsbek/GX015504", "00:00:23.023", :end},
          {"2023-04-06-br-wandsbek/GX015506", :start, "00:00:15.282"},
          {"2023-04-06-br-wandsbek/GX015480", "00:00:00.534", :end},
          {"2023-04-06-br-wandsbek/GX015481", :start, :end},
          {"2023-04-06-br-wandsbek/GX015482", :start, :end},
          {"2023-04-06-br-wandsbek/GX015483", :start, :end},
          {"2023-04-06-br-wandsbek/GX015484", :start, "00:00:10.844"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "W8",
        direction: :backward,
        from: "Glashütte",
        to: "Billstedt",
        parent_ref: __MODULE__,
        text: "Bezirksroute Wandsbek „W8“ → Billstedt",
        videos: [
          {"2023-04-06-br-wandsbek/GX015484", "00:00:27.060", :end},
          {"2023-04-06-br-wandsbek/GX015485", :start, :end},
          {"2023-04-06-br-wandsbek/GX015486", :start, :end},
          {"2023-04-06-br-wandsbek/GX015488", :start, :end},
          {"2023-04-06-br-wandsbek/GX015489", :start, "00:00:22.956"},
          {"2023-04-06-br-wandsbek/GX015490", "00:00:01.034", :end},
          {"2023-04-06-br-wandsbek/GX015515", :start, "00:00:14.381"},
          {"2023-04-06-br-wandsbek/GX015509", "00:00:34.801", "00:00:59.159"},
          {"2023-04-06-br-wandsbek/GX015516", "00:00:03.837", :end},
          {"2023-04-06-br-wandsbek/GX015517", :start, "00:00:05.239"},
          {"2022-12-27-neumarkt-krogmann/GX015074", "00:00:21.388", :end},
          {"2022-12-27-neumarkt-krogmann/GX015075", :start, :end},
          {"2022-12-27-neumarkt-krogmann/GX015076", :start, "00:00:05.172"},
          {"2022-12-27-neumarkt-krogmann/GX015076", "00:00:36.837", "00:00:53.220"},
          {"2022-12-27-neumarkt-krogmann/GX015077", "00:00:00.334", :end},
          {"2022-12-27-neumarkt-krogmann/GX015078", :start, :end},
          {"2022-12-27-neumarkt-krogmann/GX015079", :start, :end},
          {"2022-12-27-neumarkt-krogmann/GX015080", :start, "00:00:40.474"},
          {"2023-03-28-w1-w5-w8sud/GX015338", "00:00:40.274", :end},
          {"2023-03-28-w1-w5-w8sud/GX015339", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015340", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015341", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015342", :start, :end},
          {"2023-03-28-w1-w5-w8sud/GX015344", :start, "00:00:26.688"}
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
    <h3>Bezirksroute Wandsbek – Billstedt ↔ Glashütte <.icon>W8</.icon></h3>

    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „W8 – Billstedt ↔ Glashütte“ künftig verlaufen könnte. Noch bis zum 30.08.2023 läuft ein Beteiligungsverfahren wo Rückmeldungen zum Routenverlauf gegeben werden können. Auch andere Anmerkungen zum Thema Fahrradverkehr sind möglich.</p>

    <%= Data.Article.Shared.bezirksroute(:wandsbek) %>

    <h8>Externe Links</h8>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
