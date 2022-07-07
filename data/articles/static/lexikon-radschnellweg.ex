defmodule Data.Article.Static.LexikonRadschnellweg do
  use Article.Static

  def name(), do: "lexikon/radschnellweg"
  def title(), do: "Lexikon · Radschnellweg"

  def summary(),
    do: "Radschnellwege sind besonders für gutes Vorankommen optimierte Wege"

  def tags(), do: ["lexikon", "radschnellweg", "rsw", "radschnellwege"]

  def tracks(), do: Data.Article.Static.Alltagsroute5.tracks() |> Enum.filter(&(&1.group == "5N"))
  def point_of_interest(), do: %{lon: 10.029203, lat: 53.603815, zoom: 16}

  def text(assigns) do
    ~H"""
    <.roaddiagram src="rsw" width="100" alt="Verkehrszeichen 350.1 „Radschnellweg“ aus der StVO" style="float: right; padding: 0 0 1rem 1rem"/>

    <p>Ein Radschnellweg versucht längere Strecken mit dem Fahrrad attraktiv zu machen, indem er eine hohe Durchschnittsgeschwindigkeit ermöglicht. Dies wird durch Vorfahrt, genug Platz zum Überholen und gute Straßenbeläge erreicht. Stellenweise sind auch Bauwerke wie Tunnel oder Brücken vorgesehen, um eine direktere oder kreuzungsfreie Führung zu ermöglichen.</p>

    <p>Um Hamburg herum verlaufen diese sternförmig in umliegende Gemeinden. In der Trassenfindung wurden verschiedenste Aspekte gegeneinander abgewägt, um die auf der Seite dargestellten Vorzugstrassen zu finden. Eingeflossen sind unter anderem wo Menschen leben und arbeiten, Anschlüsse an Bahnhöfe, Naturschutz, vorhandene Wege, und auch Hinweise und Wünsche aus der Bevölkerung.</p>

    <p>In der Metropolregion Hamburg sind die Machbarkeitsstudien („Trassenfindung“) abgeschlossen. Die nächsten Schritte sind die Finanzierung und die Detailplanung der einzelnen Abschnitte, damit die gefundene Trasse Wirklichkeit wird.</p>

    <p><.a href="https://metropolregion.hamburg.de/radschnellwege/">offizielle Seite zu den Radschnellwegen</.a></p>
    """
  end
end
