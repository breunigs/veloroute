defmodule Data.Article.Blog.Veloroute3Aenderungen do
  use Article.Default

  def created_at(), do: ~D[2019-09-13]

  def title(), do: "Verbesserungen Veloroute 3 von Mitte 2018 bis Mitte 2019"

  def type(), do: nil

  def tags(), do: ["3"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Zuletzt bin ich die <.a name="alltagsroute-3">Veloroute 3</.a> im Mai 2019 vollständig abgefahren. Im Vergleich zum Juni 2018 gab kaum Neuerungen. An den Baustellen gab es einige Änderungen, wirklich erwähnenswert ist aber nur der Beginn des Umbaus in der <.m bounds="9.950288,53.580302,9.972212,53.593358" ref="3">Stresemannallee</.m> (<.a name="2018-10-13-3-stresemannallee">Details</.a>).</p>
    <p>Positiv ist das die Umbauten auf dem Theodor-Heuss-Platz vor dem Dammtorbahnhof beendet sind. Die Änderungen stellen kleine Verbesserungen dar, orientierten sich aber nicht immer an den Bedürftnissen des Radverkehrs. Dies führt leider zu einer häufigen Missachtung der Verkehrsregeln.</p>
    <p>Auf Bahnhofseite gibt es jetzt einen <.m bounds="9.98671,53.559179,9.992192,53.562443" ref="3">asphaltierten und geradlinigen Radfahrstreifen</.m>, der gut erreichbar ist. Das ist definitiv besser als der kurvige und von Zufußgehenden mitbenutzte Hochbordradweg. Leider muss man auch die <.m bounds="9.98671,53.559179,9.992192,53.562443" ref="3">missglückte Radampel am Dammtordamm</.m> erwähnen: Rechts-Rad hat rot, wenn Rechts-KFZ grün hat, damit sie von großen Fahrzeugen in der Kurve nicht geschnitten werden. Rad bekommt grün, wenn auch die querende Fußfurt grün hat – man wartet hier also effektiv zweimal.</p>
    <p>Auf der <.m bounds="9.98671,53.559179,9.992192,53.562443" ref="3">Nordseite ist der Radweg</.m> jetzt nur noch in einer Richtung freigegeben, was theoretisch die Breite verbessert. In der Praxis gibt es zu viele Geisterradelnden damit die Breite wirklich genutzt werden kann. Man merkt hier sehr deutlich die trennende Wirkung der sechs KFZ- und Busspuren. <.m bounds="9.98671,53.559179,9.992192,53.562443" ref="3">Die Aufleitung auf die Fahrbahn</.m> entlang der Veloroute ist jedoch gut umgesetzt, auch wenn die Radinfrastruktur aktuell kurz nach der Kreuzung aufhört.</p>
    <p>Wenn ich etwas vergessen habe, <.mailto>schreib mir</.mailto> bitte. Siehe auch <.a name="bau">weitere geplante Umbaumaßnahmen</.a>.</p>
    """
  end
end
