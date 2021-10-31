defmodule Data.Article.Blog.Moorreye do
  use Article.Default

  def name(), do: "#{created_at()}-4-moorreye"
  def created_at(), do: ~D[2019-02-18]

  def title(), do: "Moorreye (Veloroute 4)"

  def start(), do: ~d[2020Q1]

  def type(), do: :finished

  def tags(), do: [4]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Update:</strong> Der entgültige Entwurf liegt nun vor. Das zuvor kritisierte „halb auf dem Gehweg parken“ wird durch ordentliche Parkstände auf der Fahrbahn ersetzt. Wegen Leitungsarbeiten verschiebt sich der Umbau von Mitte auf Ende 2019. Die Beschreibung wurde entsprechend angepasst.</p> <p>Die <.m bounds="10.020052,53.640263,10.025217,53.645511">Moorreye</.m> ist wegen des geringen Verkehrsaufkommen gut zu beradeln. Entsprechend verwundlich ist auch die Ampel an der Kreuzung mit der <.m bounds="10.006426,53.624958,10.022248,53.64036">Flughafenstraße</.m> und dem <.m bounds="10.020053,53.63645,10.028574,53.640263">Ohkamp</.m>, die sowohl den KFZ- als auch den Radverkehr unnötig ausbremst. Dem entgültigen Entwurf nach soll sie daher verschwinden und durch einen Kreisel ersetzt werden. Im weiteren Verlauf sollen die kaum sichtbaren und im Bereich der Autotüren verlaufenden Radwege zurückgebaut werden, sodass der Radverkehr künftig nur noch im Mischverkehr fahren würde – so wie heute im nördlicheren Teil der <.m bounds="10.020052,53.640263,10.025217,53.645511">Moorreye</.m>.</p> <p>Die KFZ-Parkplätze verschieben sich teils, bleiben aber sonst erhalten. Sie werden dabei so umgebaut, dass das „halb auf dem Gehweg parken“ entfällt und so KFZ nicht durch Unachtsamkeit oder Gleichgültigkeit zu viel des Gehweg blockieren. Dieser wird im Vergleich zum Bestand teils breiter, trotz der angepassten Radbuchten.</p> <p>Auch die Details stimmen: es gibt deutlich mehr Radbügel zum Anschließen der Räder und es werden neue Sitzbänke aufgestellt. Die 30 km/h Zone wird so erweitert, das der Kreisel und der östliche Teil der <.m bounds="10.006426,53.624958,10.022248,53.64036">Flughafenstraße</.m> ebenfalls enthalten sind. Straßeneinengungen erschweren Rasen zusätzlich. Leider ist der Anteil des Radverkehrs noch zu gering um die Moorreye als Fahrradstraße auszuweisen.</p> <p>Die Umsetzung ist ab Ende 2019/Anfang 2020 vorgesehen. Zuvor sollen noch Leitungsarbeiten stattfinden.</p> <p><.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1007999">Erläuterungsbericht und Lageplan zum entgültigen Entwurf</.a> (unter Anlagen)</p>
    """
  end
end
