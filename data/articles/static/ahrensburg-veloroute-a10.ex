defmodule Data.Article.Static.AhrensburgA10 do
  use Article.Static

  def id(), do: "ahrensburg-A10"
  def display_id(), do: "A10"
  def route_group(), do: :alltag
  def title(), do: "Ahrensburg: Veloroute A10"

  def color(), do: "#ffe79f"

  def summary(),
    do: "Video und Wegführung zur im Bau befindlichen Alltags-Veloroute A10 in Ahrensburg"

  def tags(), do: [id(), "ahrensburg"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A10",
        direction: :backward,
        from: "Gartenholz",
        to: "Woldenhorn",
        parent_ref: __MODULE__,
        text: "Gartenholz → Woldenhorn",
        videos: [
          {"2022-10-15-ahrensburg/GX014879", "00:00:25.692", :end},
          {"2022-10-15-ahrensburg/GX014880", :start, "00:01:03.564"},
          {"2022-10-15-ahrensburg/GX014859", "00:01:32.859", :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A10",
        direction: :forward,
        from: "Woldenhorn",
        to: "Gartenholz",
        parent_ref: __MODULE__,
        text: "Woldenhorn → Gartenholz",
        videos: [
          {"2022-10-15-ahrensburg/GX014858", "00:00:14.678", :end},
          {"2022-10-15-ahrensburg/GX014859", :start, "00:00:53.153"},
          {"2022-10-15-ahrensburg/GX014879", "00:00:11.612", "00:00:24.091"}
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
