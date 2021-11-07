defmodule Data.Article.Blog.VerbindungswegBernerAuRoterHahn do
  use Article.Default

  def name(), do: "#{created_at()}-6-verbindungsweg-berner-au-roter-hahn"
  def created_at(), do: ~D[2018-10-17]

  def title(),
    do:
      "Verbindungsweg zwischen „An der Berner Au“ und „Roter Hahn“ (Veloroute 6, „Abschnitt W19“)"

  def start(), do: ~d[2020-06-02]
  def stop(), do: ~d[2020-12]

  def type(), do: :finished

  def tags(), do: ["6"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>In der aktuellen Ausführung fragt man sich bis zuletzt, ob man hier wirklich der Veloroute folgt und nicht gerade in eine private Gebäudezufahrt fährt. So unscheinbar wirkt dieser Verbindungsweg zwischen den Straßen <.m bounds="10.115823,53.616185,10.121817,53.622506">An der Berner Au</.m> und <.m bounds="10.11645,53.622199,10.12132,53.625579">Roter Hahn</.m>. Geplant ist die Teilstücke zu einer durchgängigen Spielstraße umzubauen, wobei vor allem die kurze Brücke in der Mitte verbessert wird. Die Durchganssperre für KFZ bleibt weiterhin bestehen.</p> <p>Der Bericht geht davon aus, das sich die KFZ künftig an das Parkverbot in der Spielstraße halten werden. Da sich die verfügbare Breite nicht ändert, ist auch weiterhin davon auszugehen, das die Straße einseitig zugeparkt wird.</p> <p>Unterm Strich wird dieses kurze Teilstück mit der Umplanung viel besser, selbst wenn an der Straße wie jetzt geparkt wird. Ich zweifle aber daran, das eine Spielstraße mit Schrittgeschwindigkeit das geeignete Mittel für eine Veloroute ist. Es ist nicht davon auszugehen, das sich viele Radfahrende daran halten werden.</p> <p>Der Umbau ist 2019 vorgesehen.</p> <p><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1008837">Erläuterungsbericht zur Umgestaltung mit vorläufigem Lageplan</.a> (unter Anlagen)</p>
    """
  end
end
