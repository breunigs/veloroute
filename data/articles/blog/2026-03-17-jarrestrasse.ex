defmodule Data.Article.Blog.Jarrestrasse do
  use Article.Default

  def title(), do: "Jarrestraße"

  def summary(),
    do:
      "Die Jarrestraße soll beidseitig ca. 1,65m breite Schutzstreifen erhalten. An Einmündungen werden sie rot gefärbt, an den Bushaltestellen unterbrochen."

  def type(), do: :planned
  def start(), do: ~d[2026Q2]

  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "m2",
        direction: :forward,
        from: "Barmbeker Straße",
        to: "Saarlandstraße",
        parent_ref: __MODULE__,
        text: "Richtung Saarlandstraße",
        historic: %{"7cdf475232da6e5f3a3deb7e6a16020b" => ~d[2023-04]},
        videos: [
          {"2023-04-02-br-wandsbek/GX015388", :start, :end},
          {"2023-04-02-br-wandsbek/GX015389", :start, "00:00:07.006"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "m2",
        direction: :backward,
        from: "Saarlandstraße",
        to: "Barmbeker Straße",
        parent_ref: __MODULE__,
        text: "Richtung Barmbeker Straße",
        historic: %{"c29dff973560850f8277e7e3f822e188" => ~d[2023-11]},
        videos: [
          {"2023-11-25-random/GX016703", :start, :end},
          {"2023-11-25-random/GX016704", :start, "00:00:08.006"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Stellungnahme ADFC", ~d[2026-03],
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1016391"},
      {"Erläuterungen und Karten", ~d[2026-03],
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1016358"}
    ]
  end

  def map_image do
    {name(),
     [
       {"Bezirksamt Nord, Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/hamburg-nord/fachamt-management-des-oeffentlichen-raums-70286"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es gibt in der Jarrestraße bisher keine eigenen Radwege. Geradelt werden muss auf der <.ref>Fahrbahn</.ref> im <.ref>Mischverkehr</.ref> bei Tempo-50.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Es ist geplant beidseitig <.ref>Schutzstreifen</.ref> von ca. 1,65m Breite aufzumalen. An Einmündungen und Kreuzungen sollen sie rot eingefärbt werden. An den Bushaltestellen und den vorhandenen <.ref>Mittelinseln</.ref> wird der Schutzstreifen unterbrochen.</p>

    <p>An der <.v bounds="10.030449,53.585647,10.036023,53.588995" lon={10.032727} lat={53.587045} dir="forward" ref={@ref} highlight="Saarlandstraße">Einmündung zur Saarlandstraße</.v> soll zum Linksabbiegen eine Aufstellfläche vor den KFZ (<.ref>ARAS</.ref>) aufgemalt werden.</p>

    <p>An der <.v bounds="10.016738,53.582062,10.023748,53.586699" lon={10.020195} lat={53.583945} dir="backward" ref={@ref}>Barmbeker Straße</.v> soll der Schutzstreifen auf den vorhandenen <.ref>Hochbordradweg</.ref> geleitet werden. <.ref>Direktes Linksabbiegen</.ref> bleibt weiterhin möglich.</p>

    <h4>Meinung</h4>
    <p>Laut Bericht seien für die Straße vorerst keine Kapazitäten vorhanden. Grund: das Bezirksroutennetz gehe vor.</p>

    <p>Als Zwischenlösung ist der Schutzstreifen in Ordnung. Trotz Unzulänglichkeiten dürfte er den Radverkehr steigern. Das hilft dann auch als Argument beim Vollumbau.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
