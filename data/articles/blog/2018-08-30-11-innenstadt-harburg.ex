defmodule Data.Article.Blog.InnenstadtHarburg do
  use Article.Default

  def name(), do: "#{created_at()}-11-innenstadt-harburg"
  def created_at(), do: ~D[2018-08-30]

  def title(), do: "Innenstadt Harburg (Veloroute 11)"

  def type(), do: :planned

  def tags(), do: [11]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Diese Umplanung betrifft die fast die gesamte Harburger Innenstadt. Sie verlegt die Radwege als Radfahrstreifen auf die Straße, wobei die Breiten jeweils mindestens 1,85m betragen sollen (außer an manchen Stellen in den Kreuzungsbereichen). Die neue Führung verspricht die Wege sehr klar und vorallem weniger kurvenreich umzusetzen.</p> <p>An der Kreuzung Hannoversche Straße wird es nach dem Umbau möglich sein Richtung Hamburg direkt links abzubiegen, was eine erhebliche Zeitersparnis bringen dürfte. Indirektes Abbiegen ist aber auch weiterhin möglich. In umgekehrter Richtung ist dies aber nicht vorgesehen. Es bleibt zu hoffen, das die Ampelschaltung daraus kein Stop-und-Go Spiel macht.</p> <p>Auch aus der Wilstorfer Straße in die <.m bounds="9.985215,53.456725,9.988749,53.457328">Moorstraße</.m> wird es kein direktes Linksabbiegen geben. Davon abgesehen scheint die Führung aber ein akzeptabler Kompromiss zu sein.</p> <p>Der Neubau <.m bounds="9.989169,53.458068,9.990202,53.458749">Hannoversche Brücke</.m> ist bereits im Gange. Anschließen sollen sich die Verbesserungen in zwei Bauphasen ab 2019. Zuerst grob um die Moorstraße, danach um den Harburger Ring inkl. der naheliegenden Kreuzungen. Weitere Infos:</p> <ul> <li> <.a href="https://lsbg.hamburg.de/contentblob/9180928/62e5e6f8e1fbda5b384385f1cd14bbab/data/veloroute-11-harburg-innenstadt-zweite-abstimmungsunterlage-plaene.pdf">vorläufiger Lageplan</.a> </li> <li> <.a href="https://lsbg.hamburg.de/contentblob/9180924/842f0b67159d79e97292b3561caee1ba/data/veloroute-11-harburg-innenstadt-zweite-abstimmungsunterlage-bericht.pdf">Erläuterungsbericht zur Umgestaltung</.a> </li> </ul>
    """
  end
end
