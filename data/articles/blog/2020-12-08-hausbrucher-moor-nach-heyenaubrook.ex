defmodule Data.Article.Blog.HausbrucherMoorNachHeyenaubrook do
  use Article.Default

  def name(), do: "#{created_at()}-hausbrucher-moor-nach-heyenaubrook"
  def created_at(), do: ~D[2020-12-08]

  def title(), do: "Hausbrucher Moor nach Heyenaubrook (Veloroute 10)"

  def start(), do: ~d[2020-12-01]
  def stop(), do: ~d[2021-03-31]

  def type(), do: :finished

  def tags(), do: ["10"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Bestand</h4> <p>Es handelt sich um einen ungefestigten, unbeleuchteten Feldweg. Die Fahrrinnen sind mit etwas Schotter versehen, sodass dieser Abschnitt auch bei Regen befahrbar bleibt.</p>
    <h4>Baustelle</h4> <p>Bereits seit Anfang Dezember wird hier ein 3,0m breiter Zweirichtungsradweg asphaltiert. Der Fußweg soll 2,0m breit ausfallen, aber in feinem Schotter (Grand) ausgebaut werden. Anders als heute werden beide beleuchtet.</p> <p>Der Umbau erfolgt unter Vollsperrung, die Umleitung erfolgt über die B73. Der <.a href="/article/2020-05-31-heykenaubrook">Bahnübergang</.a> selbst ist nicht teil dieser Baumaßnahme.</p>
    <h4>Meinung</h4> <p>Es gibt wenig zu sagen: bei Regen sollte mit zu Fuß Gehenden auf dem Radweg gerechnet werden, die den Pfützen auf dem Schotterweg ausweichen. Allerdings dürfte der Fußverkehr gering genug sein, sodass dies kaum ins Gewicht fällt.</p>
    <h4>Quelle</h4> <p><.a href="https://www.hamburg.de/harburg/pressemeldungen/14719392/ausbau-der-veloroute-10/">Pressemitteilung der Stadt</.a></p>
    """
  end
end
