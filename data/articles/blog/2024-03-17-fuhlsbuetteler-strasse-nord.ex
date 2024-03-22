defmodule Data.Article.Blog.FuhlsbuettelerStrasseNord do
  use Article.Default

  def title(),
    do:
      "Fuhlsbüttler Straße – Nördlicher Teil (Radroute Plus Bad Bramstedt, Bezirksrouten N3 und N8)"

  def summary(),
    do:
      "Zweirichtungsradweg auf der westlichen Seite soll Lückenschluss zwischen dem Zweirichtungsradweg Wellingsbütteler Landstraße und Im Grünen Grunde herstellen."

  def type(), do: :planned
  def stop(), do: ~d[2030]

  def tags(), do: ["rsw-bad-bramstedt", "br-nord-n3", "br-nord-n8", "N26"]

  def point_of_interest(), do: %{lon: 10.031908, lat: 53.625003, zoom: 17}

  def links(_assigns) do
    [
      {"1. Entwurf, Erläuterungen und Lagepläne", "März 2024",
       "https://www.hamburg.de/hamburg-nord/planen-bauen-wohnen/18274952/detailplaene-dritter-abschnitt/"},
      {"Übersichtsseite Planung Radroute Plus Bad Bramstedt",
       "https://www.hamburg.de/hamburg-nord/radschnellweg"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es sind beidseitig <.ref>Hochbordradwege</.ref> mit 0,9m bis 1,6m Breite vorhanden. Sie dürfen nur in die jeweilige Fahrtrichtung benutzt werden. Da es aus <.v bounds="10.031278,53.622745,10.033678,53.624605" lon={10.032132} lat={53.624146} dir="backward" ref="br-nord-n3">Im Grünen Grunde</.v> keine Querungsmöglichkeit gibt, sind weite Umwege notwendig um von dort die <.v bounds="10.027526,53.624366,10.034867,53.628629" lon={10.031664} lat={53.625934} dir="forward" ref="br-nord-n8">Wellingsbütteler Landstraße</.v> zu erreichen. Ohne Ortskenntnis sind diese nicht auffindbar.</p>

    <p>Die <.v bounds="10.029213,53.625077,10.032514,53.626844" lon={10.031201} lat={53.626111} dir="backward" ref="br-nord-n8">Ampeln an der Einmündung Wellingsbütteler Landstraße</.v> sind nicht auf den Radverkehr abgestimmt. Es entstehen lange Wartezeiten, was wegen der fehlenden Aufstellflächen zu Rückstau auf die Gehwege führt.</p>

    <h4>Planung</h4>
    <p>Auf der <.v bounds="10.030825,53.623483,10.032536,53.626098" lon={10.0318} lat={53.625235} dir="backward" ref="br-nord-n8" highlight="Fuhlsbüttler Straße">Westseite der Fuhlsbüttler Straße</.v> soll ein Zweirichtungsradweg entstehen. Er verbindet <.v bounds="10.030825,53.623483,10.032536,53.626098" lon={10.031909} lat={53.623691} dir="backward" ref="br-nord-n8">Im Grünen Grunde</.v> mit dem <.a name="2020-10-24-wellingsbuetteler-landstrasse">geplanten Zweirichtungsradweg in der Wellingsbütteler Landstraße</.a>. Er wird 3,20m bis 4,10m breit.</p>

    <p>Als Besonderheit werden Gehweg und Radweg getauscht: der Gehweg verläuft nahe der <.ref>Fahrbahn</.ref> und der Radweg direkt an der Lärmschutzwand. Zu Fuß muss der Radweg daher zwei mal gequert werden. Man macht dies um die Bäume erhalten zu können und trotzdem breite Wege anbieten zu können.</p>

    <p>Die <.v bounds="10.02919,53.624783,10.033154,53.627263" lon={10.031696} lat={53.625842} dir="forward" ref="br-nord-n8" highlight="Wellingsbütteler Landstraße">Einmündung Wellingsbütteler Landstraße</.v> wird komplett umgestaltet, um die beiden Zweirichtungsradwege verbinden zu können. Die <.v bounds="10.029806,53.625097,10.032701,53.626927" lon={10.03116} lat={53.626109} dir="backward" ref="br-nord-n8">Furt im nördlichen Teil</.v> wird dafür 4,0m breit und erlaubt das Queren ohne auf der Mittelinsel anzuhalten. Die Radfurt hat eine eigene Ampelphase, sodass unaufmerksame Rechtsabbieger aus der Wellingsbütteler Landstraße keine Gefahr darstellen.</p>

    <p>Da der Radwegstummel auf der <.v bounds="10.03039,53.625142,10.032839,53.627114" lon={10.031661} lat={53.6259} dir="forward" ref="br-nord-n8" highlight="Wellingsbütteler Landstraße">Südseite der Wellingsbütteler Landstraße</.v> entfällt, wird auf der Südseite der Kreuzung auch keine Querungsmöglichkeit für den Radverkehr mehr vorgesehen.</p>

    <p>Die <.v bounds="10.030502,53.623319,10.032979,53.62663" lon={10.032134} lat={53.625297} dir="forward" ref="br-nord-n3" highlight="Fuhlsbüttler Straße">Ostseite der Fuhlsbüttler Straße</.v> wird nicht umgestaltet.</p>

    <h4>Meinung</h4>
    <p>Die grundlegende Idee des Zweirichtungsradwegs ist gut.</p>

    <p>Den Gehweg direkt an den KFZ-Lärm zu legen dürfte in der Praxis kaum funktionieren – Viele laufen vermutlich lieber auf dem Radweg. Sinnvoller wäre ein Durchlass der Lärmschutzwand an der Kreuzung. Immerhin ist der Fußverkehr auf dem Abschnitt gering.</p>

    <p>Unverständlich ist, warum man den östlichen Radweg nicht ebenfalls anpasst. Mit nur 90cm Breite ist er selbst für normale Fahrräder zu schmal.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
