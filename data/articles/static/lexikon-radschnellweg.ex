defmodule Data.Article.Static.LexikonRadschnellweg do
  use Article.Static

  def name(), do: "lexikon/radschnellweg"
  def title(), do: "Lexikon · Radschnellweg"

  def summary(),
    do: "Radschnellwege sind besonders für gutes Vorankommen optimierte Wege"

  def tags(), do: ["lexikon", "radschnellweg", "rsw"]

  def text(assigns) do
    ~H"""
    <p>Ein Radschnellweg versucht längere Strecken mit dem Fahrrad attraktiv zu machen, indem er eine hohe Durchschnittsgeschwindigkeit ermöglicht. Dies wird durch Vorfahrt, genug Platz zum Überholen und gute Straßenbeläge erreicht. Stellenweise sind auch Bauwerke wie Tunnel oder Brücken vorgesehen, um eine direktere oder kreuzungsfreie Führung zu ermöglichen.</p>

    <p>Um Hamburg herum verlaufen diese sternförmig in umliegende Gemeinden. In der Trassenfindung wurden verschiedenste Aspekte gegeneinander abgewägt, um die auf der Seite dargestellten Vorzugstrassen zu finden. Eingeflossen sind unter anderem wo Menschen leben und arbeiten, Anschlüsse an Bahnhöfe, Naturschutz, vorhandene Wege, und auch Hinweise und Wünsche aus der Bevölkerung.</p>

    <p>In der Metropolregion Hamburg sind die meisten Machbarkeitsstudien („Trassenfindung“) abgeschlossen. Nur die für den Radschnellweg nach Tostedt steht noch aus. Die nächsten Schritte sind die Finanzierung und die Detailplanung der einzelnen Abschnitte, damit die gefundene Trasse Wirklichkeit wird.</p>

    <p><.a href="https://metropolregion.hamburg.de/radschnellwege/">offizielle Seite zu den Radschnellwegen</.a></p>
    """
  end
end
