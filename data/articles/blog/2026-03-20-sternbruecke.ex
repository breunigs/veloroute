defmodule Data.Article.Blog.Sternbruecke do
  use Article.Default

  def title(), do: "Sternbrücke (Radroute 14)"

  def summary(),
    do:
      "Verkehrsversuch nach Einhub der neuen Sternbrücke: Erstmals eigene Radwege, teilweise als Protected-Bike-Lane oder geteilte Busspur."

  def type(), do: :intent
  def start(), do: ~d[2026Q3]
  def stop(), do: ~d[2026Q3]

  def tags(), do: ["radroute-14"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :forward,
        from: "S-Bahnhof Holstenstraße",
        to: "Bernstorffstraße",
        parent_ref: __MODULE__,
        text: "Stresemannstraße stadteinwärts",
        historic: %{
          "fab3aa6fc4be6bb508f9d46ce6236ea2" => ~d[2026-03]
        },
        videos: [
          {"2026-03-20-sternbruecke2/GX010076", "00:01:52.212", "00:02:08.996"},
          {"2026-03-20-sternbruecke2/GX010076", "00:02:16.570", "00:02:31.084"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :backward,
        from: "Juliusstraße",
        to: "Neue Flora",
        parent_ref: __MODULE__,
        text: "Stresemannstraße stadtauswärts",
        historic: %{
          "1bf3a26e02b1fd25fd756848bf55d30f" => ~d[2026-03]
        },
        videos: [
          {"2026-03-20-sternbruecke2/GX010076", "00:01:11.838", "00:01:39.032"}
        ]
      }
    ]

  def map_image do
    {name(),
     [
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
     ]}
  end

  def links(_assigns) do
    [
      {"Präsentation zum Verkehrsversuch", ~d[2026-03],
       "https://lsbg.hamburg.de/resource/blob/1156938/7cd70ebe2259e034d814ffb884379dd1/stresemannstrasse-provisorium-praesentation-mobilitaetsausschuss-altona-data.pdf"}
    ]
  end

  def text(assigns) do
    assigns =
      assign(assigns,
        vollumbau:
          [
            Settings.r(:video_serve_host),
            Settings.r(:video_serve_path),
            "map_images",
            "sternbruecke_skizze_lsbg.webp"
          ]
          |> Util.compact()
          |> Path.join()
      )

    ~H"""
    <h4>Alter Zustand</h4>
    <p>Im Bereich der Sternbrücke fehlen eigene Radwege. Die Gehwege sind stellenweise zu schmal. Trotzdem soll Radverkehr entlang der Stresemannstraße auf ihnen fahren.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Nach dem Einhub der neuen Sternbrücke startet ein Verkehrsversuch entlang der Stresemannstraße mit neuer Flächenaufteilung. Die Kreuzung wird komplett hergerichtet, sobald die Brückenarbeiten abgeschlossen sind. Die Ergebnisse des Versuchs fließen in den endgültigen Umbau ein.</p>

    <h5>Verkehrsversuch</h5>
    <p>In <.v bounds="9.950044,53.559103,9.95992,53.562861" lon={9.953541} lat={53.56156} dir="forward" ref={@ref}>Richtung Innenstadt</.v> wird der <.ref>Hochbordradweg</.ref> bis zur Brücke verlängert. <.v bounds="9.950044,53.559103,9.95992,53.562861" lon={9.955022} lat={53.561204} dir="forward" ref={@ref}>Ab dort</.v> führt ein Radfahrstreifen bis zur <.v bounds="9.952343,53.559194,9.960519,53.562664" lon={9.9577119} lat={53.5605907} dir="forward" ref={@ref}>Mistralstraße</.v>.</p>

    <p><.v bounds="9.950044,53.559103,9.95992,53.562861" lon={9.957473} lat={53.5609} dir="backward" ref={@ref}>Stadtauswärts</.v> wird der Hochbordradweg vor der <.v bounds="9.950044,53.559103,9.95992,53.562861" lon={9.9569722} lat={53.5609206} dir="backward" ref={@ref}>Eifflerstraße</.v> auf eine geteilte Bus/Radspur gelenkt. Vor der Kreuzung geht daraus ein <.ref>Radfahrstreifen</.ref> hervor. Dieser reicht bis zur <.v bounds="9.950044,53.559103,9.95992,53.562861" lon={9.9540629} lat={53.5616009} dir="backward" ref={@ref}>Oelkersallee</.v> und lenkt dort auf den vorhandenen Radweg.</p>

    <p>Zudem werden Busspuren jeweils in Fahrtrichtung zur Sternbrücke eingerichtet. Sie beginnen am <.v bounds="9.946796,53.560085,9.956671,53.563843" lon={9.949038} lat={53.562051} dir="forward" ref={@ref}>S-Bahnhof Holstenstraße</.v> bzw. am <.v bounds="9.952643,53.555581,9.969115,53.562979" lon={9.962816} lat={53.558764} dir="backward" highlight="Neuer Pferdemarkt" ref={BrMitte02}>Neuen Pferdemarkt</.v>.</p>

    <h5>Vollumbau</h5>
    <p>Bei positivem Verlauf des Verkehrsversuchs bleibt die Straßenaufteilung erhalten. Der LSBG zeigt in einer Skizze, wie der Endzustand aussehen könnte:</p>

    <.a href={@vollumbau} target="_blank">
      <img src={@vollumbau} width="994" height="680" alt="Mögliche Straßenaufteilung nach Vollumbau. © LSBG" style="max-width: 100%; height: auto; margin-top: 0.5rem; margin-bottom: -0.5rem"/>
    </.a>

    <h4>Meinung</h4>
    <p>Der Verkehrsversuch nutzt die Bauzeit sinnvoll und trägt dazu bei, Planungsfehler zu finden bevor sie teuer werden.</p>

    <p>Die Schaffung angemessener Wege für Fuß- und Radverkehr war längst überfällig. Die neuen Busspuren betonen die Bedeutung des ÖPNV entlang der Stresemannstraße.</p>

    <p>Trotz bisher mangelhafter Infrastruktur bewältigen Fuß-, Rad- und Busverkehr bereits über zwei Drittel des Gesamtverkehrs. Dies sollte bedacht werden, wenn die Neuaufteilung kritisiert wird.</p>

    <h4>Links</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
