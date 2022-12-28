defmodule Data.Article.Static.RSWLuebeck do
  use Article.Static

  def id(), do: "rsw-luebeck"
  def route_group(), do: :rsw
  def name(), do: id()
  def title(), do: "Radschnellweg durch Lübeck"

  def color(), do: "#000000"

  def summary(),
    do: "Beschreibung und Video zum Radschnellweg Lübeck (Bad Schwartau ↔ Groß Grönau)"

  def tags(), do: [id(), "rsw"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Radschnellweg Lübeck",
        direction: :forward,
        from: "Bad Schwartau",
        to: "Groß Grönau",
        parent_ref: __MODULE__,
        text: "künftiger Radschnellweg Bad Schwartau → Groß Grönau",
        videos: [
          {"2022-08-30-rsw-luebeck/GX014654", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014655", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014656", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014657", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014658", :start, "00:00:10.777"},
          {"2022-08-30-rsw-luebeck/GX014662", "00:00:04.037", :end},
          {"2022-08-30-rsw-luebeck/GX014663", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014664", :start, "00:00:01.134"},
          {"2022-08-30-rsw-luebeck/GX014642", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014643", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014644", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014645", :start, "00:00:10.110"},
          {"2022-08-30-rsw-luebeck/GX014667", "00:00:01.535", "00:00:24.725"},
          {"2022-08-30-rsw-luebeck/GX014668", "00:00:00.767", :end},
          {"2022-08-30-rsw-luebeck/GX014669", :start, "00:00:19.620"},
          {"2022-08-30-rsw-luebeck/GX014676", "00:00:02.502", :end},
          {"2022-08-30-rsw-luebeck/GX014677", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014678", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014679", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014680", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014681", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014682", :start, "00:02:01.688"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Radschnellweg Lübeck",
        direction: :backward,
        from: "Groß Grönau",
        to: "Bad Schwartau",
        parent_ref: __MODULE__,
        text: "künftiger Radschnellweg Groß Grönau → Bad Schwartau",
        videos: [
          {"2022-08-30-rsw-luebeck/GX014682", "00:02:52.805", :end},
          {"2022-08-30-rsw-luebeck/GX014683", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014685", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014686", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014687", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014688", :start, "00:00:12.946"},
          {"2022-08-30-rsw-luebeck/GX014672", "00:00:02.803", :end},
          {"2022-08-30-rsw-luebeck/GX014673", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014674", :start, "00:00:18.085"},
          {"2022-08-30-rsw-luebeck/GX014636", "00:00:00.234", :end},
          {"2022-08-30-rsw-luebeck/GX014637", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014638", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014639", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014640", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014641", :start, "00:00:01.301"},
          {"2022-08-30-rsw-luebeck/GX014647", "00:00:03.237", :end},
          {"2022-08-30-rsw-luebeck/GX014648", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014649", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014650", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014651", :start, "00:00:24.825"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Radschnellweg Lübeck Variante Mönkhofer Weg",
        direction: :forward,
        from: "Possehlstraße",
        to: "Ratzeburger Allee",
        parent_ref: __MODULE__,
        text: "RSW Lübeck: Variante „Mönkhofer Weg“ (→ Süd)",
        videos: [
          {"2022-08-30-rsw-luebeck/GX014669", "00:00:18.518", :end},
          {"2022-08-30-rsw-luebeck/GX014670", :start, "00:00:07.774"},
          {"2022-08-30-rsw-luebeck/GX014671", "00:00:00.267", :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Radschnellweg Lübeck Variante Mönkhofer Weg",
        direction: :backward,
        from: "Ratzeburger Allee",
        to: "Possehlstraße",
        parent_ref: __MODULE__,
        text: "RSW Lübeck: Variante „Mönkhofer Weg“ (→ Nord)",
        videos: [
          {"2022-08-30-rsw-luebeck/GX014689", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014690", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014691", :start, :end},
          {"2022-08-30-rsw-luebeck/GX014692", :start, "00:00:03.002"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"offizielle Seite zu den Radschnellwegen",
       "https://metropolregion.hamburg.de/radschnellwege/"},
      {"Detailseite zum Radschnellweg Lübeck",
       "https://metropolregion.hamburg.de/radschnellwege/15307314/radschnellweg-luebeck/"},
      {"Pläne und Berichte",
       "https://metropolregion.hamburg.de/radschnellwege/15307342/mediathek-radschnellweg-luebeck/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Die Trassenfindung für einen möglichen <.ref>Radschnellweg</.ref> durch Lübeck ist größtenteils abgeschlossen. Die genaue Planung für die einzelnen Abschnitte ist noch offen, entsprechend gibt es auch keinen Zeithorizont zur Umsetzung. Die Videos orientieren sich an der Vorzugstrasse, müssen bei geplanten neuen Wegen aber zwangsläufig von ihr abweichen. </p>

    <h4>Bad Schwartau</h4>
    <p>Anfang soll das <.m bounds="10.696619,53.916311,10.700832,53.92005" lon={10.698587} lat={53.918538} dir="forward" ref="rsw-luebeck">Stadtzentrum Bad Schwartaus</.m> sein. Vorgeschlagen wird das Kopfsteinpflaster zu ersetzen und eine Fahrradstraße einzurichten. Ab Höhe der Fabrik erscheint dies durch den hohen LKW-Anteil unrealistisch, sodass hier eine Tempo-20-Zone erwägt wird. Richtung Süden schließt sich der Weg an den <.m bounds="10.691162,53.910198,10.696742,53.913947" lon={10.694221} lat={53.912471} dir="forward" ref="rsw-luebeck">vorhandenen Zweirichtungsradweg</.m> auf der Ostseite der Landstraße an. Dieser soll auf 4,0m verbreitert werden.</p>

    <h4>Lübeck – Nord</h4>
    <p>Der Zweirichtungsradweg aus Bad Schwartau setzt sich fort und soll bis zur Nebenfahrbahn <.m bounds="10.684908,53.89035,10.692069,53.896038" lon={10.687947} lat={53.892586} dir="forward" ref="rsw-luebeck">Schwartauer Landstraße</.m> verlängert werden. Die Nebenfahrbahn würde bevorzugt zur Fahrradstraße umgestaltet und das KFZ-Parken beidseitig verboten. KFZ sind aber weiterhin erlaubt: Anlieger frei bzw. KFZ frei, je nach Abschnitt. Am <.m bounds="10.681947,53.885997,10.68687,53.887971" lon={10.684516} lat={53.886931} dir="forward" ref="rsw-luebeck">Südende</.m> soll die KFZ-Einfahrt nach Norden verschoben werden, um die aktuell unübersichtliche Situation an der Kreuzung zu entschärfen.</p>

    <p>In der Vorzugsvariante wird der Zweirichtungsradweg bis zum ehemaligen <.m bounds="10.676081,53.879852,10.681228,53.882545" lon={10.678371} lat={53.881375} dir="forward" ref="rsw-luebeck">„Sankt-Lorenz“ Bahngleis</.m> fortgeführt und dort auf die Bahntrasse abgeleitet. Über das alte Bahngleis erreicht man die <.m bounds="10.678646,53.878419,10.683756,53.880581" lon={10.680661} lat={53.879421} dir="forward" ref="rsw-luebeck">Karlstraße</.m>, wo der Zweirichtungsradweg auf der Nordseite verlaufen würde. An ähnlicher Stelle wie heute erreicht man die <.m bounds="10.679468,53.875913,10.684187,53.880121" lon={10.681846} lat={53.878905} dir="forward" ref="rsw-luebeck">Katharinenstraße</.m> bzw. den Radweg auf deren Ostseite. Der Anschluss an die <.m bounds="10.674234,53.870197,10.681226,53.875798" lon={10.67758} lat={53.870945} dir="forward" ref="rsw-luebeck">Willy-Brandt-Allee</.m> erfolgt im Wesentlichen wie heute über die <.m bounds="10.674234,53.870197,10.681226,53.875798" lon={10.678956} lat={53.874573} dir="forward" ref="rsw-luebeck">Roddenkoppel</.m>. Die Wege sollen aber verbreitert werden. Das erfordert möglicherweise neue Brücken.</p>

    <h4>Lübeck – Mitte</h4>
    <p>In der Willy-Brandt-Allee soll der Radschnellweg auf der Westseite der Straße geführt werden. Nach der <.m bounds="10.670974,53.867353,10.681142,53.870535" lon={10.67736} lat={53.868652} dir="forward" ref="rsw-luebeck">Musik- und Kongresshalle</.m> wird ein Kreisverkehr vorgeschlagen, der den Radschnellweg direkt mit <.m bounds="10.665459,53.865881,10.674614,53.86948">Hauptbahnhof</.m> und <.m bounds="10.679995,53.865752,10.690779,53.871916">Altstadt</.m> verbindet.</p>


    <p>Zum Bahnhof hin ist bereits die Stadtgrabenbrücke geplant, über die man im <.ref>Mischverkehr</.ref> fährt. Die Planung schlägt vor die neue Verbindung für private KFZ zu sperren um das Verkehrsaufkommen zu reduzieren. Zusätzlich soll der Fußweg für Unsichere freigegeben werden.</p>

    <p>In Richtung Altstadt wird zunächst die <.m bounds="10.677157,53.868961,10.681196,53.870513">MuK-Brücke</.m> vorgesehen. Zusätzlich ermöglicht der Kreisel den Wechsel den Übergang vom Zweirichtungsradweg im Norden zu den beidseitigen Einrichtungsradwegen im Süden.</p>

    <p>Im <.m bounds="10.676981,53.86111,10.679516,53.868574" lon={10.677425} lat={53.865508} dir="forward" ref="rsw-luebeck">weiteren Verlauf</.m> des Radschnellwegs Richtung Süden werden weiter beidseitige Einrichtungsradwege vorgeschlagen.</p>

    <h4>Lübeck – Verbindung Possehlstraße und Ratzeburger Allee</h4>
    <p>Die Verbindung beider Straßen stellt eine Herausforderung dar. Diskutiert wurden insgesamt vier Varianten:</p>
    <ul>
      <li><strong><.m bounds="10.678003,53.852718,10.699584,53.862308" lon={10.689558} lat={53.859395} dir="forward" ref="rsw-luebeck">Wallstraße</.m>:</strong> Führung über einen Zweirichtungsradweg südlich der Wallstraße. Neue Mühlentorbrücke. Umgestaltung Mühlentorplatz, ggf. als Ampel-Kreuzung. Danach wieder beidseitige Einrichtungsradwege.</li>
      <li><strong><.m bounds="10.685958,53.856622,10.692164,53.860011">Kanaltraven</.m>:</strong> Zunächst wie Wallstraße, dann neue Brücke Höhe des Kaisertor Spielplatzes. Führung als Zweirichtungsradweg nordöstlich der Kronsforder Allee. Umgestaltung Mühlentorplatz, ggf. als Ampel-Kreuzung. Danach wieder beidseitige Einrichtungsradwege.</li>
      <li><strong><.m bounds="10.678241,53.85204,10.701775,53.861811" lon={10.699056} lat={53.853823} dir="forward" ref="rsw-luebeck">Mönkhofer Weg</.m>:</strong> Führung entlang der Possehlstraße, Ableitung über <.m bounds="10.678241,53.85204,10.701775,53.861811" lon={10.680775} lat={53.854936} dir="forward" ref="rsw-luebeck">vorhandene Rampe</.m>. Dann Charlottenstraße, Uhlandstraße, Bernt-Notke-Straße und schließlich Mönkhofer Weg. Umgestaltungen der Straßen je nach Situation. Eine bessere Querungsmöglichkeit der Kronsforder Allee wird angestrebt.</li>
      <li><strong><.m bounds="10.677845,53.849286,10.705437,53.861948">Kahlhorststraße</.m>:</strong> Zunächst wie Mönkhofer Weg, knickt dann aber nach Süden ab um die Ratzeburger Straße via der Kahlhorststraße zu erreichen. Zur Querung des Sankt-Jürgen-Ring soll eine ebenerdige Ampelkreuzung eingerichtet werden.</li>
    </ul>
    <p>Das Planungsbüro erwähnt nicht, welche der genannten Varianten der Favorit ist.</p>

    <h4>Lübeck – Süd</h4>
    <p>In der gesamten <.m bounds="10.699892,53.822384,10.723293,53.852511" lon={10.708506} lat={53.839706} dir="forward" ref="rsw-luebeck">Ratzeburger Allee</.m> bzw. <.m bounds="10.699892,53.822384,10.723293,53.852511" lon={10.708506} lat={53.839706} dir="forward" ref="rsw-luebeck">Ratzeburger Landstraße</.m> werden beidseitige Einrichtungsradwege empfohlen. Ab Höhe <.m bounds="10.718008,53.823815,10.723577,53.826757" lon={10.72077} lat={53.825319} dir="forward" ref="rsw-luebeck">Polarisweg</.m> soll der Radverkehr wieder als Zweirichtungsradweg auf Westseite geführt werden, um einen Übergang zum Bestand in Groß Grönau herzustellen.</p>

    <h4>Groß Grönau</h4>
    <p>Es wird vorschlagen den vorhandenen Radweg entlang <.m bounds="10.717944,53.815391,10.739058,53.825973" lon={10.724592} lat={53.821467} dir="forward" ref="rsw-luebeck">Sankt Hubertus</.m> zu nutzen. Als mögliche, komfortablere Alternative wird eine Führung über <.m bounds="10.720813,53.822524,10.732647,53.825949">Müggenbuschweg</.m> und <.m bounds="10.720813,53.822524,10.732647,53.825949">Tannenredder</.m> bis zur <.m bounds="10.73972,53.810651,10.747498,53.81479">Waldschule</.m> erwägt. In dieser Variante würden die Einrichtungsradwege aus Lübeck bis zum Müggenbuschweg im Radschnellweg Standard fortgesetzt.</p>


    <h3>Externe Links</h3>
    <.structured_links gpx={true}/>
    """
  end
end
