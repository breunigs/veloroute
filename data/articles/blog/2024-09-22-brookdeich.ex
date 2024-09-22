defmodule Data.Article.Blog.Brookdeich do
  use Article.Default

  def title(),
    do: "Brookdeich – An der Pollhofsbrücke bis Curslacker Heerdeich (Radroute Plus Geesthacht)"

  def summary(),
    do:
      "Umgestaltung zur Fahrradstraße bringt Vorrang an Kreuzungen und Einmündungen. Private KFZ sollen wieder auf Privatgrund parken um Platz zu schaffen."

  def start(), do: ~d[2024-09-23]
  def stop(), do: ~d[2025-03]

  def type(), do: :planned
  def tags(), do: ["rsw-geesthacht"]

  @attrib {"Bezirksamt Bergedorf, Fachamt Management des öffentlichen Raumes",
           "https://www.hamburg.de/politik-und-verwaltung/bezirke/bergedorf/bezirksamt/dezernat-wirtschaft-bauen-umwelt-56028"}

  def map_image do
    [
      Data.MapImage.new(__MODULE__, @attrib, 1, {
        %{lat: 53.479434020, lon: 10.229466896},
        %{lat: 53.478884629, lon: 10.232933753},
        %{lat: 53.478486273, lon: 10.232755229},
        %{lat: 53.479035663, lon: 10.229288372}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 2, {
        %{lat: 53.478943175, lon: 10.232157578},
        %{lat: 53.478299717, lon: 10.235541858},
        %{lat: 53.478009883, lon: 10.235386114},
        %{lat: 53.478653341, lon: 10.232001834}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 3, {
        %{lat: 53.478378118, lon: 10.235262783},
        %{lat: 53.477713177, lon: 10.238698059},
        %{lat: 53.477337720, lon: 10.238492886},
        %{lat: 53.478002660, lon: 10.235057610}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 4, {
        %{lat: 53.477877037, lon: 10.238432871},
        %{lat: 53.477454607, lon: 10.241218581},
        %{lat: 53.477092125, lon: 10.241063107},
        %{lat: 53.477514555, lon: 10.238277397}
      })
    ]
  end

  def links(_assigns) do
    [
      {"Unterlagen Umbau", ~d[2024-09],
       "https://fragdenstaat.de/anfrage/brookdeich/#nachricht-936449"},
      {"privater Blogpost zum Umbaustart", ~d[2024-09],
       "https://hamburgize.blogspot.com/2024/09/radschnellwegplanung-in-hamburg.html"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Beim Brookdeich handelt es sich um eine wenig befahrene Wohnstraße. Sie ist teilweise KFZ-Einbahnstraße. An Kreuzungen und Einmündungen ist der Brookdeich nicht bevorrechtigt.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der Brookdeich wird zu einer Fahrradstraße. Dazu wird die Rechts-Vor-Links Regelung <.v bounds="10.228957,53.47849,10.231141,53.479808" lon={10.229472} lat={53.479076} dir="forward" ref="rsw-geesthacht">An der Pollhofsbrücke</.v>, am <.v bounds="10.231432,53.478051,10.233484,53.479313" lon={10.232204} lat={53.478775} dir="forward" ref="rsw-geesthacht">Pollhof</.v> und am <.v bounds="10.235172,53.477203,10.237632,53.478581" lon={10.235969} lat={53.477928} dir="forward" ref="rsw-geesthacht">Ellernwinkel</.v> durch Vorfahrt für den Brookdeich ersetzt.</p>

    <p>Die KFZ sollen größtenteils wieder auf den Privatgrundstücken abgestellt werden. Es verbleiben einige Kurzzeitparkplätze um Lieferungen und Handwerk das Parken zu ermöglichen.</p>

    <h4>Meinung</h4>
    <p>Die Straße war bereits gut befahrbar. Nur die schlecht einsehbaren Kreuzungen bremsten aus, was mit der Umgestaltung gelöst wird. Durch die Verlagerung der Privatfahrzeuge auf Privatgrund wird der Abschnitt auch bei Gegenverkehr ohne Anhalten befahrbar.</p>

    <p>Die Vorfahrtsregelung entlang des Brookdeichs <.v bounds="10.228957,53.47849,10.231141,53.479808" lon={10.229472} lat={53.479076} dir="forward" ref="rsw-geesthacht">An der Pollhofsbrücke</.v> hilft im aktuellen Ausbauzustand. Sie soll bei Weiterbau der Radroute Plus über den <.v bounds="10.228267,53.478585,10.230375,53.479642" lon={10.228409} lat={53.478951} dir="forward" ref="rsw-geesthacht" highlight="Schwarzer Weg">Schwarzen Weg</.v> nochmal überprüft werden. </p>

    <p>Leider verzichtet man auf eindeutige Gestaltung nach niederländischem Vorbild. Am Brookdeich ist das noch okay. Stadtweit würde eine klarere Hervorhebung der Fahrradstraßen helfen um die Idee „Auto zu Gast“ besser zu vermitteln.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
