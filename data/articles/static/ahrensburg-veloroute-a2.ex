defmodule Data.Article.Static.AhrensburgA2 do
  use Article.Static

  def id(), do: "ahrensburg-a2"
  def display_id(), do: "2"
  def route_group(), do: :alltag
  def title(), do: "Ahrensburg: Veloroute A2"

  def color(), do: "#a309a9"

  def summary(),
    do:
      "Alltags-Veloroute A2 in Ahrensburg führt vom U-Bahnhof Ahrensburg West zum Bahnhof Gartenholz"

  def tags(), do: [id(), "ahrensburg"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A2",
        direction: :forward,
        from: "Gartenholz",
        to: "U-Bahn Ahrensburg West",
        parent_ref: __MODULE__,
        text: "Gartenholz → U-Bahn Ahrensburg West",
        videos: [
          {"2022-10-16-ahrensburg2/GX014935", "00:01:43.870", :end},
          {"2022-10-16-ahrensburg2/GX014936", :start, "00:00:02.703"},
          {"2022-10-16-ahrensburg2/GX014938", "00:01:44.404", :end},
          {"2022-10-16-ahrensburg2/GX014939", :start, "00:01:38.765"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A2",
        direction: :backward,
        from: "U-Bahn Ahrensburg West",
        to: "Gartenholz",
        parent_ref: __MODULE__,
        text: "U-Bahn Ahrensburg West → Gartenholz",
        videos: [
          {"2022-10-16-ahrensburg2/GX014931", "00:00:40.707", "00:01:07.000"},
          {"2022-10-16-ahrensburg2/GX014933", "00:01:30.123", "00:01:59.186"},
          {"2022-10-16-ahrensburg2/GX014933", "00:02:14.468", :end},
          {"2022-10-16-ahrensburg2/GX014934", :start, :end},
          {"2022-10-16-ahrensburg2/GX014935", :start, "00:01:42.536"}
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
