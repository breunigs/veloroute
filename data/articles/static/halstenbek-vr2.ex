defmodule Data.Article.Static.HalstenbekVR2 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "halstenbek-vr2"
  def display_id(), do: "2"
  def title(), do: "Halstenbek: Veloroute 2 (ADFC Vorschlag)"
  def color(), do: RouteColors.bezirk_normal()

  def summary(),
    do: "Die Veloroute 2 würde Halstenbeks Hauptstraße mit Pinnebergs Veloroute 2 verbinden"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :forward,
        from: "Halstenbek Zentrum",
        to: "Halstenbek",
        parent_ref: __MODULE__,
        text: "Halstenbek: Hauptstraße → Pinneberg",
        historic: %{
          "14b58d62d45371749d6f4bfe16c1e8c8" => ~d[2025-03]
        },
        videos: [
          {"2025-03-18-halsten/GX018456", "00:02:10.053", :end},
          {"2025-03-18-halsten/GX018457", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :backward,
        from: "Halstenbek",
        to: "Halstenbek Zentrum",
        parent_ref: __MODULE__,
        text: "Halstenbek: Pinneberg → Hauptstraße",
        historic: %{
          "22e345a6d9f40e097275e1b14c99fe28" => ~d[2025-03]
        },
        videos: [
          {"2025-03-18-halsten/GX018458", :start, :end},
          {"2025-03-18-halsten/GX018459", "00:00:03.237", "00:00:06.828"},
          {"2025-03-18-halsten/GX018462", "00:00:03.648", "00:00:10.300"}
        ]
      }
    ]

  def links(_assigns) do
    [
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
