defmodule Data.Article.Static.HalstenbekR2 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "halstenbek-r2"
  def display_id(), do: "2"
  def title(), do: "Halstenbek Veloroute 2"
  def color(), do: RouteColors.grey()

  def summary(),
    do:
      "Die Veloroute 2 „Schulroute“ verläuft nordöstlich der Bahnstrecke und verbindet viele Schulen in Halstenbek und Krupunder."

  def tags(), do: [id()]

  def tracks(),
    do: [
      # %Video.Track{
      #   renderer: 6,
      #   group: "x",
      #   direction: :forward,
      #   from: "Halstenbek",
      #   to: "Rotdornstieg",
      #   parent_ref: __MODULE__,
      #   text: "Thesdorfer Weg → Rotdornstieg",
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
