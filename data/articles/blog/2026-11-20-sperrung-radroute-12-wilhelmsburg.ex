defmodule Data.Article.Blog.SperrungRadroute12Wilhelmsburg do
  use Article.Default

  def title(), do: "Sperrung Radroute 12 in Wilhelmsburg"

  def summary(), do: "Radroute 12 in Wilhelmsburg gesperrt, Umleitung über Georg-Wilhelm-Straße."

  def type(), do: :construction

  def start(), do: ~d[2026-11]
  def stop(), do: ~d[2029-11]

  def tags(), do: ["radroute-12", "radroute-4", "FR6"]

  def map_image do
    {name(),
     [
       {"IBA Hamburg GmbH", "https://www.iba-hamburg.de/de/kontakt"},
       {"De Zwarte Hond GmbH", "https://dezwartehond.nl/contact/"},
       {"RMP Stephan Lenzen Landschaftsarchitekten", "https://rmpsl.la/standort/hamburg"},
       {"MASUCH + OLBRISCH Ingenieurgesellschaft für das Bauwesen mbH",
        "https://moingenieure.de/kontakt"},
       {"IPROconsult GmbH", "https://www.iproconsult.com/de/meta/kontakt"},
       {"BWS GmbH", "https://bws-gmbh.de/kontakt/"}
     ]}
  end

  def links(_assigns) do
    [
      {"IBA Hamburg", ~d[2026-11],
       "https://www.iba-hamburg.de/de/aktuell/sperrung-der-radroute-12-in-wilhelmsburg"},
      {"Bebauungsplan-Entwurf Wilhelmsburg 99 „Südliches Elbinselquartier“", ~d[2026-09],
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/mitte/themen/planen-bauen-wohnen/bebauungsplan-entwurf-wilhelmburg-99-oeffentliche-plandiskussion-1178366"},
      {"Bebauungsplan-Entwurf Wilhelmsburg 100 „Nördliches Elbinselquartier“", ~d[2025-09],
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/mitte/themen/planen-bauen-wohnen/wilhelmsburg-100-oea-1093028"},
      {"Bebauungsplan Wilhelmsburg 91 „Wilhelmsburger Rathausviertel“", ~d[2024-12],
       "https://suche.transparenz.hamburg.de/dataset/bebauungsplan-wilhelmsburg-91-hamburg1"},
      {"Funktionsplan Wilhelmsburger Rathausviertel", ~d[2023-08],
       "https://www.iba-hamburg.de/de/projekte/wilhelmsburger-rathausviertel/downloads"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Baustelle</h4>
    <p>Radroute 12 auf Wilhelmsburg wird voll gesperrt. Die Umleitung erfolgt via <.v bounds="9.990388,53.510885,10.008258,53.521709" lon={10.000683} lat={53.515224} dir="forward" ref={Radroute12}>Vogelhüttendeich</.v> ↔ <.v bounds="9.989903,53.501416,9.994575,53.516976" lon={9.991661} lat={53.504729} dir="forward" ref={Freizeitroute6}>Georg-Wilhelm-Straße</.v> ↔ <.v bounds="9.988747,53.498249,10.001408,53.50723" lon={9.993811} lat={53.50203} dir="forward" ref={Radroute4}>Gert-Schwämmle-Weg</.v>. Grund ist der Neubau von Wohnvierteln. </p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Im Anschluss soll sie dort im Radroute Plus Standard ausgebaut werden (4,0m breit, Asphalt, abgetrennter Gehweg).</p>

    <p>Eine Unterführung an der <.v bounds="9.999634,53.514791,10.001981,53.515859" lon={10.000862} lat={53.515445} dir="forward" ref={Radroute12} map_image>Schlenzigstraße</.v> ermöglicht das konfliktfreie Queren. Mit leicht anderem Verlauf führt die Route bis zur alten Autobahnunterführung beim <.v bounds="9.99376,53.498498,10.002099,53.502576" lon={9.997551} lat={53.500452} dir="forward" ref={Radroute12} map_image>Bürgerhaus See</.v>.</p>

    <p>Auf der weiterführenden <.a ref={Radroute4}>Radroute 4</.a> kommt man mit einer neuen Brücke ohne Warten über die <.v bounds="9.989638,53.497367,10.002083,53.502005" lon={9.997322} lat={53.499354} dir="forward" ref={Radroute12} map_image>Mengestraße</.v>. Ab <.v bounds="9.996645,53.495898,10.00018,53.497777" lon={9.997967} lat={53.496582} dir="forward" ref={Radroute4} map_image>Hauland</.v> trifft die neue Brücke auf die vorhandene Route.</p>

    <h4>Meinung</h4>
    <p>Toll ist die Umleitung nicht – die Georg-Wilhelm-Straße ist zu eng, holprig und laut. Dafür bekommt man nach der Bauzeit zwei neue, konfliktfreien Querungen. Auch der neugebaute Weg wird wieder genauso attraktiv wie der von heute.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
