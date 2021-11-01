defmodule Data.Article.Blog.RahlstedterWeg do
  use Article.Default

  def name(), do: "#{created_at()}-14-rahlstedter-weg"
  def created_at(), do: ~D[2019-07-13]

  def title(), do: "Rahlstedter Weg (Veloroute 14)"

  def start(), do: ~d[2019-07]
  def stop(), do: ~d[2019-11]

  def type(), do: :finished

  def tags(), do: ["14"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die Bushhaltestelle „<.m bounds="10.126739,53.602177,10.12881,53.603299">Rahlstedter Weg (Mitte)</.m>“ wird ausgebaut um dem gestiegenen Busaufkommen genug Platz zu bieten. Im Zuge dessen werden auch die Radwege angepasst: Damit die Schule besser zu erreichen ist, wird dort ein Zweirichtungsradweg mit 2,5m Breite eingerichtet. Er endet direkt vor den Eingängen, zieht sich also nicht den gesamten Rahlstedter Weg entlang. In der Gegenrichtung wird der Radverkehr künftig links an den wartenden Bussen auf einem Radfahrstreifen vorbeigeführt.</p> <p>Für den restlichen eingezeichneten Bereich sollen Fuß- und Radwege sowie die Fahrbahn saniert werden. Dies meint vermutlich wie im Bestand, d.h. lediglich neu gepflastert bzw. asphaltiert. Leider sind mir dazu keine Pläne bekannt.</p> <p><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1007241">Plan und Erläuterung zum Umbau im Bereich der Haltestelle</.a></p> <p><.a href="https://www.hamburg.de/bwi/medien/12745786/2019-07-01-bwvi-rahlstedter-weg/">Ankündigung der Stadt und Sperrungszeiten</.a></p>
    """
  end
end
