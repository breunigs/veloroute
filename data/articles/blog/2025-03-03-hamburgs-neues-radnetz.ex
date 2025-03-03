defmodule Data.Article.Blog.HamburgsNeuesRadnetz do
  use Article.Default

  def title(), do: "Hamburgs gibt sich neues Ziel für Radnetz"

  def summary(), do: "Hamburg hat sein Radnetz ohne Ankündigung erweitert und überarbeitet. "

  def type(), do: :changed_routing
  def tags(), do: []

  def links(_assigns) do
    [
      {"Radnetz auf offiziellen Seite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/radnetz-1014730"},
      {"Radnetz der offiziellen Seite (Vollbild)",
       "https://experience.arcgis.com/experience/6c0145e31c4b48358864525acdf72fe8/"},
      {"Beispiele Radrouten Wegweiser",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/radwegweisung-1014650"},
      {"Routenliste",
       "https://hamburgize.blogspot.com/2025/01/hamburg-neues-radroutenkonzept-soll.html"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Neues Radnetz</h4>
    <p>Ohne Ankündigung hat Hamburg sein Radnetz neu nummeriert und erweitert. Diese neue Nummerierung soll teilweise in diesem Jahr (2025) ausgeschildert werden. Die ganzen Fachbegriffe wie „Veloroute“ oder „Radschnellweg“ werden zwar noch intern verwendet, nach außen hin heißt es künftig nur noch „Radroute“.</p>

    <p>Die neue Nummerierung verfolgt den Ansatz, Routen grob geradlinig verlaufen zu lassen. Sie lassen sich gut mit „Nord-Süd“ oder „Ost-West“ beschreiben. Natürlich gibt es auch „diagonal“ verlaufende Routen, deren Kurs ebenfalls klar ist, auch wenn sich das nicht so einfach in Himmelsrichtungen ausdrücken lässt. Die neue Logik löst das alte sternförmige Konzept ab, wo alle Routen ab Rathausmarkt starteten und nur durch zwei Ringrouten ergänzt wurden.</p>

    <p>Die Ringrouten erhalten daher mehrere neue Nummern, weil ihre Kreisform nicht ins neue Schema passt. Sternförmige Routen werden dagegen unter einer Nummer zusammengefasst und sind nun durchgängig. Der Umweg über den Rathausmarkt entfällt vollständig. Hinzu kommen viele Ergänzungen oder Zubringer, die nach aktuellem Planungsstand auch keine Nummern erhalten sollen.</p>

    <p>Eine vollständige Liste der 27 (geplanten) Radrouten gibt es auf der <a href="/">Startseite von veloroute.hamburg</a>.</p>

    <h4>Zugänge</h4>
    <p>Die auffälligsten Änderungen sind die geplanten neuen Routen bzw. Ergänzungen sind:</p>
    <ul class="hide-bullets">
      <li><.icon name="radroute-1"> Reeperbahn / B1 / Ring 1</.icon></li>
      <li><.icon name="radroute-1"> Anbindung Billstedts im Zuge des U4 Baus</.icon></li>
      <li><.icon name="radroute-2"> Straßenzug Schäferkampsallee / An der Verbindungsbahn / Kennedybrücke</.icon></li>
      <li><.icon name="radroute-15"> B1 / Ring 1</.icon></li>
      <li><.icon name="radroute-17"> Anbindung des UKE</.icon></li>
      <li><.icon name="radroute-21"> Neue Querung Norderelbe bei A1</.icon></li>
      <li><.icon name="radroute-22"> Anbindung Vier- und Marschlande bis Zollenspieker Fähre</.icon></li>
      <li><.icon name="radroute-concept-a"> Radroute entlang Elbchausee und HafenCity zum HBF</.icon></li>
      <li><.icon name="radroute-concept-b"> Radroute auf dem Altonaer Autobahndeckel nach Stellingen</.icon></li>
      <li><.icon name="radroute-concept-c"> Fernbahnhof Diebsteich zur Sternschanze (Verlängerung Radschnellweg Elmshorn)</.icon></li>
      <li><.icon name="radroute-concept-d"> Anbindung Schnelsen in Richtung Innenstadt</.icon></li>
    </ul>

    <h4>Abgänge</h4>
    <p>Wegen des geänderten Routenkonzepts sind viele kurze Abschnitte zwar nicht mehr nummeriert. Sie werden trotzdem als Teil des Radnetzes betrachtet, wie etwa die <.m bounds="9.97712,53.549097,9.989671,53.557911">Kaiser-Wilhelm-Straße</.m>. Manchmal wurden die Abschnitte auch ortsnah verlegt, wie etwa die Führung via <.m bounds="9.959842,53.554437,9.970143,53.565205">Neuer Pferdemarkt / Schanzenstraße</.m> statt via <.m bounds="9.959842,53.554437,9.970143,53.565205">Sternstraße</.m>. Es gibt nur wenige Abgänge ohne Ersatz:</p>
    <ul>
      <li><.m bounds="10.115477,53.520283,10.162387,53.544265" highlight="Mümmelmannsberg">Abzweig der ehemaligen Veloroute 8 zum Mümmelmannsberg</.m></li>
      <li><.m bounds="9.991301,53.618204,10.146311,53.679308">Verbindung Langenhorn / Poppenbüttel auf der ehemaligen Veloroute 14 (Ring 3)</.m></li>
    </ul>

    <h4>Status auf veloroute.hamburg</h4>
    <p>Die <.show_route_group group={:radroute}>neuen Radrouten</.show_route_group> können bereits angeschaut werden. Wo Lücken eine Fahrt unmöglich machen, wurde eine möglichst ortsnahe Alternative gefilmt. Für den Alltag ist das nicht unbedingt die sinnvollste Führung.</p>

    <p>Die Anpassung der Videos der Radschnellwege (jetzt: Radroute Plus) an das neue Konzept wird noch einige Zeit brauchen. Da <.show_route_group group={:bezirk}>Bezirksrouten</.show_route_group> und <.show_route_group group={:freizeit}>Freizeitrouten</.show_route_group> nur eine geringe Überlappung mit dem neuen Radnetz aufweisen, bleiben sie als eigene Kategorien erhalten. Langfristig werden auch die „Netzergänzungen“, also kurze Strecken ohne Nummerierung, eingebunden.</p>

    <p>Die genaue Führung und Nummerierung der Routen der Stadt ist nicht eindeutig, da mehrere Versionen der Karte zu finden sind. Teilweise scheinen sich dort auch Fehler eingeschlichen zu haben. Wo sinnvoll, versucht veloroute.hamburg eine befahrbare Route aufzuzeigen, auch wenn diese nicht dem langfristigen Zielnetz entspricht. Einige Abweichungen sind daher normal. Dennoch bitte ich bei Fehlern oder Unklarheiten eine Mail zu schreiben: <.mailto/>.</p>

    <p>Die Farbgestaltung der Routen auf veloroute.hamburg ist zur besseren Erkennbarkeit. Die Stadt verwendet ein einheitliches Dunkelrot für alle Routen und unterscheidet diese nicht.</p>

    <h4>Meinung</h4>
    <p>Der Rathausmarkt als Start/Ziel der Velorouten hat noch nie Sinn ergeben. Das Konzept alle Routen durchgängig zu gestalten hat nicht nur praktischen Nutzen, sondern ist auch leichter nachvollziehbar. Wer etwa von <.v bounds="9.914379,53.576209,9.981285,53.606845" lon={9.933827} lat={53.590876} dir="forward" ref="radroute-2">Stellingen</.v> nach <.v bounds="9.973038,53.541055,10.043857,53.570845" lon={10.001341} lat={53.557232} dir="forward" ref="radroute-2">St. Georg</.v> will, bekommt nun eine annähernd gerade Strecke ohne realitätsfremden Umweg.</p>

    <p>Bei den hinzugekommenen Abschnitten gibt es ebenfalls nichts zu bemängeln. Sie haben realistische Führungen und ergänzen das Netz sinnvoll. Eher muss man fehlende Änderungen kritisieren. Etwa führt die <.v bounds="9.856248,53.545157,9.911438,53.567299" lon={9.878929} lat={53.558159} dir="forward" ref="radroute-1">Radroute 1</.v> im Westen weiter im Zick-Zack. Die meisten Radpendler bevorzugen die schnellere und direktere Führung via <.m bounds="9.856248,53.545157,9.911438,53.567299">Hochrad / Klein Flottbeker Weg</.m>.</p>

    <p>Die fehlende <.m bounds="9.991301,53.618204,10.146311,53.679308">Verbindung Ost-West Verbindung in Hamburgs Norden</.m> irritiert. Auch die geplanten Bezirksrouten für Nord und Wandsbek stellen hier keinen Ersatz bereit. Theoretisch ist das für den <.m bounds="10.115477,53.520283,10.162387,53.544265">Mümmelmannsberg</.m> noch denkbar, weil der Bezirk Mitte noch an den Bezirksrouten arbeitet. Als äußerer Stadtteil ohne weitere Anbindung ist der Verlust für die Netzwirkung aber deutlich geringer.</p>

    <p>Der Plan einer einheitlichen Namensgebung mit passenden Schildern ist zu begrüßen. Niemand sollte Verkehrsplanung verstehen müssen, um mit dem Rad von A nach B zu kommen. Für Interessierte gibt es ja nach wie vor Möglichkeiten.</p>

    <p>Zusammengefasst: das neue Radnetz ist dichter und besser als die alten Vorhaben (Velorouten + Radschnellwege). Hamburg hat aber noch viel zu tun, um das Radnetz wirklich benutzbar zu machen.</p>

    <h4>Links</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
