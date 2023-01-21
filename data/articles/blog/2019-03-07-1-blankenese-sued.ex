defmodule Data.Article.Blog.BlankeneseSued do
  use Article.Default

  def name(), do: "#{created_at()}-1-blankenese-sued"
  def created_at(), do: ~D[2019-03-07]
  def updated_at(), do: ~D[2023-01-09]
  def title(), do: "Blankenese Süd (Veloroute 1, Humannstraße bis Godeffroystraße)"

  def summary(),
    do:
      "Veloroute 1 wird im südlichen Blankenese meist Fahrradstraße; die Kreuzungen an Eichendorffstraße und Elbchaussee deutlich fahrradfreundlicher."

  def type(), do: :planned

  def tags(), do: ["1", "A22"]

  def links(_assigns) do
    [
      {"Dritter Entwurf (nur Kreuzung Elbchaussee / Manteuffelstraße / Mühlenberg)",
       "Januar 2023", "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1013546"},
      {"Zweiter Entwurf (Bericht und Lagepläne)", "Oktober 2021",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1011851"},
      {"Erster Entwurf (veraltet)", "Februar 2020",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1009667"},
      {"Dokumentation zur 1. Infoveranstaltung (veraltet)",
       "https://www.steg-hamburg.de/files/Projekte/Veloroute%201%20Altona/2019-01_Veloroute-Altona_A22_Gesamtdokumentation_mit%20Anlagen.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Januar 2023</h4>
    <p>Die Kreuzung <.v bounds="9.822446,53.559947,9.824702,53.561281" lon={9.824048} lat={53.560619} dir="forward" ref="1">Elbchaussee / Manteuffelstraße / Mühlenberg</.v> wurde mit einem anderen Konzept abermals neu geplant. Der Artikel wurde entsprechend angepasst.</p>

    <h4>Alter Zustand</h4>
    <p>Die Baumaßnahme ist in mehrere Abschnitte aufgeteilt, woran sich die nachfolgende Beschreibung orientiert. Der Radverkehr wird im Planungsgebiet bis auf wenige Meter im <.ref>Mischverkehr</.ref> geführt.</p>
    <p>Die <.v bounds="9.833793,53.559164,9.835725,53.56012" lon={9.835165} lat={53.559551} dir="forward" ref="1">Kreuzung Manteuffelstraße / Eichendorffstraße / Humannstraße</.v> ist eine abknickende Vorfahrt, allerdings nicht entlang der Veloroute. Richtung Innenstadt ist die Sicht etwas schwierig, sodass man sich im Kurvenbereich vorsichtig vortasten muss.</p>
    <p>Der Bereich um die <.v bounds="9.83056,53.559676,9.833336,53.560952" lon={9.833013} lat={53.560049} dir="forward" ref="1">Bushaltestellen Stauffenbergstraße</.v> ist für den Radverkehr nichts besonderes. Die Busbuchten erlauben auch ein Vorbeifahren bei wartenden Bussen.</p>
    <p>Selbiges gilt für die Kurve bzw. Bushaltestellen <.v bounds="9.826129,53.56068,9.829138,53.561733" lon={9.82849} lat={53.561308} dir="forward" ref="1">Domizil am Hirschpark</.v>.</p>
    <p>Um die <.v bounds="9.822446,53.559947,9.824702,53.561281" lon={9.824048} lat={53.560619} dir="forward" ref="1">Kreuzung mit der Elbchaussee</.v> zu queren muss man Richtung Blankenese über zwei Verkehrsinseln bzw. Ampeln fahren. In der Gegenrichtung ist (normalerweise) eine Fahrt geradeaus problemlos möglich. Die Ampelschaltzeiten favorisieren klar die KFZ-Hauptstraßen.</p>
    <p>In der <.v bounds="9.818031,53.559368,9.822659,53.561265" lon={9.82163} lat={53.559837} dir="forward" ref="1">Gätgensstraße</.v> liegt Kopfsteinpflaster. Der Knick über die <.v bounds="9.818031,53.559368,9.822659,53.561265" lon={9.819714} lat={53.560519} dir="forward" ref="1">Elbchaussee</.v> um die Godefroystraße zu erreichen ist etwas unübersichtlich, wurde zwischenzeitlich durch die Führung links des Baums aber bereits verbessert.</p>
    <p>Die weitläufigen Kurven an der <.v bounds="9.813847,53.561991,9.815432,53.562727" lon={9.814981} lat={53.562352} dir="forward" ref="1">Kreuzung mit Ole Hoop</.v> machen es notwendig sich vorsichtig vorzutasten, da jederzeit mit schnellen KFZ zu rechnen ist.</p>

    <h4>Planung</h4>
    <p>Die Humannstraße und Manteuffelstraße sollen zu einer Fahrradstraße werden, die auch an der <.v bounds="9.833793,53.559164,9.835725,53.56012" lon={9.835165} lat={53.559551} dir="forward" ref="1">Kreuzung Manteuffelstraße / Eichendorffstraße / Humannstraße</.v> Vorfahrt erhält. Zusätzlich soll hier eine diagonale Sperre eingebaut werden, sodass KFZ jeweils abbiegen müssen. Dem Rad- und Fußverkehr stehen aber weiterhin alle Richtungen offen.</p>
    <p>Die Einmündungen anderer Straßen werden ebenfalls so umgebaut, dass die Fahrradstraße Vorrang erhält. Die Busbuchten der Haltestellen <.v bounds="9.83056,53.559676,9.833336,53.560952" lon={9.833013} lat={53.560049} dir="forward" ref="1">Stauffenbergstraße</.v> und <.v bounds="9.826129,53.56068,9.829138,53.561733" lon={9.82849} lat={53.561308} dir="forward" ref="1">Domizil am Hirschpark</.v> entfallen, sodass der Radverkehr an haltenden Bussen über die Gegenspur vorbeifahren kann bzw. muss.</p>
    <p>Die <.v bounds="9.822446,53.559947,9.824702,53.561281" lon={9.824048} lat={53.560619} dir="forward" ref="1">Kreuzung mit der Elbchaussee</.v> bleibt im Groben so wie heute. Die Radwege werden etwas verbreitert und angepasst. Richtung Blankenese erhält der Radverkehr eine eigene Ampel; Richtung Innenstadt soll ein Aufstellbereich vor den KFZ aufgemalt werden. Linksabgebogen werden kann immer <.ref>indirekt</.ref>, je nach Fahrtziel ist manchmal auch <.ref>direktes</.ref> Abbiegen möglich.</p>

    <p>Die <.v bounds="9.822446,53.559947,9.824702,53.561281" lon={9.824048} lat={53.560619} dir="forward" ref="1">Kreuzung mit der Elbchaussee</.v> erhält ein für Hamburg neues Konzept:</p>
    <ul>
      <li><strong>Entlang der Veloroute:</strong> Die Querung der Elbchausee erfolgt geradlinig. Genau wie die Manteuffelstraße heute, wird der Mühlenberg zu einer KFZ-Einbahnstraße von der Kreuzung weg. Die Ausnahme für Busse bleibt bestehen. Der Radverkehr im Mühlenberg Richtung Innenstadt erhält einen 2,0m breiten Radfahrstreifen.</li>
      <li><strong>Entlang der Elbchaussee:</strong> Es gibt Hochbordradwege, die zum Abbiegen bzw. Queren der Kreuzung gedacht sind. Wer nur geradeaus möchte, hat auf der Fahrbahn weiterhin die einfachste Anbindung.</li>
      <li><strong>Schenefelder Landstraße:</strong> Die Radwege um die Kreuzung herum lassen sich in beide Richtungen befahren. Es ist daher möglich sowohl im als auch gegen den Uhrzeigersinn abzubiegen. Der Radweg in Richtung Norden erhält eine langgezogene Absenkung, damit man sich im Mischverkehr einordnen kann. Er endet kurz nach der Kreuzung.</li>
      <li><strong>Fußverkehr:</strong> Die Einmündungen der Veloroute werden zu einer Gehwegüberfahrt, sodass die Ampeln hier entfallen. Die Querungen der anderen Straßen verlaufen über eine Mittelinsel in Straßenmitte. Sie liegt so, dass immer „Zick-Zack“ notwendig ist, um geradeaus zu kommen.</li>
      <li><strong>Ampelschaltung:</strong> Fuß-, Rad- und KFZ-Wege erhalten jeweils eigene Ampeln, Phasen und Furten. Die Grünzeiten sollen zwar kurz sein, dafür aber häufig schalten. Je nach Ziel und Ampelphase muss der Fußverkehr auf der Mittelinsel warten.</li>
    </ul>

    <p>Die <.v bounds="9.818031,53.559368,9.822659,53.561265" lon={9.82163} lat={53.559837} dir="forward" ref="1">Gätgensstraße</.v> wird asphaltiert und zu einer KFZ-Einbahnstraße in Richtung Westen umgebaut. Die KFZ-Parkplätze werden als Schrägparkplätze auf die Nordseite der Straße verlegt. Am <.v bounds="9.819253,53.560144,9.820265,53.560924" lon={9.819871} lat={53.560455} dir="forward" ref="1">Pepers Diek</.v> fährt der KFZ-Verkehr in Richtung Elbchaussee rechts am Baum vorbei. Der Radverkehr soll dagegen geradeaus über ein kurzes Stück Radweg links am Baum vorbeifahren. Die Einfahrt von der Elbchaussee ist für KFZ verboten.</p>
    <p>Die Elbchaussee wird im Abschnitt der Veloroute zur Tempo-30-Zone, was durch eine Aufpflasterung statt Asphalt auch visuell unterstützt wird. Diese Aufpflasterung zieht sich bis zum Pepers Diek fort. Da das kurze Stück Radweg über einen Bordstein abgetrennt wird muss man hier trotzdem in beide Richtungen Vorfahrt geben. Durch das geringe Verkehrsaufkommen im Pepers Diek ist dies jedoch nur zur Elbchausee relevant.</p>
    <p>Die <.v bounds="9.811894,53.560215,9.819493,53.562666" lon={9.81858} lat={53.560864} dir="forward" ref="1">Godeffroystraße</.v> Straße soll Fahrradstraße werden. Die <.v bounds="9.813847,53.561991,9.815432,53.562727" lon={9.814981} lat={53.562352} dir="forward" ref="1">Kreuzung mit Ole Hoop</.v> wird entsprechend umgebaut und deutlich kompakter als bisher.</p>
    <p>Im Planungsgebiet werden teilweise auch neue Radanlehnbügel und Parkbänke aufgestellt. In den Fahrradstraßen wird der Asphalt erneuert und regelmäßig Fahrradpiktogramme aufgemalt.</p>

    <h4>Meinung</h4>
    <p>Nachdem man im ersten Entwurf nur das Nötigste ausbesserte, zeigt man im zweiten Entwurf deutlich mehr Gestaltungsfreude. Die Regelung an der Eichendorffstraße entschärft nicht nur die unübersichtliche Stelle, sondern hält auch gleich den KFZ-Schleichverkehr fern. Der Abschnitt der Elbchaussee zwischen Gätgensstraße und Godeffroystraße wirkt nun ebenfalls viel sicherer.</p>
    <p>Der dritte Entwurf macht nun auch die Querung der Elbchausee zwischen Manteuffelstraße und Mühlenberg geradlinig. Auch alle anderen Fahrtrichtungen erhalten jetzt eine klare und sichere Querungsmöglichkeit, auch wenn diese teils umständlich sind. Wer erfahren genug ist, kann zum Glück einfach im Mischverkehr bleiben. Außerhalb der Fahrbahn muss die Frage nach Vorrang vor allem durch Rücksicht und Absprache geregelt werden – die Konstellationen aus Gehwegüberfahrten, Zweirichtungsradwegen und Querungsstellen ist komplex.</p>
    <p>Die Vorfahrt am Pepers Diek hätte man entlang der Veloroute gewähren können, z.B. indem man die Gätgensstraße zu einer Fahrradstraße macht. Immerhin sortiert man hier die Parkplätze, was in der Godeffroystraße unterbleibt – die Straße wird also auch in Zukunft eher unordentlich aussehen.</p>
    <p>Bei allem Meckern: der zweite und dritte Entwurf nehmen den Radverkehr ernst und bemüht sich um attraktive Führungen. Das war beim ersten Entwurf noch nicht der Fall; das Warten hat sich also gelohnt.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
