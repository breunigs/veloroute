defmodule Data.Article.Static.AhrensburgA8 do
  use Article.Static

  def id(), do: "ahrensburg-a8"
  def display_id(), do: "8"
  def route_group(), do: :alltag
  def title(), do: "Ahrensburg: Veloroute A8"

  def color(), do: "#02dedd"

  def summary(),
    do: "Alltags-Veloroute A8 in Ahrensburg führt vom Schlosspark zum Erlenhof"

  def tags(), do: [id(), "ahrensburg"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A8",
        direction: :forward,
        from: "Erlenhof",
        to: "Schlosspark",
        parent_ref: __MODULE__,
        text: "Erlenhof → Schlosspark",
        videos: [
          {"2022-10-16-ahrensburg2/GX014938", "00:00:49.373", "00:01:44.404"},
          {"2022-10-16-ahrensburg2/GX014936", "00:00:02.703", "00:00:07.941"},
          {"2022-10-16-ahrensburg2/GX014936", "00:00:11.378", "00:00:21.488"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A8",
        direction: :backward,
        from: "Schlosspark",
        to: "Erlenhof",
        parent_ref: __MODULE__,
        text: "Schlosspark → Erlenhof",
        videos: [
          {"2022-10-16-ahrensburg2/GX014937", "00:00:02.636", :end},
          {"2022-10-16-ahrensburg2/GX014938", :start, "00:00:42.943"}
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
    <.summary/>

    <h3>Externe Links</h3>
    <.structured_links gpx={true}/>
    """
  end
end
