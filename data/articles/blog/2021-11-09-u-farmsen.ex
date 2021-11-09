defmodule Data.Article.Blog.UFarmsen do
  use Article.Default

  def created_at(), do: ~D[2021-11-09]
  def title(), do: "Straßen um U-Bahnhof Farmsen (Alltagsroute 6, Freizeitroute 2)"

  def type(), do: :intent
  def tags(), do: ["FR2", "6"]

  def links(_assigns) do
    [
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
    <p>Entlang der <.a href="/alltagsroute-6">Alltagsroute 6</.a> fährt man größtenteils geradlinig über die Kreuzung mit der August-Krohmann-Straße. Ausnahme ist eine <.m bounds="10.118968,53.605945,10.119893,53.606486" lon="10.119556" lat="53.606425" dir="backward" ref="6">Dreiecksinsel</.m> in Fahrtrichtung Innenstadt, wo der Radweg verschwenkt wird.</p>
    <p>Die Führung der <.a href="/freizeitroute-2">Freizeitroute 2</.a> ist unklar. Eine direkte Querungsmöglichkeit gibt es nicht, es sind entweder lange Umwege erforderlich oder es muss geschoben werden.</p>
    <p>An der August-Krogmann-Straße gibt es teilweise <.ref>Hochbordradwege</.ref>, die in jedem Fall aber durch die Wartebereich der Busfahrgäste führen. In Fahrtrichtung Osten gibt es unter der Bahnbrücke gar keinen eigenen Radweg.</p>

    <h4>Planung</h4>
    <p>Entlang der Alltagsroute ändert sich wenig: es bleibt möglich mit dem Rad rechts abzubiegen, ohne an der Ampel halten zu müssen. Die <.m bounds="10.118968,53.605945,10.119893,53.606486" lon="10.119556" lat="53.606425" dir="backward" ref="6">Dreiecksinsel</.m> entfällt, sodass der Radweg hier geradlinig wird. Linksabbiegen ist jeweils nur <.ref>indirekt</.ref> möglich.</p>

    <p>Auf der Nordseite der <.m bounds="10.116543,53.606325,10.119479,53.607453">August-Krogmann-Straße</.m> ist ein Zweirichtungsradweg vorgesehen. Der Hintergrund ist, das es auf dieser Seite hohe Bedarfe Richtung Osten gibt, gerade durch Schulkinder. Eine weitere Querungsmöglichkeit bringe jedoch den Bus- und KFZ-Verkehr zum erliegen. Auch geht man nicht davon aus, das eine weitere Querung ausreiche um das Geisterradeln ganz zu verhindern.</p>

    <p>Für die <.m bounds="10.116203,53.606849,10.118599,53.607964" lon="10.116761" lat="53.607201" dir="forward" ref="FR2">Wegbeziehung der Freizeitroute</.m> ist ein Zweirichtungsradweg geplant, der ungefähr der heutigen Führung folgt. Auf der Südseite der August-Krogmann-Straße ist dazu nur ein kurzer Abschnitt für beide Fahrtrichtungen freigegeben. Auf der Nordseite ist der Zweirichtungsradweg wie erwähnt durchgängig. An den Bushaltestellen führt er zwischen Ein-/Ausstiegsbereich und Fußweg hindurch.</p>
    <p>Zurück zur Südseite: Der Radweg soll hier erstmals durchgängig werden und deutlich geradliniger ausfallen. Unter der Brücke verläuft der Radweg rechts an der Wand. Im Anschluss führt er dann wie im Norden zwischen Bus Ein-/Ausstieg links und Fußweg rechts.</p>
    <p>Östlich des U-Bahnhofs soll die Ampel zur Querung für den Zweirichtungsverkehr angepasst werden. Die Fußfurt ist dabei zwischen den Radfurten eingeplant.</p>
    <p>Die Treppe, die die Freizeitroute derzeit unterbricht, ist nicht Teil der Planung.</p>

    <h4>Meinung</h4>
    <p>Es sind gute Ansätze erkennbar: bei der Alltagsroute entfällt eine Schikane, die ein Verringern der Geschwindigkeit nötig machte. Auch ist die Freizeitroute erstmals im Kreuzungsbereich befahrbar und die Radwege enden nicht einfach im Nichts.</p>
    <p>Allerdings wird das Auto weiterhin als das Maß der Dinge genommen, was ausreichende Gehwege verhindert und es nötig macht die Radwege irgendwie zwischen Bushalt und Fußweg hindurchzuführen. Man führt wenig überzeugend an, das ein KFZ-Rückstau auch Busse behindern würde und das es ggf. zu Ausweichverkehren in Wohngebieten kommt. Den fehlenden Straßenquerungen begegnet man mit einem Sperrgitter in der Straßenmitte.</p>
    <p>Es handelt sich um eine Vorplanung, aus der die angedachten Breiten nicht gut abzuschätzen sind. Laut Planungsbüro gäbe es genug Platz, sodass der Zweirichtungsradweg kein Sicherheitsrisiko darstelle. Auf den Vorschaubildern kommen daran Zweifel auf.</p>
    <p>Wenn die Planung grob so umgesetzt wird, wird die Situation für den Radverkehr besser. Der starke Fokus auf den Autoverkehr zeigt aber die Rückwärtsgewandtheit der Planung.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
