defmodule Data.Article.Static.Freizeitroute4 do
  use Article.Static

  def id(), do: "FR4"
  def route_group(), do: :freizeit
  def title(), do: "Billeradweg (FR4)"

  def color(), do: "#006106"
  def color_faded(), do: "#77ba7b"

  def summary(),
    do: "Freizeitroute 4 führt entlang der Bille zur Altmannbrücke"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "Billeradweg",
        direction: :forward,
        from: "Altmannbrücke",
        via: ["Hauptstrecke"],
        to: "Bergedorfer Gehölz",
        parent_ref: __MODULE__,
        text: "entlang der Bille ins Bergedorfer Gehölz",
        historic: %{
          "ae60c74c4d2111438483bdd0ec8cf15d" => ~d[2024-04],
          "d092b1f75d8ca412f00846abcfa80f2e" => ~d[2021-04]
        },
        videos: [
          {"2024-04-06-fr4/GX017044", "00:00:10.010", "00:00:51.251"},
          {"2024-04-06-fr4/GX017046", "00:00:23.690", :end},
          {"2024-04-06-fr4/GX017047", :start, :end},
          {"2024-04-06-fr4/GX017048", :start, "00:01:11.772"},
          {"2024-04-06-fr4/GX017049", :start, "00:00:04.671"},
          {"2024-04-06-fr4/GX017050", :start, :end},
          {"2024-04-06-fr4/GX017051", :start, "00:05:41.441"},
          {"2024-04-06-fr4/GX017052", "00:00:00.534", :end},
          {"2024-04-06-fr4/GX017053", :start, :end},
          {"2024-04-06-fr4/GX017054", :start, :end},
          {"2024-04-06-fr4/GX017055", :start, :end},
          {"2024-04-06-fr4/GX017058", :start, :end},
          {"2024-04-06-fr4/GX017059", :start, "00:02:03.991"},
          {"2024-04-06-fr4/GX017059", "00:02:08.829", "00:02:27.547"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "Billeradweg",
        direction: :backward,
        from: "Bergedorfer Gehölz",
        via: ["Hauptstrecke"],
        to: "Altmannbrücke",
        parent_ref: __MODULE__,
        text: "entlang der Bille in die Innenstadt",
        historic: %{
          "413cb39f99e638336509ee528b8e5a6d" => ~d[2024-04],
          "e7adf4febe427d8f5e6cdf4a90357a33" => ~d[2021-04]
        },
        videos: [
          {"2024-04-06-fr4/GX017060", "00:00:29.029", :end},
          {"2024-04-06-fr4/GX017061", :start, "00:00:26.527"},
          {"2024-04-06-fr4/GX017062", "00:00:01.235", "00:04:44.151"},
          {"2024-04-06-fr4/GX017062", "00:09:54.194", :end},
          {"2024-04-06-fr4/GX017063", :start, :end},
          {"2024-04-06-fr4/GX017064", :start, :end},
          {"2024-04-06-fr4/GX017065", :start, :end},
          {"2024-04-06-fr4/GX017066", :start, :end},
          {"2024-04-06-fr4/GX017067", :start, :end},
          {"2024-04-06-fr4/GX017068", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "Walter-Hammer-Weg",
        direction: :forward,
        from: "Walter-Hammer-Weg West",
        to: "Walter-Hammer-Weg Ost",
        parent_ref: __MODULE__,
        text: "Walter-Hammer-Weg Richtung Osten (Nebenstrecke FR4)",
        end_action: %{
          action: :play,
          route: __MODULE__,
          group: "Billeradweg",
          direction: :forward
        },
        historic: %{
          "f79f4ce74c6658ff7dccd40d2be41a51" => ~d[2024-04],
          "327f571058c788d6c7652aa7ee915255" => ~d[2021-04]
        },
        videos: [
          {"2024-04-06-fr4/GX017062", "00:06:27.587", "00:07:50.603"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "Walter-Hammer-Weg",
        direction: :backward,
        from: "Walter-Hammer-Weg Ost",
        to: "Walter-Hammer-Weg West",
        parent_ref: __MODULE__,
        text: "Walter-Hammer-Weg Richtung Westen (Nebenstrecke FR4)",
        end_action: %{
          action: :play,
          route: __MODULE__,
          group: "Billeradweg",
          direction: :backward
        },
        historic: %{
          "fc0f2a110cc3015d659c6a78522e0bb0" => ~d[2024-04],
          "85ccd74b8a2167063c1f4cf12e45b62d" => ~d[2021-04]
        },
        videos: [
          {"2024-04-06-fr4/GX017062", "00:08:32.979", "00:09:57.030"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294594/radtour-city-geesthang-boberger-niederung-bergedorf/"},
      {"Komoot Routenplaner: entlang der Bille", "https://www.komoot.com/de-de/tour/227476622"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/223231"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 4 – Billeradweg <.icon>FR4</.icon></h3>
    <span class="updated">Länge rund 21km</span>
    <p>Man beginnt <.v bounds="10.004201,53.549656,10.010574,53.554563" lon={10.009} lat={53.550662} dir="forward" ref={@ref}>südlich des Hauptbahnhofs</.v> und folgt zunächst den Straßen entlang der Bahntrasse. Am <.v bounds="10.02236,53.551986,10.028696,53.554641" lon={10.024741} lat={53.553585} dir="forward" ref={@ref}>Berliner Tor</.v> wechselt man auf dem Grünstreifen oberhalb der U2/U4 bis zur <.v bounds="10.064532,53.552192,10.070336,53.554953" lon={10.065094} lat={53.554617} dir="forward" ref={@ref}>Station Rauhes Haus</.v>. Ab hier gelangt man über Treppen oder den Fahrstuhl in der U-Bahnstation hinunter zur Hammer Landstraße und von dort in <.v bounds="10.067029,53.545846,10.082746,53.553467" lon={10.070821} lat={53.55043} dir="forward" ref={@ref}>Kleingärten</.v>.</p>

    <p>Nach einem kurzen Stück Industriegebiet ist man an der <.v bounds="10.070821,53.535759,10.106986,53.55043" lon={10.098308} lat={53.538287} dir="forward" ref={@ref}>Bille</.v> angelangt und folgt ihr durch die <.v bounds="10.070821,53.498738,10.167733,53.55043" lon={10.129413} lat={53.51485} dir="forward" ref={@ref}>Boberger Niederung</.v> bis nach <.v bounds="10.070821,53.486466,10.215925,53.55043" lon={10.209758} lat={53.490112} dir="forward" ref={@ref}>Bergedorf</.v>. Das Ziel der Tour ist das <.v bounds="10.070821,53.488571,10.248662,53.55043" lon={10.2341} lat={53.496215} dir="forward" ref={@ref}>Bergedorfer Gehölz</.v>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und einige Abbiegungen sind kaum erkennbar. Ein Navi ist daher hilfreich, aber nicht unbedingt notwendig. Die Streckenführung ist noch einfach genug sie sich mit etwas Vorbereitung zu merken.</p>

    <h4>Befahrbarkeit</h4>
    <p>Bis <.v bounds="10.070821,53.511133,10.14456,53.55043" lon={10.133133} lat={53.517008} dir="forward" ref={@ref}>Anfang der Boberger Niederung</.v> sind die Wege durchgehend befestigt. Wer über die <.v bounds="10.070821,53.511133,10.14456,53.55043" lon={10.134525} lat={53.516213} dir="forward" ref={@ref}>Nebenroute entlang des Walter-Hammer-Wegs</.v> abkürzt kann noch etwas länger auf Asphalt fahren, bevor die naturnahen Wege (Trampelpfade, Grand) den Hauptteil stellen. Die stadtnahen Wege in Bergedorf sind ebenfalls befestigt.</p>
    <p>Es gibt einige Stellen an denen Überholen nicht möglich ist, insbesondere auf der <.v bounds="10.070821,53.511133,10.14456,53.55043" lon={10.134525} lat={53.516213} dir="forward" ref={@ref}>Nebenroute entlang des Walter-Hammer-Wegs</.v> ist dies kaum möglich. Sei exzellent zu Anderen und steige an diesen Stellen ab, bevor es eng wird. Insgesamt kommt man aber gut und weitgehend ampelfrei durch.</p>

    <h4>Meinung</h4>
    <p>Die Route ist einen Ausflug wert. Der erste Streckenabschnitt um die <.v bounds="10.006037,53.548808,10.070821,53.554946" lon={10.012841} lat={53.549856} dir="forward" ref={@ref}>Norderstraße</.v> lohnt sich jedoch nicht. Es ist besser hier gleich der <.a name="alltagsroute-8">Alltagsroute <.icon link={false}>8</.icon></.a> zu folgen. Alternativ kann man auch von der Alster den <.m bounds="10.010896,53.552599,10.026937,53.561695">Grünzug Lohmühlenstraße</.m> bis zum Berliner Tor nutzen.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
