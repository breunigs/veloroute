defmodule Data.Article.Blog.RathenaustrasseNordOst do
  use Article.Default

  def title(),
    do: "Rathenaustraße – Sengelmannstraße bis Alsterdorfer Straße (Radroute Plus Bad Bramstedt)"

  def summary(),
    do:
      "Dieser Abschnitt der Rathenaustraße soll Fahrradstraße werden. Zur KFZ-Reduktion soll die Einfahrt von Ohlsdorf nur noch mit dem Fahrrad erlaubt sein."

  def type(), do: :planned
  def stop(), do: ~d[2030]

  def tags(), do: ["rsw-bad-bramstedt", "N26"]

  def map_image(), do: Data.Article.Blog.FuhlsbuettelerStrasseNord.map_image()

  def links(_assigns) do
    [
      {"2. Entwurf, Erläuterungen und Lagepläne", ~d[2025-05],
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1015194"},
      {"Verkehrsuntersuchung zu einer möglichen Fahrradstraße", ~d[2024-12],
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1014657"},
      {"1. Entwurf, Erläuterungen und Lagepläne", "März 2024",
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/hamburg-nord/detailplaene-zweiter-abschnitt-848068"},
      {"Übersichtsseite Planung Radroute Plus Bad Bramstedt",
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/hamburg-nord/themen/planen-bauen-wohnen/fachbereich-tiefbau/nachhaltige-mobilitaet/radroute-plus"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Mai 2025</h4>
    <p>Der überarbeitete zweite Entwurf wurde veröffentlicht, der den bisherigen Planungsansatz beibehält. Anpassungen erfolgten vor allem an den Kreuzungen. Für den Radverkehr wurde das Linksabbiegen von der Rathenaustraße in <.v bounds="10.017091,53.613896,10.022485,53.616561" lon={10.018966} lat={53.615164} dir="backward" ref={RSWBadBramstedt}>Sengelmannstraße</.v> verdeutlicht. Der Artikel wurde entsprechend angepasst.</p>

    <h4>Alter Zustand</h4>
    <p>In der <.v bounds="10.016734,53.613778,10.030931,53.620799" lon={10.024004} lat={53.617492} dir="forward" ref={RSWBadBramstedt}>Rathenaustraße</.v> wird der Radverkehr bei Tempo-50 im <.ref>Mischverkehr</.ref> geführt. Auf der Uferseite ist zusätzlich noch ein schmaler Weg für Rad- und Fußverkehr mit unklarer Rechtslage (vermutlich: Gehweg mit <.ref>Fahrrad frei</.ref>). Weiter abgesetzt verläuft ein (Rad-)Wanderweg direkt am Wasser.</p>

    <p>Zum Abbiegen muss an der <.v bounds="10.016586,53.613358,10.021957,53.617121" lon={10.019238} lat={53.615235} dir="backward" ref={RSWBadBramstedt} highlight="Sengelmannstraße">Kreuzung mit der Sengelmannstraße</.v> auf den <.ref>Hochbordradweg</.ref> gewechselt werden. Links abgebogen werden kann nur <.ref>indirekt</.ref>. Dafür wahlweise vor oder nach der Sengelmannstraße, da an der <.v bounds="10.016586,53.613358,10.021957,53.617121" lon={10.018793} lat={53.614941} dir="backward" ref={RSWBadBramstedt}>Ostseite</.v> ein kurzer Zweirichtungsradweg beginnt.</p>

    <p>An der <.v bounds="10.028886,53.61847,10.03197,53.620674" lon={10.029811} lat={53.619482} dir="forward" ref={RSWBadBramstedt} highlight="Alsterdorfer Straße,Im Grünen Grunde">Kreuzung Alsterdorfer Straße / Im Grünen Grunde</.v> wird direkt aus dem Mischverkehr abgebogen. Die Kreuzung ist zwar wenig befahren, hat aber komplexe Vorfahrtsregeln.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die <.v bounds="10.016734,53.613778,10.030931,53.620799" lon={10.024004} lat={53.617492} dir="forward" ref={RSWBadBramstedt}>Rathenaustraße</.v> wird zu einer Fahrradstraße umgestaltet. KFZ-Parken ist nur noch auf der Häuserseite erlaubt und mit 50cm Sicherheitsabstand gegen <.ref>Dooring</.ref> geplant. Der Parkstreifen wird regelmäßig durch Querungsstellen für den Fußverkehr unterbrochen. Dort werden auch Radanlehnbügel installiert. Der Radweg auf der Uferseite wird entfernt.</p>

    <p>An der <.v bounds="10.016586,53.613358,10.021957,53.617121" lon={10.019238} lat={53.615235} dir="backward" ref={RSWBadBramstedt} highlight="Sengelmannstraße">Kreuzung mit der Sengelmannstraße</.v> soll der Radverkehr <.ref>direkt linksabbiegen</.ref>. Dazu wird ein <.ref>ARAS</.ref> aufgemalt, damit man nicht hinter den KFZ warten muss. In Kreuzungsmitte erleichtert eine rot markierte Aufstellfläche die Orientierung. Der Zweirichtungsradweg auf der <.v bounds="10.016586,53.613358,10.021957,53.617121" lon={10.018793} lat={53.614941} dir="backward" ref={RSWBadBramstedt}>Ostseite</.v> entfällt. Rechtsabbieger müssen ebenfalls an der Ampel warten. Der <.v bounds="10.016487,53.614157,10.021074,53.616685" lon={10.019444} lat={53.615686} dir="backward" ref={Freizeitroute1}>Radwanderweg</.v> wird vor der Kreuzung auf die <.ref>Fahrbahn</.ref> geleitet.</p>

    <p>Die <.v bounds="10.028886,53.61847,10.03197,53.620674" lon={10.029811} lat={53.619482} dir="forward" ref={RSWBadBramstedt} highlight="Alsterdorfer Straße,Im Grünen Grunde">Kreuzung Alsterdorfer Straße / Im Grünen Grunde</.v> wird komplett umgestaltet. Die <.v bounds="10.026927,53.618519,10.032655,53.620294" lon={10.029821} lat={53.61953} dir="backward" ref={RSWBadBramstedt}>Einfahrt in die Rathenaustraße</.v> wird von hier nur noch für den Radverkehr möglich sein. Er erhält dazu eine eigene Verbindung zum <.v bounds="10.029075,53.618716,10.032144,53.621099" lon={10.030712} lat={53.619687} dir="forward" ref={RSWBadBramstedt} highlight="Im Grünen Grunde">Grünen Grunde</.v>. Dort gibt es zusätzlich eine Mittelinsel, damit beim Linksabbiegen je nur eine Fahrtrichtung beachtet werden muss. Der KFZ-Verkehr muss dagegen vollständig auf die <.m bounds="10.028464,53.618041,10.03337,53.620098">Alsterdorfer Straße</.m> wechseln und von dort nochmals links abbiegen.</p>

    <h4>Meinung</h4>
    <p>Die Planung sorgt mit der Umgestaltung der <.v bounds="10.028886,53.61847,10.03197,53.620674" lon={10.029811} lat={53.619482} dir="forward" ref={RSWBadBramstedt} highlight="Alsterdorfer Straße,Im Grünen Grunde">Kreuzung Alsterdorfer Straße / Im Grünen Grunde</.v> dafür, dass die Fahrt entlang der Radroute Plus mit dem KFZ unattraktiv wird. Da diese mit Abstand die größte Störquelle im Abschnitt sind, wird die Fahrt künftig deutlich angenehmer. Dass die Vorfahrtsregelung dadurch auch viel einfacher wird, ist ebenfalls hervorragend.</p>

    <p>Es bleiben Details: Warum wird die Rathenaustraße keine echte KFZ-Einbahnstraße? Dadurch könnte die alsterseitige Grünfläche vergrößert werden und der KFZ-Verkehr weiter reduziert werden. Auch eine Vorfahrt entlang der Radroute <.v bounds="10.029075,53.618716,10.032144,53.621099" lon={10.030712} lat={53.619687} dir="forward" ref={RSWBadBramstedt} highlight="Im Grünen Grunde">Im Grünen Grunde</.v> erscheint denkbar.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
