defmodule Data.Article.Static.AhrensburgA9 do
  use Article.Static

  def id(), do: "ahrensburg-a9"
  def display_id(), do: "9"
  def route_group(), do: :alltag
  def title(), do: "Ahrensburg: Veloroute A9"

  def color(), do: "#b0a318"

  def summary(),
    do:
      "Alltags-Veloroute A9 in Ahrensburg führt vom U-Bahnhof Ahrensburg West zum Ahrensburger Zentrum"

  def tags(), do: [id(), "ahrensburg"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A9",
        direction: :forward,
        from: "Zentrum",
        to: "U-Bahn Ahrensburg West",
        parent_ref: __MODULE__,
        text: "Zentrum → U-Bahn Ahrensburg West",
        videos: [
          {"2022-10-16-ahrensburg2/GX014933", "00:00:38.438", "00:01:28.155"},
          {"2022-10-16-ahrensburg2/GX014939", "00:01:11.338", "00:01:38.899"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A9",
        direction: :backward,
        from: "U-Bahn Ahrensburg West",
        to: "Zentrum",
        parent_ref: __MODULE__,
        text: "U-Bahn Ahrensburg West → Zentrum",
        videos: [
          {"2022-10-16-ahrensburg2/GX014931", "00:00:40.707", :end},
          {"2022-10-16-ahrensburg2/GX014932", :start, "00:00:11.778"}
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
