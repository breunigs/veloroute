defmodule Data.Article.Blog.Denickestrasse do
  use Article.Default

  def name(), do: "#{created_at()}-11-denickestrasse"
  def created_at(), do: ~D[2019-01-09]

  def title(), do: "Eißendorfer Straße bis Denickestraße (Veloroute 11)"

  def start(), do: ~d[2023-04]
  def stop(), do: ~d[2023-12]

  def type(), do: :planned

  def tags(), do: ["11"]

  def links(_assigns) do
    [
      {"Bauvergabe ab Schüslerweg bis Triftstraße", "2022",
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/eva/supplierportal/fhh/subproject/f4e9ef1d-0187-4a07-bef1-71f57b027716/details"},
      {"Erläuterungsbericht
    und Pläne zum 2. Entwurf", "Lageplan nur ca. Blatt 1 bis 8, ansonsten siehe 1. Entwurf",
       "https://sitzungsdienst-harburg.hamburg.de/bi/vo020.asp?VOLFDNR=1005983"},
      {"Erläuterungsbericht
    und Pläne zum 1. Entwurf", "Lagepläne Blatt 9, 10 und 11 sind noch aktuell",
       "https://sitzungsdienst-harburg.hamburg.de/bi/vo020.asp?VOLFDNR=1005134"},
      {"Pressemitteilung Umbaut zwischen Thörlstraße und Riepenhausenweg", "2021",
       "https://www.hamburg.de/harburg/pressemeldungen/15030832/ausbau-veloroute-11/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand Herbst 2021:</strong> Die Denickestraße wurde zwischen <.m bounds="9.965637,53.459847,9.971527,53.462105" lon="9.968171" lat="53.460898" dir="forward" ref="11">Uni</.m> und der <.m bounds="9.954329,53.458338,9.95959,53.461127" lon="9.957227" lat="53.459496" dir="forward" ref="11">Ampel an der Weusthoffstraße</.m> bereits umgebaut. Die anderen Abschnitte sollen 2022 folgen.</p>
    <p><strong>Update:</strong> Mittlerweile liegt die zweite Verschickung vor, die deutliche Änderungen erfahren hat. Die <.m bounds="9.944864,53.45695,9.973273,53.461455">Denickestraße</.m> ist jetzt nur bis zur <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.459154, lon: 9.957208, zoom: 16}))}>Kreuzung mit der Weusthoffstraße</.m> Fahrradstraße; im weiteren Verlauf normale 30er Zone. Entsprechend gilt an allen Einmündungen Rechts-vor-Links, statt wie zuvor Vorfahrt durch Fußwegüberfahrten. Neu hinzu kommt hier eine Verengung auf Höhe des <.m bounds="9.951189,53.458989,9.95457,53.460409">Schüslerweg</.m>s, die sowohl den KFZ- als auch den Radverkehr in Richtung Weusthoffstraße ausbremsen oder beruhigen wird. Im Bereich der Fahrradstraße wird nun viel getan um den Autoverkehr fernzuhalten: Auf Höhe des <.m bounds="9.960885,53.457317,9.962901,53.461177">Wilhelm-Busch-Weg</.m>s wird eine Wendeschleife gebaut und eine Weiterfahrt mit dem KFZ ist nicht mehr möglich. Entsprechend muss aus der <.m bounds="9.959511,53.461313,9.961488,53.464705">Thörlstraße</.m> links abgebogen werden. An der <.m bounds="9.965147,53.457512,9.968275,53.464443">Gazertstraße</.m> wird ebenfalls eine Diagonalsperre eingerichtet – das heißt das KFZ nicht mehr gerade aus fahren können, sondern nur noch jeweils rechts in die Denickestraße einbiegen können (bzw. von der Denickestraße links in die Gazertstraße). Dem Radverkehr stehen an allen Stellen natürlich weiterhin alle Fahrbeziehungen offen.</p>
    <p>Erstmals wird auch die Planung für die <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.459154, lon: 9.957208, zoom: 16}))}>Kreuzung mit der Weusthoffstraße</.m> angesprochen: Die Radwege entlang der Weusthoffstraße werden rechtzeitig vor der Kreuzung in Radfahrstreifen überführt, sodass die Kreuzung gerade gequert werden kann. Linksabbiegen in die Denickestraße ist jeweils nur direkt möglich, d.h. man muss sich in die KFZ-Spur einordnen. Die Alternative wäre illegal die Furt des Fußverkehrs mitzubenutzen oder zuerst rechts in die Denickestraße abzubiegen um dann dort zu wenden. Beides erscheint wenig komfortabel und vor allem so, als ob man sich des lästigen Problems ob der wenigen Linksabbieger entledigen wollte. Zugegeben ist eine gute Lösung nicht einfach zu finden, weil die Denickestraße recht schmal ist und der Aufstellbereich nicht von einem LKW überfahren werden sollte. Aber wenn bereits die Planer aufgeben, was soll dann der einzelne Radfahrende tun?</p>
    <p>Im Bereich der 30er Zone gibt es erwartungsgemäß sonst nur Anpassungen im Detail. Ebenso verhält es sich im Bereich der Fahrradstraße bis zur <.m bounds="9.964491,53.45834,9.972899,53.462758">TU-Harburg</.m>, wobei hier natürlich einmündende Straßen jeweils wartepflichtig sind. Von dort bis zur <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.45963, lon: 9.97305, zoom: 18}))}>Einmündung in die Eißendorfer Straße</.m> hat sich im Vergleich zur ersten Verschickung nichts verändert: Die Spielstraße im Bereich der <.m bounds="9.964491,53.45834,9.972899,53.462758">TU-Harburg</.m> bleibt erhalten, immerhin wird sie aber neu gepflastert und damit hoffentlich weniger ruppig als aktuell. Im Anschluss wird die <.m bounds="9.944864,53.45695,9.973273,53.461455">Denickestraße</.m> zusammen mit <.m bounds="9.971565,53.459607,9.971943,53.46037">Am Irrgarten</.m> wieder eine Fahrradstraße. Der Stummel bis zur <.m bounds="9.972857,53.459919,9.973674,53.46202">Kerschensteinerstraße</.m> wird allerdings als 30er Zone ausgeführt.</p>
    <p>Die Führung der Route soll in diesem Bereich aufgespalten werden: Richtung <.m bounds="9.964491,53.45834,9.972899,53.462758">TU-Harburg</.m> soll die Route über die <.m bounds="9.972857,53.459919,9.973674,53.46202">Kerschensteinerstraße</.m> und dann links in die <.m bounds="9.944864,53.45695,9.973273,53.461455">Denickestraße</.m> abbiegen. Also jeweils entlang der vorhandenen (KFZ)-Einbahnstraßen, die auch beibehalten werden. Richtung Harburger Innenstadt führt die Route dagegen über <.m bounds="9.971565,53.459607,9.971943,53.46037">Am Irrgarten</.m> auf die <.m bounds="9.954596,53.455806,9.976792,53.460608">Eißendorfer Straße</.m>. Der Erläuterungsbericht begründet diese Teilung nicht. Ich vermute, das sich so Richtung TU eine Ampel vermeiden lässt, ohne in der Gegenrichtung die stark befahrene <.m bounds="9.954596,53.455806,9.976792,53.460608">Eißendorfer Straße</.m> ungesichert queren zu müssen.</p>
    <p>Die <.m bounds="9.954596,53.455806,9.976792,53.460608">Eißendorfer Straße</.m> erhält im Bereich der Veloroute durchgängig 2,25m breite Radfahrstreifen. Im weiteren Verlauf wird auf den vorhanden Hochbordradweg aufgeleitet, bzw. im Kreuzungsbereich ab <.m bounds="9.971138,53.456714,9.972285,53.459357">Barlachstraße</.m> ein Schutzstreifen eingezeichnet. Auf Höhe der <.m bounds="9.971791,53.458973,9.977161,53.462216">Goethe-Schule-Harburg</.m> wurde an eine Aufstelltasche für Linksabbieger gedacht, sodass diese die (Bettel)ampel mitbenutzen können, ohne nachfolgende Radfahrende zu blockieren.</p> <p>Insgesamt wirkt die Planung sehr fahrradfreundlich: Obwohl es in der <.m bounds="9.944864,53.45695,9.973273,53.461455">Denickestraße</.m> momentan deutlich weniger Rad- als KFZ-Verkehr gibt, soll diese als Fahrradstraße eingerichtet werden. Normalerweise soll dies erst passieren, wenn der Radanteil überwiegt. Auch auf der stark befahrenen <.m bounds="9.954596,53.455806,9.976792,53.460608">Eißendorfer Straße</.m> wird der Radverkehr deutlich aufgewertet – allerdings zu lasten der Fußwege, die nach dem Umbau schmaler sein werden als jetzt.</p>
    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
