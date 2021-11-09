defmodule Data.Article.Blog.Eulenkamp do
  use Article.Default

  def name(), do: "#{created_at()}-6-eulenkamp"
  def created_at(), do: ~D[2019-01-07]
  def updated_at(), do: ~D[2019-11-30]
  def title(), do: "Eulenkamp (Veloroute 6, zw. Friedrich-Ebert-Damm und Alter Teichweg)"

  def start(), do: ~d[2020-08-03]
  def stop(), do: ~d[2021-03-19]

  def type(), do: :finished
  def construction_site_id_hh(), do: [10453]
  def tags(), do: ["6"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Bisher ist der <.m bounds="10.064856,53.579146,10.075162,53.589051">Eulenkamp</.m> für Fahrräder praktisch nicht zu benutzen, auch im betrachteten Abschnitt. Die schmalen Radwege die sich teils baulich in einem schlechten Zustand befinden und dann auch noch ohne Sicherheitsabstände neben legalen und illegalen Parkplätzen verlaufen wirken eher abschreckend. Entsprechend würde jedwede Planung den Zustand verbessern.</p> <p>Der vorgesehene Umbau kommt erstaunlich fahrradfreundlich daher: zwar bleibt es bei 50 km/h, aber dafür gibt es beidseitig mindestens 1,80m breite Radfahrstreifen. Lediglich in der Einmündung <.m bounds="10.060144,53.58279,10.073862,53.58615">Dulsberg-Süd</.m> und am <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.58921, lon: 10.075493, zoom: 18}))}>nördlichen Ende des Eulenkamp</.m> gibt es Schutzstreifen (gestrichelete Linie), damit LKW die Querungshilfen legal passieren können. Auch die Altglascontainer werden etwas verschoben, sodass sie nicht mehr direkt an den Radweg angrenzen. Insbesondere wurde die Sicherheit der Radfahrenden mit denen der Anzahl der PKW-Stellplätze abgewägt – und letztere zogen den Kürzeren.</p> <p>Ziel ist es die Umbauten bis Ende 2020 durchzuführen.</p> <p> <.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1008514">Abschließender Erläuterungsbericht</.a> (leider ohne Lagepläne)<br> <.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1007644">veraltete Lagepläne des ersten Entwurfs</.a><br> <.a href="https://www.hamburg.de/wandsbek/strassenbaustellen/14292132/eulenkamp/">Infoseite der Stadt zur Baustelle</.a> </p>
    """
  end
end
