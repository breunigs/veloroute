defmodule Data.Article.Static.LexikonSchutzstreifen do
  use Article.Static

  def name(), do: "lexikon/schutzstreifen"
  def title(), do: "Lexikon · Schutzstreifen"

  def summary(),
    do: "Schutzstreifen verlaufen auf der KFZ-Spur und sind durch eine Strichellinie abgetrennt."

  def tracks(), do: Data.Article.Static.Alltagsroute3.tracks()
  def point_of_interest(), do: %{lon: 9.95628, lat: 53.586235, zoom: 16}

  def tags(), do: ~w(lexikon schutzstreifen)

  def text(assigns) do
    ~H"""
    <p><.m bounds="9.946338,53.581812,9.964407,53.585945" lon={9.9556474} lat={53.5846119} dir="forward" ref="3">Videobeispiel eines Schutzstreifens auf Veloroute 3</.m></p>

    <p>Schutzstreifen sind die kleinere Variante des <.ref>Radfahrstreifens</.ref> und in jeder Hinsicht schlechter gestellt. Sie sind durch eine schmale, gestrichelte Linie gekennzeichnet. Breite Fahrzeuge dürfen sie mitbenutzen und sie sind meist sehr schmal.</p>

    <.roaddiagram src="schutzstreifen" alt="Eine Straßenansicht von oben (Vogelperspektive) die zeigt wie Schutzstreifen aussehen. Es sind Begegnungsverkehr PKW/PKW und LKW/LKW dargestellt."/>

    <p>Nicht verwechseln: „<.ref>Protected Bike Lane</.ref>“ klingt sehr ähnlich, ist für den Radverkehr aber deutlich besser.</p>

    <h3>Meinung</h3>
    <p>Schutzstreifen kommen aus der autogerechten Planung und sind für den Radverkehr ungeeignet. Wenn der Platz nicht ausreicht, muss ein anderer Ansatz her. Das könnten KFZ-Einbahnstraßen sein oder Tempo 30 Strecken. Bei letzteren muss durch die Bauweise sichergestellt sein, dass man gar nicht schneller als 30 km/h fahren <em>kann</em>. Ein Verkehrsschild das leicht übersehen oder missachtet wird hilft niemandem.</p>
    """
  end
end
