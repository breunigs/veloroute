defmodule Data.Article.Static.AhrensburgA4 do
  use Article.Static

  def id(), do: "ahrensburg-a4"
  def display_id(), do: "4"
  def route_group(), do: :alltag
  def title(), do: "Ahrensburg: Veloroute A4"

  def color(), do: "#0a80fe"

  def summary(),
    do:
      "Alltags-Veloroute A4 in Ahrensburg führt von Ahrensfelde nach Heimgarten bzw. zum Rosenweg"

  def tags(), do: [id(), "ahrensburg"]

  def tracks(),
    do: [
      # Hauptroute
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A4",
        direction: :forward,
        from: "Rosenweg",
        to: "Ahrensfelde",
        parent_ref: __MODULE__,
        text: "Rosenweg → Ahrensfelde",
        videos: [
          {"2022-10-16-ahrensburg2/GX014920", "00:01:58.552", :end},
          {"2022-10-16-ahrensburg2/GX014921", :start, "00:00:22.956"},
          {"2022-10-16-ahrensburg2/GX014921", "00:02:15.836", :end},
          {"2022-10-16-ahrensburg2/GX014922", :start, :end},
          {"2022-10-16-ahrensburg2/GX014923", :start, :end},
          {"2022-10-16-ahrensburg2/GX014924", :start, "00:00:27.728"},
          {"2022-10-16-ahrensburg2/GX014907", "00:00:49.850", "00:01:05.499"},
          {"2022-10-15-ahrensburg/GX014883", "00:01:02.329", "00:01:45.005"},
          {"2022-10-15-ahrensburg/GX014883", "00:02:30.117", "00:03:31.335"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A4",
        direction: :backward,
        from: "Ahrensfelde",
        to: "Rosenweg",
        parent_ref: __MODULE__,
        text: "Ahrensfelde → Rosenweg",
        videos: [
          {"2022-10-15-ahrensburg/GX014883", "00:03:34.781", :end},
          {"2022-10-16-ahrensburg2/GX014907", :start, "00:00:47.748"},
          {"2022-10-15-ahrensburg/GX014873", "00:00:10.644", "00:00:21.922"},
          {"2022-10-16-ahrensburg2/GX014911", "00:00:02.536", :end},
          {"2022-10-16-ahrensburg2/GX014912", :start, :end},
          {"2022-10-16-ahrensburg2/GX014913", :start, "00:00:57.157"}
        ]
      },

      # Abzweig Heimgarten, 4b
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A4b",
        direction: :forward,
        from: "Heimgarten",
        to: "Lilienweg",
        parent_ref: __MODULE__,
        text: "Heimgarten → Lilienweg",
        videos: [
          {"2022-10-16-ahrensburg2/GX014921", "00:01:14.508", "00:01:56.883"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Ahrensburg Veloroute A4b",
        direction: :backward,
        from: "Lilienweg",
        to: "Heimgarten",
        parent_ref: __MODULE__,
        text: "Lilienweg → Heimgarten",
        videos: [
          {"2022-10-16-ahrensburg2/GX014921", "00:00:23.357", "00:01:13.140"}
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
    <p><%= @ref.summary() %></p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
