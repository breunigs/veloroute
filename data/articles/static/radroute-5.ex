defmodule Data.Article.Static.Radroute5 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-5"
  def display_name(), do: "5"
  def title(), do: "Radroute 5"
  def color(), do: "#833e5d"

  def summary(),
    do: "FIXME"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "5",
        direction: :backward,
        from: "Duvenstedt",
        to: "Mundsburger Brücke",
        parent_ref: __MODULE__,
        text: "von Duvenstedt zur Mundsburger Brücke",
        historic: %{},
        videos: [
          {"2024-06-06-vr5/GX017664", "00:03:32.879", "00:07:02.138"},
          {"2024-06-06-vr5/GX017665", :start, "00:00:02.669"},
          {"2024-06-06-vr5/GX017666", :start, :end},
          {"2024-06-06-vr5/GX017667", :start, "00:02:41.363"},
          {"2024-06-06-vr5/GX017668", :start, :end},
          {"2024-06-06-vr5/GX017669", "00:00:00.200", "00:00:46.504"},
          {"2024-06-06-vr5/GX017670", :start, "00:00:04.403"},
          {"2024-06-06-vr5/GX017671", :start, "00:00:17.747"},
          {"2024-06-06-vr5/GX017672", :start, "00:00:20.150"},
          {"2024-06-06-vr5/GX017673", :start, "00:00:32.193"},
          {"2024-06-06-vr5/GX017674", "00:00:00.033", "00:00:40.433"},
          {"2024-06-06-vr5/GX017675", "00:00:00.067", "00:00:06.806"},
          {"2024-06-06-vr5/GX017676", "00:00:00.033", "00:00:27.461"}
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
