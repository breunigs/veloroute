defmodule Data.Article.Static.LexikonSchutzstreifen do
  use Article.Static

  def name(), do: "lexikon/schutzstreifen"
  def title(), do: "Lexikon · Schutzstreifen"

  def summary("de"),
    do:
      "Schutzstreifen sind Teil einer Fahrspur und mit einer gestrichelten Linie markiert. Sie dürfen von KFZ bei Bedarf mitbenutzt werden, etwa bei Gegenverkehr. Mit dem Auto müssen 1,5m Seitenabstand beim Überholen eingehalten werden, unabhängig der Markierung."

  def summary("en"),
    do:
      "Schutzstreifen are part of a single lane and marked by a dashed line. They may be temporarily used by motorized vehicles to avoid opposite traffic. Cars must leave 1.5m space when overtaking, independent of the dashed line."

  def tracks(), do: Data.Article.Static.Alltagsroute3.tracks()
  def point_of_interest(), do: %{lon: 9.955712, lat: 53.584148, zoom: 16}

  def tags(), do: ~w(lexikon schutzstreifen)

  def languages(), do: ~w[de en]

  def text(%{lang: "en"} = assigns) do
    ~H"""
    <p lang="en"><.v bounds="9.953219,53.582767,9.959368,53.586041" lon={9.955712} lat={53.584148} dir="forward" ref="3">Example video of “<span translate="no" lang="de">Schutzsstreifen</span>” in <span translate="no" lang="de">Stresemannallee</span></.v> or <.a href="/images/schutzstreifen.webp" target="_blank">example photo</.a></p>

    <p lang="en"><span translate="no" lang="de">Schutzsstreifen</span> are a smaller variant of <.ref>Radfahrstreifen</.ref> and worse in every regard. They are part of a single lane and marked by a dashed line – it's usually very narrow. The space right of the dashed line may be used by cars and trucks to avoid opposite traffic if there's otherwise not enough space. Overtaking cyclists is only permitted if there's at least 1.5m side clearance possible.</p>

    <.roaddiagram src="schutzstreifen" alt="Bird's eye view on a street with Schutzsstreifen on both sides. It shows how the road is to be used for car/car and truck/truck situations."/>

    <p lang="en">Don't confuse them with “<.ref>Protected Bike Lanes</.ref>“, which offer much higher quality. The best – but degatory – translation for <span translate="no" lang="de">Schutzsstreifen</span> might be “bicycle gutter”.</p>

    <h3 lang="en">Opinion</h3>
    <p><span translate="no" lang="de">Schutzsstreifen</span> are unsuitable for modern cycle routes and a leftover from car centric planning. If there's not enough space for proper cycle paths, the road concept needs to be revised. This could be achieved by one way streets for motorized traffic, or limiting traffic to 30 km/h. Latter needs to be enforced by traffic calming, so that's it's not even possible to go faster than that. A mere sign will be overlooked, or ignored.</p>
    """
  end

  def text(assigns) do
    ~H"""
    <p><.v bounds="9.953219,53.582767,9.959368,53.586041" lon={9.955712} lat={53.584148} dir="forward" ref="3">Videobeispiel Schutzstreifen Stresemannallee</.v> oder <.a href="/images/schutzstreifen.webp" target="_blank">Foto</.a></p>

    <p>Schutzstreifen sind die kleinere Variante des <.ref>Radfahrstreifens</.ref> und in jeder Hinsicht schlechter gestellt. Sie sind durch eine schmale, gestrichelte Linie gekennzeichnet. Sie sind meist sehr schmal und breite Fahrzeuge dürfen sie mitbenutzen um Gegenverkehr auszuweichen. Beim Überholen müssen zwischen Auto und Fahrrad mindestens 1,5m Seitenabstand gehalten werden – unabhängig vom Verlauf der Linie.</p>

    <.roaddiagram src="schutzstreifen" alt="Eine Straßenansicht von oben (Vogelperspektive) die zeigt wie Schutzstreifen aussehen. Es sind Begegnungsverkehr PKW/PKW und LKW/LKW dargestellt."/>

    <p>Nicht verwechseln: „<.ref>Protected Bike Lane</.ref>“ klingt sehr ähnlich, ist für den Radverkehr aber deutlich besser.</p>

    <h3>Meinung</h3>
    <p>Schutzstreifen kommen aus der autogerechten Planung und sind für den Radverkehr ungeeignet. Wenn der Platz nicht ausreicht, muss ein anderer Ansatz her. Das könnten KFZ-Einbahnstraßen sein oder Tempo 30 Strecken. Bei letzteren muss durch die Bauweise sichergestellt sein, dass man gar nicht schneller als 30 km/h fahren <em>kann</em>. Ein Verkehrsschild das leicht übersehen oder missachtet wird hilft niemandem.</p>
    """
  end
end
