defmodule Data.Article.Blog.LouisBraillePlatz do
  use Article.Default

  def title(),
    do: "Louis-Braille-Platz (Veloroute 13)"

  def summary(),
    do: "Platzneugestaltung vor U-Hamburger Straße bringt Zweirichtungs-Hochbordradweg mit sich."

  def type(), do: :planned
  def tags(), do: ["13"]
  def start(), do: ~d[2024]
  def stop(), do: ~d[2024]

  def links(_assigns) do
    [
      {"Erläuterungsbericht 1. Entwurf", "Dezember 2022",
       "https://lsbg.hamburg.de/resource/blob/654202/cdda952a274dcff79c18214f9d84324d/louis-braille-platz-abstimmungsunterlage-bericht-data.pdf"},
      {"Lageplan/Karte 1. Entwurf", "Dezember 2022",
       "https://lsbg.hamburg.de/resource/blob/654204/c4d7c341117a2a57ff69fe22b1bc7bee/louis-braille-platz-abstimmungsunterlage-plan-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Auf der Seite des Platzes stehen je nach Abschnitt ein schmaler <.ref>Radfahrstreifen</.ref> bzw. nach Einmündung <.v bounds="10.035396,53.574119,10.038574,53.575292" lon={10.036655} lat={53.57447} dir="backward" ref="13">Holsteinischer Kamp</.v> ein <.ref>Hochbordradweg</.ref>. An der Einmündung wurde häufig die Vorfahrt der Radfahrenden missachtet und diese angefahren („Unfallhäufungsstelle“).</p>

    <h4>Planung</h4>
    <p>Der Radfahrstreifen wird etwas verbreitert. Zwischen <.v bounds="10.035396,53.574119,10.038574,53.575292" lon={10.035829} lat={53.574981} dir="backward" ref="13">Hamburger Straße</.v> und <.v bounds="10.035396,53.574119,10.038574,53.575292" lon={10.036655} lat={53.57447} dir="backward" ref="13">Holsteinischer Kamp</.v> wird der Hochbordradweg auf 3,5m verbreitert und für beide Fahrtrichtungen freigegeben. Durch die Platzumgestaltung grenzt der Hochbordradweg direkt an einen neu angelegten Grünstreifen, der Fußweg verläuft hinter diesem.</p>

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
