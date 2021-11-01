defmodule Data.Article.Blog.Veddel do
  use Article.Default

  def name(), do: "#{created_at()}-veddel"
  def created_at(), do: ~D[2020-06-06]

  def title(), do: "Veddel (Veloroute 10)"

  def start(), do: ~d[2021-02-22]
  def stop(), do: ~d[2021Q4]

  def type(), do: :construction

  def tags(), do: ["10"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die Veloroute 10 hat auf der Veddel die Standardprobleme in Hamburg: unkomfortabler Straßenbelag und wie man Abbiegen soll um der Veloroute zu folgen muss man erraten. Speziell in der belebten <.m bounds="10.010763,53.522843,10.023564,53.525775">Veddeler Brückenstraße</.m> wird man auch häufiger von einparkenden KFZ ausgebremst.</p> <p>Viele der Probleme werden in der vorliegenden Planung behoben: die Führung wird sehr deutlich und die das alte Kopfsteinpflaster wird entfernt. Die <.m bounds="10.010763,53.522843,10.023564,53.525775">Veddeler Brückenstraße</.m> wird dabei im „Stadtbereich“ zu einer Fahrradstraße mit „KFZ frei“. Man wird also vermutlich auch künftig ausgebremst werden. Der <.m bounds="10.020561,53.525047,10.021532,53.528326">Sieldeich</.m> wird ebenfalls zu einer Fahrradstraße, bis auf ein kurzes Stück 30er Zone <.m bounds="10.019853,53.527631,10.022453,53.528665">zwischen der Wilhelmsburger Straße und der Tunnelstraße</.m>. Die <.m bounds="10.016401,53.524661,10.02872,53.527483">Auffahrt zu den Elbbrücken</.m> über die Veddeler Brückenstraße erhält neues Pflaster und soll zu einem Zweirichtungsradweg ausgebaut werden. Angesetzt sind meistens 3,0m, an Engstellen durch vorhandene Bäume wird es aber auch schmaler.</p> <p>An den Übergangsstellen gibt es ebenfalls Verbesserungen: An der <.m bounds="10.019563,53.524516,10.022075,53.525477">Kreuzung Sieldeich/Hovestieg/Veddeler Brückenstraße</.m> sind die Führungen für alle Wegbeziehungen nun klar und ohne Hindernisparkour befahrbar. In den Hauptwegbeziehungen entlang der Veloroute sind die Kurvenradien weit genug, sodass starkes Abbremsen nicht mehr erforderlich ist. Die Breiten sind ebenfalls größer als heute.</p> <p>Die zweite Verbesserung ist die neue Führung <.m bounds="10.012892,53.521944,10.017343,53.523646">rund um den S-Bahnhof</.m>. Die Veloroute erhält hier teilweise einen neuen Zweirichtungsradweg, sodass man die <.m bounds="10.014838,53.521722,10.01517,53.522778">Wilhelmsburger Brücke</.m> künftig in beiden Richtungen auf der Ostseite überquert. Wo der Radweg neu gebaut wird ist er mit 4,0m ordentlich breit. An den anderen Stellen soll es wohl beim Mischverkehr Fuß/Rad bleiben. Der Kurvenradius von der Veddeler Brückenstraße auf den Fußweg ist knapp bemessen, sodass man die Geschwindigkeit reduzieren muss – angesichts dieser absurden Planung auch bitter nötig.</p> <p>Insgesamt ergibt sich für den Radverkehr eine Verbesserung vor allem an den Kreuzungen. Dadurch, das die Fahrradstraßen Vorfahrt haben und die Übergänge großzügiger wurden, sollte man hier besser vorankommen. Ob man angesichts der auch heute zahlreichen Falschparker die Fahrradstraßen genießen kann bleibt abzuwarten. Getrübt wird das Bild durch die Führung über den Fußweg, was nicht erst seit gestern völlig inakzeptabel ist.</p> <ul>
    <li><.a href="https://www.hamburg.de/mitte/strassenbau-und-verkehr/13884848/">Infoseite der Stadt</.a> (Pläne als Download am Ende der Seite)</li>
    <li><.a href="https://www.abendblatt.de/hamburg/article231627585/Ausbau-der-Veloroute-10-auf-der-Veddel-hat-begonnen.html">Artikel Abendblatt zum Baustart [€]</.a></li>
    </ul>
    """
  end
end
