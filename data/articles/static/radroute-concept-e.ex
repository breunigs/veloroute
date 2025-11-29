defmodule Data.Article.Static.RadrouteConceptE do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-concept-e"
  def display_id(), do: "?"
  def title(), do: "Neue Radroute (Konzept)"
  def color(), do: RouteColors.red1()

  def summary(),
    do: "Die Radroute im Konzeptstand soll vom Osdorfer Born zum Autobahndeckel Altona verlaufen."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "e",
        direction: :forward,
        from: "Am Barls",
        to: "Deckel Altona",
        parent_ref: __MODULE__,
        text: "vom Osdorfer Born zum Deckel Altona",
        historic: %{
          "b9562c759152dde0085562463cef44dd" => ~d[2025-03]
        },
        videos: [
          {"2025-03-13-schene/GX018445", :start, "00:01:54.548"},
          {"2025-03-13-schene/GX018445", "00:02:15.869", :end},
          {"2025-03-13-schene/GX018446", :start, "00:00:29.667"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "e",
        direction: :backward,
        from: "Deckel Altona",
        to: "Am Barls",
        parent_ref: __MODULE__,
        text: "vom Deckel Altona zum Osdorfer Born",
        historic: %{
          "f452f3838e60714b582fd267f5cc808b" => ~d[2025-03]
        },
        videos: [
          {"2025-03-13-schene/GX018419", "00:03:43.652", :end},
          {"2025-03-13-schene/GX018420", :start, "00:00:43.014"},
          {"2025-03-13-schene/GX018421", :start, :end},
          {"2025-03-13-schene/GX018422", :start, :end},
          {"2025-03-13-schene/GX018423", :start, "00:00:14.234"},
          {"2025-03-13-schene/GX018444", "00:02:45.088", :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643657"},
      {"Marketingseite der Science City Bahrenfeld", "https://www.sciencecity.hamburg/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-concept-e</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon>radroute-7</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.843738,53.588066,9.862383,53.600015" lon={9.852849} lat={53.593251} dir="forward" ref={@ref}>Osdorfer Born</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-18</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.85293,53.569226,9.908712,53.599143" lon={9.874549} lat={53.586604} dir="forward" ref={@ref}>Lurup</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.880913,53.569316,9.907038,53.586432" lon={9.888882} lat={53.576106} dir="forward" ref={@ref}>Science City</.v></td>
      </tr>
      <tr>
        <td><.icon>FR9</.icon><.icon>radroute-concept-b</.icon><.icon>radroute-concept-c</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.890184,53.562348,9.920493,53.584116" lon={9.902627} lat={53.57261} dir="forward" ref={@ref}>Autobahndeckel Altona</.v></td>
      </tr>
    </table>

    <p>Die geplante Radroute soll vom Osdorfer Born zum Deckel Altona führen. Sie bindet damit die im Bau befindliche <.a href="https://www.sciencecity.hamburg/">Science City Hamburg Bahrenfeld</.a> ans Radnetz an. Außerdem stellt sie gerade für Radverkehr von/nach <.m bounds="9.804519,53.579021,9.871426,53.614986">Schenefeld</.m> eine direktere Alternative zur <.a ref={Radroute7}>Radroute 7</.a> dar.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und daher nur mit Ortskenntnis oder Navi auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und damit auch bei Regen gut befahrbar. Nur das Linksabbiegen am <.v bounds="9.888036,53.570009,9.90473,53.578756" lon={9.89327} lat={53.57329} dir="forward" ref={@ref}>Kielkamp</.v> ist schwierig, da die Ampel für eine noch zu bauende Straße vorgesehen ist. Man muss daher entweder kurz Absteigen oder die ungesicherte Querung ein paar Meter weiter nutzen.</p>

    <h4>Meinung</h4>
    <p>Gut, dass man schon frühzeitig an die Fahrrad-Anbindung denkt. Leider bremst <.v bounds="9.85025,53.584189,9.879292,53.595553" lon={9.859173} lat={53.591918} dir="forward" ref={@ref}>Böttcherkamp</.v> mit viel KFZ-Durchgangsverkehr sehr aus, und die Führung an der <.v bounds="9.877546,53.571123,9.89647,53.586844" lon={9.885666} lat={53.579497} dir="forward" ref={@ref}>Luruper Chaussee</.v> ist laut. Beides sollte sich jedoch verbessern lassen.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
