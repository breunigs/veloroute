defmodule Data.Article.Static.BrWandsbekW2 do
  use Article.Static

  def id(), do: "br-wandsbek-w2"
  def display_id(), do: "W2"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Wandsbek – W2 – Horn ↔ Sasel"

  # def color(), do: "#f1c775"
  def color(), do: "#969696"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „W2 – Horn ↔ Sasel“ in Wandsbek verbindet die beiden genannten Stadtteile in Nord/Süd Richtung."

  def tags(), do: [id(), display_id(), "br-wandsbek"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "w2",
        direction: :forward,
        from: "Horn",
        to: "Sasel",
        parent_ref: __MODULE__,
        text: "Bezirksroute Wandsbek „W2“ → Sasel",
        videos: [
          {"2023-04-02-br-wandsbek/GX015411.MP4_time_lapse.mkv", "00:00:40.440", :end},
          {"2023-04-02-br-wandsbek/GX015412.MP4_time_lapse.mkv", :start, :end},
          {"2023-04-02-br-wandsbek/GX015413.MP4_time_lapse.mkv", :start, :end},
          {"2023-04-02-br-wandsbek/GX015414.MP4_time_lapse.mkv", :start, :end},
          {"2023-04-02-br-wandsbek/GX015415.MP4_time_lapse.mkv", :start, :end},
          {"2023-04-02-br-wandsbek/GX015416.MP4_time_lapse.mkv", :start, :end},
          {"2023-04-02-br-wandsbek/GX015417.MP4_time_lapse.mkv", :start, :end},
          {"2023-04-02-br-wandsbek/GX015418.MP4_time_lapse.mkv", :start, :end},
          {"2023-04-02-br-wandsbek/GX015419.MP4_time_lapse.mkv", :start, :end},
          {"2023-04-02-br-wandsbek/GX015420.MP4_time_lapse.mkv", :start, "00:01:11.605"},
          {"2023-04-02-br-wandsbek/GX015402", "00:00:20.153", "00:03:20.000"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "w2",
        direction: :backward,
        from: "Sasel",
        to: "Horn",
        parent_ref: __MODULE__,
        text: "Bezirksroute Wandsbek „W2“ → Horn",
        videos: [
          {"2023-04-02-br-wandsbek/GX015403", :start, "00:03:26.673"},
          {"2023-04-02-br-wandsbek/GX015403", "00:03:33.046", :end},
          {"2023-04-02-br-wandsbek/GX015404", :start, :end},
          {"2023-04-02-br-wandsbek/GX015405", :start, :end},
          {"2023-04-02-br-wandsbek/GX015406", :start, :end},
          {"2023-04-02-br-wandsbek/GX015407", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013772", :start, "00:00:04.605"},
          {"2023-04-02-br-wandsbek/GX015410.MP4_time_lapse.mkv", "00:00:02.135", :end},
          {"2023-04-02-br-wandsbek/GX015411.MP4_time_lapse.mkv", :start, "00:00:36.069"}
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
    <h3>Bezirksroute Wandsbek – Horn ↔ Sasel <.icon>W2</.icon></h3>

    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „W2 – Horn ↔ Sasel“ künftig verlaufen könnte. Noch bis zum 30.04.2023 läuft ein Beteiligungsverfahren wo Rückmeldungen zum Routenverlauf gegeben werden können. Auch andere Anmerkungen zum Thema Fahrradverkehr sind möglich.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
