defmodule Data.Article.Static.NorderstedtVeloroute2 do
  use Article.Static

  def id(), do: "norderstedt-2"
  def display_id(), do: "2"
  def route_group(), do: :alltag
  def title(), do: "Norderstedt: Veloroute 2"

  def color(), do: "#d24a2f"

  def summary(),
    do: "Veloroute 2 führt vom Schmuggelstieg zum Harksheider Markt"

  def tags(), do: [id(), "norderstedt"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "norderstedt 2",
        direction: :forward,
        from: "Schmuggelstieg",
        to: "Harksheider Markt",
        parent_ref: __MODULE__,
        text: "vom Schmuggelstieg zum Harksheider Markt",
        videos: [
          {"2022-05-28-norderstedt/GX014068", "00:00:12.246", :end},
          {"2022-05-28-norderstedt/GX014069", :start, :end},
          {"2022-05-28-norderstedt/GX014071", :start, "00:00:07.107"},
          {"2022-05-28-norderstedt/GX014090", "00:00:21.955", "00:01:09.703"},
          {"2022-05-28-norderstedt/GX014091", "00:00:00.701", "00:00:43.844"},
          {"2022-05-28-norderstedt/GX014118", "00:00:04.171", "00:00:10.210"},
          {"2022-05-28-norderstedt/GX014116", "00:00:22.656", "00:00:26.960"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "norderstedt 2",
        direction: :backward,
        from: "Harksheider Markt",
        to: "Schmuggelstieg",
        parent_ref: __MODULE__,
        text: "vom Harksheider Markt zum Schmuggelstieg",
        videos: [
          {"2022-05-28-norderstedt/GX014117", "00:00:00.868", "00:00:05.973"},
          {"2022-05-28-norderstedt/GX014118", "00:00:13.647", :end},
          {"2022-05-28-norderstedt/GX014119", :start, :end},
          {"2022-05-28-norderstedt/GX014073", :start, "00:00:01.502"},
          {"2022-05-28-norderstedt/GX014070", "00:02:50.904", "00:02:58.712"}
        ]
      }
    ]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h3>Norderstedt: Veloroute 2 <.icon>norderstedt-2</.icon></h3>
    <p></p>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
