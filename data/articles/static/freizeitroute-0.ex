defmodule Data.Article.Static.Freizeitroute0 do
  use Article.Static

  def id(), do: "1GR"
  def route_group(), do: :freizeit
  def name(), do: "erster-gruener-ring"
  def title(), do: "1. Grüner Ring (1GR)"

  def color(), do: "#006106"
  def color_faded(), do: "#77ba7b"

  def summary(),
    do: "Video und Beschreibung zur Freizeit Radroute „1. Grüner Ring“"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "1. Grüner Ring",
        direction: :forward,
        from: "Alter Elbpark",
        via: ["Lombardsbrücke Süd", "Kehrwiedersteg Nord"],
        to: "Alter Elbpark",
        parent_ref: __MODULE__,
        text: "im Uhrzeigersinn entlang der Wallanlagen",
        end_action: :loop,
        historic: %{
          "861d51b4e28aaf9672747886af57cb6f" => ~d[2024-03],
          "e8975618b6fd00327000773350ced41d" => ~d[2021-07]
        },
        videos: [
          {"2024-03-16-fr8-gr1uhr/GX016885", :start, "00:00:17.751"},
          {"2024-03-16-fr8-gr1uhr/GX016868", "00:00:10.110", :end},
          {"2024-03-16-fr8-gr1uhr/GX016869", :start, :end},
          {"2024-03-16-fr8-gr1uhr/GX016870", :start, :end},
          {"2024-03-16-fr8-gr1uhr/GX016871", :start, :end},
          {"2024-03-16-fr8-gr1uhr/GX016872", :start, :end},
          {"2024-03-16-fr8-gr1uhr/GX016873", :start, :end},
          {"2024-03-16-fr8-gr1uhr/GX016874", :start, :end},
          {"2024-03-16-fr8-gr1uhr/GX016875", :start, :end},
          {"2024-03-16-fr8-gr1uhr/GX016876", :start, :end},
          {"2024-03-16-fr8-gr1uhr/GX016877", :start, :end},
          {"2024-03-16-fr8-gr1uhr/GX016878", :start, :end},
          {"2024-03-16-fr8-gr1uhr/GX016879", :start, :end},
          {"2024-03-16-fr8-gr1uhr/GX016880", :start, :end},
          {"2024-03-16-fr8-gr1uhr/GX016881", :start, :end},
          {"2024-03-16-fr8-gr1uhr/GX016882", :start, :end},
          {"2024-03-16-fr8-gr1uhr/GX016883", :start, :end},
          {"2024-03-16-fr8-gr1uhr/GX016884", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "1. Grüner Ring",
        direction: :backward,
        from: "Alter Elbpark",
        via: ["Kehrwiedersteg Süd", "Lombardsbrücke Nord"],
        to: "Alter Elbpark",
        parent_ref: __MODULE__,
        text: "gegen Uhrzeigersinn entlang der Wallanlagen",
        end_action: :loop,
        historic: %{
          "6d1d6e1e622ea219ef0e28bd0ef557fd" => ~d[2024-03],
          "3b9a13385e69b6b3bf18724083610d21" => ~d[2021-07]
        },
        videos: [
          {"2024-03-17-fr14/GX016926", :start, :end},
          {"2024-03-17-fr14/GX016927", :start, :end},
          {"2024-03-17-fr14/GX016928", :start, "00:00:03.937"},
          {"2024-03-17-fr14/GX016909", "00:00:02.402", :end},
          {"2024-03-17-fr14/GX016910", :start, :end},
          {"2024-03-17-fr14/GX016911", :start, :end},
          {"2024-03-17-fr14/GX016912", :start, "00:00:34.835"},
          {"2024-03-17-fr14/GX016912", "00:00:39.039", :end},
          {"2024-03-17-fr14/GX016913", :start, :end},
          {"2024-03-17-fr14/GX016914", :start, :end},
          {"2023-05-21-vr12-vr9/GX015819", :start, "00:00:01.068"},
          {"2024-03-17-fr14/GX016915", :start, :end},
          {"2024-03-17-fr14/GX016916", :start, :end},
          {"2024-03-17-fr14/GX016917", :start, :end},
          {"2024-03-17-fr14/GX016918", :start, :end},
          {"2024-03-17-fr14/GX016919", :start, :end},
          {"2024-03-17-fr14/GX016920", :start, :end},
          {"2024-03-17-fr14/GX016921", :start, :end},
          {"2024-03-17-fr14/GX016922", :start, :end},
          {"2024-03-17-fr14/GX016923", :start, :end},
          {"2024-03-17-fr14/GX016924", :start, :end},
          {"2024-03-17-fr14/GX016925", :start, "00:00:14.214"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt", "https://www.hamburg.de/freizeit-radtouren/8628594/radtouren/"},
      {"Komoot Routenplaner: 1. Grüner Ring", "https://www.komoot.de/tour/227484667"},
      {"„Kunstmeile“ Hamburg (Marketing- und Infoseite)", "https://kunstmeile-hamburg.de/"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/9038695"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 1. Grüner Ring – Wallanlagen <.icon>1GR</.icon></h3>
    <span class="updated">Länge rund 7km</span>

    <p>Diese kurze Ringroute führt im Uhrzeigersinn zunächst entlang der <.v bounds="9.9681,53.544241,9.994315,53.561761" lon={9.975699} lat={53.552291} dir="forward" ref={@ref}>ehemaligen Wallanlagen</.v>, bzw. an den heute an ihrer Stelle stehenden Parks. Nach der <.v bounds="9.992262,53.554327,10.004718,53.559976" lon={9.997233} lat={53.556813} dir="forward" ref={@ref}>Alsterquerung</.v> geht die Route in die „<.v bounds="9.999629,53.545007,10.009219,53.55806" lon={10.000217} lat={53.555789} dir="forward" ref={@ref}>Kunstmeile</.v>“ über, ein Abschnitt mit vielen Museen und Kunstaustellungen. Über die <.v bounds="9.98148,53.540509,10.01194,53.547049" lon={10.003414} lat={53.546288} dir="forward" ref={@ref}>HafenCity</.v> und entlang des <.v bounds="9.969659,53.543341,9.983004,53.546193" lon={9.976321} lat={53.54437} dir="forward" ref={@ref}>Hochbahn-Viadukts</.v> kommt man wieder zurück zum Ausgangspunkt.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und hat viele unerwartete Abzweigungen. Ein Navi ist erforderlich.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Route ist meist gepflastert und hat stellenweise sogar Winterdienst. Allerdings machen die vielen Ampeln eine durchgehende Fahrt unmöglich. Man kann stellenweise in die Parks oder auf den Deich ausweichen, allerdings muss man dann schieben.</p>

    <h4>Meinung</h4>
    <p>Ich muss davon abraten diese Route mit dem Fahrrad abzufahren. Man fährt an Autotrassen am Grün vorbei und wird durch häufige und schlecht geschaltene Ampeln ausgebremst. Zu Fuß ist diese Tour eher zu empfehlen. Als Verbindungsstrecke zwischen anderen Zielen oder um Freizeitrouten zu verknüpfen taugt sie aber.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
