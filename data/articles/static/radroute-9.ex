defmodule Data.Article.Static.Radroute9 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-9"
  def display_id(), do: "9"
  def title(), do: "Radroute 9"
  def color(), do: RouteColors.purple1()

  def summary(),
    do:
      "Radroute 9 schmiegt sich an die Ostseite der Außenalster. In Hohenfelde knickt sie nach Südosten ab und führt zum Berliner Tor."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "9",
        direction: :forward,
        from: "Krugkoppelbrücke",
        to: "Berliner Tor",
        parent_ref: __MODULE__,
        text: "von der Krugkoppelbrücke zum Berliner Tor",
        historic: %{
          "8624943fa46c1b5108d1489cc97426b4" => ~d[2025-02]
        },
        videos: [
          {"2025-02-17-ost/GX018125", "00:00:19.980", "00:02:10.420"},
          {"2025-02-17-ost/GX018127", "00:00:22.435", "00:00:26.287"},
          {"2025-02-17-ost/GX018128", "00:00:00.100", "00:00:45.760"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "9",
        direction: :backward,
        from: "Berliner Tor",
        to: "Krugkoppelbrücke",
        parent_ref: __MODULE__,
        text: "vom Berliner Tor zur Krugkoppelbrücke",
        historic: %{
          "11454f8edf9e3fa7336522582fbb0ce0" => ~d[2025-02]
        },
        videos: [
          {"2025-02-17-ost/GX018122", "00:00:26.126", :end},
          {"2025-02-17-ost/GX018123", :start, :end},
          {"2025-02-17-ost/GX018124", :start, :end},
          {"2025-02-17-ost/GX018125", :start, "00:00:16.340"}
        ]
      }
    ]

  def links(_assigns) do
    [{"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643500"}]
  end

  def text(assigns) do
    ~H"""
    <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-9</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon>radroute-4</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.98251,53.570173,10.014186,53.590909" lon={9.997839} lat={53.578666} dir="forward" ref={@ref}>Harvestehude</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td><.v bounds="9.982983,53.574201,10.015131,53.59066" lon={9.998562} lat={53.579571} dir="forward" ref={@ref}>Alster</.v></td>
      </tr>
      <tr>
        <td><.icon>FR1</.icon><.icon>br-nord-n5</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.995591,53.572986,10.023053,53.589916" lon={10.003315} lat={53.579923} dir="forward" ref={@ref}>Winterhude</.v></td>
      </tr>
      <tr>
        <td><.icon>FR3</.icon><.icon>FR2</.icon><.icon>br-nord-n4</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.001599,53.564283,10.039028,53.581569" lon={10.010774} lat={53.56985} dir="forward" ref={@ref}>Uhlenhorst</.v></td>
      </tr>
      <tr>
        <td><.icon>br-nord-n4</.icon><.icon>radroute-6</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.006417,53.555853,10.033417,53.572711" lon={10.016121} lat={53.563852} dir="forward" ref={@ref}>Hohenfelde</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td><.v bounds="10.005589,53.559974,10.027966,53.576044" lon={10.016615} lat={53.565779} dir="forward" ref={@ref}>Mundsburger Kanal</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-7</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.008134,53.545971,10.04005,53.565302" lon={10.017012} lat={53.559108} dir="forward" ref={@ref}>St. Georg</.v></td>
      </tr>
      <tr>
        <td><.icon>FR4</.icon><.icon>radroute-1</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.003479,53.545657,10.043879,53.564441" lon={10.023943} lat={53.554089} dir="forward" ref={@ref}>Berliner Tor</.v></td>
      </tr>
    </table>

    <p>Radroute 9 verläuft größtenteils am östlichen Ufer der Außenalster. Auf Höhe des Lohmühlenpark knickt die Route Richtung Berliner Tor ab.</p>

    <.roaddiagram src="radroute-09-wegweiser" width={115} alt="Zwischenwegweiser für Radroute 9" class="right"/>
    <h4>Auffindbarkeit</h4>
    <p>Die Route ist praktisch nicht beschildert – bisher gibt es nur einige Wegweiser <.v bounds="9.995227,53.577166,10.001575,53.582297" lon={9.99915} lat={53.579967} dir="forward" ref={@ref}>um die Alster</.v> (<.a href="https://veloroute.hamburg/crowdsourcing/upload" rel="nofollow">Wo genau? Hilf mit!</.a>). Da sie sich aber an der Außenalster entlang schmiegt, ist sie auch ohne Hilfsmittel leicht zu finden. Lediglich die <.v bounds="10.009838,53.557806,10.019329,53.564167" lon={10.01371} lat={53.561542} dir="forward" ref={@ref}>Abzweigung zum Lohmühlenpark</.v> muss man kennen.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Größenteils sind die Radwege asphaltiert, teils kommt Pflaster zum Einsatz. Die selten verwendeten Metallgitter dienen dem Wurzelschutz der Bäume.</p>

    <h4>Meinung</h4>
    <p>Entlang der Alster sind die meisten Abschnitte fertig und hervorragend. Die <.a name="2018-10-10-5-6-hohenfelder-bucht">Hohenfelder Bucht</.a> soll 2025 fertig werden, die das größte Manko stellt. Danach bleiben noch <.v bounds="10.006427,53.573636,10.017996,53.579639" lon={10.009473} lat={53.577967} dir="forward" ref={@ref}>Sierichstraße</.v> und <.v bounds="10.011623,53.550385,10.03002,53.563578" lon={10.016843} lat={53.559143} dir="forward" ref={@ref}>Lohmühlenstraße</.v> als Ausbaulücken – schon heute befahrbar, wenn auch mit Abstrichen.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
