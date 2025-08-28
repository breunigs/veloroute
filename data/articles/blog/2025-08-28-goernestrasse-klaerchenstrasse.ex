defmodule Data.Article.Blog.GoernestrasseKlaerchenstrasse do
  use Article.Default

  def title(), do: "Klärchenstraße / Goernestraße – östlich der U-Bahn (Radroute 17)"

  def summary(), do: ""

  def type(), do: :planned
  def tags(), do: ["radroute-17"]

  def start(), do: ~d[2026]

  def links(_assigns) do
    [
      {"erster Entwurf – Bericht und Karten", ~d[2025-08],
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1015580"}
    ]
  end

  def map_image do
    {name(),
     [
       {"Sweco GmbH", "https://www.sweco-gmbh.de/kontakt/kontakt-verkehr-und-infrastruktur/"},
       {"Bezirksamt Hamburg-Nord, Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/hamburg-nord/wirtschaft-bauen-umwelt-70292"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radverkehr fährt fast ausschließlich im <.ref>Mischverkehr</.ref> gemeinsam mit den KFZ. Ausnahme: im <.v bounds="9.999812,53.586942,10.003338,53.588062" lon={10.000998} lat={53.587461} dir="forward" ref="radroute-17" highlight="Klärchenstraße">östlichen Abschnitt der Klärchenstraße</.v> ist ein <.ref>Radfahrstreifen</.ref> entgegen der KFZ-Einbahnstraße aufgemalt.</p>

    <p>An den <.v bounds="9.994731,53.587854,9.996936,53.588992" lon={9.995417} lat={53.588502} dir="forward" ref="radroute-17">Kreuzungen</.v> ist man entlang der Radroute meist wartepflichtig. Die oft schwierige Sicht macht zusätzlich langsames Hineinantasten in die Kreuzung notwendig. An der <.v bounds="10.001318,53.586357,10.003995,53.5878" lon={10.001919} lat={53.58731} dir="forward" ref="radroute-17">Sierichstraße</.v> erfolgt der Anschluss über schmale <.ref>Hochbordradwege</.ref> bzw. den Gehweg.</p>

    <p>Der Radverkehr stellt bereits heute den größten Anteil am Verkehr in beiden Straßen.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der Straßenzug soll zur Fahrradstraße umgebaut werden. Nebenstraßen werden mittels Gehwegüberfahrt angebunden und sind damit wartepflichtig. Ausnahme bleibt die Kreuzung mit dem <.v bounds="9.996328,53.587446,9.999439,53.588901" lon={9.997513} lat={53.588159} dir="forward" ref="radroute-17">Leinpfad</.v>, die nicht umgebaut wird.</p>

    <p>Der Radfahrstreifen in der <.v bounds="9.999812,53.586942,10.003338,53.588062" lon={10.000998} lat={53.587461} dir="forward" ref="radroute-17" highlight="Klärchenstraße">östlichen Klärchenstraße</.v> entfällt. Kurz vor der <.v bounds="10.001318,53.586357,10.003995,53.5878" lon={10.001919} lat={53.58731} dir="forward" ref="radroute-17">Sierichstraße</.v> wird man von bzw. auf <.ref>Hochbordradwege</.ref> geleitet, um an die vorhandnen Radwege anschließen zu können. Sie fallen mit rund 2,0m breiter aus als heute. Dies ist eine Zwischenplanung. Mittelfristig soll die Radroute über die <.v bounds="10.001053,53.585785,10.007333,53.588293" lon={10.004076} lat={53.586742} dir="backward" ref="radroute-17">Cäcilienstraße</.v> verlängert werden, was wahrscheinlich auch eine Anpassung am Ende der Klärchenstraße bedeutet.</p>

    <p>Die Gehwege werden teilweise verbreitert. KFZ-Parken wird aufgeräumt, um die Anzahl der gefährdend abgestellen KFZ zu verringern.</p>

    <h4>Meinung</h4>
    <p>Die Planung löst die beiden größten Probleme: den fehlenden Vorrang an Kreuzungen und die schlechte Sicht durch wild geparkte KFZ. Selbst die Zwischenlösung bis auch die <.v bounds="10.001053,53.585785,10.007333,53.588293" lon={10.004076} lat={53.586742} dir="backward" ref="radroute-17">Cäcilienstraße</.v> neu geplant wird, kann sich sehen lassen.</p>

    <p>Lediglich an der <.v bounds="9.992966,53.587609,9.998417,53.58967" lon={9.995352} lat={53.588529} dir="forward" ref="radroute-17">Heilwigstraße</.v> sollte die Stadt einen <.ref>Diagonaltrenner</.ref> erwägen, um ortsfremden Schleichverkehr fernzuhalten.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
