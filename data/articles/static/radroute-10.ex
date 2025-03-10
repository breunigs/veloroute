defmodule Data.Article.Static.Radroute10 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-10"
  def display_id(), do: "10"
  def title(), do: "Radroute 10"
  def color(), do: RouteColors.red4()

  def summary(),
    do:
      "Radroute 10 verbindet Harburg mit Neu Wulmstorf und orientiert sich an der Niederelbebahn."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "10",
        direction: :forward,
        from: "Neu Wulmstorf",
        via: ["Neue Straße"],
        to: "Alte Harburger Elbbrücke",
        parent_ref: __MODULE__,
        text: "von Neu Wulmstorf nach Wilhelmsburg",
        historic: %{
          "ecdf0d7d74a0ee08c1a10658c3d56911" => ~d[2025-02]
        },
        videos: [
          {"2022-08-09-stade-rev/GX024460", "00:00:19.349", "00:02:43.297"},
          {"2024-05-18-vr10/GX017621", "00:02:11.005", "00:02:56.543"},
          {"2025-02-12-west/GX018038", "00:06:19.279", "00:06:42.102"},
          {"2024-05-18-vr10/GX017622", "00:00:18.018", "00:01:03.751"},
          {"2024-05-18-vr10/GX017623", :start, :end},
          {"2024-05-18-vr10/GX017624", :start, :end},
          {"2024-05-18-vr10/GX017625", :start, "00:01:21.632"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "10",
        direction: :backward,
        from: "Alte Harburger Elbbrücke",
        via: ["Seehafenstraße"],
        to: "Neu Wulmstorf",
        parent_ref: __MODULE__,
        text: "von Wilhelmsburg nach Neu Wulmstorf",
        historic: %{
          "70bd69d9989b09fb6317ba885bcf7f2e" => ~d[2025-02]
        },
        end_action: %{
          action: :play,
          route: Data.Article.Static.RSWStade,
          group: "Radroute Plus Stade (via Neugraben)",
          direction: :backward
        },
        videos: [
          {"2024-05-18-vr10/GX017618", "00:00:50.150", "00:04:32.117"},
          {"2024-05-18-vr10/GX017619", "00:00:00.501", "00:01:13.574"},
          {"2025-02-12-west/GX018038", "00:06:48.108", "00:07:05.325"},
          {"2024-05-18-vr10/GX017621", "00:00:23.290", "00:01:32.859"},
          {"2021-09-18-rsw-stade/GX012840", "00:01:11.838", :end}
        ]
      }
    ]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-10</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon>radroute-23</.icon><.icon>radroute-4</.icon></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td><.v bounds="9.984841,53.461869,10.017726,53.483141" lon={9.994204} lat={53.472608} dir="forward" ref={@ref}>Alte Harburger Elbbrücke</.v></td>
      </tr>
      <tr>
        <td><.icon>FR6</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.967332,53.454832,10.00821,53.474953" lon={9.98583} lat={53.466525} dir="forward" ref={@ref}>Harburg</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.92063,53.459319,9.965277,53.478283" lon={9.935018} lat={53.471895} dir="forward" ref={@ref}>Heimfeld</.v> (Am Radeland)</td>
      </tr>
      <tr>
        <td><.icon>FR14</.icon><.icon>radroute-11</.icon></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td class="dim"><.v bounds="9.932798,53.469573,9.945825,53.47456" lon={9.93903} lat={53.47167} dir="forward" ref={@ref}>Moorburger Bogen</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td class="dim"><.v bounds="9.903731,53.465098,9.9389,53.477603" lon={9.921087} lat={53.472031} dir="forward" ref={@ref}>Autobahn A7</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.86742,53.465845,9.906586,53.481613" lon={9.886261} lat={53.473458} dir="forward" ref={@ref}>Hausbruch</.v></td>
      </tr>
      <tr>
        <td><.icon>FR13</.icon><.icon>radroute-18</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.824715,53.465913,9.866164,53.481205" lon={9.851662} lat={53.474477} dir="forward" ref={@ref}>Neugraben-Fischbek</.v></td>
      </tr>
      <tr>
        <td><.icon name="rsw-stade" bounds="9.749057,53.46445,9.882779,53.505862" lon={9.799003} lat={53.473906} dir="forward">RSW</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.771713,53.457348,9.834173,53.487252" lon={9.802201} lat={53.473866} dir="forward" ref={@ref}>Neu Wulmstorf</.v></td>
      </tr>
    </table>

    <p>Die Radroute 10 führt von <.v bounds="9.934425,53.452084,10.016485,53.479857" lon={9.985618} lat={53.466457} dir="forward" ref={@ref}>Harburg</.v> nach Westen bis <.v bounds="9.771713,53.457348,9.834173,53.487252" lon={9.802201} lat={53.473866} dir="forward" ref={@ref}>Neu Wulmstorf</.v>. Dort schließt sie nahtlos an die <.a name="rsw-stade">Radroute Plus</.a> nach <.v bounds="9.678675,53.456305,9.82665,53.484185" lon={9.79988} lat={53.473821} dir="forward" ref="rsw-stade">Stade</.v> an.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Bis nach <.v bounds="9.824715,53.465913,9.866164,53.481205" lon={9.851662} lat={53.474477} dir="forward" ref={@ref}>Neugraben</.v> sind die Wege befestigt und allwettertauglich. Überwiegend asphaltiert, teils gepflastert. Es gibt auch <.v bounds="9.987852,53.467916,9.999704,53.473175" lon={9.99358} lat={53.470852} dir="forward" ref={@ref}>kurze Abschnitte mit Kopfsteinpflaster</.v>. Der Abschnitt zwischen <.v bounds="9.828538,53.468798,9.861054,53.482127" lon={9.839578} lat={53.474785} dir="forward" ref={@ref}>Neugraben</.v> und <.v bounds="9.792702,53.465169,9.837359,53.482684" lon={9.800696} lat={53.473991} dir="forward" ref={@ref}>Neu Wulmstorf</.v> ist ein unbefestigter Feldweg, der bei Regen matschig wird.</p>

    <p>In Harburg fehlt eine <.a name="2021-12-18-bahnquerung-hafenbahn">Querungsmöglichkeit der Hafenbahn</.a>. Diese ist zwar geplant, aber wann diese zeitlich umgesetzt wird ist noch nicht absehbar (Stand: Frühjahr 2025). Eine Umfahrung ist zwar möglich, aber umständlich.</p>

    <p><.v bounds="9.906721,53.469337,9.928368,53.47739" lon={9.915974} lat={53.472669} dir="forward" ref={@ref}>Am Heykenaubrook</.v> ist die Querung der Bahnlinie nur durch sehr enge Drängelgitter möglich. Ein <.a name="2020-05-31-heykenaubrook">Umbau ist geplant</.a>. Bis dahin ist die Durchfahrt mit Lastenrädern oder mit Anhängern dort nicht möglich.</p>

    <h4>Meinung</h4>
    <p>Die Führung an der Niederelbebahn ist angenehmer als an der lauten <.m bounds="9.809713,53.454748,9.986148,53.478863">Cuxhavener Straße</.m>. Leider ist der Weg an der Bahn nicht durchgängig, sodass häufig Umwege notwendig sind. Das weiß die Stadt auch und arbeitet daran, die Führung direkter zu gestalten – aber das zieht sich.</p>

    <p>Schon heute kann man sich hervorragende Abschnitte wie um den <.v bounds="9.975328,53.462136,9.988648,53.469571" lon={9.983302} lat={53.466938} dir="forward" ref={@ref}>Kanalplatz</.v> herum oder am <.v bounds="9.856821,53.466322,9.91478,53.479082" lon={9.869421} lat={53.473599} dir="forward" ref={@ref}>Gleisstieg</.v> anschauen. Die hergerichteten Teile sind bisher aber recht kurz.</p>

    <p>Für die umständliche Führung über die <.v bounds="9.887071,53.466475,9.919758,53.478618" lon={9.900265} lat={53.471306} dir="forward" ref={@ref}>Cuxhavener Straße</.v> ist keine Verbesserung vorgesehen. Zumindest finden sich dazu bisher nichtmal Absichtserklärungen. Langfristig muss aber eine Lösung her, wenn die Route wirklich attraktiv werden soll.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
