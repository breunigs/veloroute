defmodule Data.Article.Blog.AmDorfgraben do
  use Article.Default

  def name(), do: "#{created_at()}-5-am-dorfgraben"
  def created_at(), do: ~D[2018-10-25]
  def updated_at(), do: ~D[2020-06-11]
  def title(), do: "Veloroute 5: Neue Führung durch „Am Dorfgraben“"

  def type(), do: :planned

  def tags(), do: ["5"]

  def links(_assigns) do
    [
      {"Erläuterungen und Pläne zum Fußweg",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1011872"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand 2021:</h4>
    <p>Die Veloroute verbleibt in der Fabriciusstraße und sollte wohl auch nie verlegt werden. Ich bitte den Fehler zu entschuldigen.</p>

    <h4>Alter Artikel</h4>
    <p>Künftig soll die Veloroute 5 durch die Straße „<.m bounds="10.071774,53.614525,10.074022,53.615055">Am Dorfgraben</.m>“ geführt werden. Aktuell (Mitte 2020) ist die Straße teilweise fertiggestellt, kann aber noch nicht durchgehend befahren werden. Laut Plan ist vorgesehen die Straße dem ÖPNV vorzubehalten, sodass hier keine weitere KFZ-Durchgangsstraße entstünde. Da <.m bounds="10.074735,53.613801,10.076981,53.61483">nahe der Bramfelder Chaussee</.m> weitere Hausbauten geplant sind wird sich die Umsetzung noch eine Weile verzögern. Es ist geplant zunächst einen Gehweg anzulegen, um eine Durchverbindung zum <.m bounds="10.075942,53.613092,10.079086,53.614942">Bramfelder Dorfplatz</.m> zu schaffen. Während des Hausbaus soll dieser als „Fahrrad frei“ auch vom Radverkehr als Übergangslösung mitbenutzt werden. Der eigentliche Radweg soll dann im Nachhinein als eigenständiger Weg neben der ÖPNV-Strecke entstehen.</p>
    <p>Der Fußweg soll je nach Fortschritt <.a name="2018-10-25-5-leeschenblick-und-fabriciusstrasse">des Kreisels mit der Fabriciusstraße</.a> ab Sommer 2020 angelegt werden. Wann der eigentliche Radweg kommen soll ist noch nicht bekannt.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
