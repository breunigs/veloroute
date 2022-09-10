defmodule Data.Article.Static.LexikonRadfahrstreifen do
  use Article.Static

  def name(), do: "lexikon/radfahrstreifen"
  def title(), do: "Lexikon · Radfahrstreifen"

  def summary(),
    do: "Radfahrstreifen sind asphaltierte Radwege direkt neben den KFZ-Spuren"

  def tags(), do: ["lexikon", "radfahrstreifen", "radfahrstreifens"]

  def tracks(), do: Data.Article.Static.Alltagsroute13.tracks()
  def point_of_interest(), do: %{lon: 9.9503139, lat: 53.564714, zoom: 16}

  @spec text(any) :: Phoenix.LiveView.Rendered.t()
  def text(assigns) do
    ~H"""
    <p><.m bounds="9.944998,53.563638,9.954255,53.565782" lon="9.9503139" lat="53.564714" ref="13" dir="backward">Videobeispiel eines Radfahrstreifen in der Alsenstraße</.m></p>

    <p>Radfahrstreifen werden auf dem gleichen Niveau geführt wie die KFZ-Fahrspuren und durch einen weißen „Breitstrich“ von diesen abgegrenzt. KFZ dürfen den Radfahrstreifen nicht benutzen – befahren, halten oder parken sind verboten. Die einzige Ausnahme ist um Einfahrten oder Parkplätze rechts des Radfahrstreifens zu erreichen; man spricht hier häufig von „überfahren“.</p>

    <.roaddiagram src="radfahrstreifen" alt="Eine Straßenansicht von oben (Vogelperspektive) die zeigt wo Radfahrstreifen verlaufen und wie diese in Hamburg häufig gestaltet werden."/>

    <p>Die vereinfachte Draufsicht entspricht was in Hamburg um 2020 häufig umgesetzt wurde: 2,30m Fußweg, 1,85m Radfahrstreifen (inkl. Kanalrinne), 3,25m Autospur und dann das ganze nochmal spiegelverkehrt für die Gegenrichtung. Die Schrägansicht verdeutlicht die Höhenunterschiede, die zur leichteren Erkennbarkeit stark übertrieben dargestellt sind:</p>

    <.roaddiagram src="iso_radfahrstreifen" alt="Schrägsicht auf einen Radfahrstreifen. Im Diagramm ist der Asphalt des Radwegs rot eingefärbt. Nicht maßstabgerecht, Sicherheitsabstände fehlen."/>

    <p>Nicht in den Grafiken dargestellt sind die typischen Baumreihen zwischen Radfahrstreifen und Fußweg, wo auch häufig Radanlehnbügel oder KFZ-Parkplätze angeboten werden.</p>

    <h4>Breitenangaben bei Radfahrstreifen</h4>
    <p>In den meisten Planungen werden sowohl die Kanalrinne, als auch der 25cm „Breitstrich“ zur KFZ-Spur hin dem Radfahrstreifen zugeschlagen. Den Breitstrich mitbenutzen darf man nicht, auch ein Überfahren mit dem Lenker ist nicht erlaubt. Die Kanalrinne ist für einfache Fahrräder meist verschmerzbar, für Lastenräder aber problematisch. Kurzum: man schönt die Werte.
    </p>

    <p>Auf <em>veloroute.hamburg</em> orientieren sich die Breitenangaben an der nutzbaren Breite für einspurige Fahrräder. Sprich, die 25cm des „Breitstrich“ werden von den offiziellen Angaben abgezogen, die Kanalrinne aber nicht.</p>


    <h3>Variantenvergleich</h3>
    <table>
      <tr>
        <th>Variante</th>
        <th>zur KFZ-Spur</th>
        <th>zum Fußweg</th>
      </tr>
      <tr>
        <td><.ref>Hochbordradweg</.ref></td>
        <td>hoher Randstein</td>
        <td>ebenerdig</td>
      </tr>
      <tr>
        <td><.ref>Kopenhagener Radweg</.ref></td>
        <td>halbhoher Randstein</td>
        <td>halbhoher Randstein</td>
      </tr>
      <tr>
        <td><.ref>Radfahrstreifen</.ref></td>
        <td>ebenerdig</td>
        <td>hoher Randstein</td>
      </tr>
      <tr>
        <td><.ref>geschützte Radfahrstreifen</.ref></td>
        <td>hoher Randstein</td>
        <td>hoher Randstein</td>
      </tr>
    </table>

    <h3>Meinung</h3>
    <p>Radfahrstreifen stellen eine deutliche Trennung vom Fußverkehr her, aber keine zum KFZ-Verkehr. Falschparken, Schneiden und mangelnder Überholabstand sind daher tägliche Probleme auf dieser Führungsform. In Hamburg werden sie häufig eingesetzt, um KFZ-Parkplätze rechts des Radwegs zu erhalten, sodass es zu weiteren, aber legalen, Behinderungen kommt. Sie sind für den Radverkehr daher nur bedingt geeignet und für längere Abschnitte eher ungeeignet.</p>
    """
  end
end
