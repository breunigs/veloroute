defmodule Data.Article.Static.Radroute21 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-21"
  def display_id(), do: "21"
  def title(), do: "Radroute 21 (Konzept)"
  def color(), do: RouteColors.red3()

  def summary(),
    do:
      "Die geplante Radroute soll von der Spreehafenbrücke über eine noch zu bauende Radbrücke nach Moorfleet führen. Durch die Lücke ist die Route aktuell uninteressant."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "2",
        direction: :forward,
        from: "Ernst-August-Straße",
        to: "Halskestraße",
        parent_ref: __MODULE__,
        text: "vom Hafen nach Moorfleet",
        historic: %{
          "2a7e22c6654d781d46e88bd80c2a91c4" => ~d[2025-02]
        },
        videos: [
          {"2025-02-06-whburg/GX017895", "00:00:45.746", "00:01:27.634"},
          {"2025-02-06-whburg/GX017896", :start, "00:00:38.767"},
          {"2025-02-06-whburg/GX017897", :start, "00:00:20.854"},
          {"2025-02-06-whburg/GX017898", "00:00:05.572", :end},
          {"2025-02-23-ost/a1_gap_from_west_25s", :start, :end},
          {"2025-02-23-ost/GX018265", :start, :end},
          {"2025-02-23-ost/GX018266", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "2",
        direction: :backward,
        from: "Halskestraße",
        to: "Ernst-August-Straße",
        parent_ref: __MODULE__,
        text: "von Moorfleet zum Hafen",
        historic: %{
          "890ceb36524922b9d033a8712678c125" => ~d[2025-02]
        },
        videos: [
          {"2025-02-23-ost/GX018259", "00:01:48.375", :end},
          {"2025-02-23-ost/GX018260", :start, "00:00:01.935"},
          {"2025-02-23-ost/GX018263", "00:00:01.602", :end},
          {"2025-02-23-ost/a1_gap_from_east_25s", :start, :end},
          {"2025-02-06-whburg/GX017899", "00:00:20.020", "00:01:59.487", vf: "curves=lighter"},
          {"2025-02-06-whburg/GX017902", "00:00:18.940", "00:00:32.980"},
          {"2025-02-06-whburg/GX017903", :start, :end},
          {"2025-02-06-whburg/GX017904", :start, "00:01:10.270"}
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
          <.icon>radroute-21</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon>radroute-4</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.964136,53.512392,9.997787,53.532951" lon={9.982512} lat={53.522903} dir="forward" ref={@ref}>Spreehafenbrücke</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td class="dim"><.v bounds="9.99887,53.512889,10.036328,53.529945" lon={10.012272} lat={53.521171} dir="forward" ref={@ref}>Eisenbahn</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-23</.icon><.icon>radroute-3</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.009611,53.517922,10.023687,53.52523" lon={10.015643} lat={53.521643} dir="forward" ref={@ref}>Ballin Park</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.018912,53.508833,10.040701,53.526635" lon={10.027902} lat={53.517537} dir="forward" ref={@ref}>Autobahn A255</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river_only} ref={@ref}/></td>
        <td>Norderelbe</td>
      </tr>
      <tr>
        <td><.icon>radroute-20</.icon><.icon>radroute-2</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.058832,53.501174,10.105609,53.525723" lon={10.080804} lat={53.510873} dir="forward"ref={@ref}>Moorfleet</.v></td>
      </tr>
    </table>

    <p>Radroute 21 soll einmal eine Querverbindung zwischen der <.a name="radroute-4">Radroute 4</.a> im <.v bounds="9.964136,53.512392,9.997787,53.532951" lon={9.982512} lat={53.522903} dir="forward" ref={@ref}>Westen auf Wilhelmsburg</.v> und der  <.a name="radroute-20">Radroute 20</.a> im Osten bei <.v bounds="10.058832,53.501174,10.105609,53.525723" lon={10.080804} lat={53.510873} dir="forward"ref={@ref}>Moorfleet</.v> herstellen. Momentan fehlt der wichtige Lückenschluss über die Elbe, was die Route unbrauchbar macht.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <.roaddiagram src="gap" width={100} alt="Warnzeichen vor dem Ufer (angelehnt an das Schild 101-53 aus der StVO, aber mit Fahrrad statt Autosymbol)" class="right"/>
    <h4>Befahrbarkeit</h4>
    <p>Die Wege sind schon heute befestigt und allwettertauglich. Da die Route noch nicht ausgebaut ist, ist die Führung teils umständlich oder man wird durch Schranken ausgebremst. Außerdem fehlt natürlich die Elbquerung.</p>

    <h4>Meinung</h4>
    <p>Für den Radverkehr gibt es im Wesentlichen nur zwei befahrbare Elbquerungen: den <.m bounds="9.95424,53.533517,9.983847,53.553551" highlight="St. Pauli-Elbtunnel">Alten Elbtunnel</.m> und die <.m bounds="10.013229,53.524833,10.038877,53.543602" highlight="Freihafenelbbrücke,Neue Elbbrücke">beiden Elbbrücken</.m>. Hinzu kommen sonst nur noch die kostenpflichtigen Fähren ab <.m bounds="9.84627,53.531662,9.893523,53.562242">Teufelsbrück</.m> bzw. <.m bounds="10.138095,53.368333,10.244132,53.452">Zollenspieker</.m>.</p>

    <p>Eine weitere Alternative ist daher sehr willkommen. Davon abgesehen schafft die Route auch erstmals eine attraktive Verbindung von Wilhelmsburg in Richtung Osten, was vorher dem Autoverkehr vorbehalten war. Leider wird noch viel Zeit ins Land gehen, bis die neue Brücke kommt.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
