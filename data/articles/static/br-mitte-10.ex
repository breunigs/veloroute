defmodule Data.Article.Static.BrMitte10 do
  use Article.Static

  def id(), do: "br-mitte-10"
  def display_id(), do: "M10"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Mitte – M10 – Wilhelmsburg-Süd Route"

  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute M10 – Wilhelmsburg-Süd Route im Bezirk Hamburg-Mitte verläuft entlang der Neuenfelder Straße"

  def tags(), do: [id(), display_id(), "br-mitte"]

  def tracks(),
    do: [
      # TODO
      # %Video.Track{
      #   renderer: 6,
      #   group: "m2",
      #   direction: :forward,
      #   from: "Am Inselpark",
      #   to: "Kirchdorfer Straße",
      #   parent_ref: __MODULE__,
      #   text: "v",
      #   historic: %{"" => ~d[2026-]},
      #   videos: [
      #   ]
      # },
      %Video.Track{
        renderer: 6,
        group: "m2",
        direction: :backward,
        from: "Kirchdorfer Straße",
        to: "Am Inselpark",
        parent_ref: __MODULE__,
        text: "Neuenfelder Straße Richtung Inselpark",
        historic: %{"c54777e57140c5d2357ab635288a96d8" => ~d[2022-10]},
        videos: [
          {"2022-10-02-elbchausse-hafen-whburg/GX014811", "00:00:58.358", :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      # {"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643567"},
      {"Entwurf Radroutenkonzept", ~d[2025-09],
       "https://sitzungsdienst-hamburg-mitte.hamburg.de/bi/to010.asp?SILFDNR=1003205"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Bezirksroute HH-Mitte – M10 – Wilhelmsburg-Süd Route <.icon>M10</.icon></h3>
    <p>Die Bezirksroute mit dem offiziellen Namen „BR10 – Wilhelmsburg-Süd Route“ folgt der Neuenfelder Straße und verbindet die <.a ref={Radroute4}>Radroute 4</.a> im Westen mit der <.a ref={Radroute23}>Radroute 23</.a> im Osten.</p>

    <p>Sie erschließt große Arbeitgeber und Schulen und schafft eine Querverbindung innerhalb Wilhelmsburg.</p>

    <%= Data.Article.Shared.bezirksroute(:mitte) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
