defmodule Data.Article.Static.LexikonProtectedBikeLane do
  use Article.Static

  def name(), do: "lexikon/protected-bike-lane"
  def title(), do: "Lexikon · Protected Bike Lane"

  def summary(),
    do: "Protected Bike Lanes sind durch hohe Bordsteine oder Poller vorm KFZ-Verkehr geschützt"

  def tags(),
    do: [
      "lexikon",
      "protected-bike-lane",
      "protected-bike-lanes",
      "pbl",
      "geschützter-radfahrstreifen",
      "geschützten-radfahrstreifen",
      "geschützte-radfahrstreifen",
      "radroute-1"
    ]

  def links(_assigns) do
    [
      {"Faltblatt der Stadt Protected-Bike-Lanes",
       "https://www.hamburg.de/resource/blob/1014992/40c88d945d594e5aa642214df1e3a9f1/protected-bike-lane-data.pdf"}
    ]
  end

  def tracks(), do: Data.Article.Static.Radroute1.tracks()

  def point_of_interest(), do: %{lon: 9.953226, lat: 53.549677, zoom: 16}

  def text(assigns) do
    ~H"""
    <p><.v bounds="9.939468,53.546688,9.960892,53.552133" lon={9.953226} lat={53.549677} dir="backward" ref="radroute-1">Videobeispiel einer Protected Bike Lane auf Radroute 1</.v></p>

    <p>Unter einer „Protected Bike Lane“, also einer geschützten Radspur, versteht man eine vom Autoverkehr abgetrennte Fahrradspur. Eine Trennung wird durch einen extra Bordstein, Poller oder ähnliche Absperrelementen erreicht.</p>

    <.a href="/images/pbl.webp" target="_blank"><img src="/images/pbl.webp" width="3733" height="2508" alt="Beispiel einer Protected-Bike-Lane an einer Zufahrt. Die Lücke ist rot markiert, das Ende bzw. Beginn der Pflastersteine mit einem orangenen Mini-Poller." style="max-width:100%; height: auto; margin-top: .6rem;"/></.a>

    <p>Ihr Hauptvorteil liegt im besseren Fahrgefühl, da die Chancen sinkt das Autofahrende die Spur illegal mitbenutzen oder darauf parken. In Hamburg sind häufig noch kleine, orangefarbene Poller darauf angebracht, um die Sichtbarkeit zu erhöhen.</p>

    <.roaddiagram src="pbl" alt="Eine Straßenansicht von oben (Vogelperspektive) die ein Beispiel einer Protected-Bike-Lane auf beiden Straßenseiten zeigt."/>

    <p>Die schematischen Darstellungen verdeutlichen die Höhenunterschiede, die zur leichteren Erkennbarkeit stark übertrieben dargestellt sind:</p>

    <.roaddiagram src="iso_pbl" alt="Schrägsicht auf einen geschützten Radfahrstreifen. Im Diagramm ist der Radweg rot gepflastert. Nicht maßstabgerecht, Sicherheitsabstände fehlen."/>

    <p>Nicht verwechseln: „<.ref>Schutzstreifen</.ref>“ klingt sehr ähnlich, stellt den Radverkehr aber deutlich schlechter.</p>

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
    <p>Protected-Bike-Lanes sind bei ausreichender Breite sehr angenehm zu befahren. Sowohl Fuß- als auch KFZ-Verkehr nehmen sie als deutliche Trennung wahr, sodass sie auch tatsächlich dem Radverkehr zur Verfügung steht. Umgekehrt bleibt auch der Radverkehr in seiner Spur. PBLs sind damit für alle Altersgruppen gut nutzbar.</p>

    <h3>Weiterführende Links</h3>
    <.structured_links ref={@ref}/>
    """
  end
end
