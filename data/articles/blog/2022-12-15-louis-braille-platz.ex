defmodule Data.Article.Blog.LouisBraillePlatz do
  use Article.Default

  def title(),
    do: "Louis-Braille-Platz (Radroute 17)"

  def summary(),
    do: "Platzneugestaltung vor U-Hamburger Straße bringt Zweirichtungs-Hochbordradweg mit sich."

  def type(), do: :construction
  def tags(), do: ["radroute-17", "13"]

  def start(), do: ~d[2025-09-22]
  def stop(), do: ~d[2026-11-13]

  def construction_site_id_hh(), do: [1_706_277]

  def links(_assigns) do
    [
      {"Baustelleninfo", ~d[2025-09],
       "https://lsbg.hamburg.de/resource/blob/1096550/03f56e63a39f795b94d99f2764c2c425/louis-braille-platz-anliegerinformation-september-2025-data.pdf"},
      {"Politik blockiert Umbau nicht mehr", ~d[2025-02],
       "https://www.abendblatt.de/hamburg/hamburg-nord/article408394749/barmbek-umbau-aufregung-um-louis-braille-platz-alles-hing-nur-an-zwei-parkplaetzen.html"},
      {"Politik blockiert Umbau", ~d[2025-01],
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1014770"},
      {"Erläuterungsbericht fertiger Entwurf", "Februar 2024",
       "https://lsbg.hamburg.de/resource/blob/784252/618885a6f8c6eb852af4a40c1c633b50/louis-braille-platz-abgestimmte-planung-bericht-data.pdf"},
      {"Lageplan/Karte fertiger Entwurf", "Februar 2024",
       "https://lsbg.hamburg.de/resource/blob/784254/b628ad8a6736db281fc426c9fbdaa817/louis-braille-platz-abgestimmte-planung-plan-data.pdf"},
      {"Erläuterungsbericht 1. Entwurf", "Dezember 2022",
       "https://web.archive.org/web/20230413211548if_/https://lsbg.hamburg.de/resource/blob/654202/cdda952a274dcff79c18214f9d84324d/louis-braille-platz-abstimmungsunterlage-bericht-data.pdf"},
      {"Lageplan/Karte 1. Entwurf", "Dezember 2022",
       "https://web.archive.org/web/20230413211608if_/https://lsbg.hamburg.de/resource/blob/654204/c4d7c341117a2a57ff69fe22b1bc7bee/louis-braille-platz-abstimmungsunterlage-plan-data.pdf"}
    ]
  end

  def map_image do
    {name(),
     [
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"},
       {"Schmeck · Junker Ingenieurgesellschaft mbH", "https://schmeck-junker.de/kontakt/"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Auf der Seite des Platzes stehen je nach Abschnitt ein schmaler <.ref>Radfahrstreifen</.ref> bzw. nach Einmündung <.v bounds="10.035396,53.574119,10.038574,53.575292" lon={10.036655} lat={53.57447} dir="backward" ref={Alltagsroute13}>Holsteinischer Kamp</.v> ein <.ref>Hochbordradweg</.ref>. An der Einmündung wurde häufig die Vorfahrt der Radfahrenden missachtet und diese angefahren („Unfallhäufungsstelle“).</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der Radfahrstreifen wird etwas verbreitert. Zwischen <.v bounds="10.035396,53.574119,10.038574,53.575292" lon={10.035829} lat={53.574981} dir="backward" ref={Alltagsroute13}>Hamburger Straße</.v> und <.v bounds="10.035396,53.574119,10.038574,53.575292" lon={10.036655} lat={53.57447} dir="backward" ref={Alltagsroute13}>Holsteinischer Kamp</.v> wird der Hochbordradweg auf 3,5m verbreitert und für beide Fahrtrichtungen freigegeben. Durch die Platzumgestaltung grenzt der Hochbordradweg direkt an einen neu angelegten Grünstreifen, der Fußweg verläuft hinter diesem.</p>

    <p>Der Holsteinische Kamp wird KFZ-Einbahnstraße Richtung Wagnerstraße, Radverkehr ist weiterhin in beide Richtungen möglich. Vor dem U-Bahnhof werden zahlreiche Radanschließmöglichkeiten ergänzt. Der Platz selbst wird begrünt, für den Fußverkehr und zum Verweilen hergerichtet. Der KFZ-Parkplatz verschiebt sich in den Holsteinischen Kamp, wo er weniger stört.</p>

    <h4>Beteiligungsverfahren</h4>
    <p>Anfang 2023 soll eine zweite Beteiligungsveranstaltung zur Platzumgestaltung stattfinden.</p>

    <h4>Meinung</h4>
    <p>Der Vorschlag für den Platz selbst kann sich sehen lassen. Mit dem Zweirichtungsradweg bleibt jedoch die Unfallgefahr, da nicht mit Fahrrädern aus dieser Richtung gerechnet wird. Immerhin ist es jetzt legal und ohne abzusteigen möglich, mit dem Fahrrad von der Hamburger Straße zum Holsteinischen Kamp zu kommen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
