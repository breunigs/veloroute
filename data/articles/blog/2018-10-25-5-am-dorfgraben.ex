defmodule Data.Article.Blog.AmDorfgraben do
  use Article.Default

  def name(), do: "#{created_at()}-5-am-dorfgraben"
  def created_at(), do: ~D[2018-10-25]
  def updated(), do: ~D[2020-06-11]
  def title(), do: "Veloroute 5: Neue Führung durch „Am Dorfgraben“"

  def type(), do: :planned

  def tags(), do: [5]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Künftig soll die Veloroute 5 durch die Straße „<.m bounds="10.071774,53.614525,10.074022,53.615055">Am Dorfgraben</.m>“ geführt werden. Aktuell (Mitte 2020) ist die Straße teilweise fertiggestellt, kann aber noch nicht durchgehend befahren werden. Laut Plan ist vorgesehen die Straße dem ÖPNV vorzubehalten, sodass hier keine weitere KFZ-Durchgangsstraße entstünde. Da <.m bounds="10.074735,53.613801,10.076981,53.61483">nahe der Bramfelder Chaussee</.m> weitere Hausbauten geplant sind wird sich die Umsetzung noch eine Weile verzögern. Es ist geplant zunächst einen Gehweg anzulegen, um eine Durchverbindung zum <.m bounds="10.075942,53.613092,10.079086,53.614942">Bramfelder Dorfplatz</.m> zu schaffen. Während des Hausbaus soll dieser als „Fahrrad frei“ auch vom Radverkehr als Übergangslösung mitbenutzt werden. Der eigentliche Radweg soll dann im Nachhinein als eigenständiger Weg neben der ÖPNV-Strecke entstehen.</p>
    <p>Der Fußweg soll je nach Fortschritt <.a href="/article/2018-10-25-5-leeschenblick-und-fabriciusstrasse?bounds=10.06937%2C53.614092%2C10.073164%2C53.61583&img=_dibhFdaoUN2RPODxKgh_w">des Kreisels mit der Fabriciusstraße</.a> ab Sommer 2020 angelegt werden. Wann der eigentliche Radweg kommen soll ist noch nicht bekannt.</p>
    <p>
    <.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1011872">Erläuterungen und Pläne zum Fußweg</.a>
    </p>
    """
  end
end
