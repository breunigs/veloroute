defmodule Data.Article.Static.BrNordN2 do
  use Article.Static

  def id(), do: "br-nord-n2"
  def display_id(), do: "N2"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N2 – Alster ↔ Airport"

  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N2 – Alster ↔ Airport“ im Bezirk Hamburg-Nord führt von Groß Borstel über zwei Äste zur Hoheluftbrücke bzw. Heilwigbrücke"

  def tags(), do: [id(), display_id(), "br-nord"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "n2-main",
        direction: :forward,
        from: "Hoheluftbrücke",
        to: "Papenreye",
        parent_ref: __MODULE__,
        text: "von der Hoheluftbrücke zur Papenreye",
        videos: [
          {"2023-10-17-brnord/GX016310", :start, :end},
          {"2023-10-17-brnord/GX016311", :start, :end},
          {"2023-10-17-brnord/GX016312", :start, "00:00:13.113"},
          {"2023-10-18-brnord/GX016370", "00:00:10.410", :end},
          {"2023-10-18-brnord/GX016371", :start, :end},
          {"2023-10-18-brnord/GX016372", :start, :end},
          {"2023-10-18-brnord/GX016373", :start, :end},
          {"2023-10-18-brnord/GX016374", :start, :end},
          {"2023-10-18-brnord/GX016375", :start, :end},
          {"2023-10-18-brnord/GX016376", :start, "00:00:01.335"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n2-main",
        direction: :backward,
        from: "Papenreye",
        to: "Hoheluftbrücke",
        parent_ref: __MODULE__,
        text: "von der Papenreye zur Hoheluftbrücke",
        videos: [
          {"2023-10-18-brnord/GX016378", :start, :end},
          {"2023-10-18-brnord/GX016379", :start, "00:00:38.739"},
          {"2023-10-18-brnord/GX016380", :start, :end},
          {"2023-10-18-brnord/GX016381", :start, :end},
          {"2023-10-18-brnord/GX016382", :start, :end},
          {"2023-10-18-brnord/GX016383", :start, :end},
          {"2023-10-18-brnord/GX016384", :start, "00:00:08.909"},
          {"2023-10-18-brnord/GX016388", "00:00:09.526", "00:01:03.897"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n2-leg",
        direction: :forward,
        from: "Heilwigbrücke",
        to: "Kümmellstraße",
        parent_ref: __MODULE__,
        text: "von der Heilwigbrücke zur Kümmellstraße",
        videos: [
          {"2023-10-18-brnord/GX016387", "00:00:27.022", :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n2-leg",
        direction: :backward,
        from: "Kümmellstraße",
        to: "Heilwigbrücke",
        parent_ref: __MODULE__,
        text: "von der Kümmellstraße zur Heilwigbrücke",
        videos: [
          {"2023-10-18-brnord/GX016385", "00:00:01.368", :end},
          {"2023-10-18-brnord/GX016386", :start, :end},
          {"2023-10-18-brnord/GX016387", :start, "00:00:18.682"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Entwurf Radverkehrskonzept", "Oktober 2023",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1013264"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Bezirksroute HH-Nord N2 – Alster ↔ Airport <.icon>N2</.icon></h3>
    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N2 – Alster ↔ Airport“ künftig verlaufen könnte.</p>

    <p>Die zwei südlichen Äste starten an der <.v bounds="9.965009,53.575781,10.001209,53.591971" lon={9.976231} lat={53.578959} dir="forward" ref="br-nord-n2">Hoheluftbrücke</.v> bzw. <.v bounds="9.965009,53.575781,10.001209,53.591971" lon={9.994171} lat={53.584747} dir="forward" ref="br-eimsbuettel-rotherbaum">Heilwigbrücke</.v> um kommen kurz vorm <.v bounds="9.97007,53.585677,10.000833,53.601976" lon={9.988103} lat={53.591379} dir="forward" ref="br-nord-n2">Eppendorfer Marktplatz</.v> zusammen. Über die <.v bounds="9.945288,53.591356,10.005616,53.627726" lon={9.97789} lat={53.607729} dir="forward" ref="br-nord-n2">Borsteler Chaussee</.v> führt die Route dann Richtung Flughafen, bzw. an die Kleingärten davor.</p>

    <h4>Speziell für diese Route</h4>
    <p>Für den Ast ab <.v bounds="9.965009,53.575781,10.001209,53.591971" lon={9.994171} lat={53.584747} dir="forward" ref="br-eimsbuettel-rotherbaum">Heilwigbrücke</.v> werden Fahrradstraßen vorgeschlagen. Das bereits umgebaute Stück am <.v bounds="9.988831,53.586888,9.99326,53.589877" lon={9.991631} lat={53.5887} dir="forward" ref="br-nord-n2">Loogeplatz</.v> bliebe unverändert. Für den anderen Ast ab <.v bounds="9.965009,53.575781,10.001209,53.591971" lon={9.976231} lat={53.578959} dir="forward" ref="br-nord-n2">Hoheluftbrücke</.v> bis <.v bounds="9.97007,53.585677,10.000833,53.601976" lon={9.988103} lat={53.591379} dir="forward" ref="br-nord-n2">Eppendorfer Marktplatz</.v> sind <.ref>Radfahrstreifen</.ref> oder <.ref>Schutzstreifen</.ref> vorgesehen.</p>

    <p>Für den <.v bounds="9.97007,53.585677,10.000833,53.601976" lon={9.988103} lat={53.591379} dir="forward" ref="br-nord-n2">Eppendorfer Marktplatz</.v> gibt es <.a name="2023-10-28-eppendorfer-marktplatz">bereits detaillierte Pläne</.a>.</p>

    <p>Bis zur <.v bounds="9.982127,53.60011,9.990808,53.606446" lon={9.987479} lat={53.602784} dir="forward" ref="br-nord-n2" highlight="Rosenbrook,Alsterkrugchaussee">B5</.v> sind Fahrradstraßen geplant. Die Kreuzung selbst soll natürlich auch überarbeitet werden, damit sie leichter gequert werden kann. Für die <.v bounds="9.945288,53.591356,10.005616,53.627726" lon={9.97789} lat={53.607729} dir="forward" ref="br-nord-n2">Borsteler Chaussee</.v> werden vom KFZ-Verkehr getrennte Wege vorgeschlagen, also etwa <.ref>Protected-Bike-Lanes</.ref> oder <.ref>Hochbordradwege</.ref>.</p>

    <%= Data.Article.Shared.bezirksroute(:nord) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
