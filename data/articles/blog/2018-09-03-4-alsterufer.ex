defmodule Data.Article.Blog.Alsterufer do
  use Article.Default

  def name(), do: "#{created_at()}-4-alsterufer"
  def created_at(), do: ~D[2018-09-03]
  def updated_at(), do: ~D[2020-11-22]
  def title(), do: "Radweg am Alsterufer (Veloroute 4)"

  def start(), do: ~d[2020-11-23]
  def stop(), do: ~d[2021-07]

  def type(), do: :finished

  def tags(), do: ["4"]

  def links(_assigns) do
    [
      {"Lageplan",
       "https://web.archive.org/web/20201201140259/https://lsbg.hamburg.de/contentblob/13755304/c54a12df525b7e9134e76fd25b14b2a3/data/alster-farradachse-alsterufer-von-fontenay-bis-alsterglacis-planung-plan.pdf"},
      {"Erläuterungsbericht zur Umgestaltung",
       "https://web.archive.org/web/20201201150049/https://lsbg.hamburg.de/contentblob/13755298/d33e2da7b9eb51fe531ac4d903c9e8d8/data/alster-farradachse-alsterufer-von-fontenay-bis-alsterglacis-abgestimmte-planung-bericht.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Umleitung</h4> <p>Während der Bauzeit wird der Radverkehr über die Warburgstraße / Alsterterrasse / Neue Rabenstraße / Mittelweg / Alte Rabenstraße umgeleitet.</p>
    <h4>Beschreibung</h4> <p>Vor einigen Jahren wollte das US-Konsulat noch umziehen, aber das wurde auf unbestimmte Zeit verschoben. Daher hat man die Pläne nun angepasst, um die Situation für den Radverkehr trotz des eingeschränkten Platzes vor dem Konsulat zu verbessern.</p>
    <p><.m bounds="9.994018,53.561017,10.00286,53.566283">Von Norden kommend</.m> wird die Fahrradstraße bis zur <.m bounds="9.994018,53.561017,10.00286,53.566283">Absperrung am Konsulat</.m> im Wesentlichen genauso fortgesetzt. Das heißt 5,5m breit und freie Sicht auf die Alster. Parkplätze gibt es nur zur Gebäudeseite hin. Schikanen, Poller und andere Hindernisse sind hier nicht geplant.</p>
    <p>Vor dem Konsulat schwenkt die Fahrradstraße ab und wird auf 3m verschmälert. Der Fußweg daneben bleibt mit 4m ungefähr so breit wie heute. KFZ können diese Engstelle wie bisher auch weiterhin nicht befahren. Die Poller bleiben, aber der Radweg wird so geplant, das sie möglichst wenig stören.</p>
    <p>Nach dem Konsulat gibt es wieder die gewohnten 5,50m Breite, allerdings hat man sich hier für Parkplätze auf beiden Seiten entschieden. Begründet wird dies mit Parkplatzerhalt und da die Ruderclubs die Sicht auf die Alster bereits teilweise versperren.</p>
    <p>An der <.m bounds="9.991354,53.556757,9.999662,53.561705">Alsterterrasse</.m> endet die Fahrradstraße, wobei der Radverkehr hier trotzdem Vorfahrt eingeräumt bekommen soll. Im Anschluss wird provisorisch an die vorhandenen Radwege angeschlossen – der Vollumbau soll während der <.a name="2019-04-10-4-kreuzung-neuer-jungfernstieg">Umgestaltung der Kreuzung</.a> erfolgen. Auf <.m bounds="9.990369,53.55582,9.999211,53.561086">Höhe der Kurve</.m> wird durch eine Querungshilfe und kurzes Radweg-Verbindungsstück die Weiterfahrt über die Kennedybrücke ermöglicht.</p>
    <p>Man merkt, das Hamburg die westliche Alster-Fahrradachse zum Aushängeschild machen möchte. Klar, die Engstelle vor dem Konsulat ist ärglich, aber der Stadt nicht vorzuwerfen. Ansonsten muss man Mängel schon sehr genau suchen – etwa sind die Längsparkplätze im südlichen Teil ohne Sicherheitsabstände geplant, was beim Unachtsamen öffnen von Autotüren ein Problem werden kann. Ansonsten stimmt die Planung aber. </p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
