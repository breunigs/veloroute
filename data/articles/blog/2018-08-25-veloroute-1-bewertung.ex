defmodule Data.Article.Blog.Veloroute1Bewertung do
  use Article.Default

  def name(), do: "#{created_at()}-veloroute-1-bewertung"
  def created_at(), do: ~D[2018-08-25]

  def title(), do: "Bewertung der Veloroute 1 Mitte 2018"

  def type(), do: nil

  def tags(), do: [1]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Beide Äste der Veloroute 1 sind schon relativ weit ausgebaut und ermöglichen gutes Vorankommen. Wer etwa ein Gefühl bekommen möchte, wie sich die Autobahndeckel anfühlen werden, kann beim <.m bounds="9.896637,53.553523,9.896637,53.553523">Röperhof</.m> am Nordausgang des neuen Elbtunnel vorbeischauen.</p>
    <p>Weiter Richtung Innenstadt wird es ab <.m bounds="9.919819,53.555066,9.919819,53.555066">Ottensen</.m> eher eng. Bis <.m bounds="9.963575,53.556701,9.963851,53.556797">Zum Grünen Jäger</.m> erfolgt der Ausbau erst noch, sodass man kaum Platz zum Überholen hat und auch regelmäßig im Begegnungsverkehr mit KFZ ausgebremst wird. Gut: für viele Stellen ist ein Ausbau ab 2019 vorgesehen.</p>
    <p>Außerhalb der Innenstadt gibt zwar hier und da Ausbaulücken, wirklich auffällig sind aber nur zwei Stellen. Auf dem Nordast ist dies der <.m bounds="9.86712,53.574239,9.876374,53.578486">Lise-Meitner-Park</.m>, der mit engen und zugewachsenen Schotterwegen nicht einladend ist. Auf dem Westast sind dies mehrere Stellen in <.m bounds="9.80306,53.5575,9.815532,53.564649">Blankenese</.m>:</p><ol><li><.m bounds="9.81973,53.55972,9.821948,53.56066">Gätgensstraße</.m>/<.m bounds="9.812138,53.560437,9.819113,53.56239">Godeffroystraße</.m> – man will hier der Autotrasse aus dem Weg gehen, was beim aktuellen Ausbaustand aber deutlich umständlicher ist als kurz im KFZ-Verkehr mitzuschwimmen.</li><li><.m bounds="9.793264,53.56325,9.812449,53.586809">Sülldorfer Kirchenweg</.m> – zumindest der Teil bergauf, da die KFZ hier 50 km/h fahren dürfen und eher nicht auf eine ausreichend große Lücke warten.</li><li><.m bounds="9.796375,53.572692,9.805467,53.577368">Friedhof Blankenese</.m> – Die Drängelgitter sind für normale Fahrräder schon eng, mit dem Lastenvelo kommt man vermutlich nicht durch.</li></ol><p>Allen in allem ist die Route definitiv alltagstauglich, auch im Berufsverkehr.</p>
    <p><.a target="_blank" href="https://www.abendblatt.de/hamburg/article215309469/Auf-dem-Rad-nach-Westen-dieser-Weg-ist-steinig-und-schwer.html" rel="nofollow">Zeitungsartikel/Review vom 12.09.2018</.a></p>
    """
  end
end
