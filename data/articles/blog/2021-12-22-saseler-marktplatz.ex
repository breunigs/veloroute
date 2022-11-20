defmodule Data.Article.Blog.SaselerMarktplatz do
  use Article.Default

  def created_at(), do: ~D[2021-12-22]
  def title(), do: "Saseler Marktplatz (Veloroute 14)"

  def type(), do: :construction
  def tags(), do: ["14"]

  def start(), do: ~d[2022-02-14]
  def stop(), do: ~d[2022-12]

  def links(_assigns) do
    [
      {"Lagepläne und Bauvergabe",
       "https://suche.transparenz.hamburg.de/dataset/neugestaltung-saseler-mark"},
      {"Infoseite der Stadt",
       "https://www.hamburg.de/wandsbek/strassenbaustellen/15555824/saseler-markt/"}
    ]
  end

  def summary(),
    do:
      "Saseler Markt wird teilweise Platz mit Aufenthaltscharakter. Außer Radanlehnbügeln keine Verbesserungen für den Radverkehr."

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Saseler Markt selbst ist ein reiner KFZ-Parkplatz, außer an Markttagen. Der Radverkehr umfährt ihn um der Veloroute zu folgen. Bei der Fahrt gegen den Uhrzeigersinn ist die Querungsampel nur durch Umwege zu erreichen.</p>

    <h4>Planung</h4>
    <p>Es ist vorgesehen, den Parkplatz zu halbieren. Auf der östlichen Seite soll ein Platz mit Aufenthaltscharakter entstehen, u.a. durch umlaufende Bänke an den Rändern. Der Gesamtbereich soll neu gepflastert werden. Die heute asphaltierten Straßen werden ebenfalls gepflastert. Neu hinzukommen eine StadtRAD-Station sowie Anlehnbügel zum Anschließen von Fahrrädern.</p>

    <p>Die grobe Führung bleibt gleich. Die <.m bounds="10.111461,53.652959,10.112332,53.653438" lon={10.111883} lat={53.653131} dir="backward" ref="14">Sackgasse Richtung Osten</.m> wird aber offenbar gleichberechtigt, sodass hier Rechts-vor-Links gilt. Der <.m bounds="10.110138,53.653657,10.111424,53.65413" lon={10.110259} lat={53.653776} dir="backward" ref="14">schmale Radweg an der Hauptverkehrsstraße</.m> bleibt ebenfalls bestehen.</p>

    <h4>Meinung</h4>
    <p>Die Platzgestaltung bleibt hinter den Möglichkeiten zurück – in der Umgebung gibt es zahlreiche weitere KFZ-Parkplätze, sie hier nur um die Hälfte zu reduzieren ist mindestens fragwürdig.</p>

    <p>Das man die Führung an der Hauptverkehrstraße nicht anpasst ist jedoch grober Unfug. Sie bleibt umständlich, der Radweg erreicht nur das absolute Minimum von 1,62m, der Fußweg unterschreitet das sogar teilweise noch. Auch endet der Radweg an der Ampel – wie heute soll der Radverkehr sich irgendwie mit „<.ref>Fahrrad frei</.ref>“ durchmogeln.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
