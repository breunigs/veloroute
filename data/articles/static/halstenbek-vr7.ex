defmodule Data.Article.Static.HalstenbekVR7 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "halstenbek-vr7"
  def display_id(), do: "7"
  def title(), do: "Halstenbek: Veloroute 7 (ADFC Vorschlag)"
  def color(), do: RouteColors.bezirk_normal()

  def summary(),
    do: "Die Veloroute 7 verbindet Halstenbeks Zentrum mit Waldenau-Datum"

  def tags(), do: [id(), "halstenbek"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :forward,
        from: "Halstenbek Zentrum",
        to: "Nienhöfener Straße",
        parent_ref: __MODULE__,
        text: "Halstenbek: Hauptstraße → Waldenau-Datum",
        historic: %{
          "968dacbe39c277a4123ff114206b7f89" => ~d[2025-03]
        },
        videos: [
          {"2025-03-18-halsten/GX018456", "00:02:10.353", "00:02:18.654"},
          {"2025-03-18-halsten/GX018459", "00:00:09.060", :end},
          {"2025-03-18-halsten/GX018460", :start, "00:01:48.693"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :backward,
        from: "Nienhöfener Straße",
        to: "Halstenbek Zentrum",
        parent_ref: __MODULE__,
        text: "Halstenbek: Waldenau-Datum → Hauptstraße",
        historic: %{
          "653e6dd481516ef4e2591072f3807120" => ~d[2025-03]
        },
        videos: [
          {"2025-03-18-halsten/GX018461", "00:00:06.020", :end},
          {"2025-03-18-halsten/GX018462", :start, "00:00:10.300"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643621"},
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
