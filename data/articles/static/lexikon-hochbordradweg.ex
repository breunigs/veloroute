defmodule Data.Article.Static.LexikonHochbordradweg do
  use Article.Static

  def name(), do: "lexikon/hochbordradweg"
  def title(), do: "Lexikon · Hochbordradweg"

  def summary(),
    do: "Hochbordradwege sind meist rot gepflastert und verlaufen neben den Fußwegen"

  def tags(), do: ["lexikon", "hochbordradweg", "hochbordradwegen", "hochbordradwege"]

  def tracks(), do: Data.Article.Static.Alltagsroute5.tracks() |> Enum.filter(&(&1.group == "5"))
  def point_of_interest(), do: %{lon: 10.030456, lat: 53.572017, zoom: 16}

  def text(assigns) do
    ~H"""

    <p><.m bounds="9.986512,53.566867,10.034861,53.574044" lon={10.030745} lat={53.571782} dir="forward" ref="5">Videobeispiel eines Hochbordradweges an der Hamburger Meile</.m></p>

    <p>Hochbordradwege werden auf dem gleichen Niveau wie die Fußwege geführt. Sie sind in Hamburg meist gepflastert und bei neuer Bauweise mit Noppenplatten vom Fußweg abgetrennt.</p>
    <p>Zur Breite: die roten Pflastersteine geben den Ausschlag, die Noppenplatten zählen nicht zum Radweg. Hamburg strebt eine Mindestbreite von 1,60m für diese Führungsform an, wobei diese bei „begründeten Ausnahmen“ unterschritten wird. Das ist etwa bei Bäumen oder bestehenden Häusern der Fall. Oft liest man auch von 1,625m breiten Radwegen, welche sich aus den 25cm breiten Pflastersteinen ergeben: man verbaut 6½ um das Mindestmaß zu erreichen.</p>

    <p>Die Schrägansicht verdeutlicht die Höhenunterschiede, die zur leichteren Erkennbarkeit stark übertrieben dargestellt sind:</p>

    <.roaddiagram src="iso_hochbord" alt="Schrägsicht auf einen Hochbordradweg. Im Diagramm ist der Radweg rot gepflastert. Nicht maßstabgerecht, Sicherheitsabstände fehlen."/>

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
    """
  end
end
