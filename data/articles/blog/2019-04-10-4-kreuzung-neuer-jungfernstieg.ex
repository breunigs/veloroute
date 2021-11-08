defmodule Data.Article.Blog.KreuzungNeuerJungfernstieg do
  use Article.Default

  def name(), do: "#{created_at()}-4-kreuzung-neuer-jungfernstieg"
  def created_at(), do: ~D[2019-04-10]

  def title(), do: "Kreuzung am Neuen Jungfernstieg (Veloroute 4)"

  def start(), do: ~d[2025]

  def type(), do: :intent

  def tags(), do: ["4"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand September 2020:</strong> Die Deutsche Bahn plant Umbauten am <.m bounds="10.000127,53.555559,10.002856,53.557072">Ferdinandstor</.m>, deswegen der Umbau dieser Doppelkreuzung vermutlich nicht vor 2025 stattfinden wird.</p>
    <p>In keine Richtung gibt es an diesem Doppelknoten eine fahrradfreundliche Schaltung, noch ist die Führung besonders einladend. Entlang der Veloroute 4 soll man stadtauswärts sogar auf die falsche Straßenseite wechseln, um auf einem kaum einen Meter breiten Radweg die Bahnbrücke zu unterqueren. Mit anderen Worten: Die Radverkehrsführung ist hier katastrophal.</p> <p>Die Umplanung verbessert die Situation definitiv, setzt aber nur Mindestmaße um. Es wird versucht möglichst viele der Unfallschwerpunkte zu entschärfen und die Ampelmissachtung durch verbesserte Schaltungen zu verringern. Da der Knoten aber als essentiell für den Autoverkehr angesehen wird und dieser entsprechend Vorrang in der Planung genießt, gelingt dies leider nicht immer. Etwa wird der Radverkehr von der <.a href="/#18/53.557684/9.993245">Lombardsbrücke zur Esplanade</.a> auch künftig mehrmals warten müssen, weil es sich „signaltechnisch nicht vermeiden“ lässt.</p> <p>Der erste Entwurf sieht folgende Änderungen vor:</p> <ul>
    <li>Die östliche Unterführung wird nur noch vom Autoverkehr benutzt, der Fußweg wird entfernt.</li>
    <li>Der Nord/Süd Radverkehr entlang der Veloroute wird durch die westliche Unterführung abgewickelt, wobei der Radweg je nach Richtung auf der „richtigen“ Seite ist. Hier wird es beidseitig Fußwege geben.</li>
    <li><.a href="/#18/53.559028/9.994293">Alsterufer und Warburgstraße</.a> sind jeweils Einbahnstraßen, wobei das Alsterufer von der Kreuzung wegführt, die Warburgstraße dagegen zur Kreuzung hin. Sie tauschen im Vergleich zu heute also jeweils die Richtung.</li>
    <li>Es wird versucht durch mehr KFZ-Aufstellflächen Rückstau in die Kreuzungsbereiche zu vermeiden.</li>
    <li>Bettelampeln werden abgeschafft und die Rad- und Fußfurten erhalten automatisch grün.</li>
    </ul> <p>Die Verbesserung für den Radverkehr ergibt sich hauptsächlich aus den Detailmaßnahmen zur Unfallreduktion. Die Führung im gesamten Kreuzungsbereich bleibt komplex, wobei sich häufig Einrichtung- und Zweirichtungsradwege abwechseln, sodass von viel Falschfahrenden auszugehen ist.</p> <p>Entlang der Veloroute sind drei (nach Süden) bzw. vier (nach Norden) Ampeln zu queren, die teils gemeinsam mit der Fußampel geschalten werden. Leider ergibt sich aus dem Erläuterungsbericht nicht wie häufig gehalten werden muss. Richtung Norden wird die Führung leicht begradigt, in der Gegenrichtung bleibt es im Wesentlichen wie bisher. Die angedachte Führung der Radwege entlang der Veloroute sind in der Karte skizziert (dunkelgraue Linien). Die Radwege verbleiben an vielen Stellen mit Mindestmaßen, bequemes Überholen ist also nicht möglich.</p> <p>Es ist schwierig in der Planung konkrete Verbesserungsmöglichkeiten auszumachen, da auch kleine Änderungen sich auf beide Kreuzungen auswirken und so ggf. die Situation insgesamt wieder verschlechtern. Um eine erhebliche Verbesserung zu erzielen wäre eine Verbreiterung der Unterführungen notwendig, oder die KFZ müssten Spuren abtreten. Erstes ist zu teuer und für letzteres ist Hamburg noch zu sehr auf KFZ fixiert. Es handelt sich hier um den ersten Entwurf, d.h. Details können durchaus noch geändert werden.</p> <p>Der Umbau soll 2020 bis 2021 in mehreren Bauphasen erfolgen. Die Kreuzungen sollen jeweils für alle Verkehrsteilnehmenden passierbar bleiben, aber die Spurenreduktion dürfte zu massiven Behinderungen im KFZ-Verkehr führen.</p> <ul>
    <li><.a href="https://lsbg.hamburg.de/contentblob/12432130/ddb27d99abdccdacd7bad70c44ad3096/data/doppelknoten-esplanade-neuer-jungfernstieg-abstimmungsunterlage-bericht.pdf">Erläuterungsbericht zum Umbau</.a></li>
    <li><.a href="https://lsbg.hamburg.de/contentblob/12432128/3e85e8095778bdb4b346996650c605ea/data/doppelknoten-esplanade-neuer-jungfernstieg-abstimmungsunterlage-plan.pdf">Lagepläne</.a></li>
    </ul>
    """
  end
end