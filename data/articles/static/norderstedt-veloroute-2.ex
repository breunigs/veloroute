defmodule Data.Article.Static.NorderstedtVeloroute2 do
  use Article.Static

  def id(), do: "norderstedt-2"
  def display_id(), do: "2"
  def route_group(), do: :alltag
  def title(), do: "Norderstedt: Veloroute 2"

  def color(), do: "#d24a2f"

  def summary(),
    do: "Norderstedts Veloroute 2 führt vom Schmuggelstieg zum Harksheider Markt"

  def tags(), do: [id(), "norderstedt"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "norderstedt 2",
        direction: :forward,
        from: "Schmuggelstieg",
        to: "Harksheider Markt",
        parent_ref: __MODULE__,
        text: "vom Schmuggelstieg zum Harksheider Markt",
        videos: [
          {"2022-05-28-norderstedt/GX014068", "00:00:12.246", :end},
          {"2022-05-28-norderstedt/GX014069", :start, :end},
          {"2022-05-28-norderstedt/GX014071", :start, "00:00:07.107"},
          {"2022-05-28-norderstedt/GX014090", "00:00:21.955", "00:01:09.703"},
          {"2022-05-28-norderstedt/GX014091", "00:00:00.701", "00:00:43.844"},
          {"2022-05-28-norderstedt/GX014118", "00:00:04.171", "00:00:10.210"},
          {"2022-05-28-norderstedt/GX014116", "00:00:22.656", "00:00:26.960"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "norderstedt 2",
        direction: :backward,
        from: "Harksheider Markt",
        to: "Schmuggelstieg",
        parent_ref: __MODULE__,
        text: "vom Harksheider Markt zum Schmuggelstieg",
        videos: [
          {"2022-05-28-norderstedt/GX014117", "00:00:00.868", "00:00:05.973"},
          {"2022-05-28-norderstedt/GX014118", "00:00:13.647", :end},
          {"2022-05-28-norderstedt/GX014119", :start, :end},
          {"2022-05-28-norderstedt/GX014073", :start, "00:00:01.502"},
          {"2022-05-28-norderstedt/GX014070", "00:02:50.904", "00:02:58.712"}
        ]
      }
    ]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h3>Norderstedt: Veloroute 2</h3>
    <.roaddiagram src="logo-norderstedt-2" width={100} alt="Logo der Veloroute 2 in Norderstedt" class="right"/>

    <p>Die Strecke beginnt am <.m bounds="9.997648,53.679996,10.004217,53.68503" lon={9.999337} lat={53.681612} dir="forward" ref="norderstedt-2">Schmuggelstieg</.m> und führt zunächst nach Norden. Am <.m bounds="9.990894,53.693671,10.005301,53.698556" lon={9.994532} lat={53.69527} dir="forward" ref="norderstedt-2">Forstweg</.m> knickt sie etwas nach Osten ab um eine direkte Verbindung zum <.m bounds="10.001945,53.701307,10.01449,53.709814" lon={10.007494} lat={53.704041} dir="forward" ref="norderstedt-2">Harksheider Markt</.m> herzustellen.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nur dort ausgeschildert, wo sich verschiedene Radrouten treffen. Die Wegweiser sind klein und häufig außerhalb des Blickfelds angebracht, z.B. in Fahrtrichtung hinter dem Pfosten. Es muss daher an jeglichen Rad-Wegweisern genau geschaut werden. Dazwischen muss man sich auf Intuition oder allgemeine Richtungsweise (🚲 →) verlassen.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Wegoberflächen sind durchgängig befestigt. Nicht überall stehen dem Radverkehr eigene Wege zur Verfügung. Besonders an <.m bounds="9.996595,53.687242,9.999018,53.688485" lon={9.997575} lat={53.687542} dir="forward" ref="norderstedt-2">Bushaltestellen</.m> wird es eng.</p>

    <h4>Meinung</h4>
    <p>Die Route ist brauchbar, auch wenn viele Wege zu schmal sind um sicher höhere Geschwindigkeiten fahren zu können. Die Hauptkritik richtet sich auf umständliche Querungen:</p>
    <ul>
      <li><.m bounds="9.997329,53.68158,10.00071,53.683314" lon={9.99886} lat={53.682236} dir="forward" ref="norderstedt-2">fehlende, legale Fahrtmöglichkeit Schmuggelstieg</.m></li>
      <li><.m bounds="9.996436,53.68307,9.999815,53.685551" lon={9.998} lat={53.683928} dir="forward" ref="norderstedt-2">Seitenwechsel ab Breslauer Straße</.m> (entfiele mit besserer Querungsmöglichkeit beim Schmuggelstieg)</li>
      <li><.m bounds="10.004786,53.702579,10.010087,53.706123" lon={10.006643} lat={53.703042} dir="forward" ref="norderstedt-2">Einmündung Am Exerzierplatz</.m></li>
    </ul>
    <p>Es ist schade, dass die Route am Harksheider Markt endet statt die Wohngebiete an der <.m bounds="10.006606,53.703975,10.009604,53.711093">Falkenbergstraße</.m> ebenfalls anzubinden.</p>

    <h3>Externe Links</h3>
    <.structured_links gpx={true}/>
    """
  end
end
