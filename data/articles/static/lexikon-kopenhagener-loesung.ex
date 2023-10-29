defmodule Data.Article.Static.LexikonKopenagenerLoesung do
  use Article.Static

  def name(), do: "lexikon/kopenhagener-loesung"
  def title(), do: "Lexikon · Kopenhagener Lösung"

  def summary(),
    do:
      "Radwege nach Kopenhagener Lösung sind durch Bordsteine von Fußwegen und KFZ-Streifen getrennt"

  def tags(),
    do: [
      "lexikon",
      "kopenhagener-lösung",
      "kopenhagener-radweg",
      "kopenhagener-radwege",
      "kopenhagener-stil"
    ]

  def tracks(), do: Data.Article.Static.Alltagsroute10.tracks()
  def point_of_interest(), do: %{lon: 10.004687, lat: 53.540797, zoom: 16}

  def text(assigns) do
    ~H"""
    <p><.v bounds="9.999916,53.539131,10.010449,53.542032" lon={10.00548} lat={53.540836} dir="backward" ref="10">Videobeispiel Überseeallee in der HafenCity</.v></p>

    <p>Als Kopenhagener Lösung beschreibt man Radwege, die sowohl vom Fußweg als auch von der KFZ-Spur durch einen Randstein abgetrennt sind. Im Vergleich zu anderen Varianten sind die Randsteine jeweils nur etwa halb so hoch. Der Radweg sitzt von der Höhe also „mittig“. Zur Verdeutlichung sind die Höhenunterschiede in den schematischen Darstellungen stark übertrieben:</p>

    <.roaddiagram src="iso_kopenhagen" alt="Schrägsicht auf einen Radweg im Kopenhagener Stil. Im Diagramm ist der Radweg rot gepflastert. Nicht maßstabgerecht, Sicherheitsabstände fehlen."/>

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
    <p>Mit einem ordentlichen Bordstein können Kopenhagener Radwege eine gute Trennung vom KFZ Verkehr herstellen. Sind die Bordsteine jedoch zu niedrig, stellen sie eine leicht übersehbare Stolper- bzw. Sturzgefahr für Fuß- und Radverkehr dar. Diese Gestaltungsart ist in Hamburg noch neu, es muss sich also noch zeigen ob sie von Stadt und Planungsbüros sinnvoll eingesetzt wird.</p>
    """
  end
end
