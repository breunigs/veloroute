defmodule Data.Article.Static.Radroute13 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-13"
  def display_id(), do: "13"
  def title(), do: "Radroute 13"
  def color(), do: RouteColors.red3()

  def summary(),
    do:
      "Die südliche Radroute 13 verbindet Eißendorf mit dem Harburger Bahnhof, und geht von dort in den Radschnellweg nach Lüneburg über."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "13",
        direction: :forward,
        from: "Eißendorf",
        to: "Seevetal",
        parent_ref: __MODULE__,
        text: "von Eißendorf Richtung Seevetal",
        historic: %{
          "b91966765c64d00c45185278b7a5a644" => ~d[2025-02]
        },
        videos: [
          {"2025-02-20-harburg/GX018187", "00:01:39.399", :end},
          {"2025-02-20-harburg/GX018188", :start, "00:01:06.894"},
          {"2025-02-20-harburg/GX018189", :start, :end},
          {"2025-02-20-harburg/GX018190", :start, :end},
          {"2025-02-20-harburg/GX018191", :start, :end},
          {"2025-02-20-harburg/GX018192", :start, :end},
          {"2025-02-20-harburg/GX018193", :start, :end},
          {"2025-02-20-harburg/GX018194", :start, :end},
          {"2025-02-20-harburg/GX018195", :start, "00:00:13.763"},
          {"2021-08-15-rsw-lueneburg/GX012675", "00:00:32.676", "00:02:22.113"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "13",
        direction: :backward,
        from: "Seevetal",
        to: "Eißendorf",
        parent_ref: __MODULE__,
        text: "aus Seevetal nach Eißendorf",
        historic: %{
          "363d12fc9f51879763d95bffbd22f812" => ~d[2025-02]
        },
        videos: [
          {"2022-08-11-rsw-luene-rev/GX014493", "00:00:40.699", "00:01:18.063",
           vf: "curves=lighter"},
          {"2022-08-11-rsw-luene-rev/GX014494", "00:00:11.810", "00:01:22.917",
           vf: "curves=lighter"},
          {"2025-02-20-harburg/GX018195", "00:00:53.493", :end},
          {"2025-02-20-harburg/GX018196", :start, :end},
          {"2025-02-20-harburg/GX018197", "00:00:00.100", "00:00:01.702"},
          {"2025-02-20-harburg/GX018198", :start, :end},
          {"2025-02-20-harburg/GX018199", :start, :end},
          {"2025-02-20-harburg/GX018200", :start, "00:00:04.037"},
          {"2025-02-20-harburg/GX018201", "00:00:00.200", "00:01:25.852", vf: "curves=lighter"}
        ]
      }
    ]

  def links(_assigns) do
    [{"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643639"}]
  end

  def text(assigns) do
    ~H"""
    <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-13</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.935232,53.446383,9.976751,53.469216" lon={9.945361} lat={53.457295} dir="forward" ref={@ref}>Eißendorf</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.957586,53.454169,9.98206,53.465344" lon={9.968376} lat={53.46084} dir="forward" ref={@ref}>TU-HH</.v></td>
      </tr>
      <tr>
        <td><.icon>FR7</.icon><.icon>FR6</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.974784,53.452865,9.991651,53.464261" lon={9.983259} lat={53.460028} dir="forward" ref={@ref}>Harburg</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon><.icon>radroute-4</.icon></td>
        <td><.graph icon={:bridge} ref={@ref}/></td>
        <td><.v bounds="9.984483,53.449107,9.998869,53.46112" lon={9.98856} lat={53.457071} dir="forward" ref={@ref}>Bahnhof Harburg</.v></td>
      </tr>
      <tr>
        <td><.icon name="rsw-lueneburg" bounds="10.010827,53.332163,10.240882,53.458995" lon={10.023245} lat={53.432159} dir="forward">RSW</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.994353,53.406962,10.075599,53.447821" lon={10.022132} lat={53.43295} dir="forward" ref={@ref}>Meckelfeld</.v></td>
      </tr>
    </table>

    <p>Radroute 13 verläuft in Ost-West Richtung und verbindet <.v bounds="9.935232,53.446383,9.976751,53.469216" lon={9.945361} lat={53.457295} dir="forward" ref={@ref}>Eißendorf</.v> mit dem <.v bounds="9.984483,53.449107,9.998869,53.46112" lon={9.98856} lat={53.457071} dir="forward" ref={@ref}>Harburger Bahnhof</.v>. Ab dort knickt sie nach Südosten ab und geht in die <.a name="rsw-lueneburg">Radroute Plus nach Lüneburg</.a> über.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>


    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich.</p>

    <h4>Meinung</h4>
    <p>Außer der <.v bounds="9.954613,53.454158,9.977888,53.466644" lon={9.95955} lat={53.460765} dir="forward" ref={@ref}>Denickestraße</.v> und dem <.v bounds="9.980394,53.457309,9.98886,53.461519" lon={9.982303} lat={53.460323} dir="forward" ref="radroute-13">Herbert-Wehner-Platz</.v> wurde die Route noch nicht für den Radverkehr hergerichtet. Entsprechend mäßig ist sie zu befahren.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
