defmodule Data.Article.Static.Radroute3 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-3"
  def display_name(), do: "3"
  def title(), do: "Radroute 3"
  def color(), do: "#833e5d"

  def summary(),
    do: "FIXME"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "3",
        direction: :backward,
        from: "Niendorf",
        to: "Veddel",
        parent_ref: __MODULE__,
        text: "von Niendorf zur Veddel",
        historic: %{
          "" => ~d[]
        },
        videos: [
          {"2024-04-30-fr3/GX017305", "00:00:02.669", "00:00:03.904"},
          {"2024-04-30-fr3/GX017306", :start, "00:00:36.963"},
          {"2024-04-30-fr3/GX017307", :start, "00:00:47.872"},
          {"2024-04-30-fr3/GX017308", :start, "00:00:02.336"},
          {"2024-04-30-fr3/GX017309", "00:00:00.067", "00:00:27.622"},
          {"2024-04-30-fr3/GX017310", "00:00:00.200", "00:00:44.102"},
          {"2024-04-30-fr3/GX017311", "00:00:00.033", "00:01:00.627"},
          {"2024-04-30-fr3/GX017311", "00:01:06.233", "00:01:20.331"},
          {"2024-04-30-fr3/GX017312", "00:00:00.167", "00:00:56.245"},
          {"2024-04-30-fr3/GX017313", "00:00:00.100", :end},
          {"2024-04-30-fr3/GX017314", "00:00:00.033", "00:00:45.303"},
          {"2024-04-30-fr3/GX017315", "00:00:01.068", "00:00:23.252"},
          {"2024-04-30-fr3/GX017316", :start, :end},
          {"2024-04-30-fr3/GX017317", :start, "00:00:08.674"},
          {"2024-04-06-fr4/GX017041", "00:00:21.417", "00:00:35.695"},
          {"2024-04-06-fr4/GX017042", :start, "00:00:16.780"},
          {"2024-05-18-vr10/GX017611", :start, "00:00:06.639"},
          {"2024-05-18-vr10/GX017612", "00:00:00.067", "00:00:12.744"},
          {"2024-05-18-vr10/GX017613", "00:00:00.033", "00:00:35.869"},
          {"2021-05-02-gruener-ring-sued-uhrzeigersinn/GX011460.MP4_time_lapse.mkv",
           "00:00:28.795", "00:01:01.828"},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012366", "00:01:01.962", "00:01:12.973"},
          {"2021-12-23-veddel-und-so/GX013063", "00:00:21.755", "00:01:27.154"}
        ]
      }
    ]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>In Arbeit.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
