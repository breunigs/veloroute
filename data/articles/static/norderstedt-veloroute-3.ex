defmodule Data.Article.Static.NorderstedtVeloroute3 do
  use Article.Static

  def id(), do: "norderstedt-3"
  def display_id(), do: "3"
  def route_group(), do: :alltag
  def title(), do: "Norderstedt: Veloroute 3"

  def color(), do: "#d34a3f"

  def summary(),
    do: "Norderstedts Veloroute 3 führt von Norderstedt-Mitte nach Glashütte"

  def tags(), do: [id(), "norderstedt"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "norderstedt 3",
        direction: :forward,
        from: "Norderstedt-Mitte",
        to: "Glashütte",
        parent_ref: __MODULE__,
        text: "von Norderstedt-Mitte nach Glashütte",
        videos: [
          {"2022-05-28-norderstedt/GX014095", :start, "00:00:05.772"},
          {"2022-05-28-norderstedt/GX014097", "00:00:03.971", :end},
          {"2022-05-28-norderstedt/GX014098", :start, :end},
          {"2022-05-28-norderstedt/GX014099", :start, "00:00:03.203"},
          {"2022-05-28-norderstedt/GX014102", "00:00:25.192", "00:00:31.498"},
          {"2022-05-28-norderstedt/GX014102", "00:00:40.040", :end},
          {"2022-05-28-norderstedt/GX014103", :start, :end},
          {"2022-05-28-norderstedt/GX014104", :start, "00:00:20.120"},
          {"2022-05-28-norderstedt/GX014113", "00:00:00.868", :end},
          {"2022-05-28-norderstedt/GX014114", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "norderstedt 3",
        direction: :backward,
        from: "Glashütte",
        to: "Norderstedt-Mitte",
        parent_ref: __MODULE__,
        text: "von Glashütte nach Norderstedt-Mitte",
        videos: [
          {"2022-05-28-norderstedt/GX014115", :start, :end},
          {"2022-05-28-norderstedt/GX014116", :start, "00:00:20.954"},
          {"2022-05-28-norderstedt/GX014117", "00:00:04.771", "00:00:07.007"},
          {"2022-05-28-norderstedt/GX014091", "00:00:45.512", :end},
          {"2022-05-28-norderstedt/GX014092", :start, :end},
          {"2022-05-28-norderstedt/GX014093", :start, "00:00:09.142"}
        ]
      }
    ]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h3>Norderstedt: Veloroute 3</h3>
    <.roaddiagram src="logo-norderstedt-3" width={100} alt="Logo der Veloroute 3 in Norderstedt" class="right"/>

    <p>Die Route führt von <.v bounds="9.989592,53.704789,9.998013,53.710449" lon={9.992578} lat={53.707073} dir="forward" ref="norderstedt-3">Norderstedt-Mitte</.v>, über <.v bounds="9.999743,53.6999,10.014974,53.708598" lon={10.004641} lat={53.703276} dir="forward" ref="norderstedt-3">Harksheide</.v> nach <.v bounds="10.017243,53.686578,10.040955,53.699376" lon={10.034424} lat={53.694075} dir="forward" ref="norderstedt-3">Glashütte</.v>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nur dort ausgeschildert, wo sich verschiedene Radrouten treffen. Die Wegweiser sind klein und häufig außerhalb des Blickfelds angebracht, z.B. in Fahrtrichtung hinter dem Pfosten. Es muss daher an jeglichen Rad-Wegweisern genau geschaut werden. Dazwischen muss man sich auf Intuition oder allgemeine Richtungsweise (🚲 →) verlassen. Ausnahme: am <.v bounds="10.021715,53.696934,10.0243,53.698707" lon={10.022583} lat={53.698046} dir="forward" ref="norderstedt-3">Achtern Born</.v> sind die allgemeinen Wegweise für eine andere Route und leiten daher von der Veloroute weg.</p>


    <h4>Befahrbarkeit</h4>
    <p>Die Wege sind fast durchgehend befestigt. Dem Radverkehr stehen stellenweise eigene Wege zur Verfügung, die meiste Zeit muss er sie jedoch teilen: mit KFZ im <.ref>Mischverkehr</.ref> auf Nebenstraßen und mit dem Fußverkehr auf gemeinsamen Fuß- und Radwegen. Je nach Betrieb dürfte überholen gerade auf diesen Abschnitten schwierig werden.</p>

    <h4>Meinung</h4>
    <p>Die Strecke ist brauchbar, sollte jedoch über Norderstedt Mitte in der <.v bounds="9.977338,53.705978,9.995351,53.709165" lon={9.986979} lat={53.707897} dir="backward" ref="norderstedt-3">Rathausallee</.v> verlängert werden. An der <.v bounds="9.996553,53.702561,10.003026,53.705237" lon={9.998764} lat={53.7042} dir="forward" ref="norderstedt-3">Tarpenbek</.v> sollte das kurze Waldstück noch asphaltiert werden. Zuletzt muss die Querung der <.v bounds="10.010571,53.699106,10.017326,53.701531" lon={10.01297} lat={53.700466} dir="forward" ref="norderstedt-3">Schleswig-Holstein-Straße</.v> verbessert werden – neben kürzeren Wartezeiten wäre eine automatische Erkennung sinnvoll, damit man den Taster nicht mehr von Hand betätigten muss.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
