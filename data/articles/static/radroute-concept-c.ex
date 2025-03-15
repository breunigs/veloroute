defmodule Data.Article.Static.RadrouteConceptC do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-concept-c"
  def display_id(), do: "?"
  def title(), do: "Neue Radroute (Konzept)"
  def color(), do: RouteColors.purple1()

  def summary(),
    do:
      "Die Radroute im Konzeptstand soll einmal die Elbgaustraße mit dem Neuen Pferdemarkt verbinden. Ab Diebsteich ist die Route kaum benutzbar."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :forward,
        from: "Hamburg Elbgaustraße",
        to: "Neuer Pferdemarkt",
        parent_ref: __MODULE__,
        text: "von Lurup nach St. Pauli",
        historic: %{
          "853e008e84435d29b0482c16ef799279" => ~d[2025-03]
        },
        videos: [
          {"2022-08-13-rsw-elmshorn-rev/GX014535", :start, :end},
          {"2022-08-13-rsw-elmshorn-rev/GX014536", :start, :end},
          {"2022-08-13-rsw-elmshorn-rev/GX014537", :start, "00:01:15.861"},
          {"2022-08-13-rsw-elmshorn-rev/GX014539", "00:00:00.501", :end},
          {"2022-08-13-rsw-elmshorn-rev/GX014540", :start, :end},
          {"2022-08-13-rsw-elmshorn-rev/GX014541", :start, :end},
          {"2022-08-13-rsw-elmshorn-rev/GX014542", :start, "00:00:27.261"},
          {"2021-08-08-fr9/GX012633", "00:00:30.330", "00:00:43.376"},
          {"2025-03-01-west/GX018381", "00:00:25.092", "00:01:14.016"},
          {"2025-03-01-west/GX018382", :start, "00:00:22.061"},
          {"2025-03-01-west/GX018383", :start, "00:00:24.914"},
          {"2025-03-01-west/GX018384", :start, "00:00:37.638"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :backward,
        from: "Neuer Pferdemarkt",
        to: "Hamburg Elbgaustraße",
        parent_ref: __MODULE__,
        text: "von St. Pauli nach Lurup",
        historic: %{
          "d12490fd6ccb29cc8c2ea24a512d9b31" => ~d[2025-03]
        },
        videos: [
          {"2025-03-01-west/GX018385", :start, "00:00:27.861"},
          {"2025-03-01-west/GX018385", "00:00:29.596", "00:02:01.742"},
          {"2025-03-13-schene/GX018419", "00:00:58.826", "00:01:09.269"},
          {"2021-09-11-rsw-elmshorn/GX012803", "00:01:05.465", "00:01:47.453"},
          {"2021-09-11-rsw-elmshorn/GX012804", :start, :end},
          {"2021-09-11-rsw-elmshorn/GX012805", :start, "00:00:09.742"},
          {"2021-08-08-fr9/GX012619", "00:01:33.441", :end},
          {"2021-08-08-fr9/GX012620", "00:00:00.300", :end},
          {"2021-08-08-fr9/GX012621", :start, "00:01:01.651"},
          {"2021-09-11-rsw-elmshorn/GX012807", "00:01:02.217", "00:02:33.756"},
          {"2021-09-11-rsw-elmshorn/GX012808", "00:00:00.267", "00:00:01.235"},
          {"2021-09-11-rsw-elmshorn/GX012808", "00:00:23.290", :end}
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
          <.icon>radroute-concept-c</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon name="rsw-elmshorn">RSW</.icon><.icon>radroute-18</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.871573,53.587432,9.909113,53.60763" lon={9.88921} lat={53.601005} dir="forward" ref={@ref}>Lurup</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.878612,53.574802,9.919234,53.598813" lon={9.896952} lat={53.588844} dir="forward" ref={@ref}>Volksparkstadion</.v></td>
      </tr>
      <tr>
        <td><.icon>FR9</.icon><.icon>radroute-concept-b</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.89707,53.567748,9.914681,53.578658" lon={9.904405} lat={53.574358} dir="forward" ref={@ref}>Deckel Altona</.v></td>
      </tr>
      <tr>
        <td><.icon name="rsw-elmshorn">RSW</.icon><.icon>FR9</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.917991,53.553536,9.979341,53.580781" lon={9.935503} lat={53.568559} dir="forward"  ref={@ref}>Fernbahnhof Diebsteich</.v></td>
      </tr>
      <tr>
        <td><.icon>br-eimsbuettel-sued</.icon><.icon>radroute-16</.icon><.icon>radroute-14</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.935603,53.558816,9.966744,53.576826" lon={9.950494} lat={53.56657} dir="forward"  ref={@ref}>Altona-Nord</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-15</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.95011,53.553536,9.979341,53.571267" lon={9.962687} lat={53.559847} dir="forward" ref={@ref}>Sternschanze</.v></td>
      </tr>
    </table>

    <p>Die geplante Radroute soll einmal die Elbgaustraße mit dem Neuen Pferdemarkt verbinden. Sie schafft damit eine Anbindung des <.a name="rsw-elmshorn">Radschnellwegs Elmshorn</.a> in Hamburgs Radnetz.</p>

    <p>Im Innenstadtbereich ist die Route momentan kaum ausgebaut und entsprechend schlecht befahrbar.</p>

    <p>Ab dem künftigen <.v bounds="9.932179,53.566228,9.936053,53.57052" lon={9.933123} lat={53.567272} dir="forward" ref={@ref}>Fernbahnhof Diebsteich</.v> käme man via Fahrradstraßen zum <.v bounds="9.905415,53.569786,9.924592,53.574445" lon={9.922476} lat={53.570868} dir="forward" ref={@ref}>Holstenkamp</.v>. Im ersten Abschnitt soll ein schmaler Zweirichtungsradweg auf der Südseite ergänzt werden, der sich nach <.v bounds="9.917098,53.570341,9.919687,53.571486" lon={9.918268} lat={53.570864} dir="forward" ref={@ref}>der Kreuzung</.v> jedoch wieder aufspaltet. Da der Holstenkamp beim Bau des Autobahndeckel eine Verbindung zur Luruper Chaussee erhalten soll, wird mit deutlich mehr KFZ Verkehr gerechnet. Die Planung dazu erfolgt im Rahmen des Deckelbaus, angepeilt ist Mitte 2020er Jahre.</p>

    <p>Um dem Volkspark herum sind Fahrradstraßen angedacht, ab dem <.v bounds="9.893036,53.583709,9.89976,53.593764" lon={9.895265} lat={53.585007} dir="forward" ref={@ref}>Hellgrundweg</.v> ein Zweirichtungsradweg auf der Friedhofsseite. Im Rahmen des Baus der U-Bahn Station „Arenen / Volkspark“ soll auch eine Unter- bzw. Überführung des <.v bounds="9.896275,53.592183,9.899914,53.593662" lon={9.898623} lat={53.592856} dir="forward" ref={@ref}>Farnhornstieg</.v> geprüft werden. Bis dahin soll die Ampel verbessert werden. Die Wege durch die <.v bounds="9.887028,53.592545,9.899774,53.601438" lon={9.896974} lat={53.596083} dir="forward" ref={@ref}>Grünanlagen</.v> sollen so gut es geht verbreitert werden, wobei weiterhin mit viel Fußverkehr zu rechnen ist.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und daher nur mit Ortskenntnis oder Navi auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Route ist kaum praktisch befahrbar:</p>
    <ul>
      <li>Umfahrung des <.v bounds="9.946119,53.562096,9.957584,53.569389" lon={9.951147} lat={53.566361} dir="forward" ref={@ref}>Alsenplatz</.v> ist umständlich</li>
      <li><.v bounds="9.959138,53.557922,9.971335,53.564589" lon={9.962637} lat={53.559827} dir="forward" ref="radroute-concept-c" highlight="Lerchenstraße">Einbahnstraße Lerchenstraße</.v> ist Richtung Innenstadt eine Schiebestrecke</li>
      <li>die meisten Abschnitte haben (sehr unebenes) Kopfsteinpflaster</li>
    </ul>

    <p>Trotz Unzulänglichkeiten ist die <.m bounds="9.933955,53.557124,9.968592,53.566256">Stresemannstraße</.m> momentan (Stand: Frühjahr 2025) die bessere Alternative.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
