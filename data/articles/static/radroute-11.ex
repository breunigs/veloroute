defmodule Data.Article.Static.Radroute11 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-11"
  def display_id(), do: "11"
  def title(), do: "Radroute 11"
  def color(), do: RouteColors.blue1()

  def summary(),
    do:
      "Radroute 11 verläuft in Nord-Süd-Richtung und verbindet den Hafen bzw. das Reiherstiegviertel mit Heimfeld."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "11main",
        direction: :forward,
        from: "Argentinienbrücke",
        to: "Stader Straße",
        parent_ref: __MODULE__,
        text: "von der Argentinienbrücke zur Stader Straße",
        historic: %{
          "157efef2dde742b7550eaac881bb2845" => ~d[2025-02]
        },
        videos: [
          {"2025-02-20-harburg/GX018182", "00:00:01.034", :end},
          {"2025-02-20-harburg/GX018183", :start, :end},
          {"2025-02-20-harburg/GX018184", :start, "00:00:05.434"},
          {"2025-02-06-whburg/GX017891", "00:00:05.488", :end},
          {"2025-02-06-whburg/GX017892", :start, "00:00:07.939"},
          {"2025-02-20-harburg/GX018184", "00:00:52.883", :end, vf: "curves=lighter"},
          {"2025-02-20-harburg/GX018185", :start, :end, vf: "curves=lighter"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "11main",
        direction: :backward,
        from: "Stader Straße",
        to: "Argentinienbrücke",
        parent_ref: __MODULE__,
        text: "von der Stader Straße zur Argentinienbrücke",
        historic: %{
          "838222cd3013cf903c829f52c8796563" => ~d[2025-02]
        },
        videos: [
          {"2025-02-20-harburg/GX018202", :start, "00:00:22.487", vf: "curves=lighter"},
          {"2025-02-20-harburg/GX018203", :start, "00:00:54.081", vf: "curves=lighter"},
          {"2025-02-20-harburg/GX018204", :start, "00:03:03.116", vf: "curves=lighter"},
          {"2025-02-06-whburg/GX017905", "00:00:19.853", "00:00:21.634"},
          {"2025-02-06-whburg/GX017906", :start, :end},
          {"2025-02-06-whburg/GX017907", :start, :end},
          {"2025-02-20-harburg/GX018182", :start, "00:00:01.034"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "11side",
        direction: :forward,
        from: "Reiherstieg-Hauptdeich",
        to: "Neuhöfer Damm",
        parent_ref: __MODULE__,
        text: "vom Reiherstieg-Hauptdeich zum Neuhöfer Damm",
        historic: %{
          "5be69ed0c430df188827cee8324f90cd" => ~d[2025-02]
        },
        videos: [
          {"2025-02-06-whburg/GX017904", "00:01:24.980", :end},
          {"2025-02-06-whburg/GX017905", :start, "00:00:20.187"},
          {"2025-02-20-harburg/GX018204", "00:03:02.983", :end},
          {"2025-02-20-harburg/GX018205", :start, "00:00:01.969"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "11side",
        direction: :backward,
        from: "Neuhöfer Damm",
        to: "Reiherstieg-Hauptdeich",
        parent_ref: __MODULE__,
        text: "vom Neuhöfer Damm zum Reiherstieg-Hauptdeich",
        historic: %{
          "bab37dba00d021d0a2d0078888883d4f" => ~d[2025-02]
        },
        videos: [
          {"2025-02-06-whburg/GX017892", "00:00:09.343", :end},
          {"2025-02-06-whburg/GX017893", :start, "00:00:01.568"},
          {"2025-02-06-whburg/GX017894", :start, :end},
          {"2025-02-06-whburg/GX017895", :start, "00:00:34.480"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Ride With GPS Routenplaner: Argentinienbrücke ↔ Stader Straße",
       "https://ridewithgps.com/routes/52643635"},
      {"Ride With GPS Routenplaner: Reiherstieg-Hauptdeich ↔ Neuhöfer Damm",
       "https://ridewithgps.com/routes/52643636"},
      {"Präsentation zum Planungsstand", ~d[2025-04],
       "https://sitzungsdienst-harburg.hamburg.de/bi/vo020.asp?VOLFDNR=1012691"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-11</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon>FR14</.icon><.icon>radroute-4</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.966115,53.522144,9.980881,53.532432" lon={9.973314} lat={53.528108} dir="forward" ref={@ref}>Hafen</.v> / <.v bounds="9.966539,53.515753,9.987542,53.526346" lon={9.981142} lat={53.51967} dir="forward" ref={@ref}>Reiherstiegviertel</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td><.v bounds="9.95987,53.497301,9.978187,53.509016" lon={9.965964} lat={53.504693} dir="forward" ref={@ref}>Rethedamm</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td><.v bounds="9.93864,53.487571,9.960922,53.499161" lon={9.951641} lat={53.495008} dir="forward" ref={@ref}>Kattwykbrücke</.v></td>
      </tr>
      <tr>
        <td><.icon>FR14</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.927699,53.482381,9.946727,53.494425" lon={9.941894} lat={53.489746} dir="forward" ref={@ref}>Moorburg</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon><.icon>radroute-10</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.923599,53.466003,9.94906,53.484345" lon={9.937738} lat={53.473835} dir="forward" ref={@ref}>Bostelbek</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.931455,53.462277,9.950019,53.476169" lon={9.938727} lat={53.471273} dir="forward" ref={@ref}>Stader Straße</.v></td>
      </tr>
    </table>

    <p>Radroute 11 stellt eine weiter westliche verlaufende Route zur <.a name="radroute-4">Radroute 4</.a> dar. Sie führt vom <.v bounds="9.966115,53.522144,9.980881,53.532432" lon={9.973314} lat={53.528108} dir="forward" ref={@ref}>Hafen („Argentinienknoten“)</.v> bzw. <.v bounds="9.966539,53.515753,9.987542,53.526346" lon={9.981142} lat={53.51967} dir="forward" ref={@ref}>Reiherstiegviertel</.v> nach Süden über die Kattwykbrücke. Dort findet sie Anschluss an die <.a name="radroute-10">Radroute 10</.a> für die weitere Fahrt in Richtung Westen.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Meist asphaltiert, seltener auch Betonpflaster. Wegen der zwei beweglichen Brücken können unerwartet lange Standzeiten vorkommen – allerdings passiert das nur selten.</p>

    <h4>Meinung</h4>
    <p>Wer aus dem Südwesten Richtung Innenstadt will, findet hier eine gut befahrbare Alternative. Wegen der seltenen Einmündungen und Abzweigungen sind auch höhere Geschwindigkeiten über lange Strecken kein Problem. Allerdings: es ist ein Industriegebiet. An Wochentagen ist es wegen der vielen LKW laut, und in den Nachtstunden ist tote Hose.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
