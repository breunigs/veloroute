defmodule Data.Article.Static.Radroute14 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-14"
  def display_name(), do: "14"
  def title(), do: "Radroute 14"
  def color(), do: "#833e5d"

  def summary(), do: "Die Radroute verbindet den Altonaer Balkon mit der Außenalster am Fährdamm."

  def tags(), do: [id()]

  def tracks(),
    do: [
      # %Video.Track{
      #   renderer: 6,
      #   group: "",
      #   direction: :forward,
      #   from: "Palmaille",
      #   to: "Fährdamm",
      #   parent_ref: __MODULE__,
      #   text: "vom Altonaer Balkon zum Fährdamm (Außenalster)",
      #   historic: %{},
      #   videos: [
      #     #

      #     {"2023-11-25-random/GX016709", "00:01:09.536", "00:01:59.963"},
      #     {"2023-11-25-random/GX016710", "00:00:00.534", "00:00:17.214"},
      #     {"2023-11-25-random/GX016711", "00:00:00.033", "00:00:09.741"},
      #     {"2023-11-25-random/GX016712", "00:00:00.033", "00:00:14.111"},
      #     {"2023-11-25-random/GX016713", :start, "00:00:16.113"},
      #     {"2023-11-25-random/GX016714", "00:00:00.033", "00:00:08.840"},
      #     {"2024-03-14-fr12-fr1a/GX016861", "00:00:03.269", :end},
      #     {"2024-03-14-fr12-fr1a/GX016862", :start, :FIXME},
      #     {"2025-02-06-whburg/GX017886", :FIXME, :end},
      #     {"2025-02-06-whburg/GX017887", :start, :end}
      #   ]
      # }
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
