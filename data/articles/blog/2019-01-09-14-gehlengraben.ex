defmodule Data.Article.Blog.Gehlengraben do
  use Article.Default

  def name(), do: "#{created_at()}-14-gehlengraben"
  def created_at(), do: ~D[2019-01-09]

  def title(), do: "Gehlengraben (Veloroute 14)"

  def start(), do: ~d[2020-03-30]
  def stop(), do: ~d[2021-08-01]

  def type(), do: :construction
  def construction_site_id_hh(), do: [295, 17929]
  def tags(), do: ["14"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Betrifft: <.m bounds="10.017493,53.649015,10.03166,53.650344">Gehlengraben</.m> von ca. <.m bounds="10.019,53.649423,10.021923,53.652715">Neukoppel</.m> bis <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.64891, lon: 10.03737, zoom: 18}))}>Lademannbogen (Ost)</.m></p> <p>Im Wesentlichen bleibt hier nach dem Umbau im Frühjahr 2020 alles beim Alten. Die Busse halten künftig direkt auf der Fahrspur damit sich Fahrgäste, Zufußgehende und Radverkehr weniger in die Quere kommen. Der Belag wird natürlich auch erneuert. Die Radwegbreiten orientieren sich an der 1,6m Mindestforderung, sofern der Platz ausreicht. Auf der Südseite ist dies meist nicht der Fall und Rad- und Fußverkehr werden gemischt geführt, wobei jedoch nur wenig Fußverkehr herrsche, da es keine direkten Anbauten gibt. Immerhin stehen hier dann 2,5m bis 3m zur Verfügung.</p> <p>Wo möglich werden die Radwege begradigt, was an den Kreuzungen jedoch meist nicht klappt. Hier wird man kurz vor der Kreuzung auf einen Radfahrstreifen mittels S-förmiger Kurve verschwenkt und quert so die Kreuzung. Direkt im Anschluss wird man dann wieder gerade auf den Radweg geleitet. Am Knoten <.m bounds="10.019434,53.64979,10.027526,53.653294">Am Schulwald</.m> soll die Radführung laut Plan jedoch so kurvig bleiben. Auch die Freigabe die Kreuzung „linksherum“ mit dem Fahrrad zu queren wird wieder eingerichtet, aber besser mit Pfeilen verdeutlicht.</p> <p>Der Plan wurde so bereits abgestimmt, d.h. Änderungen sind kaum noch zu erwarten. Zwar wird angesichts der Minimalaustattung sicher niemand Freudensprünge machen, mehr ist angesichts der Verkehrsstärken von 30&thinsp;000 KFZ zu 200 Fahrrädern pro Tag aber auch nicht sinnvoll. Daher empfinde ich die Planung auch als fairen Kompromiss, zumindest wenn die hier gemachten Einsparungen an dringlicherer Stelle in den Radverkehr investiert werden.</p> <ul>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/11998298/bbb3cf4eedcd8e57215f6d25caff9ffa/data/veloroute-14-gehlengraben-von-tangstedter-landstr-bis-lademannbogen-abgestimmte-planung-plan.pdf">fertiger Lageplan</.a>
    </li>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/11998296/d82201e5383f82f5589444318c9d596a/data/veloroute-14-gehlengraben-von-tangstedter-landstr-bis-lademannbogen-abgestimmte-planung-bericht.pdf">Erläuterungsbericht zur Umgestaltung</.a>
    </li>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/15199946/6c9bc82ba0c2f387637618425d6abc77/data/krohnstieg-06-2021-bis-08-2021.pdf">Baustelleninfo</.a>
    </li>
    </ul>
    """
  end
end
