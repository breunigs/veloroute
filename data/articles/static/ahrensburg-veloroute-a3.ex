defmodule Data.Article.Static.AhrensburgA3 do
  use Article.Static

  def id(), do: "ahrensburg-A3"
  def display_id(), do: "A3"
  def route_group(), do: :alltag
  def title(), do: "Ahrensburg: Veloroute A3"

  def color(), do: "#7fff07"

  def summary(),
    do: "Video und Wegführung zur Alltags-Veloroute A3 in Ahrensburg"

  def tags(), do: [id(), "ahrensburg"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A3",
        direction: :forward,
        from: "Bünningstedt",
        to: "Ahrensburger Redder",
        parent_ref: __MODULE__,
        text: "Bünningstedt → Ahrensburger Redder",
        videos: [
          {"2022-10-16-ahrensburg2/GX014913", "00:01:34.795", :end},
          {"2022-10-16-ahrensburg2/GX014914", :start, :end},
          {"2022-10-16-ahrensburg2/GX014915", :start, :end},
          {"2022-10-16-ahrensburg2/GX014916", :start, "00:01:10.056"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A3",
        direction: :backward,
        from: "Ahrensburger Redder",
        to: "Bünningstedt",
        parent_ref: __MODULE__,
        text: "Ahrensburger Redder → Bünningstedt",
        videos: [
          {"2022-10-16-ahrensburg2/GX014916", "00:01:13.726", :end},
          {"2022-10-16-ahrensburg2/GX014917", :start, "00:00:31.865"},
          {"2022-10-16-ahrensburg2/GX014926", "00:00:00.801", :end},
          {"2022-10-16-ahrensburg2/GX014918", :start, :end},
          {"2022-10-16-ahrensburg2/GX014919", :start, :end},
          {"2022-10-16-ahrensburg2/GX014920", :start, "00:01:04.051"}
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
