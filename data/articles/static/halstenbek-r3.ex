defmodule Data.Article.Static.HalstenbekR3 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "halstenbek-r3"
  def display_id(), do: "3"
  def title(), do: "Halstenbek Veloroute 3"
  def color(), do: RouteColors.grey()

  def summary(),
    do:
      "Die Veloroute 3 verläuft in Nord-Süd Richtung und stellt eine Verbindung nach Schenefeld her."

  def tags(), do: [id()]

  def tracks(),
    do: [
      # %Video.Track{
      #   renderer: 6,
      #   group: "x",
      #   direction: :forward,
      #   from: "Neuer Luruper Weg",
      #   to: "Domänenweg-West",
      #   parent_ref: __MODULE__,
      #   text: "Blocksberg (Schenefeld) → Nienhöfener Straße (Waldenau-Datum)",
      #   historic: %{
      #     "" => ~d[2025-03]
      #   },
      #   videos: [       ]
      # }
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
