defmodule Data.Article.Static.RadrouteConceptA do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-concept-a"
  def display_id(), do: "?"
  def title(), do: "Neue Radroute (Konzept)"
  def color(), do: RouteColors.red3()

  def summary(),
    do:
      "Die Radroute im Konzeptstand verliefe entlang der Elbchaussee und den darauffolgenden Straßen. Ab Baumwall knickt die Route über die Speicherstadt ab und führt zum HBF."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :forward,
        from: "Blankenese",
        to: "Hauptbahnhof",
        parent_ref: __MODULE__,
        text: "von Blankenese zum Hauptbahnhof",
        historic: %{
          "5eec168615cbd129558e2e950e61c4e1" => ~d[2025-03]
        },
        videos: [
          {"2025-03-01-west/GX018361", :start, :end},
          {"2025-03-01-west/GX018362", :start, :end},
          {"2025-03-01-west/GX018363", :start, :end},
          {"2025-03-01-west/GX018364", :start, :end},
          {"2025-03-01-west/GX018365", :start, :end},
          {"2025-03-01-west/GX018366", :start, :end},
          {"2025-03-01-west/GX018367", :start, :end},
          {"2025-03-01-west/GX018368", :start, :end},
          {"2025-03-01-west/GX018369", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :backward,
        from: "Hauptbahnhof",
        to: "Blankenese",
        parent_ref: __MODULE__,
        text: "vom Hauptbahnhof nach Blankenese",
        historic: %{
          "b0024dacc319c67802c52123f35414f9" => ~d[2025-03]
        },
        videos: [
          {"2025-03-01-west/GX018370", "00:00:07.427", :end},
          {"2025-03-01-west/GX018371", :start, :end},
          {"2025-03-01-west/GX018372", :start, :end},
          {"2025-03-01-west/GX018373", :start, "00:00:43.735"},
          {"2025-03-01-west/GX018374", :start, :end},
          {"2025-03-01-west/GX018375", :start, "00:00:34.212"},
          {"2025-03-01-west/GX018357", "00:00:12.670", "00:02:34.401"},
          {"2025-03-01-west/GX018358", :start, :end},
          {"2025-03-01-west/GX018359", :start, "00:00:02.253"}
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
          <.icon>radroute-concept-a</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon>radroute-1</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.795432,53.522128,9.919726,53.581305" lon={9.823799} lat={53.559959} dir="forward" ref={@ref}>Blankenese</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.825695,53.520272,9.927902,53.576366" lon={9.840203} lat={53.551673} dir="forward" ref={@ref}>Nienstedten</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-18</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.858636,53.533376,9.968422,53.580842" lon={9.884549} lat={53.546639} dir="forward" ref={@ref}>Othmarschen</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.875762,53.533072,9.985548,53.580538" lon={9.919823} lat={53.546032} dir="forward" ref={@ref}>Ottensen</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-8</.icon><.icon>radroute-14</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.899022,53.53292,10.008808,53.580386" lon={9.939505} lat={53.546335} dir="forward" ref={@ref}>Altona-Altstadt</.v></td>
      </tr>
      <tr>
        <td><.icon>FR1</.icon><.icon>radroute-15</.icon><.icon>radroute-4</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.912058,53.533224,10.021844,53.58069" lon={9.957908} lat={53.54588} dir="forward" ref={@ref}>St. Pauli</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.926372,53.533832,10.036157,53.581298" lon={9.968387} lat={53.546082} dir="forward" ref={@ref}>Neustadt</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-3</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.926372,53.533832,10.036157,53.581298" lon={9.987785} lat={53.542745} dir="forward" ref={@ref}>HafenCity / Speicherstadt</.v></td>
      </tr>
      <tr>
        <td><.icon>FR6</.icon><.icon>FR5</.icon><.icon>radroute-7</.icon><.icon>radroute-2</.icon><.icon>radroute-1</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.926372,53.533832,10.036157,53.581298" lon={10.007183} lat={53.549494} dir="forward" ref={@ref}>Hauptbahnhof</.v></td>
      </tr>
    </table>

    <p>Die geplante Route soll einmal den elbnahen Hauptstraßen folgen. Im Westen ist dies die <.v bounds="9.821954,53.542012,9.861394,53.566781" lon={9.825227} lat={53.559125} dir="forward" ref={@ref}>Elbchaussee</.v>, im Zentrum geht's über den <.v bounds="9.930762,53.539543,9.979857,53.559023" lon={9.955073} lat={53.54549} dir="forward" ref={@ref} highlight="St. Pauli Fischmarkt">Fischmarkt</.v> bis zum <.v bounds="9.961422,53.541538,9.986376,53.549133" lon={9.980732} lat={53.544063} dir="forward" ref={@ref}>Baumwall</.v>. Dort knickt die Route in die <.v bounds="9.980335,53.539565,10.01299,53.550795" lon={9.989977} lat={53.542978} dir="forward" ref={@ref}>Speicherstadt</.v> ab und führt von dort zum <.v bounds="9.996148,53.54233,10.01899,53.554501" lon={10.006433} lat={53.551064} dir="forward" ref={@ref}>Hauptbahnhof</.v>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert, allerdings dennoch leicht zu finden. Man folgt im Wesentlichen dem Straßenverlauf und biegt außer am Baumwall nie ab.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Bis Altona fährt man auf asphaltierten Radwegen oder zusammen mit den KFZ auf einer Spur. Ab etwa Altona hat man meist die Wahl weiter auf der <.ref>Fahrbahn</.ref> zu bleiben oder auf gepflasterte Radwege zu wechseln.</p>

    <h4>Meinung</h4>
    <p>Ausgebaut wäre die Route sowohl direkt, als auch einfach zu verstehen. Leider hat der Platz nicht überall für eigene Radwege gereicht, was durch Unfähige im Auto zum Problem wird. Zudem sind in Altona und St. Pauli noch Lücken, wo Radwege im Nichts beginnen oder enden. Wer auf andere Routen ausweichen kann, sollte dies tun.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
