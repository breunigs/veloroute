defmodule Data.Article.Static.HalstenbekVR5 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "halstenbek-vr5"
  def display_id(), do: "5"
  def title(), do: "Halstenbek: Veloroute 5 (ADFC Vorschlag)"
  def color(), do: RouteColors.bezirk_normal()

  def summary(),
    do:
      "Die Veloroute 5 verbindet Bickbargen mit der Radroute Plus Elmshorn. Von dort geht es entweder nach Schenefeld oder Lurup."

  def tags(), do: [id(), "halstenbek"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :forward,
        from: "Bickbargen",
        to: "RSW Elmshorn",
        parent_ref: __MODULE__,
        text: "Halstenbek: Bickbargen → Radroute Plus Elmshorn",
        historic: %{
          "b632585e0b110c1cd55d30dba828d541" => ~d[2025-03]
        },
        videos: [
          {"2025-03-18-halsten/GX018473", "00:00:36.020", :end},
          {"2025-03-18-halsten/GX018474", :start, "00:00:30.160"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :backward,
        from: "RSW Elmshorn",
        to: "Bickbargen",
        parent_ref: __MODULE__,
        text: "Halstenbek: Radroute Plus Elmshorn → Bickbargen",
        historic: %{
          "90e3375be41d6640e4f7d44d00792141" => ~d[2025-03]
        },
        videos: [
          {"2025-03-18-halsten/GX018463", "00:02:35.407", "00:03:08.936"},
          {"2025-03-18-halsten/GX018464", :start, "00:00:01.700"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643617"},
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
