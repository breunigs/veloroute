defmodule Data.Article.Blog.AmpelAltonaerStrasseBartelsstrasse do
  use Article.Default

  def title(), do: "Ampel Altonaer Straße / Bartelsstraße (Radroute 14)"

  def summary(),
    do:
      "Protected-Bike-Lane im Bereich der Ampel. Mehr Aufstellfläche für Fuß und Rad zum Queren der Ampel. Lücke in der Allee wird geschlossen."

  def type(), do: :planned
  def tags(), do: ["radroute-14"]

  def start(), do: ~d[2026-06-26]
  def stop(), do: ~d[2026-09-04]
  def construction_site_id_hh(), do: [3_288_932]

  def links(_assigns) do
    [
      {"Baustelleninfo", ~d[2026-06],
       "https://lsbg.hamburg.de/resource/blob/1186228/54064cb6d0d9dd9ec9842ed4e0fe7283/altonaer-strasse-baustelleinfo-flsa-juni-2026-data.pdf"},
      {"fertiger Entwurf – Karte", ~d[2025-08],
       "https://lsbg.hamburg.de/resource/blob/1090100/5c8bf63c1473d22b9ba131e57b5ae544/altonaer-str-bartelsstr-flsa-abgestimmte-planung-plan-data.pdf"},
      {"fertiger Entwurf – Erläuterungen", ~d[2025-08],
       "https://lsbg.hamburg.de/resource/blob/1090034/6a432f7e5100065c99b94ed409d7210b/altonaer-str-bartelsstr-flsa-abgestimmte-planung-bericht-data.pdf"}
    ]
  end

  def map_image do
    {name(),
     [
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"},
       {"Urban Ingenieurteam", "mailto:mail@urban-ingenieurteam.de"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Breiten der <.ref>Hochbordradwege</.ref> (1,0m) und Gehwege (1,5m) rund um die Ampel sind schmal. Wegen hohem Rad- und Fußverkehr kommt es deswegen regelmäßig zu Problemen.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Es ist vorgesehen den Radverkehr in <.v bounds="9.962136,53.564016,9.966056,53.565694" lon={9.962849} lat={53.564447} dir="forward" ref={Radroute14}>Fahrtrichtung Schlump</.v> über einer 2,10m breite <.ref>Protected-Bike-Lane</.ref> zu führen. Der Anschluss an die vorhandenen Radwege erfolgt an der Einmündung <.v bounds="9.961477,53.56389,9.963483,53.564976" lon={9.962131} lat={53.56424} dir="forward" ref={Radroute14}>Bartelsstraße</.v> bzw. <.v bounds="9.961477,53.56389,9.963483,53.564976" lon={9.962963} lat={53.564457} dir="forward" ref={Radroute14}>direkt nach der Ampel</.v>.</p>

    <p>Zum <.ref>indirekten Linksabbiegen</.ref> wird eine Aufstelltasche vorgesehen.</p>

    <p>Der ehemalige Radweg wird zum Gehweg und zu einem neuen Grünstreifen umfunktioniert. Neue Bäume dort schließen die Lücke in der Allee.</p>

    <h4>Meinung</h4>
    <p>Eine gute Lösung. Leider passt man nur den Bereich um die Ampel an. </p>

    <p>Schön wäre auch, die Nebenstraßen mit durchgängigen Geh- und Radwegen auszustatten, um den Vorrang zu verdeutlichen. Weil es nur ein kleiner Umbau ist, ist das aber zu verschmerzen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
