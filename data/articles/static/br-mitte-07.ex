defmodule Data.Article.Static.BrMitte07 do
  use Article.Static

  def id(), do: "br-mitte-07"
  def display_id(), do: "M7"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Mitte – M7 – Horn-Billstedt Route"

  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute M7 – Horn-Billstedt Route im Bezirk Hamburg-Mitte verbindet die genannten Stadtteile etwas weiter nördlich als Radroute 8."

  def tags(), do: [id(), display_id(), "br-mitte"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "m2",
        direction: :forward,
        from: "Derbyweg",
        to: "Kandinskyallee",
        parent_ref: __MODULE__,
        text: "Richtung Mümmelmannsberg",
        historic: %{"b2191dfada5cf54941963480fd3ecc21" => ~d[2026-03]},
        videos: [
          {"2026-03-29-mitte-ost/GX018901", "00:00:28.533", :end},
          {"2026-03-29-mitte-ost/GX018902", :start, "00:00:50.800"},
          {"2026-03-29-mitte-ost/GX018903", :start, :end},
          {"2026-03-29-mitte-ost/GX018904", :start, "00:02:17.626"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "m2",
        direction: :backward,
        from: "Kandinskyallee",
        to: "Derbyweg",
        parent_ref: __MODULE__,
        text: "Richtung Marienthal",
        historic: %{"4276b84c6fc6301be26c103cfacd748a" => ~d[2026-03]},
        videos: [
          {"2026-03-29-mitte-ost/GX018904", "00:02:20.226", "00:05:04.035"},
          {"2026-03-29-mitte-ost/GX018905", :start, :end},
          {"2026-03-29-mitte-ost/GX018906", :start, :end},
          {"2026-03-29-mitte-ost/GX018907", :start, "00:00:45.679"},
          {"2026-03-29-mitte-ost/GX018912", "00:02:11.999", "00:02:25.312"},
          {"2026-03-29-mitte-ost/GX018911", "00:00:01.969", "00:00:25.853"}
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
    <h3>Bezirksroute HH-Mitte – M7 – Horn-Billstedt Route <.icon>M7</.icon></h3>
    <p>Die Bezirksroute mit dem offiziellen Namen „BR07 – Horn-Billstedt Route“ verbindet die beiden genannten Stadtteile. Sie verläuft dabei weiter nördlich als die parallele <.a ref={Radroute8}>Radroute 8</.a>.</p>

    <%= Data.Article.Shared.bezirksroute(:mitte) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
