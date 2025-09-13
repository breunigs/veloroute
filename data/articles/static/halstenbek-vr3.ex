defmodule Data.Article.Static.HalstenbekVR3 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "halstenbek-vr3"
  def display_id(), do: "3"
  def title(), do: "Halstenbek: Veloroute 3 (ADFC Vorschlag)"
  def color(), do: RouteColors.bezirk_normal()

  def summary(),
    do: "Die Veloroute 3 würde von Rellingen Kellerstraße zum Zentrum Krupunders führen"

  def tags(), do: [id(), "halstenbek"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :forward,
        from: "Kellerstraße",
        to: "Bickbargen",
        parent_ref: __MODULE__,
        text: "Halstenbek: Rellingen Kellerstraße → Bickbargen",
        historic: %{
          "033ce7d09d87db3baba2f346047cc409" => ~d[2025-03]
        },
        videos: [
          {"2025-03-18-halsten/GX018471", :start, "00:00:43.762"},
          {"2025-03-18-halsten/GX018470", "00:00:11.003", "00:00:28.033"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :backward,
        from: "Bickbargen",
        to: "Kellerstraße",
        parent_ref: __MODULE__,
        text: "Halstenbek: Bickbargen → Rellingen Kellerstraße",
        historic: %{
          "eede72a15a977968469837a172d39d08" => ~d[2025-03]
        },
        videos: [
          {"2025-03-18-halsten/GX018464", :start, "00:00:23.935"},
          {"2025-03-18-halsten/GX018470", "00:05:24.275", :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643615"},
      {"Velorouten Vorschläge ADFC", ~d[2025-02],
       "https://www.adfc-halstenbek.de/3035/03/11/velorouten-fuer-halstenbek/"},
      {"Verkehrsentwicklungsplan Halstenbek", ~d[2021-10],
       "https://www.halstenbek.de/Redaktion/user_upload/D_311037_Projektbericht_VEP.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
