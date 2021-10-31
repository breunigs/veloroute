defmodule Data.Article.Blog.Veloroute13Bewertung do
  use Article.Default

  def name(), do: "#{created_at()}-veloroute-13-bewertung"
  def created_at(), do: ~D[2018-08-28]

  def title(), do: "Bewertung der Veloroute 13 Mitte 2018"

  def type(), do: nil

  def tags(), do: [13]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die Ringroute 13 ist eine schöne Abwechslung von Hamburgs sonst sternförmiger Verkehrsführung, aber sie ist auch ziemlich anstrengend. Nicht nur kreuzt regelmäßig eine ebenjener sternförmigen Straßen, die entweder beampelt sind oder Vorfahrt genießen. Die Strecke ist auch kaum ausgebaut: Kopfsteinpflaster in <.m bounds="9.935089,53.547425,9.935526,53.551769">Altona</.m>, zu schmale Spuren in <.m bounds="10.04639,53.566811,10.059121,53.574938">Eilbek</.m>, komplexe Verkehrsführung am <.m bounds="10.00974,53.579011,10.013267,53.583539">Mühlenkamp</.m>. Ansonsten führt die Route hauptsächlich durch Nebenstraßen, die durch die hohe Parkdichte und Falschparkern nicht gut einsehbar sind und daher nur mit voller Aufmerksamkeit befahren werden können. Die Funktion eines „Lückenschlusses“ kann diese Route also sicherlich erfüllen und einen brauchbaren Weg <i>zwischen</i> zwei Routen aufzeigen. Sie am Stück im Gesamten zu befahren macht aber keinen Spaß – und auf Grund der Ringführung auch keinen Sinn.</p>
    <p><.a target="_blank" href="https://www.abendblatt.de/hamburg/article215637459/Mit-dem-Fahrrad-ueber-Buckelpisten-von-Hamm-nach-Altona.html" rel="nofollow">Zeitungsartikel/Review vom 24.10.2018</.a></p>
    """
  end
end
