defmodule Data.Article.Static.Freizeitroute0 do
  use Article.Static

  def id(), do: "1GR"
  def route_group(), do: :freizeit
  def name(), do: "erster-gruener-ring"
  def title(), do: "1. Grüner Ring (1GR)"

  def color(), do: "#006106"

  def summary(),
    do: "Video und Beschreibung zur Freizeit Radroute „1. Grüner Ring“"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 1,
        group: "1. Grüner Ring",
        direction: :forward,
        from: "Alter Elbpark",
        via: ["Lombardsbrücke Süd", "Kehrwiedersteg Nord"],
        to: "Alter Elbpark",
        parent_ref: __MODULE__,
        text: "im Uhrzeigersinn entlang der Wallanlagen",
        videos: [
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012352", "00:00:08.642", "00:00:10.911"},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012332", "00:00:03.737", :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012333", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012334", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012335", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012336", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012337", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012338", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012339", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012340", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012341", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012342", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012343", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012344", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012345", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012346", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012347", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012348", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012349", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012350", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012351", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012352", :start, "00:00:08.642"}
        ]
      },
      %Video.Track{
        renderer: 1,
        group: "1. Grüner Ring",
        direction: :backward,
        from: "Alter Elbpark",
        via: ["Kehrwiedersteg Süd", "Lombardsbrücke Nord"],
        to: "Alter Elbpark",
        parent_ref: __MODULE__,
        text: "gegen Uhrzeigersinn entlang der Wallanlagen",
        videos: [
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012312", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012313", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012314", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012315", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012316", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012317", :start, "00:00:03.203"},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012355", "00:00:03.837", "00:00:22.189"},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012317", "00:00:20.220", :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012318", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012319", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012320", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012321", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012322", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012323", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012324", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012325", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012326", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012327", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012328", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012329", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012330", :start, :end}
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

    <p>Diese kurze Ringroute führt im Uhrzeigersinn zunächst entlang der <.m bounds="9.9681,53.544241,9.994315,53.561761" lon="9.975699" lat="53.552291" dir="forward">ehemaligen Wallanlagen</.m>, bzw. an den heute an ihrer Stelle stehenden Parks. Nach der <.m bounds="9.992262,53.554327,10.004718,53.559976" lon="9.997233" lat="53.556813" dir="forward">Alsterquerung</.m> geht die Route in die „<.m bounds="9.999629,53.545007,10.009219,53.55806" lon="10.000217" lat="53.555789" dir="forward">Kunstmeile</.m>“ über, ein Abschnitt mit vielen Museen und Kunstaustellungen. Über die <.m bounds="9.98148,53.540509,10.01194,53.547049" lon="10.003414" lat="53.546288" dir="forward">HafenCity</.m> und entlang des <.m bounds="9.969659,53.543341,9.983004,53.546193" lon="9.976321" lat="53.54437" dir="forward">Hochbahn-Viadukts</.m> kommt man wieder zurück zum Ausgangspunkt.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und hat viele unerwartete Abzweigungen. Ein Navi ist erforderlich.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Route ist meist gepflastert und hat stellenweise sogar Winterdienst. Allerdings machen die vielen Ampeln eine durchgehende Fahrt unmöglich. Man kann stellenweise in die Parks oder auf den Deich ausweichen, allerdings muss man dann schieben.</p>

    <h4>Meinung</h4>
    <p>Ich muss davon abraten diese Route mit dem Fahrrad abzufahren. Man fährt an Autotrassen am Grün vorbei und wird durch häufige und schlecht geschaltene Ampeln ausgebremst. Zu Fuß ist diese Tour eher zu empfehlen. Als Verbindungsstrecke zwischen anderen Zielen oder um Freizeitrouten zu verknüpfen taugt sie aber.</p>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
