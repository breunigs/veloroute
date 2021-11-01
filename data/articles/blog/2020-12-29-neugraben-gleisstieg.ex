defmodule Data.Article.Blog.NeugrabenGleisstieg do
  use Article.Default

  def name(), do: "#{created_at()}-neugraben-gleisstieg"
  def created_at(), do: ~D[2020-12-29]

  def title(), do: "Gleisstieg Neugraben (Veloroute 10)"

  def start(), do: ~d[2021-01-04]
  def stop(), do: ~d[2021-06-30]

  def type(), do: :finished
  def construction_site_id_hh(), do: [14084]
  def tags(), do: ["10"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Bestand</h4> <p>Der Gleisstieg ist ein asphaltierter, geteilter Fuß- und Radweg mit rund drei Metern Breite. Der Zustand des Weges ist gut.</p>
    <h4>Baustelle</h4> <p>Ab Januar 2021 wird der Abschnitt zu einem 3,0m breiten Zweirichtungsradweg ausgebaut. Der direkt anliegende Gehweg erhält je nach Bäumen unterschiedliche Breiten, mindestens aber 1,75m. Die <.m bounds="9.854198,53.472941,9.859655,53.475449" lon="9.8567359" lat="53.4741625" dir="backward"> Brücke über den Süderelbebogen</.m> wird nicht verbreitert, ebenso wird ein Stück im Bereich des S-Bahnhofs erst mit einer anderen Maßnahme umgebaut. Dort werden auch neue Fahrradstellplätze gebaut. Der Umbau erfolgt unter Vollsperrung.</p>
    <h4>Meinung</h4> <p>Der Teil, der tatsächlich umgebaut wird ist gut. Kurios wirkt das Stückwerk: vorm Bahnhof nicht, die Brücke auch nicht. Bleiben also rund zwei Stücke mit 180m bzw. 100m, für die die Veloroute ein halbes Jahr vollgesperrt wird. Ein Teil der Bauzeit wird sicher für eine hier durchgeführte Studie verwendet, was auch völlig in Ordnung ist. Fraglich ist eher die fehlende Baustellenkoordination.</p>
    <h4>Quelle</h4> <p><.a href="https://www.hamburg.de/harburg/pressemeldungen/14793396/bauarbeiten-neugraben/">Pressemitteilung der Stadt</.a></p>
    """
  end
end
