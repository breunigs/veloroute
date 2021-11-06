defmodule Data.Article.Blog.Niedergeorgswerder do
  use Article.Default

  def name(), do: "#{created_at()}-niedergeorgswerder"
  def created_at(), do: ~D[2020-10-10]
  def updated_at(), do: ~D[2021-10-16]
  def title(), do: "Niedergeorgswerder (Veloroute 10)"

  def type(), do: :intent

  def tags(), do: ["10", "M12.1B"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Oktober 2021</h4> <p>Aus einer Präsentation vom Mai 2021 gehen einige Details hervor. Der Artikel wurde entsprechend konkretisiert.</p>
    <h4>Alter Zustand</h4> <p>Dieser lange Planungsabschnitt umfasst die Straßen <.m bounds="10.018735,53.518806,10.019367,53.520473">Veddeler Bogen</.m>, <.m bounds="10.019367,53.503152,10.031341,53.518806">Niedergeorgswerder Deich</.m> und die <.m bounds="10.007853,53.484021,10.027401,53.503764">Kirchdorfer Straße</.m>. Die Situation ist durch einen Hochbordradweg Richtung Süden geprägt. Dieser wird regelmäßig zu einem <.ref name="fahrrad-frei">Fußweg mit „Fahrrad frei“</.ref> und spielt Fuß und Rad gegeneinander aus. Vor einigen Jahren war dieser Radweg sogar ein <.ref>benutzungspflichtiger</.ref> Zweirichtungsradweg – dabei ist der Weg häufig schmaler als er heute für Radwege in eine Richtung sein müsste. Stellenweise ist er immer noch in der Gegenrichtung freigegeben, was jedoch kaum ersichtlich ist. Durch die fehlende Führung kommt es auch zu viel Geisterverkehr an nicht freigegebenen Stellen.</p>
    <h4>Planung</h4> <p>In Teilabschnitten konnte schon eine Führungsform festgelegt werden. Bis zum <.m bounds="10.016838,53.517635,10.020905,53.521337" lon="10.019265" lat="53.519098" dir="forward" ref="10">Georgswerder Bogen</.m> wird eine Fahrradstraße ausgeschildert. Danach soll in Fahrtrichtung Süden ein rund 2,0m breiter <.ref>Hochbordradweg</.ref> anschließen. In der Gegenrichtung ist dagegen ein 1,5m breiter <.ref>Schutzstreifen</.ref> vorgesehen. Diese asymmetrische Führung ist überall dort vorgesehen, wo genug Platz ist. Dies entspricht grob den Abschnitten wo keine Wohnbebauung direkt an die Straßen grenzt.</p>
    <p>In den engen Straßenabschnitten, sprich in <.m bounds="10.017624,53.504388,10.024745,53.517183" lon="10.020185" lat="53.51651" dir="forward" ref="10">Niedergeorgswerder</.m> und in <.m bounds="10.018453,53.492909,10.027933,53.50007" lon="10.024409" lat="53.498374" dir="forward" ref="10">Kirchdorf</.m> prüft man ob eine Tempo-30-Zone mit Rechts-vor-Links eingerichtet werden darf. Der Radverkehr führe dort im <.ref>Mischverkehr</.ref>.</p>
    <h4>Meinung</h4> <p>Ohne die vollständigen Planungsunterlagen bleibt eine Bewertung schwierig. Es ist klar, das die vorgeschlagenen Änderungen die Situation des Radverkehrs ein wenig verbessern. Von Velorouten-Standard ist die Planung jedoch sehr weit entfernt, da ein nur 1,5m breiter Schutzstreifen zu gefährlichem Überholen verleiten wird. In Richtung Süden muss die Praxis zeigen ob man vom Hochbordradweg gut in die Tempo-30-Zone kommt ohne geschnitten zu werden.</p> <p>Ohne eine starke Reduzierungen des Autoverkehrs wird dieser Abschnitt immer eine mangelhafte Veloroute bleiben. Da man schon die Einrichtung von Tempo 30 entlang der Wohngebiete als problematisch ansieht, sind effektivere Maßnahmen wie Durchfahrtssperren als völlig unrealistisch einzustufen.</p>
    <h4>Quellen</h4> <ul>
    <li><.a href="https://sitzungsdienst-hamburg-mitte.hamburg.de/bi//to020.asp?TOLFDNR=1028260">Präsentation Veloroute 10 auf Wilhelmsburg (Mai 2021)</.a></li>
    <li><.a href="https://www.hamburg.de/mitte/strassenbau-und-verkehr/13884848/">Infoseite der Stadt</.a> (noch keine Pläne für diese Maßnahme)</li>
    <li><.a href="https://sitzungsdienst-hamburg-mitte.hamburg.de/bi/vo020.asp?VOLFDNR=1013483">Planungsstand Anfang Oktober 2020</.a></li>
    </ul>
    """
  end
end
