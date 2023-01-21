defmodule Data.Article.Blog.TheodorHeussPlatz do
  use Article.Default

  def created_at(), do: ~D[2020-07-15]

  def title(), do: "Theodor-Heuss-Platz (Dammtorbahnhof, Veloroute 3)"

  def start(), do: ~d[2021-03-14]
  def stop(), do: ~d[2021-08-01]

  def type(), do: :finished
  def construction_site_id_hh(), do: [14495]
  def tags(), do: ["3"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Nach dem Umbau am Theodor-Heuss-Platz vorm Dammtorbahnhof mussten die Planer viel Kritik einstecken, v.a. für die <.v lon={9.9903211} lat={53.56066} dir="backward" bounds="9.989608,53.560402,9.991555,53.560853" ref={@ref}>misslungene Ampelschaltung</.v> an der Ecke zum Dammtordamm. Der Radverkehr muss hier warten während die KFZ-Rechtsabbieger grün haben, da abbiegende Busse und LKW den Radweg schneiden.</p>
    <h4>Pläne</h4> <p>In der zum Umbau ausgeschrieben Planung ist vorgesehen die Hochbordradwege unter der Brücke durch Radfahrstreifen zu ersetzen. Sie bleiben mit 2,0m gleich breit, wobei nur noch die Kanalrinne als Abstandhalter zu den KFZ vorhanden ist – die gute Abtrennung durch Poller entfällt. Der Fußweg an der Bahnhofseite wird schmäler und der Platz wird der Ostseite zugeschlagen.</p> <p>Außerdem wird unter der Brücke eine rund 2,5m breite Mittelinsel geschaffen und mit neuen Ampeln für den Fußverkehr ausgestattet.</p> <p>Die <.v lon={9.9903211} lat={53.56066} dir="backward" bounds="9.989608,53.560402,9.991555,53.560853" ref={@ref}>erwähnte Radampel</.v> wird ebenfalls umgebaut: auf Kosten des Fußwegs wird eine echte Geradeaus/Rechtsspur für den Radverkehr geschaffen. Um die Akzeptanz zu erhöhen soll die Ampel um extra Signale für Rechtsabbiegende ergänzt werden, die auch dann grün sind wenn der Rad-Geradeausverkehr rot hat. Die Schaltung erfolgt hier dann gleichzeitig mit den rechts abbiegenden KFZ. Damit auch große Fahrzeuge den Radweg nicht schneiden, verbreitert man die KFZ-Spur an dieser Stelle.</p> <p>Die Aufstellfläche an der Ampel wird durch eine Mini-Verkehrsinsel vom KFZ Verkehr abgetrennt. Wer aus dem <.m bounds="9.990191,53.56074,9.992822,53.561726">Mittelweg</.m> kommt und <.ref>indirekt Linksabbiegen</.ref> möchte wird hinter der Insel vorbeigeführt um sich dann normal Aufstellen zu können.</p> <p>Im <.m bounds="9.98939,53.558708,9.993629,53.560653">Alsterglacis</.m> wird der Radverkehr nicht mehr in die Stellfläche für Rad/Fuß aufgeleitet, sondern der Radfahrstreifen etwas fortgeführt. Erst nach einigen Metern erfolgt dies mittels einer S-förmigen Kurve. Damit der KFZ-Verkehr weiterhin drei Spuren hat werden dazu alle Bäume auf der Mittelinsel gefällt.</p> <p>Gebaut werden soll von Mitte Oktober 2020 bis Juli 2021, wobei auch das Siel an dieser Stelle erneuert wird.</p>
    <h4>Meinung</h4> <p>Die eigene Rechtsabbiegerspur entlang der Veloroute ist überfällig. Enttäuschend ist das sie auf Kosten des bereits zu schmalen Fußwegs kommt. Leider wird nicht erwähnt warum KFZ nicht einfach auf die linke Spur unter der Brücke abbiegen, was mit einer Verkehrsinsel sichergestellt werden könnte.</p> <p>Alle weiteren Änderungen sind Geschmackssache, stellen aber keine echte Verbesserung dar. Mit 2,0m bleiben die Radfahrstreifen deutlich zu schmal um an dieser viel beradelten Stelle sicher überholen zu können.</p>
    <h4>Quelle</h4> <ul>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/14910976/89ea2860a329d901a759daeef3ee441d/data/theodor-heuss-platz-dammtordamm-abgestimmte-planung-plan.pdf">Lageplan</.a>
    </li>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/14910978/40d9da8a8c4453e0c250a8591a5da5fb/data/theodor-heuss-platz-dammtordamm-abgestimmte-planung-bericht.pdf">Erläuterungsbericht</.a>
    </li>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/14926836/4cf69462e46772a8fa08a7c5f1634b3d/data/theodor-heuss-platz-kreuzungsumbau-03-2021-bis-08-2021.pdf">Anliegerinfo</.a> (März 2021)
    </li>
    </ul> <p>Danke an den Einsender für den Hinweis auf dieses Vorhaben.</p>
    """
  end
end
