defmodule Data.Article.Static.AhrensburgA6 do
  use Article.Static

  def id(), do: "ahrensburg-a6"
  def display_id(), do: "6"
  def route_group(), do: :alltag
  def title(), do: "Ahrensburg: Veloroute A6"

  def color(), do: "#099728"

  def summary(),
    do: "Alltags-Veloroute A6 in Ahrensburg führt vom U-Bahnhof Ahrensburg West zum Zentrum"

  def tags(), do: [id(), "ahrensburg"]

  def tracks(),
    do: [
      # Hauptroute
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A6",
        direction: :forward,
        from: "U-Bahn Ahrensburg West",
        to: "Zentrum",
        parent_ref: __MODULE__,
        text: "U-Bahn Ahrensburg West → Zentrum",
        videos: [
          {"2022-10-16-ahrensburg2/GX014939", "00:01:35.329", "00:01:38.765"},
          {"2022-10-16-ahrensburg2/GX014904", "00:01:34.561", :end},
          {"2022-10-16-ahrensburg2/GX014905", :start, "00:00:28.128"},
          {"2022-10-15-ahrensburg/GX014881", "00:03:19.766", :end},
          {"2022-10-15-ahrensburg/GX014882", :start, :end},
          {"2022-10-15-ahrensburg/GX014883", :start, "00:00:13.614"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A6",
        direction: :backward,
        from: "Zentrum",
        to: "U-Bahn Ahrensburg West",
        parent_ref: __MODULE__,
        text: "Zentrum → U-Bahn Ahrensburg West",
        videos: [
          {"2022-10-16-ahrensburg2/GX014933", "00:00:07.941", "00:00:18.051"},
          {"2022-10-16-ahrensburg2/GX014928", "00:00:48.448", :end},
          {"2022-10-16-ahrensburg2/GX014929", :start, :end},
          {"2022-10-16-ahrensburg2/GX014930", :start, :end},
          {"2022-10-16-ahrensburg2/GX014931", :start, "00:00:43.034"}
        ]
      },

      # Abzweig Bhf
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A6 Abzweig",
        direction: :forward,
        from: "Hamburger Straße",
        to: "Bahnhofsstraße",
        parent_ref: __MODULE__,
        text: "Hamburger Straße → Bahnhofsstraße",
        videos: [
          {"2022-10-16-ahrensburg2/GX014905", "00:00:30.964", "00:00:51.385"}
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
