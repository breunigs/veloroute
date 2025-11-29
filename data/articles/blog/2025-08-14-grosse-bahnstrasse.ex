defmodule Data.Article.Blog.GrosseBahnstrasse do
  use Article.Default

  def title(), do: "Große Bahnstraße – Kieler Straße bis Holstenkamp"

  def summary(),
    do:
      "…wird zur Fahrradstraße. Zweirichtungsradweg in der Kieler Straße bindet Eimsbüttel besser an. KFZ-Einbahnstraße verringert Schleichverkehr."

  def type(), do: :planned
  def tags(), do: []

  def start(), do: ~d[2026Q3]
  def stop(), do: ~d[2026Q3]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "x",
        direction: :forward,
        from: "Paciusweg",
        to: "Waidmannstraße",
        parent_ref: __MODULE__,
        text: "Große Bahnstraße Richtung Diebsteich",
        historic: %{
          "ec5c80d8f4ac147f282556bee2502886" => ~d[2024-07]
        },
        videos: [
          {"2025-03-18-halsten/GX018476", "00:01:08.335", :end},
          {"2025-03-18-halsten/GX018477", :start, "00:00:02.669"},
          {"2024-07-13-stelli/GX010035", "00:00:09.710", :end, vf: "scale=2704:1520"},
          {"2024-07-13-stelli/GX010036", :start, "00:00:18.819", vf: "scale=2704:1520"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"1. Entwurf – Karte und Erläuterung", ~d[2025-08],
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1010845"}
    ]
  end

  def map_image do
    {name(),
     [
       {"Bezirksamt Eimsbüttel – Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/bezirksamt-eimsbuettel/ihr-bezirksamt/fachamt-management-des-oeffentlichen-raumes-58482"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In der <.v bounds="9.933462,53.571325,9.941831,53.577975" lon={9.938011} lat={53.57558} dir="forward" ref={@ref}>Großen Bahnstraße</.v> gibt es keine eigenen Radwege. Rad und KFZ teilen sich gleichberechtigt die Fahrbahn im <.ref>Mischverkehr</.ref>. Das erlaubte Höchsttempo ist 50 km/h.</p>

    <p>Eine Führung auf die <.ref>benutzungspflichtigen</.ref> Radwege in der <.v bounds="9.93578,53.574,9.942002,53.57874" lon={9.938011} lat={53.57609} dir="forward" ref={@ref}>Kieler Straße</.v> bzw. den <.v bounds="9.933934,53.570968,9.939857,53.574688" lon={9.93621} lat={53.573061} dir="forward" ref={@ref}>Holstenkamp</.v> fehlt.</p>

    <p>Die Anbindung an <.a ref={BrEimsbuettelSued}>Eimsbüttels Bezirksrouten</.a> via dem <.v bounds="9.936682,53.575102,9.941596,53.577848" lon={9.938667} lat={53.576695} dir="backward" ref={@ref}>Paciusweg</.v> ist durch die ungünstig gelegenen Querungsmöglichkeiten mit Umwegen verbunden.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die Große Bahnstraße wird zu einer Fahrradstraße umgestaltet. Die <.ref>Fahrbahn</.ref> wird dazu auf 5m verschmälert. Sie erhält an den Nebenstraßen Vorrang.</p>

    <p>KFZ dürfen sie nur noch Richtung Norden befahren. An den Einmündungen verdeutlichen eine Verkehrsinsel bzw. Bordsteine („<.ref>Protected-Bike-Lane</.ref>“) die Führung des Radverkehrs in beide Richtungen.</p>

    <p>In der Kieler Straße wird die Querung geradlinig möglich sein. Zudem darf sich der Radverkehr an der Ampel vor den KFZ aufstellen (<.ref>ARAS</.ref>). Der östliche Radweg auf der Kieler Straße wird zu einem 3,0m breiten Zweirichtungsradweg verbreitert. Dadurch kann man vom <.v bounds="9.936682,53.575102,9.941596,53.577848" lon={9.938667} lat={53.576695} dir="backward" ref={@ref}>Paciusweg</.v> die <.v bounds="9.933462,53.571325,9.941831,53.577975" lon={9.938011} lat={53.57558} dir="forward" ref={@ref}>Großen Bahnstraße</.v> ohne Umwege erreichen.</p>

    <p>Die Kreuzung mit dem <.v bounds="9.933934,53.570968,9.939857,53.574688" lon={9.93621} lat={53.573061} dir="forward" ref={@ref}>Holstenkamp</.v> wird zunächst nur teilweise angepasst. Sie soll zur besseren Anbindung des neuen Fernbahnhofs Diebsteich nochmal ganz umgebaut werden.</p>

    <p>Im Endzustand sollen die <.ref>Hochbordradwege</.ref> entlang des Holstenkamp im Kreuzungsbereich zu geradlinigen <.ref>Radfahrstreifen</.ref> werden. Von hier ist nur <.ref>indirektes Linksabbiegen</.ref> möglich. Vom Fernbahnhof kommend soll ein <.ref>ARAS</.ref> aufgemalt werden. Aus der Großen Bahnstraße ist immer nur <.ref>direktes Linksabbiegen</.ref> erlaubt.</p>

    <h4>Meinung</h4>
    <p>Mit der KFZ-Einbahnstraße fällt der meiste KFZ-Schleichverkehr weg. Dennoch sollte die Stadt es sich offenhalten, nachträglich eine <.ref ref={LexikonModalfilter}>Durchfahrtssperre</.ref> zu errichten. Das Schilder gerne ignoriert werden, hat man ja minütlich am Jungfernstieg gesehen.</p>

    <p>Abseits der Details schafft die Stadt mit der Umplanung aber was sie möchte – den neuen Fernbahnhof gut an Eimsbüttel anbinden. Dazu tragen sowohl Große Bahnstraße als auch der Zweirichtungsradweg in der Kiele Straße gleich viel bei.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
