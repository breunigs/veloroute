defmodule Data.Article.Blog.Veloroute4Bewertung do
  use Article.Default

  def name(), do: "#{created_at()}-veloroute-4-bewertung"
  def created_at(), do: ~D[2018-09-03]

  def title(), do: "Bewertung der Veloroute 4 Herbst 2018"

  def type(), do: nil

  def tags(), do: [4]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Mit dem <.m bounds="9.994156,53.580384,9.999744,53.593289">Leinpfad</.m> und dem <.m bounds="9.98907,53.566887,10.001238,53.581468">Harvestehuder Weg</.m> hat die Veloroute 4 bisher die Filetstücke unter den Fahrradwegen. Es ist natürlich ein bisschen schade, das die Ungewissheit um die amerikanische Botschaft am <.m bounds="9.9936,53.552852,10.001202,53.566887">Alsterufer</.m> auch unklar macht, ob und wann die Fahrradstraße Richtung Innenstadt fortgesetzt werden kann. Notwendig wäre es bei dem hohen Zufußgehende- und Radaufkommen definitiv. Auch Kreuzung an <.m bounds="9.993771,53.556938,10.002927,53.55879">Kennedybrücke</.m> bzw. <.m bounds="9.992951,53.5557,10.000595,53.557791">Lombardsbrücke</.m> benötigt dringend eine Überarbeitung.</p>
    <p>In die andere Richtung gibt's nach den Fahrradstraßen vor allem Mischverkehr: mal mit Angebotsstreifen (gestrichelte Linie), mal ohne. Gerade in in um Alsterdorf ist dies wegen der 50 km/h Höchstgeschwindigkeit eher unangenehm, wie etwa in der <.m bounds="9.996719,53.605461,10.030666,53.619634">Rathenaustraße</.m>. Nach <.m bounds="10.023369,53.63234,10.026851,53.632603">Fuhlsbüttel</.m> handelt es sich aber meist um Nebenstraßen mit max. 30 km/h, sodass sich ab hier bequem fahren lässt.</p>
    <p>Insgesamt lässt sich Veloroute 4 gut befahren. Die nicht so guten Stellen sind meist kurz und im Mischverkehr die Straßen meist immer noch so breit, das man nicht mit den KFZ im Stau stehen muss. Insbesondere in den Fahrradstraßen lassen sich mögliche Zeitverluste gut ausgleichen.</p>
    <p><.a target="_blank" href="https://www.abendblatt.de/hamburg/article215390465/Der-schwierige-Weg-nach-Langenhorn-auf-dem-Leinpfad.html" rel="nofollow">Zeitungsartikel/Review vom 22.09.2018</.a></p>
    """
  end
end
