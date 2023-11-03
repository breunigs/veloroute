defmodule Data.Article.Static.LexikonSchutzstreifen do
  use Article.Static

  def name(), do: "lexikon/schutzstreifen"
  def title(), do: "Lexikon · Schutzstreifen"

  def summary(),
    do: "Schutzstreifen verlaufen auf der KFZ-Spur und sind durch eine Strichellinie abgetrennt."

  def tracks(), do: Data.Article.Static.Alltagsroute3.tracks()
  def point_of_interest(), do: %{lon: 9.955712, lat: 53.584148, zoom: 16}

  def tags(), do: ~w(lexikon schutzstreifen)

  def text(assigns) do
    ~H"""
    <p><.v bounds="9.953219,53.582767,9.959368,53.586041" lon={9.955712} lat={53.584148} dir="forward" ref="3">Videobeispiel Schutzstreifen Stresemannallee</.v> oder <.a href="/images/schutzstreifen.webp" target="_blank">Foto</.a></p>

    <p>Schutzstreifen sind die kleinere Variante des <.ref>Radfahrstreifens</.ref> und in jeder Hinsicht schlechter gestellt. Sie sind durch eine schmale, gestrichelte Linie gekennzeichnet. Breite Fahrzeuge dürfen sie mitbenutzen und sie sind meist sehr schmal.</p>

    <.roaddiagram src="schutzstreifen" alt="Eine Straßenansicht von oben (Vogelperspektive) die zeigt wie Schutzstreifen aussehen. Es sind Begegnungsverkehr PKW/PKW und LKW/LKW dargestellt."/>

    <p>Nicht verwechseln: „<.ref>Protected Bike Lane</.ref>“ klingt sehr ähnlich, ist für den Radverkehr aber deutlich besser.</p>

    <h3>Meinung</h3>
    <p>Schutzstreifen kommen aus der autogerechten Planung und sind für den Radverkehr ungeeignet. Wenn der Platz nicht ausreicht, muss ein anderer Ansatz her. Das könnten KFZ-Einbahnstraßen sein oder Tempo 30 Strecken. Bei letzteren muss durch die Bauweise sichergestellt sein, dass man gar nicht schneller als 30 km/h fahren <em>kann</em>. Ein Verkehrsschild das leicht übersehen oder missachtet wird hilft niemandem.</p>
    """
  end
end
