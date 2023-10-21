defmodule Data.Article.Blog.FernbahnhofDiebsteich do
  use Article.Default

  def title(), do: "Fernbahnhof Diebsteich (Radschnellweg nach Elmshorn, Freizeitroute 9)"

  def summary(),
    do:
      "Westseite: Schmaler Zweirichtungsradweg oder Fahrbahnradeln. Keine Durchfahrt für private KFZ. Komplizierte Ampel an der Unterführung. Ostseite: Tempo-50 im Mischverkehr. Kreisel an der Unterführung. Zweirichtungsradweg endet mit gelungener Aufleitung in der Unterführung."

  def type(), do: :planned

  def tags(), do: ["rsw-elmshorn", "FR9"]

  def start(), do: ~d[2024Q4]
  def stop(), do: ~d[2026Q4]

  def links(_assigns) do
    [
      {"Erläuterungsbericht", "Oktober 2023",
       "https://lsbg.hamburg.de/resource/blob/692606/14b5bf7563f810e162a68f3311dece67/fernbahnhof-altona-abstimmungsunterlage-bericht-data.pdf"},
      {"Lagepläne", "Oktober 2023",
       "https://lsbg.hamburg.de/resource/blob/692608/1cfaf7cffd95cebddcdf02efd5bfdb5b/fernbahnhof-altona-abstimmungsunterlage-plaene-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Freizeitroute führte über eine <.v bounds="9.926438,53.565059,9.939544,53.570201" lon={9.934788} lat={53.569005} dir="forward" ref="FR9">schmale Fußgängerbrücke</.v> bzw. die <.v bounds="9.926438,53.565059,9.939544,53.570201" lon={9.934633} lat={53.568042} dir="forward" ref="FR9">Zuwegung zum S-Bahn-Halt</.v> Diebsteich. Der gesamte Abschnitt war ein Fußweg, es musste also geschoben werden.</p>

    <p>In der <.v bounds="9.926438,53.565059,9.939544,53.570201" lon={9.933245} lat={53.567507} dir="forward" ref="FR9">Schleswiger Straße</.v> durfte auf dem bahnseitigen Gehweg gefahren werden. Für mehr als Schrittgeschwindigkeit musste unebenes Kopfsteinpflaster benutzt werden.</p>

    <p>Am <.v bounds="9.926438,53.565059,9.939544,53.570201" lon={9.933209} lat={53.567011} dir="backward" ref="FR9">Zebrastreifen auf der Westseite der Unterführung</.v> kam es häufig zu Unfällen.</p>

    <h4>Planung</h4>
    <h5>Ostseite</h5>
    <p>Auf Seite des neuen Fernbahnhofs beginnt ab etwa Höhe <.v bounds="9.926438,53.565059,9.939544,53.570201" lon={9.93555} lat={53.568752} dir="forward" ref="FR9">Waidmannstraße</.v> ein 3,0m breiter Zweirichtungsradweg nach Süden. Er verläuft neben einer neuen, zweispurigen Fahrbahn. Die <.v bounds="9.926438,53.565059,9.939544,53.570201" lon={9.935772} lat={53.568342} dir="forward" ref="FR9">Isebekstraße</.v> wird als wartepflichtige Gehwegüberfahrt an die Fahrbahn angebunden, allerdings nicht an den Radweg.</p>

    <p>Der Zweirichtungsradweg erhält einen direkten Anschluss an ein geplantes Fahrradparkhaus. An anderen Zufahrten zum Bahnhof wird er unterbrochen. Überholen ist auf dem Zweirichtungsradweg nicht gestattet.</p>

    <p>Die <.v bounds="9.926438,53.565059,9.939544,53.570201" lon={9.935419} lat={53.568815} dir="forward" ref="FR9">Waidmannstraße</.v>, die <.v bounds="9.926438,53.565059,9.939544,53.570201" lon={9.934895} lat={53.569163} dir="forward" ref="FR9">Große Bahnstraße</.v> und der Bahnhofsvorplatz sollen nur für KFZ-Anlieger, ÖPNV, Rad- und Fußverkehr freigegeben werden. Allgemeiner KFZ-Verkehr ist von Süden nur bis zum Vorplatz zugelassen und kann dort über einen Wendekreis umkehren. KFZ-Parken ist hauptsächlich in einer Tiefgarage vorgesehen.</p>

    <h5>Südseite / Unterführung</h5>
    <p>Der Zweirichtungsradweg endet in <.v bounds="9.926438,53.565059,9.939544,53.570201" lon={9.934047} lat={53.566843} dir="forward" ref="FR9">der Unterführung</.v>. Der Radverkehr in Richtung Westen muss sich dort in den <.ref>Mischverkehr</.ref> einordnen. Für die Gegenrichtung steht eine langgezogene, rund 3m breite Aufstellfläche bereit um ihn gut erreichen zu können. Die Benutzung der Fahrbahn soll in der Unterführung verboten werden.</p>

    <p>In der <.v bounds="9.926438,53.565059,9.939544,53.570201" lon={9.934763} lat={53.567016} dir="forward" ref="FR9">Plöner Straße</.v> in Richtung Süden wird der Zweirichtungsradweg auf der Häuserseite weitergeführt. Er wird hier an einer Engstelle nur 2,25m breit, sonst 2,85m. Die Querung erfolgt mittels Ampel, wobei jeweils eigene Abbiegespuren vorgesehen sind.</p>

    <h5>Westseite</h5>
    <p>Die <.v bounds="9.926438,53.565059,9.939544,53.570201" lon={9.933245} lat={53.567507} dir="forward" ref="FR9">Schleswiger Straße</.v> wird über einen Kreisel angebunden. Ab hier wird dann ausschließlich im <.ref>Mischverkehr</.ref> bei Tempo 50 gefahren. <.v bounds="9.926438,53.565059,9.939544,53.570201" lon={9.933061} lat={53.568664} dir="forward" ref="FR9">In der Kurve</.v> wird eine StadtRAD Station errichtet.</p>

    <h4>Meinung</h4>
    <p>Gut ist der Kreisel auf der Westseite der Unterführung. Auch die Anbindung des Zweirichtungsradwegs in der Unterführung ist gelungen.</p>

    <p>Die Ampeln auf der Ostseite sind hingegen so kompliziert, dass Missverständnisse und damit Konflikte unumgänglich sind. Ein Beispiel: Rad- und Fußverkehr vom Bahnhofsvorplatz in Richtung Süden müssen die Straßenseite wechseln. Die Aufstellflächen für den Radverkehr liegen genau auf Höhe der Fußfurt. Haben beide gleichzeitig grün, kommen sie sich in die Quere. Bei getrennten Phasen muss man sich zu Fuß durch die wartenden Fahrräder schlängeln.</p>

    <p>Der Zweirichtungsradweg selbst ist auch zu schmal, und das durchgehende Überholverbot realitätsfremd. Zwar lässt man das Radeln auf der Fahrbahn zu, zwingt die Leute in der Unterführung für 100m auf den Radweg. Wie der Wechsel von Fahrbahn auf Radweg an der eben erwähnten Ampel sicher erfolgen soll, erschließt sich mir nicht.</p>

    <p>Im direkten Bahnhofsvorfeld ist die Idee gut, die Durchfahrt für private KFZ zu sperren. Da man rein auf Schilder und Designelemente setzt, dürfte sich der Erfolg in Grenzen halten – automatische Poller wären wesentlich effektiver.</p>

    <p>Irritierend ist der fehlende Anschluss der Freizeitroute 9 an den Zweirichtungsradweg.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
