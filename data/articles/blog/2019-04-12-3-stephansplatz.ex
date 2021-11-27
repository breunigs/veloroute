defmodule Data.Article.Blog.Stephansplatz do
  use Article.Default

  def name(), do: "#{created_at()}-3-stephansplatz"
  def created_at(), do: ~D[2019-04-12]
  def updated_at(), do: ~D[2020-09-05]
  def title(), do: "Stephansplatz (Veloroute 3)"

  def start(), do: ~d[2021-03-01]
  def stop(), do: ~d[2021-11-21]

  def type(), do: :finished
  def construction_site_id_hh(), do: [14688]
  def tags(), do: ["3"]

  def links(_assigns) do
    [
      {"Pressemitteilung zur Fertigstellung",
       "https://www.hamburg.de/bvm/medien/15616728/2021-11-21-bvm-esplanade/"},
      {"Infoseite des LSBGs zum Umbau",
       "https://lsbg.hamburg.de/esplanade/13287196/umbau-esplanade/"},
      {"Baustelleninfo",
       "https://lsbg.hamburg.de/contentblob/15595816/351893310b12b3cd697af3ed8908baf7/data/esplanade-dammtordamm-stephansplatz-%E2%80%93-sperrungen-%E2%80%93-21-11-21-bis-22-11-21.pdf"},
      {"Erläuterungsbericht",
       "https://lsbg.hamburg.de/contentblob/12437970/ee10808c85b64c942de1c1f17fadc23e/data/esplanade-von-gorch-fock-wall-bis-neuer-jungfernstieg-abstimmungsunterlage-bericht.pdf"},
      {"Lageplan",
       "https://lsbg.hamburg.de/contentblob/12437968/ac9753f143f3324e5b1e8fe58102177e/data/esplanade-von-gorch-fock-wall-bis-neuer-jungfernstieg-abstimmungsunterlage-plan.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand September 2020</h4>
    <p>Der LSBG hat die abschlossene Planung veröffentlicht und nimmt den Radverkehr diesmal wirklich ernst. Im ersten Entwurf wurde die Situation für den Radverkehr teils sogar schlechter. Der Artikel wurde an die neue Fassung angepasst.</p>

    <h4>Bestand</h4>
    <p>Der aktuelle Zustand der Radwege über den <.m bounds="9.98847,53.557063,9.989571,53.55877">Stephansplatz</.m> ist akzeptabel, wenn auch die verfügbare Breite deutlich zu schmal ist. Am kritischsten ist hier vor allem die fehlende Radführung West-Ost in Richtung <.m bounds="9.992951,53.5557,10.000595,53.557791">Lombardsbrücke</.m>.</p>

    <h4>Pläne</h4>
    <p>Im Zuge der Umplanung der <.m bounds="9.989051,53.557503,9.993183,53.558317">Esplanade</.m> wird auch die Kreuzung am Stephansplatz und angrenzende Straßen umgebaut. In der Kreuzung gibt es erstmals durchgängige Radfahrstreifen für alle Richtungen, die mit rund 2,0m Breite auch brauchbar breit ausfallen. Sie sollen zusätzlich rot hervorgehoben werden. Linksabbiegen ist zwar in alle Richtungen möglich, jedoch nur mittels <.ref>indirektem Linksabbiegen</.ref>.</p>

    <p>Im Vor- und Nachlauf der Kreuzung wird der Radverkehr ebenfalls auf 2,0m breiten Radfahrstreifen geführt. Ausnahme bildet der Weg nach Norden: Im <.m bounds="9.987593,53.557069,9.989654,53.558251" lon="9.9886025" lat="53.5575438" dir="forward">Bereich der Bushaltestelle in der Dammstorstraße</.m> bleibt der Radweg mit 1,5m weiterhin zu schmal. Nach der Kreuzung, auf <.m bounds="9.988345,53.558156,9.990406,53.559339" lon="9.9895327" lat="53.5585385" dir="forward">Höhe des Casinos</.m>, wird auf den vorhandenen Hochbordradweg aufgeleitet, der allerdings ebenfalls auf 2,0m verbreitert wird.</p>

    <p>Teilweise werden die Radfahrstreifen auch durch rund 50cm breite Fahrbahnteiler vom KFZ-Verkehr getrennt. Sie sind auf fast der gesamten Länge im <.m bounds="9.988167,53.558274,9.990758,53.559845">Dammtordamm</.m> Richtung Süden und der <.m bounds="9.989149,53.556924,9.992913,53.559206">Esplanade</.m> Richtung Westen vorgesehen. In Richtung Osten gibt es nur wenige Trenner, da KFZ-Ladeflächen rechts des Radfahrstreifens eingerichtet werden.</p>

    <p>Im <.m bounds="9.987216,53.557897,9.989182,53.558689">Gorch-Fock-Wall</.m> werden die Radfahrstreifen durch Haltezone für den Bus geführt, eine Vorbeifahrt ist nur durch Einordnen in den KFZ-Verkehr gefahrlos möglich. Entlang der <.m bounds="9.987281,53.557617,9.989248,53.558408" lon="9.9887283" lat="53.5578861" dir="backward">Dammstorstraße</.m> Richtung Süden wird der Radfahrstreifen mit einem Sicherheitsabstand zu den Parkplätzen ausgestattet um die <.ref>Dooring-Gefahr</.ref> zu verringern.</p>

    <p>Umgebaut werden soll in Abstimmungen mit umliegenden Maßnahmen. Nach aktuellem Stand ist die Umsetzung für ganz 2021 angesetzt.</p>

    <h4>Meinung</h4>
    <p>Die Verbesserungen für den Radverkehr liegen auf der Hand und beheben endlich die untragbare Verkehrsführung in West/Ost Richtung. Dennoch gibt es einige Kritikpunkte:</p>
    <ul>
    <li><.m bounds="9.987593,53.557069,9.989654,53.558251" lon="9.9886025" lat="53.5575438" dir="forward">Dammstorstraße Richtung Norden</.m>: Zu Gunsten des Fußverkehrs sollte der KFZ-Rechtsabbieger entfallen. Rechtsabbiegen für KFZ kann auch problemlos über den Straßenzug Valentinskamp – Caffamacherreihe – Gorch-Fock-Wall erfolgen.</li>
    <li><.m bounds="9.987216,53.557897,9.989182,53.558689">Führung durch den Bushalt im Gorch-Fock-Wall</.m>: Die Planung führt ausschließlich die geringe Anzahl an Bussen als Argument an. Warum der Bus Richtung Hauptbahnhof nicht wie bisher auf einer KFZ-Spur halten kann wird nicht erläutert.</li>
    </ul>

    <h4>Quellen</h4>
    <.structured_links/>
    """
  end
end
