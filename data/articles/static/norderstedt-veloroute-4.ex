defmodule Data.Article.Static.NorderstedtVeloroute4 do
  use Article.Static

  def id(), do: "norderstedt-4"
  def display_id(), do: "4"
  def route_group(), do: :alltag
  def title(), do: "Norderstedt: Veloroute 4"

  def color(), do: "#d14a1f"

  def summary(),
    do: "Veloroute 4 führt von Garstedt nach Glashütte"

  def tags(), do: [id(), "norderstedt"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "norderstedt 4",
        direction: :forward,
        from: "Garstedt",
        to: "Glashütte",
        parent_ref: __MODULE__,
        text: "von Garstedt nach Glashütte",
        videos: [
          {"2022-05-28-norderstedt/GX014070", "00:01:58.885", "00:02:50.937"},
          {"2022-05-28-norderstedt/GX014073", "00:00:01.568", "00:00:03.403"},
          {"2022-05-28-norderstedt/GX014074", :start, :end},
          {"2022-05-28-norderstedt/GX014075", :start, :end},
          {"2022-05-28-norderstedt/GX014076", :start, "00:00:01.802"},
          {"2022-05-28-norderstedt/GX014077", "00:00:01.468", :end},
          {"2022-05-28-norderstedt/GX014078", :start, "00:00:43.644"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "norderstedt 4",
        direction: :backward,
        from: "Glashütte",
        to: "Garstedt",
        parent_ref: __MODULE__,
        text: "von Glashütte nach Garstedt",
        videos: [
          {"2022-05-28-norderstedt/GX014079", "00:00:02.736", :end},
          {"2022-05-28-norderstedt/GX014080", :start, "00:00:56.456"},
          {"2022-05-28-norderstedt/GX014081", "00:00:03.103", :end},
          {"2022-05-28-norderstedt/GX014082", :start, "00:00:00.901"},
          {"2022-05-28-norderstedt/GX014070", "00:00:01.468", "00:00:51.418"}
        ]
      }
    ]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h3>Norderstedt: Veloroute 4 <.icon>norderstedt-4</.icon></h3>
    <p></p>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
