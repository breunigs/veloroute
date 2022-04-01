defmodule Data.Article.Blog.MaxBrauerAllee do
  use Article.Default

  def name(), do: "#{created_at()}-1-13-max-brauer-allee"
  def created_at(), do: ~D[2018-12-17]
  def updated_at(), do: ~D[2022-03-31]

  def title(), do: "Max-Brauer-Allee (Busbahnhof bis Holstenstraße, Veloroute 1 und 13)"

  def summary(),
    do:
      "Verschiedene Führungen; teilweise auf Busspur; Schutz vor KFZ nicht überall. Kreuzungen deutlich besser."

  def type(), do: :planned

  def tags(), do: ["1", "13"]

  def links(_assigns) do
    [
      {"Planung 2022", "Lageplan und Änderungen zur 2018er Version",
       "https://suche.transparenz.hamburg.de/dataset/e749e266-0450-4e76-9f0e-a0bd9ddc643d"},
      {"Erläuterungsbericht mit Lageplänen 2018", "Übersicht Seite 22, Pläne ab Seite 88",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1008162"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand März 2022</h4>
    <p>Die Planungen wurden an die Forderungen des <.a href="https://radentscheid-hamburg.de/">Radentscheids</.a> angepasst. Statt 1,85m breiter Radfahrstreifen sind nun breitere Radwege vorgesehen, die deutlicher vom KFZ-Verkehr abgegrenzt sind. Der Artikel wurde komplett überarbeitet und beschreibt die Situation der 2022er Planung.</p>

    <h4>Alter Zustand</h4>
    <p>Nur in kurzen Abschnitten der Max-Brauer-Allee gibt es <.ref>Hochbordradwege</.ref>. Diese sind <.m bounds="9.937635,53.552885,9.939369,53.553728" lon="9.938654" lat="53.553506" dir="forward" ref="1">schmal und von Baumwurzeln unterbrochen</.m>. Ansonsten kann die Busspur mitbenutzt werden, die zeitweise auch für den privaten KFZ-Verkehr freigegeben ist.</p>

    <p>Die Führung zu bestimmten Fahrtzielen ist unklar. Etwa wie man zur <.m bounds="9.930961,53.551805,9.934104,53.552473">Ottenser Hauptstraße</.m> kommt oder wie <.m bounds="9.941509,53.554527,9.943611,53.555664" lon="9.942527" lat="53.555225" dir="forward" ref="1">links aus der Chemnitzstraße</.m> abgebogen werden soll.</p>

    <h4>Planung – Fahrtrichtung Süden / Elbe</h4>
    <p>Ab der <.m bounds="9.946863,53.557516,9.94874,53.558536">Eggerstedtstraße</.m> fährt der Radverkehr auf der Busspur. Sie ist mit 4,75m breiter als heute und nicht mehr für den KFZ-Verkehr freigegeben. Kurz vor der <.m bounds="9.940695,53.554543,9.943797,53.556118" lon="9.942264" lat="53.555422" dir="forward" ref="1">Gerichtsstraße</.m> beginnt ein <.ref>geschützter Radfahrstreifen</.ref> der über die Kreuzung hilft. Danach gibt es wieder ein Stück auf der Busspur.</p>

    <p>An der <.m bounds="9.937696,53.552713,9.941115,53.554734" lon="9.939397" lat="53.553902" dir="forward" ref="1">Goetheallee</.m> beginnt ein <.ref>Radfahrstreifen</.ref> – diesmal ohne Trennelement zum KFZ-Verkehr. Nach der Einmündung geht dieser in einen <.ref>Kopenhagener Radweg</.ref> über. Am <.m bounds="9.93588,53.551282,9.937785,53.552628" lon="9.93717" lat="53.552531" dir="forward" ref="1">Paul-Nevermann-Platz</.m> wechseln sich Radfahrstreifen und Busspur ab. Danach geht der Radfahrstreifen in die Planung „<.a href="/article/2021-09-11-max-brauer-allee-sued">Max Brauer Allee Süd</.a>“ über.</p>

    <h4>Planung – Fahrtrichtung Norden / Sternschanze</h4>
    <p>Bis zum <.m bounds="9.935302,53.551104,9.937535,53.552623" lon="9.936491" lat="53.551354" dir="backward" ref="1">Paul-Nevermann-Platz</.m> fährt man auf einem Hochbordradweg. Ab dort auf einem teilweise <.ref>geschützen Radfahrstreifen</.ref>, der nach der Einmündung <.m bounds="9.936656,53.55218,9.938966,53.553628" lon="9.9372" lat="53.55239" dir="backward" ref="1">Große Bergstraße</.m> auf einen Hochbordradweg aufgeleitet wird.</p>

    <p>Im weiteren Verlauf wechseln sich dann <.ref>Kopenhagener Lösung</.ref> und ungeschützte Radfahrstreifen an den Kreuzungen ab. An der <.m bounds="9.942286,53.555308,9.944204,53.556183">Bushaltestelle Gerichtsstraße</.m> führt der Radweg durch die Wartefläche der Busse. Wer nicht hinter dem Bus warten möchte, muss sich in den KFZ-Verkehr einordnen.</p>

    <p>Ab der <.m bounds="9.945094,53.556781,9.947997,53.558226">Hospitalstraße</.m> bleibt es beim Radfahrstreifen. Nur wo eine zweite KFZ-Spur anfängt und der Radweg verschwenkt wird gibt es einen Bordstein, mit dem ein Schneiden der Kurve verhindert wird.</p>

    <h4>Planung – Julius-Leber-Straße</h4>
    <p>Nahe des Kreuzungsbereichs mit der Max-Brauer-Allee sind kurze Abschnitte als <.ref>geschützte Radfahrstreifen</.ref> geplant. Diese sind im weiteren Verlauf als reine Radfahrstreifen ohne Trennelemente ausgeführt. An der <.m bounds="9.937519,53.555399,9.939057,53.555792">Löfflerstraße</.m> gibt es einen Durchlass zum <.ref>indirekten Linksabbiegen</.ref>.</p>

    <h4>Planung – Kreuzung Max-Brauer-Allee / Julius-Leber-Straße</h4>
    <p>Ein Zweirichtungsradweg verbindet die <.m bounds="9.940868,53.554848,9.943894,53.556132" lon="9.942647" lat="53.55523" dir="forward" ref="1">Chemnitzstraße</.m> mit der <.m bounds="9.940868,53.554848,9.943894,53.556132" lon="9.941988" lat="53.555664" dir="forward" ref="13">Gerichtsstraße</.m>. Über diesen Weg wird auch links abgebogen um der Veloroute 1 zu folgen. Die Ampel wird so angepasst, dass sie für den Radverkehr gut einsehbar ist.</p>

    <p>Auch alle anderen Fahrtbeziehungen sind möglich. Dabei sind individuelle Lösungen vorgesehen: eigene Rechtsabbieger Spuren für den Radverkehr, mit und ohne Zebrastreifen. <.ref>Indirektes Linksabbiegen</.ref> mit eigenem Aufstellbereich, oder mit Warten auf dem Radfahrstreifen.</p>

    <h4>Planung – Kreuzung Paul-Nevermann-Platz</h4>
    <p>Die Anbindung an die <.m bounds="9.93031,53.55157,9.934129,53.552537">Ottenser Haupstraße</.m> verschiebt sich auf die Südseite der Unterführung. Über einen <.ref>Hochbordradweg</.ref> direkt am Geländer erreicht man die Taxi-Parkplätze und fährt dort wie heute. In Gegenrichtung quert man jedoch die Busspuren und kommt mittels einens <.ref>Radfahrstreifen in Mittellage</.ref> zur Kreuzung.</p>

    <h4>Meinung</h4>
    <p>Die Neuplanungen – sowohl von 2018 und 2022 – verbessern die Situation für den Radverkehr. Da der Zustand der Max-Brauer-Allee vorher katastrophal war, ist dies keine große Kunst. Die interessante Frage lautet also ob die neuen Radwege attraktiv sind.</p>

    <p>Die Trennung vom KFZ-Verkehr macht die 2022er Planung besser als die 2018er. Allerdings erkauft sie sich das mit häufig wechselnden Varianten, die durch die Höhenunterschiede jeweils Rampen brauchen. Das senkt den Fahrkomfort. Dafür sind die Radwege jetzt breiter als vorher, auch wenn Engstellen verbleiben.</p>

    <p>Die geteilte Busspur Richtung Elbe ist mit der in der <.m bounds="9.969503,53.556473,9.973821,53.557444" lon="9.971835" lat="53.557097" dir="backward" ref="1">Feldstraße</.m> vergleichbar. Super, zumindest bis ein Bus kommt. Auch bei 4,75m Spurbreite ist ein mit 50 km/h vorbeirauschender Bus unangenehm.</p>

    <p>Die Umplanung der Julius-Leber-Straße wirft Fragen auf: bei 3,30m breiten Radwegen auf Trennelemente zu verzichten wird zu viel Falschparken führen. Dabei könnte man diese hier ohne Probleme anbringen.</p>

    <p>Gelungen sind die Abbiegemöglichkeiten an den Kreuzungen. Endlich sind für den Radverkehr wichtige Verbindungen verständlich benutzbar und man schafft teilweise sogar Neue.</p>

    <p>Insgesamt ergibt sich positives Bild, auch wenn es nicht der große Wurf für den Radverkehr wurde. Allerdings ist die verkehrliche Situation in der Max-Brauer-Allee komplex und andere Verkehrsarten müssen auch berücksichtigt werden. Trotz aller Kritik wird die Fahrt künftig deutlich angenehmer.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
