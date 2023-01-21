defmodule Data.Article.Static.NorderstedtVeloroute1 do
  use Article.Static

  def id(), do: "norderstedt-1"
  def display_id(), do: "1"
  def route_group(), do: :alltag
  def title(), do: "Norderstedt: Veloroute 1"

  def color(), do: "#d14a1f"

  def summary(),
    do:
      "Norderstedts Veloroute 1 führt vom Schmuggelstieg über Norderstedt-Mitte nach Meeschensee"

  def tags(), do: [id(), "norderstedt"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "norderstedt 1",
        direction: :forward,
        from: "Schmuggelstieg",
        to: "Meeschensee",
        parent_ref: __MODULE__,
        text: "vom Schmuggelstieg nach Meeschensee",
        videos: [
          {"2022-05-28-norderstedt/GX014068", "00:00:12.246", :end},
          {"2022-05-28-norderstedt/GX014069", :start, :end},
          {"2022-05-28-norderstedt/GX014071", :start, "00:00:06.840"},
          {"2022-05-28-norderstedt/GX014082", "00:00:07.241", "00:00:58.358"},
          {"2022-05-28-norderstedt/GX014089", "00:01:25.519", "00:01:29.623"},
          {"2022-05-28-norderstedt/GX014082", "00:01:07.668", "00:02:33.053"},
          {"2022-05-28-norderstedt/GX014083", "00:00:01.268", :end},
          {"2022-05-28-norderstedt/GX014084", :start, "00:01:44.304"},
          {"2022-05-28-norderstedt/GX014085", "00:00:18.585", :end},
          {"2022-05-28-norderstedt/GX014086", :start, "00:01:54.014"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "norderstedt 1",
        direction: :backward,
        from: "Meeschensee",
        to: "Schmuggelstieg",
        parent_ref: __MODULE__,
        text: "von Meeschensee zum Schmuggelstieg",
        videos: [
          {"2022-05-28-norderstedt/GX014087", "00:00:01.034", "00:02:16.737"},
          {"2022-05-28-norderstedt/GX014084", "00:01:45.072", "00:01:59.052"},
          {"2022-05-28-norderstedt/GX014087", "00:02:58.879", :end},
          {"2022-05-28-norderstedt/GX014088", :start, :end},
          {"2022-05-28-norderstedt/GX014089", :start, "00:01:18.712"},
          {"2022-05-28-norderstedt/GX014089", "00:01:31.592", :end},
          {"2022-05-28-norderstedt/GX014090", :start, "00:00:18.485"},
          {"2022-05-28-norderstedt/GX014072", "00:00:06.540", :end},
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
    <h3>Norderstedt: Veloroute 1</h3>
    <.roaddiagram src="logo-norderstedt-1" width={100} alt="Logo der Veloroute 1 in Norderstedt" class="right"/>


    <p>Die Veloroute 1 verläuft in Nord-Süd Richtung und orientiert sich an den Bahnstrecken der U-Bahn und des AKN. Start ist der <.v bounds="9.997648,53.679996,10.004217,53.68503" lon={9.999337} lat={53.681612} dir="forward" ref="norderstedt-1">Schmuggelstieg</.v>, wo Anschluss an <.a name="alltagsroute-4">Hamburgs Alltagsroute 4</.a> besteht. Über verschiedene <.v bounds="9.983344,53.680517,10.004847,53.689524" lon={9.992534} lat={53.685062} dir="forward" ref="norderstedt-1">verschiedene Nebenstraßen</.v> erreicht man die Bahnschienen und folgt ihnen <.v bounds="9.990255,53.717033,9.993064,53.720824" lon={9.991487} lat={53.719901} dir="forward" ref="norderstedt-1">mehr</.v> oder <.v bounds="9.985279,53.724679,9.997136,53.731463" lon={9.99254} lat={53.727977} dir="forward" ref="norderstedt-1">weniger</.v> direkt bis nach <.v bounds="9.973136,53.748855,9.988609,53.75762" lon={9.979173} lat={53.753531} dir="forward" ref="norderstedt-1">Meeschensee</.v>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nur dort ausgeschildert, wo sich verschiedene Radrouten treffen. Die Wegweiser sind klein und häufig außerhalb des Blickfelds angebracht, z.B. in Fahrtrichtung hinter dem Pfosten. Es muss daher an jeglichen Rad-Wegweisern genau geschaut werden. Dazwischen muss man sich auf Intuition oder allgemeine Richtungsweise (🚲 →) verlassen.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Qualität der Wege schwankt. Die Oberflächen sind größtenteils laufruhig, mit Ausnahme des <.v bounds="9.981995,53.743732,9.990764,53.751645" lon={9.985989} lat={53.745192} dir="forward" ref="norderstedt-1">Waldstücks ab Haslohfurt</.v>. An vielen Stellen teilen sich Rad- und Fußverkehr schmale Wege, was zügiges Vorankommen verhindert.</p>

    <h4>Meinung</h4>
    <p>Eine brauchbare Radroute, die sich aber nicht für Rennräder und hohe Geschwindigkeiten eignet. Neben dem fehlenden Ausbau im Waldstück fallen vor allem einige Kreuzungen negativ ins Auge:</p>
    <ul>
      <li><.v bounds="9.997329,53.68158,10.00071,53.683314" lon={9.99886} lat={53.682236} dir="forward" ref="norderstedt-1">fehlende, legale Fahrtmöglichkeit Schmuggelstieg</.v></li>
      <li><.v bounds="9.990823,53.706587,9.994787,53.708676" lon={9.992109} lat={53.707062} dir="forward" ref="norderstedt-1">schlechte Ampelschaltung Norderstedt-Mitte</.v></li>
      <li><.v bounds="9.989328,53.684478,9.992112,53.685953" lon={9.990251} lat={53.685077} dir="backward" ref="norderstedt-1">Schikane beim Linksabbiegen Lütjenmoor</.v> (Richtung Süden)</li>
    </ul>
    <p>Trotz allem ist sie auch in ihrem heutigen Stand bereits nutzbar.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
