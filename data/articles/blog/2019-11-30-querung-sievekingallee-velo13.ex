defmodule Data.Article.Blog.QuerungSievekingalleeVelo13 do
  use Article.Default

  def name(), do: "#{created_at()}-querung-sievekingallee-velo13"
  def created_at(), do: ~D[2019-11-30]

  def title(), do: "Querung Sievekingsallee (Veloroute 13)"

  def type(), do: :finished

  def tags(), do: ["13"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Aktuell quert man die Sievekingsallee über eine Fußampel, die nicht auf die Radgeschwindigkeit eingestellt ist. Zusätzlich wird diese auf dem Gründstreifen zwischen den KFZ-Spuren verschwenkt, sodass sich zwangsläufig ein Slalom ergibt. Auch die Führung aus bzw. in die Nebenstraßen ist kurvig und unkomfortabel. Kurzum: für Fuß- und Rad völlig unbrauchbar.</p> <p>Der LSBG plant daher die Querung deutlich breiter und geradliniger auszuführen. Sowohl dem Rad- als auch dem Fußverkehr stehen nach dem Umbau 4m bzw. 2m pro Richtung zur Verfügung. Für den Radverkehr entfällt die Mittelinsel und die dazugehörige Ampel. Auf der Sievekingsallee ist der Belag damit durchgängig Asphalt, die Fußwegüberleitung in den Hirschgraben bzw. die Jordanstraße wird hingegen gepflastert. Die Anschlüsse in die beiden Nebenstraßen erlauben durch gute Einblickwinkel und einer Führung nahe der „Ideallinie“ sicheres und zügiges Fahren.</p> <p>Man entschied sich für diese Variante um klar zu machen, das KFZ die Radanlagen nicht mitbenutzen dürfen und auch um den Baumbestand zu erhalten. Nachteil dieser Lösung ist, das der Radverkehr entlang der Sievekingsallee keine Ampel beachten muss, was zu Konflikten mit dem Querverkehr führen könnte. <.m bounds="9.962192,53.555909,9.965684,53.557989" ref="1">Am Neuen Pferdemarkt</.m> gibt es eine ähnliche Stelle an der diese Konflikte regelmäßig auftreten.</p> <p>Die Ampel erkennt Fahrräder automatisch und fordert Grün an. Leider schaltet sie nie automatisch, sodass man nur ohne Anhalten durchkommt, wenn jemand anders bereits Grün angefordert hat.</p> <p>Umgebaut werden soll im August 2020, wobei sich das in Abstimmung mit den angrenzenden Baumaßnahmen <.a name="2019-06-22-13-jordanstrasse">Jordanstraße</.a> und <.a name="2019-09-13-13-hirschgraben">Hirschgraben</.a> noch ändern kann.</p> <p>
    <.a href="https://lsbg.hamburg.de/contentblob/13179666/0a401f9c53116c4fd4e981995ad058cf/data/veloroute-13-sievekingsallee-hirschgraben-jordanstrasse-abgestimmte-planung-bericht.pdf">Erläuterungsbericht</.a><br>

    <.a href="https://lsbg.hamburg.de/contentblob/13179668/ff966c3c004a89b991e6f44e974871f7/data/veloroute-13-sievekingsallee-hirschgraben-jordanstrasse-abgestimmte-planung-plan.pdf">Lageplan</.a>
    </p>
    """
  end
end
