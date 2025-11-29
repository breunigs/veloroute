defmodule Data.Article.Static.BrBergedorfB do
  use Article.Static

  def id(), do: "br-bergedorf-b"
  def display_id(), do: "BB"

  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Bergedorf – B – Nord/Süd"

  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Die Bezirksroute B in Bergedorf verläuft in Nord/Süd-Richtung und verbindet Lohbrügge via Bergedorfs Zentrum mit Nettelnburg."

  def tags(), do: [id(), display_id(), "br-bergedorf"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "nordsued",
        direction: :forward,
        from: "Reinbeker Redder",
        to: "Unterführung A25",
        parent_ref: __MODULE__,
        text: "Bezirksroute Bergedorf B → Süden",
        end_action: :reverse,
        historic: %{
          "3e1d1f4b79c1e0a47b7b05e6a131b852" => ~d[2025-08]
        },
        videos: [
          {"2025-08-16-br-berge/GX018599", "00:01:13.880", :end},
          {"2025-08-16-br-berge/GX018600", :seamless, :end},
          {"2025-08-16-br-berge/GX018601", :start, "00:00:10.534"},
          {"2025-08-16-br-berge/GX018601", "00:00:39.100", :end},
          {"2025-08-16-br-berge/GX018601", "00:00:39.100", "00:01:23.517"},
          {"2025-08-16-br-berge/GX018601", "00:01:25.819", :end},
          {"2025-08-16-br-berge/GX018602", :start, :end},
          {"2025-08-16-br-berge/GX018603", :start, "00:00:00.667"},
          {"2025-08-16-br-berge/GX018603", "00:00:28.762", "00:01:01.109"},
          {"2025-08-16-br-berge/GX018603", "00:01:56.688", "00:03:52.267"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "nordsued",
        direction: :backward,
        from: "Unterführung A25",
        to: "Reinbeker Redder",
        parent_ref: __MODULE__,
        text: "Bezirksroute Bergedorf B → Norden",
        end_action: :reverse,
        historic: %{
          "9204d8779d4a99a2280c87d883c85b98" => ~d[2025-08]
        },
        videos: [
          {"2025-08-16-br-berge/GX018603", "00:03:52.267", "00:05:02.475"},
          {"2025-08-16-br-berge/GX018604", "00:00:00.601", :end},
          {"2025-08-16-br-berge/GX018605", :start, "00:00:22.314"},
          {"2025-08-16-br-berge/GX018597", "00:01:26.622", :end},
          {"2025-08-16-br-berge/GX018598", :start, :end},
          {"2025-08-16-br-berge/GX018599", :start, "00:01:13.880"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643556"},
      {"Bezirksrouten Bergedorf Zielnetz", ~d[2025-08],
       "https://suche.transparenz.hamburg.de/dataset/bezirksradrouten-hamburg-bergedorf-finales-zielnetz1"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Bezirksroute Bergedorf – Nord-Süd-Richtung <.icon>BB</.icon></h3>

    <p>Die als „B“ bezeichnete Route soll einmal <.v bounds="10.189801,53.498605,10.224581,53.515861" lon={10.199036} lat={53.507565} dir="forward" ref={@ref}>Lohbrügge</.v> mit dem <.v bounds="10.187291,53.470669,10.219779,53.488405" lon={10.200588} lat={53.477258} dir="forward" ref={@ref}>Industriegebiet am Schleusengraben</.v> verbinden. In Lohbrügge folgt sie im Wesentlichen der <.v bounds="10.195253,53.495683,10.213724,53.511227" lon={10.204292} lat={53.504176} dir="forward" ref={@ref}>Leuschnerstraße</.v>. Im Stadtzentrum führt sie durch die Fußgängerzone, wo auch der Übergang zur <.a ref={BrBergedorfA}>Bezirksroute A in Ost-West-Richtung</.a> ist. Weiter nach Süden soll die Route einmal am <.v bounds="10.195728,53.478442,10.212324,53.489522" lon={10.20484} lat={53.484046} dir="forward" ref={@ref}>Schleusengraben</.v> verlaufen, der Stand heute (2025) noch nicht befahrbar ist.</p>

    <h4>Speziell für diese Route</h4>
    <p>Für die <.v bounds="10.195253,53.495683,10.213724,53.511227" lon={10.204292} lat={53.504176} dir="forward" ref={@ref}>Leuschnerstraße</.v> wird vorgeschlagen die nur stellenweise vorhandenen Radwege zum Gehweg zu machen. Der Radverkehr soll künftig vollständig im <.ref>Mischverkehr</.ref> mit den Autos fahren. Die Einmündung <.v bounds="10.206341,53.494736,10.209988,53.496717" lon={10.208324} lat={53.495796} dir="backward" ref={@ref}>Am Beckerkamp</.v> wurde bereits umgebaut und ist jetzt gut zu queren. Das letzte Teilstück zur Innenstadt erfolgt über die <.a ref={Radroute8}>Radroute 8</.a>.</p>

    <p>Im Zentrum führt die Route durch die Fußgängerzone (<.v bounds="10.204275,53.486662,10.211012,53.490728" lon={10.208494} lat={53.488991} dir="forward" ref={@ref}>Serrhanstraße und Kampdeich</.v>). Im Entwurf werden keine Änderungen für diesen Teil vorgeschlagen.</p>

    <p>In Richtung Süden soll der <.v bounds="10.195728,53.478442,10.212324,53.489522" lon={10.20484} lat={53.484046} dir="forward" ref={@ref}>Schleusengraben</.v>  einen neuen, eigenständigen Geh- und Radweg erhalten. KFZ sollen dort nicht fahren. Die Voruntersuchung bringt verschiedene Gestaltungen ein, die alle den Radweg (mindestens 3,5m breit) auf der Häuserseite und den Gehweg (mindestens 2,75m) auf der Uferseite vorsehen. Die Route endet auf Höhe der <.v bounds="10.190241,53.471052,10.210837,53.478276" lon={10.199028} lat={53.474251} dir="forward" ref={@ref}>Unterführung der A25</.v>.</p>

    <%= Data.Article.Shared.bezirksroute(:bergedorf) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
