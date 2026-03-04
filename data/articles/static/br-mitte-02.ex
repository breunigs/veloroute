defmodule Data.Article.Static.BrMitte02 do
  use Article.Static

  def id(), do: "br-mitte-02"
  def display_id(), do: "M2"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Mitte – M2 – St. Pauli Route"

  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute M2 – St. Pauli Route im Bezirk Hamburg-Mitte verläuft entlang der Stresemannstraße und Budapester Straße."

  def tags(), do: [id(), display_id(), "br-mitte"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "m2",
        direction: :forward,
        from: "Juliusstraße",
        to: "Millerntorplatz",
        parent_ref: __MODULE__,
        text: "von der Sternbrücke zum Millerntorplatz",
        historic: %{"e91e7a65fed8a0750f16f8b2568a96d6" => ~d[2025-09]},
        videos: [
          {"2025-09-20-random/GX018633", "00:00:02.302", :end}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "m2",
        direction: :backward,
        from: "Millerntorplatz",
        to: "Juliusstraße",
        parent_ref: __MODULE__,
        text: "vom Millerntorplatz zur Sternbrücke",
        historic: %{"88d90c8845776d0f04a1accc6ce67927" => ~d[2025-09]},
        videos: [
          {"2025-09-20-random/GX018667", "00:00:48.920", "00:01:24.695"},
          {"2025-09-20-random/GX018668", :start, "00:00:14.908"},
          {"2025-09-20-random/GX018669", "00:00:00.067", :end}
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
    <h3>Bezirksroute HH-Mitte – M2 – St. Pauli Route <.icon>M2</.icon></h3>
    <p>Die Bezirksroute mit dem offiziellen Namen „BR02 – St. Pauli Route“ folgt der Bundesstraße B4 von der <.v bounds="9.956726,53.557664,9.963508,53.562356" lon={9.959568} lat={53.560056} dir="forward" ref={@ref}>Juliusstraße</.v> bis zum <.v bounds="9.964319,53.547868,9.975532,53.555485" lon={9.96906} lat={53.550905} dir="forward" ref={@ref}>Millerntorplatz</.v>. Sie ist damit fast deckungsgleich mit der <.a ref={Radroute15}>Radroute 15</.a>.</p>

    <p>Sie soll die Besuchermagneten <.v bounds="9.962546,53.552277,9.971863,53.557982" lon={9.964484} lat={53.554628} dir="forward" ref={@ref}>Millerntorstadion</.v>, <.v bounds="9.963903,53.550845,9.975012,53.55904" lon={9.969276} lat={53.551276} dir="backward" ref={@ref}>Heiligengeistfeld</.v> und <.v bounds="9.961171,53.556355,9.970537,53.564657" lon={9.964293} lat={53.557498} dir="backward" ref={@ref}>Sternschanze</.v> anbinden. Als Querverbindung ist sie für den Stadtteil auch selbst wichtig und stellt eine Anbindung an Atlonas Bezirksrouten her.</p>

    <%= Data.Article.Shared.bezirksroute(:mitte) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
