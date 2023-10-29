defmodule Data.Article.Blog.UFarmsen do
  use Article.Default

  def created_at(), do: ~D[2021-11-09]

  def title(),
    do: "Straßen um U-Bahnhof Farmsen (Radroute 6, Freizeitroute 2, Bezirksrouten W5 und W8)"

  def type(), do: :planned
  def tags(), do: ["FR2", "6", "br-wandsbek-w5", "br-wandsbek-w8"]

  def start(), do: ~d[2026]
  def stop(), do: ~d[2027]

  def links(_assigns) do
    [
      {"Lageplan und Erläuterungsbericht", "Oktober 2023",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1019655"},
      {"Präsentation zum Umbau",
       "https://via-bus.hamburg.de/contentblob/15542692/738ee06d41a71392fa2108465cedcd68/data/praesentation-online-dialogrunde-vom-11-08-2021.pdf"},
      {"Dokumentation zur Online-Dialogrunde",
       "https://via-bus.hamburg.de/contentblob/15542682/aee1379cbb674d255d0dcc376ea1b401/data/dokumentation-online-dialogrunde-vom-11-08-2021.pdf"}
    ]
  end

  def summary(),
    do:
      "Durchgängige Radwege geplant; auf der Nordseite in beide Richtungen. Fokus aufs Auto verhindert Entzerrung Fuß/Rad."

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Entlang der <.a name="alltagsroute-6">Alltagsroute 6</.a> fährt man größtenteils geradlinig über die Kreuzung mit der August-Krohmann-Straße. Ausnahme ist eine <.v bounds="10.118968,53.605945,10.119893,53.606486" lon={10.119556} lat={53.606425} dir="backward" ref="6">Dreiecksinsel</.v> in Fahrtrichtung Innenstadt, wo der Radweg verschwenkt wird.</p>
    <p>Die Führung der <.a name="freizeitroute-2">Freizeitroute 2</.a> ist unklar. Eine direkte Querungsmöglichkeit gibt es nicht, es sind entweder lange Umwege erforderlich oder es muss geschoben werden.</p>
    <p>An der <.v bounds="10.115564,53.605793,10.120876,53.608256" lon={10.117747} lat={53.607121} dir="forward" ref="br-wandsbek-w5">August-Krogmann-Straße</.v> gibt es teilweise <.ref>Hochbordradwege</.ref>, die in jedem Fall aber durch die Wartebereich der Busfahrgäste führen. In Fahrtrichtung Osten gibt es <.v bounds="10.115564,53.605793,10.120876,53.608256" lon={10.117375} lat={53.607033} dir="backward" ref="br-wandsbek-w5">unter der Bahnbrücke</.v> gar keinen eigenen Radweg.</p>

    <h4>Planung</h4>
    <p>Entlang der Alltagsroute ändert sich wenig: es bleibt möglich mit dem Rad rechts abzubiegen, ohne an der Ampel halten zu müssen. Die <.v bounds="10.118968,53.605945,10.119893,53.606486" lon={10.119556} lat={53.606425} dir="backward" ref="6">Dreiecksinsel</.v> entfällt, sodass der Radweg hier geradlinig wird. Linksabbiegen ist jeweils nur <.ref>indirekt</.ref> möglich.</p>

    <p>Auf der <.v bounds="10.115564,53.605793,10.120876,53.608256" lon={10.117747} lat={53.607121} dir="forward" ref="br-wandsbek-w5" highlight="August-Krogmann-Straße">Nordseite der August-Krogmann-Straße</.v> ist ein Zweirichtungsradweg vorgesehen. Der Hintergrund ist, das es auf dieser Seite hohe Bedarfe Richtung Osten gibt, gerade durch Schulkinder. Eine weitere Querungsmöglichkeit bringe jedoch den Bus- und KFZ-Verkehr zum erliegen. Auch geht man nicht davon aus, das eine weitere Querung ausreiche um das Geisterradeln ganz zu verhindern.</p>

    <p>Für die <.v bounds="10.116203,53.606849,10.118599,53.607964" lon={10.116761} lat={53.607201} dir="forward" ref="FR2">Wegbeziehung der Freizeitroute</.v> ist ein Zweirichtungsradweg geplant, der ungefähr der heutigen Führung folgt. Auf der <.v bounds="10.115564,53.605793,10.120876,53.608256" lon={10.117375} lat={53.607033} dir="backward" ref="br-wandsbek-w5" highlight="August-Krogmann-Straße">Südseite der August-Krogmann-Straße</.v> ist dazu nur ein kurzer Abschnitt für beide Fahrtrichtungen freigegeben. Auf der Nordseite ist der Zweirichtungsradweg wie erwähnt durchgängig. An den Bushaltestellen führt er zwischen Ein-/Ausstiegsbereich und Fußweg hindurch.</p>
    <p>Zurück zur Südseite: Der Radweg soll hier erstmals durchgängig werden und deutlich geradliniger ausfallen. Unter der Brücke verläuft der Radweg rechts an der Wand. Im Anschluss führt er dann wie im Norden zwischen Bus Ein-/Ausstieg links und Fußweg rechts.</p>
    <p>Östlich des U-Bahnhofs soll die Ampel zur Querung für den Zweirichtungsverkehr angepasst werden. Die Fußfurt ist dabei zwischen den Radfurten eingeplant.</p>
    <p>Die Treppe, die die Freizeitroute derzeit unterbricht, ist nicht Teil der Planung.</p>

    <h4>Meinung</h4>
    <p>Es sind gute Ansätze erkennbar: bei der Alltagsroute entfällt eine Schikane, die ein Verringern der Geschwindigkeit nötig machte. Auch ist die Freizeitroute erstmals im Kreuzungsbereich befahrbar und die Radwege enden nicht einfach im Nichts.</p>
    <p>Allerdings wird das Auto weiterhin als das Maß der Dinge genommen, was ausreichende Gehwege verhindert und es nötig macht die Radwege irgendwie zwischen Bushalt und Fußweg hindurchzuführen. Man führt wenig überzeugend an, das ein KFZ-Rückstau auch Busse behindern würde und das es ggf. zu Ausweichverkehren in Wohngebieten kommt. Den fehlenden Straßenquerungen begegnet man mit einem Sperrgitter in der Straßenmitte.</p>
    <p>Es handelt sich um eine Vorplanung, aus der die angedachten Breiten nicht gut abzuschätzen sind. Laut Planungsbüro gäbe es genug Platz, sodass der Zweirichtungsradweg kein Sicherheitsrisiko darstelle. Auf den Vorschaubildern kommen daran Zweifel auf.</p>
    <p>Wenn die Planung grob so umgesetzt wird, wird die Situation für den Radverkehr besser. Der starke Fokus auf den Autoverkehr zeigt aber die Rückwärtsgewandtheit der Planung.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
