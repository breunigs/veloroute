defmodule Data.Article.Static.AhrensburgA5 do
  use Article.Static

  def id(), do: "ahrensburg-a5"
  def display_id(), do: "5"
  def route_group(), do: :alltag
  def title(), do: "Ahrensburg: Veloroute A5"

  def color(), do: "#ff8717"

  def summary(),
    do: "Alltags-Veloroute A5 in Ahrensburg führt von Wulfsdorf zum Beimoorwald"

  def tags(), do: [id(), "ahrensburg"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A5",
        direction: :forward,
        from: "Wulfsdorf",
        to: "Beimoorwald",
        parent_ref: __MODULE__,
        text: "Wulfsdorf → Beimoorwald",
        videos: [
          {"2022-10-15-ahrensburg/GX014856", "00:01:21.799", :end},
          {"2022-10-15-ahrensburg/GX014857", :start, :end},
          {"2022-10-15-ahrensburg/GX014858", :start, "00:00:16.116"},
          {"2022-10-15-ahrensburg/GX014860", "00:00:01.034", :end},
          {"2022-10-15-ahrensburg/GX014861", :start, "00:00:02.703"},
          {"2022-10-15-ahrensburg/GX014862", "00:00:01.335", :end},
          {"2022-10-15-ahrensburg/GX014863", :start, "00:00:38.698"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A5",
        direction: :backward,
        from: "Beimoorwald",
        to: "Wulfsdorf",
        parent_ref: __MODULE__,
        text: "Beimoorwald → Wulfsdorf",
        videos: [
          {"2022-10-15-ahrensburg/GX014876", "00:01:08.721", :end},
          {"2022-10-15-ahrensburg/GX014877", :start, :end},
          {"2022-10-15-ahrensburg/GX014878", :start, :end},
          {"2022-10-15-ahrensburg/GX014879", :start, "00:00:11.178"},
          {"2022-10-15-ahrensburg/GX014859", "00:00:53.620", "00:01:32.859"},
          {"2022-10-15-ahrensburg/GX014880", "00:01:03.564", :end},
          {"2022-10-15-ahrensburg/GX014881", :start, "00:01:30.290"},
          {"2021-09-26-velo6-rsw-ahrensburg/GX012967", "00:01:45.038", "00:02:21.446"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Radverkehrsseite der Stadt Ahrensburg",
       "https://www.ahrensburg.de/Bauen-Umwelt-Klimaschutz/Stra%C3%9Fenwesen/Radverkehr/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Externe Links</h3>
    <.structured_links gpx={true}/>
    """
  end
end
