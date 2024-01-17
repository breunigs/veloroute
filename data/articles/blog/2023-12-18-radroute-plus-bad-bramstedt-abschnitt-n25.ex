defmodule Data.Article.Blog.RadroutePlusBadBramstedtAbschnittN25 do
  use Article.Default

  def title(),
    do: "Güterbahngleis Wellingsbütteler Landstraße bis Hohe Liedt (Radroute Plus Bad Bramstedt)"

  def summary(),
    do:
      "4,0m breiter, kreuzungsfreier Radweg neben dem Gleis der U1. Einige Engstellen an Masten und Brücken. 6 Zufahrten im Bauabschnitt."

  def type(), do: :planned

  def tags(), do: ["rsw-bad-bramstedt", "4"]

  def links(_assigns) do
    [
      {"öffentliche Vorstellung", "25.01.2024",
       "https://www.hamburg.de/hamburg-nord/pressemitteilungen/18076666/radroute-plus-einladung/"},
      {"1. Entwurf", "Dezember 2023",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1013508"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Öffentliche Vorstellung</h4>
    <p>Am 25.01.2024 um 18 Uhr wird die Planung in der <.m bounds="10.013784,53.653421,10.024,53.65855" title="Timmerloh 27-29, 22417 Hamburg">Fritz-Schumacher-Schule</.m> vorgestellt und diskutiert. Die Teilnahme ist ohne Anmeldung möglich.</p>

    <h4>Hintergrund</h4>
    <p>Das ehemalige Gütergleis entlang der U1 soll für die <.a name="rsw-bad-bramstedt">Radroute Plus nach Bad Bramstedt</.a> hergerichtet werden. Es handelt sich um eine neue Wegeverbindung, die bisher noch nicht existiert. Videoaufnahmen in diesem Abschnitt orientieren sich an vorhandenen, nahegelegenen Wegen. Diese werden <em>nicht</em> zur Radroute umgebaut.</p>

    <h4>Infoveranstaltung</h4>
    <p>Die Planung soll im Januar 2024 vorgestellt werden. Rückmeldungen aus der Bevölkerung sollen ebenfalls möglich sein. Details sind noch nicht bekannt.</p>

    <h4>Planung</h4>
    <p>Der Radweg verläuft neben den vorhandenen U-Bahn-Gleisen und wird 4,0m breit. Er verwendet die vorhandenen Brücken und Unterführungen entlang der Schienen. An einigen Masten und Brücken verbleiben Engstellen mit 3,50m bis 3,75m.</p>

    <p>Am jeweiligen Ende des Abschnitts wird der Radweg mittels Rampe auf Straßenniveau abgesenkt. Dort sind „Rüttelstreifen“ (dicke Fahrbahnmarkierungen, die quer zur Fahrtrichtung aufgemalt werden) geplant, um das Ende des kreuzungsfreien Radwegs deutlich zu machen. Insgesamt gibt es sechs Zufahrten:</p>

    <ul>
      <li><.v bounds="10.030976,53.625842,10.035884,53.629489" lon={10.034156} lat={53.628026} dir="backward" ref="br-nord-n8">Wellingsbütteler Landstraße</.v>: Rampe hinauf zum Radweg. Keine Stützwände.</li>
      <li><.v bounds="10.019356,53.63199,10.026337,53.636389" lon={10.022893} lat={53.634184} dir="forward" ref="rsw-bad-bramstedt">Hummelsbütteler Kirchenweg</.v>: Anschluss links des vorhandenen Bahnwegs. Zebrastreifen verschiebt sich Richtung Gleise. Beidseitige Stützwände an der Rampe hinab zum Radweg.</li>
      <li><.v bounds="10.013865,53.63923,10.020662,53.643797" lon={10.016995} lat={53.640944} dir="forward" ref="rsw-bad-bramstedt">Kielstück</.v>: ebenerdige Zufahrt.</li>
      <li><.v bounds="10.014927,53.646315,10.019945,53.650998" lon={10.017249} lat={53.646829} dir="forward" ref="rsw-bad-bramstedt">Höpen</.v>: Rampe hinab zum Radweg. Stützwände in Richtung Höpen notwendig.</li>
      <li><.v bounds="10.016989,53.661004,10.021226,53.664569" lon={10.018525} lat={53.66243} dir="forward" ref="rsw-bad-bramstedt">Laukamp</.v>: Rampe hinauf zum Radweg. Stützwand zum Laukamp hin.</li>
      <li><.v bounds="10.017263,53.66736,10.022536,53.670841" lon={10.020104} lat={53.66918} dir="forward" ref="rsw-bad-bramstedt">Hohe Liedt</.v>: Rampe hinauf zum Radweg. Keine Stützwände.</li>
    </ul>

    <h4>Meinung</h4>
    <p>An diesem Abschnitt und den Zufahrten gibt es nichts auszusetzen. Es ist aber schade, dass der kreuzungsfreie Abschnitt bereits an der Hohen Liedt endet. Siehe dazu <.a name="2023-07-10-rsw-bad-bramstedt-hohe-liedt-bis-langenhorner-chaussee">Artikel zum nachfolgenden Abschnitt</.a>.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
