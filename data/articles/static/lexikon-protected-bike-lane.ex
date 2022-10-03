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
      "geschützte-radfahrstreifen"
    ]

  def tracks(),
    do: Data.Article.Static.Alltagsroute11.tracks() |> Enum.filter(&(&1.group == "11 Eißendorf"))

  def point_of_interest(), do: %{lon: 9.991008, lat: 53.459644, zoom: 16}

  def text(assigns) do
    ~H"""
    <p><.m lat={53.45947} lon={9.99094} dir="backward" ref="11" bounds="9.986734,53.458457,9.997266,53.465207">Videobeispiel einer Protected Bike Lane auf Veloroute 11</.m></p>

    <p>Unter einer „Protected Bike Lane“, also einer geschützten Radspur, versteht man eine vom Autoverkehr abgetrennte Fahrradspur. Eine Trennung wird durch einen extra Bordstein, Poller oder ähnliche Absperrelementen erreicht. Ihr Hauptvorteil liegt im besseren Fahrgefühl, da die Chancen sinkt das Autofahrende die Spur illegal mitbenutzen oder darauf parken. In Hamburg sind häufig noch kleine, orangefarbene Poller darauf angebracht, um die Sichtbarkeit zu erhöhen.</p>

    <.roaddiagram src="pbl" alt="Eine Straßenansicht von oben (Vogelperspektive) die ein Beispiel einer Protected-Bike-Lane auf beiden Straßenseiten zeigt."/>

    <p>Die Schrägansicht verdeutlicht die Höhenunterschiede, die zur leichteren Erkennbarkeit stark übertrieben dargestellt sind:</p>

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
    """
  end
end
