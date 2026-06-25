defmodule Data.Article.Static.HalstenbekVR4 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "halstenbek-vr4"
  def display_id(), do: "4"
  def title(), do: "Halstenbek: Veloroute 4 (ADFC Vorschlag)"
  def color(), do: RouteColors.bezirk_normal()

  def summary(),
    do:
      "Die Veloroute 4 stellt den Anschluss vom Bickbargen zum Radnetz Hamburgs her. Sie führt nördlich der Bahn zu einer Bezirksroute in Eimsbüttel."

  def tags(), do: [id(), "halstenbek"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :forward,
        from: "Bickbargen",
        to: "Lohkampstraße",
        parent_ref: __MODULE__,
        text: "Halstenbek: Bickbargen → Lohkampstraße",
        historic: %{
          "d05b1c8c21d5a744f4f9d87ea3191e98" => ~d[2025-03]
        },
        videos: [
          {"2025-03-18-halsten/GX018470", "00:00:26.473", "00:00:57.033"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :backward,
        from: "Lohkampstraße",
        to: "Bickbargen",
        parent_ref: __MODULE__,
        text: "Halstenbek: Lohkampstraße → Bickbargen",
        historic: %{
          "db548d72281c29ed98afeac71c3247d5" => ~d[2025-03]
        },
        videos: [
          {"2025-03-18-halsten/GX018471", "00:01:09.460", "00:01:29.200"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643616"},
      {"Velorouten Vorschläge ADFC", ~d[2025-02],
       "https://www.adfc-halstenbek.de/2025/10/13/velorouten-fuer-halstenbek/"},
      {"Verkehrsentwicklungsplan Halstenbek", ~d[2021-10],
       "https://www.adfc-halstenbek.de/wp-content/uploads/2021/11/D211027_Projektbericht_final.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
