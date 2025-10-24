defmodule Data.Article.Blog.OsterfeldstrasseLokstedterWeg do
  use Article.Default

  def title(), do: "Osterfeldstraße und Lokstedter Weg"

  def summary(),
    do:
      "Radwege erhalten neue Oberflächen, bleiben sonst aber meist wie bisher. Verbesserungen vor allem punktuell."

  def type(), do: :planned

  def start(), do: ~d[2026-02]
  def stop(), do: ~d[2026-10]

  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "x",
        direction: :forward,
        from: "Rissen",
        to: "Öjendorf",
        parent_ref: __MODULE__,
        text: "von Rissen nach Öjendorf",
        historic: %{
          "356d05ef110a8bcfcff6c23c29b305d6" => ~d[2023-10]
        },
        videos: [
          {"2023-10-22-br-nord-reg/GX016464", :start, "00:00:51.708"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Bauvergabe", ~d[2025-10],
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/eva/supplierportal/fhh/subproject/91c569f0-cb9b-461a-9155-2cbc26205fe3/details"}
    ]
  end

  def map_image do
    {name(),
     [
       {"SBI beratende Ingenieure für BAU-VERKEHR-VERMESSUNGS GmbH", "https://www.sbi.de/"},
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Auf beiden Seiten sind rund 1,25m breite <.ref>Hochbordradwege</.ref> vorhanden. Ihre Oberflächen wechseln und sind uneben. Eine gut erkennbare Abgrenzung zum Gehweg fehlt.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die Radwege erhalten im Wesentlichen einen neuen Belag. An Einfahrten soll der Radweg durchgängig werden. Zusätzlich werden weiße Noppensteine als Abrenzung zum Gehweg eingesetzt.</p>

    <p>Querungsfurten über einmündende Straßen rücken näher Richtung <.ref>Fahrbahn</.ref>, sodass geradliniger gequert werden kann. Sie werden meist breiter als heute.</p>

    <p>Kurz nach der <.m bounds="9.966921,53.596868,9.971591,53.59968">Höxterstraße</.m> bis zur <.m bounds="9.966921,53.596868,9.971591,53.59968">Corveystraße</.m> wird der Radweg als Zweirichtungsradweg mit 2,5m Breite eingerichtet.</p>

    <p>An Bushaltestellen wird teilweise ein gemeinsamer Rad- und Gehweg ausgeschildert. Die <.v bounds="9.977868,53.596428,9.98085,53.597991" lon={9.979722} lat={53.597209} dir="backward" ref={@ref}>Haltestelle Frickestraße auf der Nordseite</.v> wird zum Halten-auf-der-Fahrbahn (statt Busbucht) umgebaut. An der <.m bounds="9.97113,53.597612,9.974383,53.599235">Lottestraße</.m> auf Seite des Supermarkts wird die Wartefläche für Fahrgäste vergrößert.</p>

    <h4>Meinung</h4>
    <p>Ohne die Straßenaufteilung zu ändern, ist nicht viel zu machen. Entsprechend dürftig fällt das Ergebnis aus. Die punktuellen Verbesserungen sind hilfreich und räumen einige Probleme aus. Langsamere überholen ist – bis auf eine Ausnahme – auch weiterhin nicht möglich.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
