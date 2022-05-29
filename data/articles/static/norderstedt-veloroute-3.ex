defmodule Data.Article.Static.NorderstedtVeloroute3 do
  use Article.Static

  def id(), do: "norderstedt-3"
  def display_id(), do: "3"
  def route_group(), do: :alltag
  def title(), do: "Norderstedt: Veloroute 3"

  def color(), do: "#d34a3f"

  def summary(),
    do: "Veloroute 3 führt von Norderstedt-Mitte nach Glashütte"

  def tags(), do: [id(), "norderstedt"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "norderstedt 3",
        direction: :forward,
        from: "Norderstedt-Mitte",
        to: "Glashütte",
        parent_ref: __MODULE__,
        text: "von Norderstedt-Mitte nach Glashütte",
        videos: [
          {"2022-05-28-norderstedt/GX014095", :start, "00:00:05.772"},
          {"2022-05-28-norderstedt/GX014097", "00:00:03.971", :end},
          {"2022-05-28-norderstedt/GX014098", :start, :end},
          {"2022-05-28-norderstedt/GX014099", :start, "00:00:03.203"},
          {"2022-05-28-norderstedt/GX014102", "00:00:25.192", "00:00:31.498"},
          {"2022-05-28-norderstedt/GX014102", "00:00:40.040", :end},
          {"2022-05-28-norderstedt/GX014103", :start, :end},
          {"2022-05-28-norderstedt/GX014104", :start, "00:00:20.120"},
          {"2022-05-28-norderstedt/GX014113", "00:00:00.868", :end},
          {"2022-05-28-norderstedt/GX014114", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "norderstedt 3",
        direction: :backward,
        from: "Glashütte",
        to: "Norderstedt-Mitte",
        parent_ref: __MODULE__,
        text: "von Glashütte nach Norderstedt-Mitte",
        videos: [
          {"2022-05-28-norderstedt/GX014115", :start, :end},
          {"2022-05-28-norderstedt/GX014116", :start, "00:00:20.954"},
          {"2022-05-28-norderstedt/GX014117", "00:00:04.771", "00:00:07.007"},
          {"2022-05-28-norderstedt/GX014091", "00:00:45.512", :end},
          {"2022-05-28-norderstedt/GX014092", :start, :end},
          {"2022-05-28-norderstedt/GX014093", :start, "00:00:09.142"}
        ]
      }
    ]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h3>Norderstedt: Veloroute 3 <.icon>norderstedt-3</.icon></h3>
    <p></p>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
