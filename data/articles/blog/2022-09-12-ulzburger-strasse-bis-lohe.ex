defmodule Data.Article.Blog.UlzburgerStrasseBisLohe do
  use Article.Default
  def created_at(), do: ~D[2022-09-12]
  def title(), do: "Straßenzug Ulzburger Straße bis Lohe"

  def summary(),
    do:
      "Gehwege werden saniert. Radeln auf dem Fußweg geplant. Furchtlose dürfen auch weiterhin auf der Straße fahren."

  def type(), do: :planned
  def tags(), do: []

  def start(), do: ~d[2024-03]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "fußweg",
        direction: :forward,
        from: "Ulzburger Straße",
        to: "Lohe",
        parent_ref: __MODULE__,
        text: "Poppenbüttel nach Duvenstedt (auf dem Fußweg)",
        videos: [
          {"2022-09-11-landstr-volksd-duvens/GX014750", "00:00:06.340", :end},
          {"2022-09-11-landstr-volksd-duvens/GX014751", :start, :end},
          {"2022-09-11-landstr-volksd-duvens/GX014752", :start, "00:03:00.811"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "fußweg",
        direction: :backward,
        from: "Lohe",
        to: "Ulzburger Straße",
        parent_ref: __MODULE__,
        text: "Duvenstedt nach Poppenbüttel (auf dem Fußweg)",
        videos: [
          {"2022-09-11-landstr-volksd-duvens/GX014752", "00:03:33.504", :end},
          {"2022-09-11-landstr-volksd-duvens/GX014753", :start, "00:00:16.283"},
          {"2022-09-11-landstr-volksd-duvens/GX014754", "00:00:00.667", :end},
          {"2022-09-11-landstr-volksd-duvens/GX014755", :start, :end},
          {"2022-09-11-landstr-volksd-duvens/GX014756", :start, "00:00:02.335"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "fahrbahn",
        direction: :forward,
        from: "Ulzburger Straße",
        to: "Lohe",
        parent_ref: __MODULE__,
        text: "Poppenbüttel nach Duvenstedt (auf der Fahrbahn)",
        videos: [
          {"2022-09-11-landstr-volksd-duvens/GX014757", "00:00:09.007", :end},
          {"2022-09-11-landstr-volksd-duvens/GX014758", :start, "00:02:53.472"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "fahrbahn",
        direction: :backward,
        from: "Lohe",
        to: "Ulzburger Straße",
        parent_ref: __MODULE__,
        text: "Duvenstedt nach Poppenbüttel (auf der Fahrbahn)",
        videos: [
          {"2022-09-11-landstr-volksd-duvens/GX014759", "00:00:10.675", "00:01:49.109"},
          {"2022-09-11-landstr-volksd-duvens/GX014766", "00:02:00.988", :end},
          {"2022-09-11-landstr-volksd-duvens/GX014767", :start, "00:00:35.361"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Projektseite des LSBG", "https://lsbg.hamburg.de/ulzburger-str-poppenbuetteler-chaussee"},
      {"Unterlagen 1. Entwurf", "2021",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1017156"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die genaue Führung des Radverkehrs hängt stark vom Streckenabschnitt und Fahrtrichtung ab. Insgesamt ist keine durchgängige Radführung vorhanden, Fußweg mit <.ref>Fahrrad frei</.ref> ist die häufigste Führungsform. Danach kommen <.ref>Hochbordradwege</.ref>, die jedoch selbst für einspurige Fahrräder zu schmal sind und durch Wurzelaufbrüche u.ä. nur mäßig befahrbar. <.ref>Benutzungspflicht</.ref> besteht auf dem gesamten Abschnitt keine, sodass auch auf dem ebenen Asphalt gefahren werden kann. Dort muss mit knappen Überholvorgängen gerechnet werden, auch wenn sich die Mehrheit an die Regeln hält.</p>

    <h4>Aufteilung</h4>
    <p>Die Planung betrifft den gesamten Straßenzug <.v bounds="10.075281,53.652212,10.078347,53.664536" lon={10.077009} lat={53.659646} group="fußweg" dir="forward" ref={@ref}>Ulzburger Straße</.v>, <.v bounds="10.075069,53.662859,10.091321,53.672637" lon={10.081341} lat={53.668045} group="fußweg" dir="forward" ref={@ref}>Poppenbütteler Berg</.v>, <.v bounds="10.089248,53.671521,10.101427,53.697021" lon={10.095088} lat={53.681083} group="fußweg" dir="forward" ref={@ref}>Lemsahler Landstraße</.v>, <.v bounds="10.09814,53.696219,10.106431,53.708795" lon={10.103428} lat={53.701261} dir="forward" group="fußweg" ref={@ref}>Poppenbütteler Chaussee</.v> und <.v bounds="10.104076,53.708084,10.110594,53.71479" lon={10.107853} lat={53.711575} group="fußweg" dir="forward" ref={@ref}>Lohe</.v>. Die Pläne und Projekte zur Umsetzung sind nach den Straßennamen aufgeteilt, d.h. es gibt je Straße eine eigene Projektnummer. Nur Lohe als kurzes Teilstück wurde der Poppenbütteler Chausee zugeschlagen.</p>

    <h4>Planung – Prinzip</h4>
    <p>Man wollte entlang des gesamten Straßenzugs eine einheitliche Führung herstellen. Außerdem sollten möglichst viele der Straßenbäume erhalten bleiben. Mit diesen Vorgaben war eine eigene Radführung nicht umsetzbar, zumindest nicht ohne erheblichen Zukauf von Grundstücken.</p>

    <p>Man entschied sich den Radverkehr auf den Fußwegen mittels <.ref>Fahrrad frei</.ref> zu führen und diese wo nötig zu verbreitern. An Kreuzungen soll der Radverkehr dagegen im Sichtfeld des Autoverkehrs fahren und wird durch Behelfsrampen auf meist rund 2,0m breite <.ref>Radfahrstreifen</.ref> abgeleitet. Nach der Kreuzung gibt es wieder eine Rampe um auf den Fußweg zu gelangen. Aufstellflächen zum Linksabbiegen werden nicht markiert, es obliegt den Radfahrenden sich geeignet aufzustellen.</p>

    <p>Bei einfachen Einmündungen wird nur auf jeweils anderen Seite ein Radfahrstreifen angelegt, um von diesem links abbiegen zu können.</p>

    <p>Das radeln auf der Fahrbahn bleibt weiterhin erlaubt. Man muss sich entsprechend nach der Kreuzung nach links einordnen statt auf den Fußweg zu fahren. Ansonsten gibt es hier keine weiteren Änderungen.</p>

    <p>Bushaltestellen werden jeweils zum Halt am Fahrbahnrand umgebaut. Man muss dann entweder hinter dem Bus warten oder ihn überholen, während Fahrgäste ein- und aussteigen.</p>

    <h4>Planung – Abweichungen</h4>
    <p>Wenn nicht anders erwähnt, wird das oben erklärte Prinzip verwendet. Es gibt allerdings einige Ausnahmen:</p>

    <ul>
      <li>Bis zum <.v bounds="10.076469,53.652934,10.077677,53.656572" lon={10.077073} lat={53.65624} group="fußweg" dir="forward" ref={@ref}>Minsbekweg</.v> gibt es einen 1,90m breiten Radfahrstreifen Richtung Norden. Die Aufleitung auf den Fußweg erfolgt nach dem Bushalt.</li>
      <li>Am <.v bounds="10.076069,53.659768,10.077809,53.661463" lon={10.076414} lat={53.660858} group="fußweg" dir="backward" ref={@ref}>Rehmbrook</.v> ist es zu eng für einen Radfahrstreifen Richtung Süden.</li>
      <li>An der Kreuzung mit der <.v bounds="10.075394,53.66292,10.077047,53.66418" lon={10.07617} lat={53.663482} group="fußweg" dir="forward" ref={@ref}>Harksheider Straße</.v> sind entlang des Straßenzugs <.ref>ARAS</.ref> vorgesehen zum Linksabbiegen. Die alten Hochbordradwege in der Harksheider Straße bleiben. Für diese wird <.ref>indirektes Linksabbiegen</.ref> geplant.</li>
      <li>Von Norden kommend kann vom Fußweg nicht links in die <.v bounds="10.083277,53.668969,10.085725,53.670227" lon={10.084505} lat={53.669765} group="fußweg" dir="backward" ref={@ref}>Ohlendiekshöhe</.v> abgebogen werden, da kein Durchlass angelegt wird. Umgekehrt kann man von der Nebenstraße auch nicht den gegenüberliegenden Gehweg erreichen.</li>
      <li>Wer von Norden kommend links in <.v bounds="10.089076,53.670646,10.092011,53.673062" lon={10.090595} lat={53.672369} group="fußweg" dir="forward" ref={@ref}>An der Alsterschleife</.v> abbiegen möchte, kann dies über eine Mittelinsel nach der Einmündung tun. Es gibt vorher auch eine Rampe auf die Fahrbahn, allerdings keinen Radfahrstreifen Richtung Süden.</li>
      <li>Es gibt ein längeres Stück Radfahrstreifen in Richtung Süden ab Höhe <.v bounds="10.092566,53.675323,10.094834,53.67807" lon={10.094016} lat={53.677901} group="fußweg" dir="backward" ref={@ref}>Hausnummer 100</.v> bis <.v bounds="10.092566,53.675323,10.094834,53.67807" lon={10.09297} lat={53.675593} group="fußweg" dir="backward" ref={@ref}>Kuhredder</.v>.</li>
      <li>Am <.v bounds="10.094936,53.688807,10.097735,53.690659" lon={10.096591} lat={53.690235} group="fußweg" dir="forward" ref={@ref}>Spechtort</.v> gibt es Richtung Süden keinen Radfahrstreifen.</li>
      <li>In Fahrtrichtung Süden zwischen <.v bounds="10.103004,53.702325,10.104636,53.70402" lon={10.103532} lat={53.703188} group="fußweg" dir="backward" ref={@ref}>Steenbarg</.v> und Höhe <.v bounds="10.096479,53.690367,10.098394,53.691592" lon={10.097459} lat={53.691094} group="fußweg" dir="backward" ref={@ref}>Lemsahler Landstraße 247</.v> gibt es keinen Fuß- bzw Radweg auf der rechten Seite. Der Radverkehr muss im <.ref>Mischverkehr</.ref> fahren. In der Gegenrichtung verbleiben Engstellen mit nur 1,2m breiten Fußwegen (1,85m mit Sicherheitsabstand zu den KFZ). Dieser Fußweg soll künfig nur noch nach Norden freigegeben werden.</li>
      <li>Der <.v bounds="10.104071,53.707644,10.106477,53.709337" lon={10.105466} lat={53.708362} group="fußweg" dir="forward" ref={@ref}>Kreisverkehr in Duvenstedt</.v> wird nicht umgebaut.</li>
      <li>Kurz <.v bounds="10.108084,53.71313,10.109923,53.714841" lon={10.108902} lat={53.7142} group="fußweg" dir="forward" ref={@ref}>vor der Landesgrenze</.v> wird eine Mittelinsel als Querungshilfe gebaut.</li>
    </ul>

    <h4>Meinung</h4>
    <p>Die Planung scheitert an ihren selbst gesetzten Maßstäben – und diese waren schon nicht besonders hoch. Immerhin werden die Gehwege saniert und meist gepflastert.</p>

    <p>Wer aus Angst vor dem KFZ-Verkehr lieber auf dem Fußweg fährt, wird auf einem ungesicherten Radfahrstreifen Mühe haben links abzubiegen. Lässt man das außen vor, sind die Führungsformen immer noch inkonsistent – ob man via Radfahrstreifen, Zebrastreifen oder Ampel linksabbiegt ist nur für Ortskundige vorher ersichtlich. Außerdem sind nicht alle Einfahrten vom Fußweg aus erreichbar. Man muss also rechtzeitig die Straßenseite wechseln und dort dann lange Schiebestrecken in Kauf nehmen.</p>

    <p>Auf der Fahrbahn wurde die Situation sogar noch verschlechtert. Aktuell kann man auf der einzigen Geradeausspur bleiben und hat nur mit den Leuten zu kämpfen, die die 1,5m Sicherheitsabstand nicht einhalten. Nach der Umplanung muss man wegen Rechtsfahrgebot auf den Radfahrstreifen wechseln. Dieser endet meist nach wenigen Metern, sodass man sich wieder einfädeln muss. Dabei wird in vielen Fällen die KFZ-Spur geradlinig durchgeführt, während der Radfahrstreifen einfach endet. Das Fahrrad wird hier klar benachteiligt.</p>

    <p>Insgesamt sind Kombi-Varianten mit Fahrbahnradeln und Gehweg mit Fahrrad frei ein Feigenblatt, aber keine zukunftsfähige Lösung. Hinzu kommen bei diesem ersten Entwurf noch Probleme bei der Detailplanung.</p>

    <p>Eine gangbare Lösung ist Tempo 30 mit entsprechender Verkehrsberuhigung. An breiteren Stellen können Überholmöglichkeiten geschaffen werden. Dieser Ansatz wurde nicht ernsthaft untersucht – zu viel KFZ Verkehr. Angesichts der Planung wird sich daran auch nichts ändern.</p>

    <h4>Übersicht</h4>
    <table>
      <tr>
        <th>Straße</th>
        <th>Projektstrukturplan (PSP)</th>
      </tr>
      <tr>
        <td>Ulzburger Straße</td>
        <td>Abschnitt 1 / PSP 12091</td>
      </tr>
      <tr>
        <td>Poppenbütteler Berg</td>
        <td>Abschnitt 2 / PSP 12062</td>
      </tr>
      <tr>
        <td>Lemsahler Landstraße</td>
        <td>Abschnitt 3 / PSP 12090</td>
      </tr>
      <tr>
        <td>Poppenbütteler Chaussee</td>
        <td>Abschnitt 4 / PSP 12058</td>
      </tr>
      <tr>
        <td>Lohe</td>
        <td>Abschnitt 4 / PSP 12058</td>
      </tr>
    </table>

    <h4>Videovarianten</h4>
    <p>Nach Duvenstedt <.v bounds="10.071596,53.651241,10.08835,53.666966" lon={10.077788} lat={53.65277} dir="forward" group="fußweg" ref={@ref}>auf dem Fußweg</.v> oder <.v bounds="10.071596,53.651241,10.08835,53.666966"  lon={10.077788} lat={53.65277} dir="forward" group="fahrbahn" ref={@ref}>auf der Fahrbahn</.v></p>
    <p>Nach Poppenbüttel <.v bounds="10.100657,53.704353,10.11741,53.720078" lon={10.109278} lat={53.714736} dir="backward" group="fußweg" ref={@ref}>auf dem Fußweg</.v> oder <.v bounds="10.100657,53.704353,10.11741,53.720078" lon={10.109278} lat={53.714736} dir="backward" group="fahrbahn" ref={@ref}>auf der Fahrbahn</.v></p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
