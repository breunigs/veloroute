defmodule Data.Article.Blog.VerlegungNettelnburgVelo9 do
  use Article.Default

  def name(), do: "#{created_at()}-verlegung-nettelnburg-velo9"
  def created_at(), do: ~D[2021-09-23]

  def title(), do: "Verlegung Veloroute 9 am Bahnhof Nettelnburg"

  def type(), do: :changed_routing

  def tags(), do: ["9"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alte Führung</h4> <p>Man fuhr vor dem Bahnhof zum <.m bounds="10.179507,53.487893,10.182119,53.489122">Friedrich-Frank-Bogen</.m> herunter und erreichte über den <.m bounds="10.184172,53.48883,10.186997,53.490171">Ladenbeker Furtweg</.m> den <.m bounds="10.185666,53.488908,10.187144,53.490633">Oberen Landweg</.m>.</p>
    <h4>Neue Führung</h4> <p>Man fährt nun stattdessen weiter gerade aus, direkt am Bahnhof vorbei und erreicht so <.m bounds="10.18393,53.486795,10.186936,53.488522" lon="10.185412" lat="53.487658" dir="forward">kurz nach der Bahnunterführung</.m> den oberen Landweg.</p>
    <h4>Meinung</h4> <p>Leider ist mir nicht bekannt, wann die Führung geändert wurde. Ich vermute es hängt mit der Planung zum <.a name="rsw-geesthacht">Radschnellweg Geesthacht</.a> zusammen, da dieser ebenfalls „direkt“ an den oberen Landweg angeschlossen werden soll. Durch die längere gemeinsame Führung spart man sich eine extra Planung für den Abschnitt um den Parkplatz vorm Bahnhof. Für die Veloroute macht die Verlegung kaum einen Unterschied.</p> <p>Leider führt die Route damit im heutigen Ausbauzustand direkt vorm Ein- bzw. Ausgang des Bahnhofs vorbei, was Konflikte mit dem Fußverkehr begünstigt. Für den Bau des Radschnellwegs ist daher vorgesehen den Weg leicht zu versetzen, damit die Sichtbeziehungen verbessert werden.</p>
    """
  end
end
