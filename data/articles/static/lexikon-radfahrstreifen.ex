defmodule Data.Article.Static.LexikonRadfahrstreifen do
  use Article.Static

  def name(), do: "lexikon/radfahrstreifen"
  def title(), do: "Lexikon · Radfahrstreifen"

  def summary(),
    do: "Radfahrstreifen sind asphaltierte Radwege direkt neben den KFZ-Spuren"

  def tags(), do: ["lexikon", "radfahrstreifen", "radfahrstreifens"]

  @spec text(any) :: Phoenix.LiveView.Rendered.t()
  def text(assigns) do
    ~H"""
    <p><.m bounds="9.944998,53.563638,9.954255,53.565782" lon="9.9503139" lat="53.564714" ref="13" dir="backward">Videobeispiel eines Radfahrstreifen auf Veloroute 13</.m></p>

    <p>Radfahrstreifen werden auf dem gleichen Niveau geführt wie die KFZ-Fahrspuren und durch einen weißen „Breitstrich“ von diesen abgegrenzt. KFZ dürfen den Radfahrstreifen nicht benutzen – befahren, halten oder parken sind verboten. Die einzige Ausnahme ist um Einfahrten oder Parkplätze rechts des Radfahrstreifens zu erreichen; man spricht hier häufig von „überfahren“.</p>

    <img src="/images/radfahrstreifen.svg" class="roaddiagram" />

    <p>Die vereinfachte Draufsicht entspricht was in Hamburg um 2020 häufig umgesetzt wurde: 2,30m Fußweg, 1,85m Radfahrstreifen (inkl. Kanalrinne), 3,25m Autospur und dann das ganze nochmal spiegelverkehrt für die Gegenrichtung. Nicht in der Grafik dargestellt sind die typischen Baumreihen zwischen Radfahrstreifen und Fußweg, wo auch häufig Radanlehnbügel oder KFZ-Parkplätze angeboten werden.</p>

    <h4>Breitenangaben bei Radfahrstreifen</h4>
    <p>In den meisten Planungen werden sowohl die Kanalrinne, als auch der 25cm „Breitstrich“ zur KFZ-Spur hin dem Radfahrstreifen zugeschlagen. Den Breitstrich mitbenutzen darf man nicht, auch ein Überfahren mit dem Lenker ist nicht erlaubt. Die Kanalrinne ist für einfache Fahrräder meist verschmerzbar, für Lastenräder aber problematisch. Kurzum: man schönt die Werte.
    </p>

    <p>Auf <em>veloroute.hamburg</em> orientieren sich die Breitenangaben an der nutzbaren Breite für einspurige Fahrräder. Sprich, die 25cm des „Breitstrich“ werden von den offiziellen Angaben abgezogen, die Kanalrinne aber nicht.</p>
    """
  end
end
