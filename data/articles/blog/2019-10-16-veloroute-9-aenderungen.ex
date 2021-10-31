defmodule Data.Article.Blog.Veloroute9Aenderungen do
  use Article.Default

  def name(), do: "#{created_at()}-veloroute-9-aenderungen"
  def created_at(), do: ~D[2019-10-16]

  def title(), do: "Änderungen Veloroute 9 von Mitte 2018 bis Mitte 2019"

  def type(), do: nil

  def tags(), do: [9]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Tatsächlich sind mir auf der <.a href="/9">Veloroute 9</.a> keine Verbesserungen aufgefallen. Trotzdem gibt es eine wichtige Änderung: die Route führt über die <.a href="/9#14.2/53.52004/10.08166/xbBnX8PttIg6asatTY3-_g">Halskestraße</.a> und nicht über die Bredowstraße – zumindest noch nicht. Für die Zukunft ist dort der Ausbau der Veloroute vorgesehen, aber bis dies geschieht bleibt die Führung über die Halskestraße. Die <abbr title="Behörde für Wirtschaft, Verkehr und Innovation">BWVI</abbr> (<.a href="https://fahrrad.hamburg/de/service/velorouten/">fahrrad.hamburg</.a>) und der <abbr title="Landesbetrieb Geoinformation und Vermessung">LGV</abbr> (<.a href="http://geoportal-hamburg.de/verkehrsportal/?layerIDs=1043,4866&amp;visibility=true,true&amp;transparency=0,0&amp;center=568582.1417433872,5932081.524032326&amp;zoomlevel=1">geoportal-hamburg.de</.a>) sind sich hier uneins, aber ich habe bereits um Angleichung gebeten. Meine Info stammt von der BWVI, Mitte Juli 2019.</p>
    <p>Für den Radverkehr optimiert sind weder Bredowstraße noch Halskestraße. Der wesentliche Unterschied liegt im Teilstück <strong>Unterer Landweg</strong>. Bei einer Führung über die Halskestraße stehen <.a href="/9#16.54/53.515625/10.094505/Jx_R_fDFCWbSgXOnZgE5sA">Hochbordradwege</.a> zur Verfügung und es gibt <.a href="/9#16.54/53.517487/10.097171/ZR_WQwENHD97ypvwywSJzw">Querungshilfen</.a>. Leider sind <.a href="/9#16.54/53.517487/10.097171/MnkmTYeg3BApUKkBbNh4eg">die Rampen</.a> viel zu schmal und man muss durch den <.a href="/9#16.54/53.517487/10.097171/Y630TKJ3zjzMfDt_uk5bkQ">S-Bahnhof</.a> fahren. Fährt man über die Bredowstraße muss man ein Stück im Mischverkehr auf dem unteren Landweg fahren, was bei 50 km/h Höchstgeschwindigkeit und hohem LKW Anteil unangenehm ist.</p>
    <p>Wenn ich etwas übersehen habe, <mailto>schreib mir</mailto> bitte.</p>
    """
  end
end
