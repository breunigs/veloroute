defmodule Data.Article.Static.RadrouteConceptC do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-concept-c"
  def display_id(), do: "?"
  def title(), do: "Neue Radroute (Konzept)"
  def color(), do: RouteColors.purple1()

  def summary(),
    do:
      "Die Radroute im Konzeptstand soll einmal Fernbahnhof Diebsteich mit dem Neuen Pferdemarkt verbinden. Aktuell verhindert eine fehlende Querungsmöglichkeit des Alsenplatz eine direkte Fahrt."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :forward,
        from: "Hamburg Diebsteich",
        to: "Neuer Pferdemarkt",
        parent_ref: __MODULE__,
        text: "von Diebsteich nach St. Pauli",
        historic: %{
          "6368303968d0a2a64b51afd6ed4feb7a" => ~d[2025-03]
        },
        videos: [
          {"2025-03-01-west/GX018381", "00:00:24.847", "00:01:14.016"},
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
        to: "Hamburg Diebsteich",
        parent_ref: __MODULE__,
        text: "von St. Pauli nach Diebsteich",
        historic: %{
          "6bf86c892dffae5f48fe521e51733099" => ~d[2025-03]
        },
        videos: [
          {"2025-03-01-west/GX018385", :start, "00:00:27.861"},
          {"2025-03-01-west/GX018385", "00:00:29.596", "00:02:18.367"}
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

    <p>Die geplante Radroute soll einmal den Fernbahnhof Diebsteich mit dem Neuen Pferdemarkt verbinden. Sie schafft damit eine Anbindung des <.a name="rsw-elmshorn">Radschnellwegs Elmshorn</.a> in Hamburgs Radnetz. Sie ist momentan gar nicht ausgebaut und entsprechend schlecht befahrbar.</p>

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
