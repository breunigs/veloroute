defmodule Data.Article.Static.AhrensburgA7 do
  use Article.Static

  def id(), do: "ahrensburg-a7"
  def display_id(), do: "7"
  def route_group(), do: :alltag
  def title(), do: "Ahrensburg: Veloroute A7"

  def color(), do: "#ff1248"

  def summary(),
    do:
      "Alltags-Veloroute A7 in Ahrensburg führt vom Braunen Hirsch zum Gewerbegebiet Nord, mit Abzweig via U-Bahnhof Ahrensburg Ost"

  def tags(), do: [id(), "ahrensburg"]

  def tracks(),
    do: [
      # 7b, direkt
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A7 (7b)",
        direction: :forward,
        from: "Brauner Hirsch",
        to: "Ahrensburg Gewerbegebiet Nord",
        parent_ref: __MODULE__,
        text: "Brauner Hirsch → Gewerbegebiet Nord",
        videos: [
          {"2022-10-15-ahrensburg/GX014872", :start, :end},
          {"2022-10-15-ahrensburg/GX014873", :start, :end},
          {"2022-10-15-ahrensburg/GX014874", :start, :end},
          {"2022-10-15-ahrensburg/GX014875", :start, "00:00:45.612"},
          {"2022-10-15-ahrensburg/GX014875", "00:00:51.552", :end},
          {"2022-10-15-ahrensburg/GX014876", :start, "00:00:36.362"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A7 (7b)",
        direction: :backward,
        from: "Ahrensburg Gewerbegebiet Nord",
        to: "Brauner Hirsch",
        parent_ref: __MODULE__,
        text: "Gewerbegebiet Nord → Brauner Hirsch",
        videos: [
          {"2022-10-15-ahrensburg/GX014863", "00:01:07.054", :end},
          {"2022-10-15-ahrensburg/GX014864", :start, :end},
          {"2022-10-15-ahrensburg/GX014865", :start, "00:00:16.116"},
          {"2022-10-15-ahrensburg/GX014883", "00:00:14.281", "00:00:34.067"},
          {"2022-10-15-ahrensburg/GX014865", "00:00:38.338", :end},
          {"2022-10-15-ahrensburg/GX014866", :start, "00:00:01.502"}
        ]
      },

      # 7a, via U-Ahrensburg Ost
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A7 (7a)",
        direction: :forward,
        from: "Hagener Allee",
        to: "Bahnhofsstraße",
        parent_ref: __MODULE__,
        text: "Hagener Allee → Bahnhofsstraße (via U-Ahrensburg Ost)",
        videos: [
          {"2022-10-15-ahrensburg/GX014883", "00:02:11.932", "00:02:29.883"},
          {"2022-10-15-ahrensburg/GX014883", "00:04:30.070", :end},
          {"2022-10-16-ahrensburg2/GX014907", :start, "00:00:34.101"},
          {"2022-10-16-ahrensburg2/GX014927", "00:00:06.273", "00:00:20.153"},
          {"2022-10-16-ahrensburg2/GX014910", "00:00:34.701", "00:00:38.639"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A7 (7a)",
        direction: :backward,
        from: "Bahnhofsstraße",
        to: "Hagener Allee",
        parent_ref: __MODULE__,
        text: "Bahnhofsstraße → Hagener Allee (via U-Ahrensburg Ost)",
        videos: [
          {"2022-10-16-ahrensburg2/GX014905", "00:00:46.079", "00:01:10.737"},
          {"2022-10-15-ahrensburg/GX014883", "00:01:02.296", "00:02:05.092"}
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
