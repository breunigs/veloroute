defmodule Data.Article.Static.NorderstedtVeloroute1 do
  use Article.Static

  def id(), do: "norderstedt-1"
  def display_id(), do: "1"
  def route_group(), do: :alltag
  def title(), do: "Norderstedt: Veloroute 1"

  def color(), do: "#d14a1f"

  def summary(),
    do: "Veloroute 1 führt vom Schmuggelstieg über Norderstedt-Mitte nach Meeschensee"

  def tags(), do: [id(), "norderstedt"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "norderstedt 1",
        direction: :forward,
        from: "Schmuggelstieg",
        to: "Meeschensee",
        parent_ref: __MODULE__,
        text: "vom Schmuggelstieg nach Meeschensee",
        videos: [
          {"2022-05-28-norderstedt/GX014068", "00:00:12.246", :end},
          {"2022-05-28-norderstedt/GX014069", :start, :end},
          {"2022-05-28-norderstedt/GX014071", :start, "00:00:06.840"},
          {"2022-05-28-norderstedt/GX014082", "00:00:07.241", "00:00:58.358"},
          {"2022-05-28-norderstedt/GX014089", "00:01:25.519", "00:01:29.623"},
          {"2022-05-28-norderstedt/GX014082", "00:01:07.668", "00:02:33.053"},
          {"2022-05-28-norderstedt/GX014083", "00:00:01.268", :end},
          {"2022-05-28-norderstedt/GX014084", :start, "00:01:44.304"},
          {"2022-05-28-norderstedt/GX014085", "00:00:18.585", :end},
          {"2022-05-28-norderstedt/GX014086", :start, "00:01:54.014"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "norderstedt 1",
        direction: :backward,
        from: "Meeschensee",
        to: "Schmuggelstieg",
        parent_ref: __MODULE__,
        text: "von Meeschensee zum Schmuggelstieg",
        videos: [
          {"2022-05-28-norderstedt/GX014087", "00:00:01.034", "00:02:16.737"},
          {"2022-05-28-norderstedt/GX014084", "00:01:45.072", "00:01:59.052"},
          {"2022-05-28-norderstedt/GX014087", "00:02:58.879", :end},
          {"2022-05-28-norderstedt/GX014088", :start, :end},
          {"2022-05-28-norderstedt/GX014089", :start, "00:01:18.712"},
          {"2022-05-28-norderstedt/GX014089", "00:01:31.592", :end},
          {"2022-05-28-norderstedt/GX014090", :start, "00:00:18.485"},
          {"2022-05-28-norderstedt/GX014072", "00:00:06.540", :end},
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
    <h3>Norderstedt: Veloroute 1 <.icon>norderstedt-1</.icon></h3>
    <p></p>

    <img src="/images/logo-norderstedt-1.svg" style="float:left; padding: 3px 10px 10px 0; width: 100px" />

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
