defmodule Data.Article.Blog.ImGruenenGrunde do
  use Article.Default

  def title(),
    do: "Im Grünen Grunde (Radroute Plus Bad Bramstedt, Bezirksroute N8, Freizeitrouten 1 und 11)"

  def summary(),
    do:
      "Straße soll zur Fahrradstraße umgestaltet werden. Teils im niederländischen Design mit Pflastersteinen statt Mittelspur. Überleitung auf Zweirichtungsradweg an der Fuhlsbütteler Straße."

  def type(), do: :planned
  def stop(), do: ~d[2030]

  def tags(), do: ["rsw-bad-bramstedt", "br-nord-n8", "FR1", "FR11", "N26"]

  def links(_assigns) do
    [
      {"1. Entwurf, Erläuterungen und Lagepläne", "März 2024",
       "https://web.archive.org/web/20240316144712/https://www.hamburg.de/politik-und-verwaltung/bezirke/hamburg-nord/detailplaene-zweiter-abschnitt-848068"},
      {"Übersichtsseite Planung Radroute Plus Bad Bramstedt",
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/hamburg-nord/themen/planen-bauen-wohnen/fachbereich-tiefbau/nachhaltige-mobilitaet/radroute-plus"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Im Abschnitt wird meist im <.ref>Mischverkehr</.ref> gefahren, bei zugelassenem Tempo-50. Lediglich von der <.v bounds="10.030109,53.621421,10.034116,53.625154" lon={10.031568} lat={53.623465} dir="backward" ref="br-nord-n8" highlight="Fuhlsbütteler Straße">Fuhlsbütteler Straße kommend</.v> ist ein schmaler, unebener <.ref>Hochbordradweg</.ref> vorhanden, der sich nach <.v bounds="10.030109,53.621421,10.034116,53.625154" lon={10.031119} lat={53.622593} dir="backward" ref="br-nord-n8">Am Hasenberge</.v> in Luft auflöst.</p>

    <h4>Planung</h4>
    <p>Die Straße soll zu einer Fahrradstraße umgestaltet werden. Der alte Hochbordradweg wird zum Fußweg.</p>

    <p>Im südlichen Teil bis <.v bounds="10.029527,53.619386,10.032181,53.622709" lon={10.031217} lat={53.622232} dir="forward" ref="FR1">Am Hasenberge</.v> soll ein niederländisches Design probiert werden: in Straßenmitte wird ein Stück gepflastert statt asphaltiert. Das soll dazu führen, dass beim Überholen ein vollständiger Spurwechsel gemacht wird.</p>

    <p><.v bounds="10.028681,53.621782,10.03409,53.623295" lon={10.030889} lat={53.622503} dir="backward" ref="FR1">Am Hasenberge</.v> wird wartepflichtig, was durch „Haifischzähne“ (▲▲▲▲▲) hervorgehoben wird. Man verzichtet wegen dem Busverkehr auf die sonst übliche Gehwegüberfahrt.</p>

    <p>Im <.v bounds="10.03026,53.622167,10.032912,53.624215" lon={10.031479} lat={53.62293} dir="forward" ref="br-nord-n8">nördlichen Teil</.v> werden die Schrägparkplätze durch seitliches Parken ersetzt. Man plant mit 75cm Sicherheitsabstand gegen <.ref>Dooring</.ref>. Am Ende der Straße wird eine Auffahrt zum <.a name="2024-03-17-fuhlsbuetteler-strasse-nord">neuen Zweirichtungsradweg in der Fuhlsbütteler Straße</.a> geschaffen. Der verwirrende Umweg über den <.v bounds="10.028198,53.62297,10.03518,53.627202" lon={10.030048} lat={53.625757} dir="forward" ref="br-nord-n8">Justus-Strandes-Weg</.v> entfällt.</p>

    <p>Es wird noch untersucht, ob man den KFZ-Verkehr zum <.v bounds="10.029095,53.618193,10.045529,53.626645" lon={10.033887} lat={53.620266} dir="forward" ref="FR11">Friedhof Ohlsdorf</.v> direkt von der <.v bounds="10.029095,53.618193,10.045529,53.626645" lon={10.033292} lat={53.62074} dir="forward" ref="FR11">Fuhlsbütteler Straße</.v> links abbiegen lassen kann. Dieser könnte dann von der Radroute ferngehalten werden.</p>

    <h4>Meinung</h4>
    <p>Das niederländische Design ist einen Versuch wert. Statt die Straße mit hohem Aufwand zu verschmälern, muss nur die Mitte angepasst werden. Man hätte dieses Design auch im nördlichen Teil wegen der Einheitlichkeit umsetzen sollen. Dort ist die Fahrbahn zwar etwas schmaler, wird wegen dem geänderten KFZ-Parken aber sowieso leicht angepasst.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
