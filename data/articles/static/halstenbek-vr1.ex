defmodule Data.Article.Static.HalstenbekVR1 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "halstenbek-vr1"
  def display_id(), do: "1"
  def title(), do: "Halstenbek: Veloroute 1 (ADFC Vorschlag)"
  def color(), do: RouteColors.bezirk_normal()

  def summary(),
    do:
      "Die Veloroute 1 würde die beiden Stadtzentren (Halstenbek und Krupunder) miteinander verbinden."

  def tags(), do: [id(), "halstenbek"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :forward,
        from: "Halstenbek Zentrum",
        to: "Bickbargen",
        parent_ref: __MODULE__,
        text: "Halstenbek: Hauptstraße → Bickbargen",
        historic: %{
          "3490a0cd67d1a071ef9dd6c9b43cb86b" => ~d[2025-03]
        },
        videos: [
          {"2025-03-18-halsten/GX018470", "00:03:51.113", "00:05:20.514"},
          {"2025-03-18-halsten/GX018470", "00:00:00.701", "00:00:28.033"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :backward,
        from: "Bickbargen",
        to: "Halstenbek Zentrum",
        parent_ref: __MODULE__,
        text: "Halstenbek: Bickbargen → Hauptstraße",
        historic: %{
          "ee2f92fcbd3b0c050c19e779f11882c0" => ~d[2025-03]
        },
        videos: [
          {"2025-03-18-halsten/GX018464", :start, :end},
          {"2025-03-18-halsten/GX018465", "00:00:00.367", "00:00:08.795"},
          {"2025-03-18-halsten/GX018472", "00:00:18.034", "00:01:27.208"},
          {"2025-03-18-halsten/GX018456", "00:01:57.766", "00:02:14.313"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643613"},
      {"Velorouten Vorschläge ADFC", ~d[2025-02],
       "https://www.adfc-halstenbek.de/2025/02/11/velorouten-fuer-halstenbek/"},
      {"Verkehrsentwicklungsplan Halstenbek", ~d[2021-10],
       "https://www.halstenbek.de/Redaktion/user_upload/D_211027_Projektbericht_VEP.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
