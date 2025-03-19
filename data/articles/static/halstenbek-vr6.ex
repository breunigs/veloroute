defmodule Data.Article.Static.HalstenbekVR6 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "halstenbek-vr6"
  def display_id(), do: "6"
  def title(), do: "Halstenbek: Veloroute 6 (ADFC Vorschlag)"
  def color(), do: RouteColors.bezirk_normal()

  def summary(),
    do: "Die Veloroute 6 verbindet das Zentrum Halstenbeks mit Schenefeld"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :forward,
        from: "Halstenbek Zentrum",
        to: "Domänenweg-West",
        parent_ref: __MODULE__,
        text: "Halstenbek: Hauptstraße → Kameruner Weg",
        historic: %{
          "1b7032c52199e529a22bf016e8d5dec5" => ~d[2025-03]
        },
        videos: [
          {"2025-03-18-halsten/GX018462", "00:00:07.060", :end},
          {"2025-03-18-halsten/GX018463", :start, "00:00:58.307"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :backward,
        from: "Domänenweg-West",
        to: "Halstenbek Zentrum",
        parent_ref: __MODULE__,
        text: "Halstenbek: Kameruner Weg → Hauptstraße",
        historic: %{
          "0450653dac4ccdd5e84d1dd11152b88f" => ~d[2025-03]
        },
        videos: [
          {"2025-03-18-halsten/GX018456", "00:00:29.273", "00:02:14.613"}
        ]
      }
    ]

  def links(_assigns) do
    [
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
