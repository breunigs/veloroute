defmodule Data.Article.Blog.Veloroute5Bewertung do
  use Article.Default

  def name(), do: "#{created_at()}-veloroute-5-bewertung"
  def created_at(), do: ~D[2018-09-14]

  def title(), do: "Bewertung der Veloroute 5 Herbst 2018"

  def type(), do: nil

  def tags(), do: ["5"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Gute Stellen auf der Veloroute 5 muss man schon mit der Lupe suchen. Zugegeben, nach dem Kopfsteinpflaster an der Straße <.m bounds="10.106018,53.668692,10.111353,53.673149">Alte Mühle</.m> ist die Strecke auf dem letzten Stück ganz angenehm. Vorher prägen die Route vor allem zu schmale Radwege, die auch noch häufig mit den ZufußgehendeInnen im Konflikt stehen.</p>
    <p>Beispiele? In der <.m bounds="9.787062,53.58462,10.034569,53.659018">Saarlandstraße</.m> Richtung Norden ist der Radweg ab etwa <.m bounds="10.011032,53.590932,10.032365,53.593661">Südring</.m> nur einen halben Meter breit. Stadteinwärts hat man um <.m bounds="9.980501,53.46337,10.049812,53.590145">U-Barmbek</.m> eine rote Welle; gleiches gilt für den gesamten Weg stadtauswärts <.m bounds="10.001175,53.556557,10.013544,53.561097">an der Alster</.m>. Die Führung am <.m bounds="10.01509,53.562342,10.01777,53.568488">Schwanenwik</.m>, <.m bounds="10.037646,53.577879,10.042731,53.580341">U-Dehnhaide</.m>, <.m bounds="10.089753,53.64945,10.100302,53.654784">S-Poppenbüttel</.m>, <.m bounds="10.092295,53.652104,10.096591,53.662164">Heegbarg</.m> und weiteren Stellen ist im besten Fall umständlich, am Ende der <.m bounds="10.059066,53.594004,10.080125,53.619639">Fabriciusstraße</.m> sogar nicht mal StVo-konform. Die <.m bounds="10.027699,53.569724,10.035628,53.575174">Oberaltenallee</.m> hat eine hohe Unfallrate durch rechts abbiegende KFZ.</p>
    <p>Traurigerweise ist dies auch auf grunderneuerten Strecken nicht besser. Etwa <.m bounds="10.058728,53.610684,10.058728,53.610684">Steilshoop</.m>: Im <.m bounds="10.061736,53.608589,10.06358,53.610768">Gustav-Seitz-Weg</.m> ist der neu gepflasterte Radweg nur 1,5m breit statt der Mindestvorgabe von 1,6m. Weiter in der <.m bounds="10.044233,53.609629,10.068401,53.615433">Gründgensstraße</.m> gibt es nur einen Angebotsstreifen (gestrichelte Linie), der an Zufußgehendeüberwegen ganz wegfällt. Vorher werden die Streifen nochmal schmaler, während die KFZ Spur gleich breit bleibt. Dies räumt Autos optisch Vorfahrt ein, was auf einer Veloroute völlig unverständlich ist.</p>
    <p>Immerhin ist die umgebaute Kreuzung am <.m bounds="10.000127,53.555559,10.002856,53.557072">Ferdinandstor</.m> ganz gut und die Umleitung am <.m bounds="10.02826,53.602835,10.032888,53.607062">Hebebrandquartier</.m> teilweise ausgeschildert.</p>
    <p>Fazit: aktuell ist Veloroute 5 eine Frechheit und nicht zu empfehlen. In <.m bounds="10.042956,53.586752,10.04604,53.587774">Barmbek</.m> bietet sich die <.m bounds="10.058741,53.593319,10.090246,53.633302">Bramfelder Chaussee</.m> als Alternative an. Diese ist zwar nicht unbedingt besser ausgebaut, aber dafür führt sie ohne Umwege in die Innenstadt.</p>
    <p><.a target="_blank" href="https://www.abendblatt.de/hamburg/article215418281/Wer-nach-Duvenstedt-will-lernt-grosse-Strassen-kennen.html" rel="nofollow">Zeitungsartikel/Review vom 26.09.2018</.a></p>
    """
  end
end
