defmodule Data.Article.Blog.BlankeneseSued do
  use Article.Default

  def name(), do: "#{created_at()}-1-blankenese-sued"
  def created_at(), do: ~D[2019-03-07]
  def updated(), do: ~D[2021-09-27]
  def title(), do: "Blankenese Süd (Veloroute 1, Humannstraße bis Godeffroystraße)"

  def summary(),
    do:
      "Veloroute 1 wird im südlichen Blankenese meist Fahrradstraße; die Kreuzungen an Eichendorffstraße und Elbchaussee deutlich fahrradfreundlicher."

  def start(), do: ~d[2022Q2]

  def type(), do: :planned

  def tags(), do: [1, "A22"]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Stand September 2021</h4> <p>Der erste Entwurf vom Februar 2020 wurde nicht umgesetzt. Die Beschreibung wurde an den im September 2021 veröffentlichten, zweiten Entwurf angepasst.</p>
    <h4>Alter Zustand</h4> <p>Die Baumaßnahme ist in mehrere Abschnitte aufgeteilt, woran sich die nachfolgende Beschreibung orientiert. Der Radverkehr wird im Planungsgebiet bis auf wenige Meter im <ref>Mischverkehr</ref> geführt.</p>
    <p>Die <.m bounds="9.833793,53.559164,9.835725,53.56012" lon="9.835165" lat="53.559551" dir="forward" ref="1">Kreuzung Manteuffelstraße / Eichendorffstraße / Humannstraße</.m> ist eine abknickende Vorfahrt, allerdings nicht entlang der Velroute. Richtung Innenstadt ist die Sicht etwas schwierig, sodass man sich im Kurvenbereich vorsichtig vortasten muss.</p>
    <p>Der Bereich um die <.m bounds="9.83056,53.559676,9.833336,53.560952" lon="9.833013" lat="53.560049" dir="forward" ref="1">Bushaltestellen Stauffenbergstraße</.m> ist für den Radverkehr nichts besonderes. Die Busbuchten erlauben auch ein Vorbeifahren bei wartenden Bussen.</p>
    <p>Selbiges gilt für die Kurve bzw. Bushaltestellen <.m bounds="9.826129,53.56068,9.829138,53.561733" lon="9.82849" lat="53.561308" dir="forward" ref="1">Domizil am Hirschpark</.m>.</p>
    <p>Um die <.m bounds="9.822446,53.559947,9.824702,53.561281" lon="9.824048" lat="53.560619" dir="forward" ref="1">Kreuzung mit der Elbchaussee</.m> zu queren muss man Richtung Blankenese über zwei Verkehrsinseln bzw. Ampeln fahren. In der Gegenrichtung ist (normalerweise) eine Fahrt geradeaus problemlos möglich. Die Ampelschaltzeiten favorisieren klar die KFZ-Hauptstraßen.</p>
    <p>In der <.m bounds="9.818031,53.559368,9.822659,53.561265" lon="9.82163" lat="53.559837" dir="forward" ref="1">Gätgensstraße</.m> liegt Kopfsteinpflaster. Der Knick über die <.m bounds="9.818031,53.559368,9.822659,53.561265" lon="9.819714" lat="53.560519" dir="forward" ref="1">Elbchaussee</.m> um die Godefroystraße zu erreichen ist etwas unübersichtlich, wurde zwischenzeitlich durch die Führung links des Baums aber bereits verbessert.</p>
    <p>Die weitläufigen Kurven an der <.m bounds="9.813847,53.561991,9.815432,53.562727" lon="9.814981" lat="53.562352" dir="forward" ref="1">Kreuzung mit Ole Hoop</.m> machen es notwendig sich vorsichtig vorzutasten, da jederzeit mit schnellen KFZ zu rechnen ist.</p>
    <h4>Planung</h4> <p>Die Humannstraße und Manteuffelstraße sollen zu einer Fahrradstraße werden, die auch an der <.m bounds="9.833793,53.559164,9.835725,53.56012" lon="9.835165" lat="53.559551" dir="forward" ref="1">Kreuzung Manteuffelstraße / Eichendorffstraße / Humannstraße</.m> Vorfahrt erhält. Zusätzlich soll hier eine diagonale Sperre eingebaut werden, sodass KFZ jeweils abbiegen müssen. Dem Rad- und Fußverkehr stehen aber weiterhin alle Richtungen offen.</p>
    <p>Die Einmündungen anderer Straßen werden ebenfalls so umgebaut, dass die Fahrradstraße Vorrang erhält. Die Busbuchten der Haltestellen <.m bounds="9.83056,53.559676,9.833336,53.560952" lon="9.833013" lat="53.560049" dir="forward" ref="1">Stauffenbergstraße</.m> und <.m bounds="9.826129,53.56068,9.829138,53.561733" lon="9.82849" lat="53.561308" dir="forward" ref="1">Domizil am Hirschpark</.m> entfallen, sodass der Radverkehr an haltenden Bussen über die Gegenspur vorbeifahren kann bzw. muss.</p>
    <p>Die <.m bounds="9.822446,53.559947,9.824702,53.561281" lon="9.824048" lat="53.560619" dir="forward" ref="1">Kreuzung mit der Elbchaussee</.m> bleibt im Groben so wie heute. Die Radwege werden etwas verbreitert und angepasst. Richtung Blankenese erhält der Radverkehr eine eigene Ampel; Richtung Innenstadt soll ein Aufstellbereich vor den KFZ aufgemalt werden. Linksabgebogen werden kann immer <ref>indirekt</ref>, je nach Fahrtziel ist manchmal auch <ref>direktes</ref> Abbiegen möglich.</p>
    <p>Die <.m bounds="9.818031,53.559368,9.822659,53.561265" lon="9.82163" lat="53.559837" dir="forward" ref="1">Gätgensstraße</.m> wird asphaltiert und zu einer KFZ-Einbahnstraße in Richtung Westen umgebaut. Die KFZ-Parkplätze werden als Schrägparkplätze auf die Nordseite der Straße verlegt. Am <.m bounds="9.819253,53.560144,9.820265,53.560924" lon="9.819871" lat="53.560455" dir="forward" ref="1">Pepers Diek</.m> fährt der KFZ-Verkehr in Richtung Elbchaussee rechts am Baum vorbei. Der Radverkehr soll dagegen geradeaus über ein kurzes Stück Radweg links am Baum vorbeifahren. Die Einfahrt von der Elbchaussee ist für KFZ verboten.</p>
    <p>Die Elbchaussee wird im Abschnitt der Veloroute zur Tempo-30-Zone, was durch eine Aufpflasterung statt Asphalt auch visuell unterstützt wird. Diese Aufpflasterung zieht sich bis zum Pepers Diek fort. Da das kurze Stück Radweg über einen Bordstein abgetrennt wird muss man hier trotzdem in beide Richtungen Vorfahrt geben. Durch das geringe Verkehrsaufkommen im Pepers Diek ist dies jedoch nur zur Elbchausee relevant.</p>
    <p>Die <.m bounds="9.811894,53.560215,9.819493,53.562666" lon="9.81858" lat="53.560864" dir="forward" ref="1">Godeffroystraße</.m> Straße soll Fahrradstraße werden. Die <.m bounds="9.813847,53.561991,9.815432,53.562727" lon="9.814981" lat="53.562352" dir="forward" ref="1">Kreuzung mit Ole Hoop</.m> wird entsprechend umgebaut und deutlich kompakter als bisher.</p>
    <p>Im Planungsgebiet werden teilweise auch neue Radanlehnbügel und Parkbänke aufgestellt. In den Fahrradstraßen wird der Asphalt erneuert und regelmäßig Fahrradpiktogramme aufgemalt.</p>
    <h4>Meinung</h4> <p>Nachdem man im ersten Entwurf nur das Nötigste ausbesserte, zeigt man im zweiten Entwurf deutlich mehr Gestaltungsfreude. Die Regelung an der Eichendorffstraße entschärft nicht nur die unübersichtliche Stelle, sondern hält auch gleich den KFZ-Schleichverkehr fern. Der Abschnitt der Elbchaussee zwischen Gätgensstraße und Godeffroystraße wirkt nun ebenfalls viel sicherer.</p>
    <p>Schade ist das die Führung aus der Manteuffelstraße zum Mühlenberg umständlich bleibt. Auch die Vorfahrt am Pepers Diek hätte man entlang der Veloroute gewähren können, z.B. indem man die Gätgensstraße zu einer Fahrradstraße macht. Immerhin sortiert man hier die Parkplätze, was in der Godeffroystraße unterbleibt – die Straße wird also auch in Zukunft eher unordentlich aussehen.</p>
    <p>Bei allem Meckern: der zweite Entwurf nimmt den Radverkehr ernst und bemüht sich um attraktive Führungen. Das war beim ersten Entwurf noch nicht der Fall; das Warten hat sich also gelohnt.</p>
    <h4>Quellen</h4> <ul>
    <li><.a href="https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1011851">Zweiter Entwurf (Bericht und Lagepläne)</.a></li>
    <li><.a href="https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1009667">Erster Entwurf (veraltet)</.a></li>
    <li><.a href="https://www.steg-hamburg.de/files/Projekte/Veloroute%201%20Altona/2019-01_Veloroute-Altona_A22_Gesamtdokumentation_mit%20Anlagen.pdf">Dokumentation zur 1. Infoveranstaltung (veraltet)</.a></li>
    </ul>
    """
  end
end
