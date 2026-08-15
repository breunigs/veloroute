defmodule Data.Article.Blog.ZOBHarburg do
  use Article.Default

  def updated_at(), do: ~D[2025-11-07]
  def title(), do: "Busbahnhof Harburg und anliegende Kreuzungen (Radrouten 4 und 13)"

  def start(), do: ~d[2023-05]
  def stop(), do: ~d[2027-09-05]
  def construction_site_id_hh(), do: [586_843, 2_994_597]

  def type(), do: :construction

  def summary(),
    do:
      "Doppelkreuzung erhält breitere Radwege, mit klaren und kurzen Furten. Radroute+ Lüneburg wird brauchbar durchgebunden."

  def tags(), do: ["radroute-13", "radroute-4", "FR11"]

  def map_image do
    {name(),
     [
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"},
       {"Ingenieurbüro Münster GmbH", "https://ib-muenster.de/kontakt/"}
     ]}
  end

  def links(_assigns) do
    [
      {"Baustelleninfo", ~d[2026-03],
       "https://lsbg.hamburg.de/resource/blob/1158628/a785fc136d89a40d1e91b7129ef295cb/zob-harburg-4-ba-anliegerinformation-februar-2026-data.pdf"},
      {"Artikel der Hochbahn zum Baufortschritt", ~d[2025-11],
       "https://dialog.hochbahn.de/allgemein/zob-harburg-der-neubau-geht-in-die-naechste-runde/"},
      {"2. Entwurf, nördlicher Teil, Lagepläne und Präsentation", ~d[2025-11],
       "https://fragdenstaat.de/anfrage/doppelknoten-am-zob-harburg/#nachricht-1058297"},
      # {"Baustelleninfo", ~d[2024-12],
      #  "https://web.archive.org/web/20250118130325/https://lsbg.hamburg.de/resource/blob/784454/fda32c7599b7a6f6f5ba86c681c806bf/hannoversche-strasse-zob-harburg-anliegerinformation-juni-2024-data.pdf"},
      # {"Baustelleninfo", "Februar 2024",
      #  "https://lsbg.hamburg.de/resource/blob/784454/9cf3dba5a806f6250ceab12441ede066/hannoversche-strasse-zob-harburg-anliegerinformation-juli-2023-data.pdf"},
      {"Erläuterungsbericht", "2022",
       "https://lsbg.hamburg.de/resource/blob/784358/6be53ea4ecd55afb26e2db86fa61b343/veloroute-11-harburger-innenstadt-zob-harburg-abgestimmte-planung-bericht-data.pdf"},
      {"Lageplan – südlicher Abschnitt", "2022",
       "https://lsbg.hamburg.de/resource/blob/784360/657b189d6bcc96128617c3480b74bdb5/veloroute-11-harburger-innenstadt-zob-harburg-abgestimmte-planung-plaene-data.pdf"},
      {"Zeitungsartikel mit veralteter Visualisierung (2021)",
       "https://web.archive.org/web/20210305190832/https://www.elbe-wochenblatt.de/2021/02/12/heftige-kritik-am-geplanten-umbau-des-harburger-busbahnhofs/"},
      {"Zeitungsartikel zum Bauzeitraum (2021)",
       "https://www.abendblatt.de/hamburg/harburg/article402627419/harburgs-zentraler-busbahnhof-wird-drei-jahre-geschlossen.html"},
      {"Bestätigung der Pläne des Verkehrssenators (2022)",
       "https://twitter.com/anjes_tjarks/status/1482231808209129474"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Kreuzung vorm Busbahnhof wird vom Autoverkehr dominiert. Wer zu Fuß unterwegs ist und auf ebenerdige Wege angewiesen ist, muss teils riesige Umwege in Kauf nehmen: der <.v bounds="9.989281,53.457167,9.992087,53.457861" lon={9.989458} lat={53.457387} dir="forward" ref={Radroute13}>Walter-Dudek-Brücke</.v> fehlt eine solche Querungsmöglichkeit.</p>

    <p>Dem Radverkehr machen die Ampelschaltungen zu schaffen. Die Fahrt von der <.v bounds="9.986975,53.456788,9.988792,53.457455" lon={9.987975} lat={53.457055} dir="forward" ref={Radroute13}>Moorstraße</.v> auf die <.v bounds="9.988803,53.457817,9.990229,53.458536" lon={9.989208} lat={53.457934} dir="backward" ref={Radroute4}>Hannoversche Brücke</.v> dauert knapp zwei Minuten, für nur rund 150m. Die Radwege selbst sind <.ref>Hochbordradwege</.ref>, aber ein Großteil der Wege besteht aus den langen Querungsfurten.</p>

    <p>Am Busbahnhof wiederum fehlen Busstiege um die hohe Anzahl der hier haltenden Busse abfertigen zu können.</p>

    <p>In <.v bounds="9.987247,53.454171,9.992275,53.458378" lon={9.989372} lat={53.456003} dir="forward" ref={Radroute4} highlight="Schlachthofbrücke">Richtung Schlachthofbrücke</.v> gibt es meist <.ref>Hochbordradwege</.ref>, die teils für beide Richtungen freigegeben sind. Ausnahme: <.v bounds="9.987512,53.454469,9.992079,53.457617" lon={9.990594} lat={53.455038} dir="backward" ref={RSWTostedt}>vor dem Busbahnhof und Zugbahnhof </.v> gibt es nur einen geteilten Rad- und Fußweg auf der Stadtseite. Der Radweg auf Bahnseite endet vor dem Bahnhof.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Das Gebiet ist in zwei eigene Planungs-Abschnitte aufgeteilt:</p>
    <ul>
      <li><.m bounds="9.988158,53.453375,9.992964,53.45735">südlicher Teil samt Busbahnhof</.m> (bereits im Umbau)</li>
      <li><.m bounds="9.986705,53.45694,9.991479,53.459298">nördlicher Teil mit Walter-Dudek-Brücke</.m> (noch in Planung)</li>
    </ul>
    <p>Zur Vereinfachung werden beide Abschnitte zusammen betrachtet. Die Beschreibung orientiert sich an den Radrouten.</p>

    <h5>Radroute 4 → Süden</h5>
    <p>Der <.v bounds="9.987182,53.453472,9.992602,53.459157" lon={9.989553} lat={53.458397} dir="forward" ref={Radroute4}>heute vorhandene Radfahrstreifen</.v> wird verbreitert (3,8m). Kurz vor der Kreuzung erfolgt eine Aufleitung auf einen Hochbordradweg (3,0m), an den ein Zweirichtungsradweg (4,0m) anschließt. Auf diesem quert man die Hannoversche Straße zweimal, da die einzige Querungsmöglichkeit in Richtung Harburg „zwischen“ die Brücken gelegt wurde.</p>

    <p>Auf der <.v bounds="9.987182,53.453472,9.992602,53.459157" lon={9.988558} lat={53.457647} dir="forward" ref={Radroute4}>Seite des Seevekanals</.v> fährt man auf einem Hochbordradweg (2,5m) und quert die <.v bounds="9.987182,53.453472,9.992602,53.459157" lon={9.988542} lat={53.457282} dir="forward" ref={Radroute4}>Moorstraße</.v>. Im <.v bounds="9.987182,53.453472,9.992602,53.459157" lon={9.988769} lat={53.456899} dir="forward" ref={Radroute4}>Bereich des Busbahnhofs</.v> fährt man auf einer Protected-Bike-Lane (2,0m), danach auf einem Radfahrstreifen (1,6m – 2,0m). Dieser geht <.v bounds="9.987182,53.453472,9.992602,53.459157" lon={9.990152} lat={53.455175} dir="forward" ref={Radroute4}>in einen Hochbordradweg</.v> (1,75m – 2,0m) über.</p>

    <h5>Radroute 4 → Norden</h5>
    <p>Vom <.v bounds="9.987182,53.453472,9.992602,53.459157" lon={9.991823} lat={53.453975} dir="backward" ref={Radroute4}>Hochbordradweg</.v> (1,6m breit) kommend wird man auf einen Radfahrstreifen (2,0m) abgeleitet. Auf <.m bounds="9.988448,53.45525,9.991067,53.456521">Höhe der Einfahrt zum Phoenix-Center</.m> gibt es eine Engstelle (1,5m). Der Radfahrstreifen ist im Bereich des Busbahnhofs teilweise überdacht und führt an den weitläufigen Zufahrten der Busse vorbei. Trennelemente sind nicht vorgesehen.</p>

    <p>Ab der <.v bounds="9.987213,53.456239,9.993878,53.459058" lon={9.989094} lat={53.457114} dir="backward"  ref={Radroute4}>Walter-Dudek-Brücke</.v> schließt ein Zweirichtungsradweg (4,0m) an, den man vorzeitig verlässt um dem Hochbordradweg (3,0m) in der <.v bounds="9.986404,53.456855,9.993068,53.459674" lon={9.989431} lat={53.458057} dir="backward" ref={Radroute4}>Hannoverschen Straße</.v> zu folgen. Dieser geht in eine <.ref>Protected-Bike-Lane</.ref> (3,3m) über, die sich zum bereits heute vorhandenen Radfahrstreifen verengt.</p>

    <h5>Radroute 13 → Osten</h5>
    <p>Von den Hochbordradwegen (1,0m) in der <.v bounds="9.985283,53.45617,9.99434,53.458952" lon={9.987451} lat={53.456993} dir="forward" ref={Radroute13}>Moorstraße</.v> wird auf eine Protected-Bike-Lane (3,0m) vor der Kreuzung geleitet. Die Furt (2,0m – 3,0m) führt kerzengerade zur <.v bounds="9.985283,53.45617,9.99434,53.458952" lon={9.98917} lat={53.457194} dir="forward" ref={Radroute13}>Walter-Dudek-Brücke</.v>. Der Hochbordradweg (2,5m) verengt sich zum Altbestand (1,0m) hin.</p>

    <h5>Radroute 13 → Westen</h5>
    <p>Am Altbestand (1,0m) auf der <.v bounds="9.985283,53.45617,9.99434,53.458952" lon={9.990802} lat={53.457661} dir="backward" ref={Radroute13}>Walter-Dudek-Brücke</.v> schließt ein Hochbordradweg (2,5m) neben einem neuen Grünstreifen an. Um geradeaus in die <.v bounds="9.985283,53.45617,9.99434,53.458952" lon={9.988111} lat={53.457297} dir="backward" ref={Radroute13}>Moorstraße</.v> zu kommen, muss man zunächst nach Norden abbiegen. Über einen Zweirichtungsradweg (4,0m) wechselt man die Straßenseite und kommt dann auf einem Hochbordradweg (2,5m) wieder zurück nach Süden. Schließlich biegt man in die Moorstraße ab wo der Radweg an den Altbestand (1,0m) abschließt.</p>

    <h5>Radroute+ Lüneburg</h5>
    <p>Die Route ist eine Kombination aus Radroute 4 und 13.</p>

    <p>In Richtung Hamburg bleibt man im Wesentlichen auf dem gleichen Hochbordradweg (1,0m → 2,5m → 4,0m → 3,0m). Danach schließt eine Protected-Bike-Lane (3,3m) an.</p>

    <p>In Richtung Lüneburg kommt man vom Radfahrstreifen (3,8m), über ein Stück Hochbordradweg (3,0m) zum Zweirichtungsradweg (4,0m). Dieser ist durchgängig bis zum Busbahnhof durchgängig. Dort schließt ein Hochbordradweg (2,5m) an den Altbestand (1,0m) auf der Brücke an.</p>

    <h4>Meinung</h4>
    <p>Man merkt, dass sich die Stadt höhere Standards setzt. Der vorige Entwurf für den nördlichen Teil war katastrophal, der aktuelle ist gut. Der südliche Teil liegt irgendwo dazwischen. Da dieser bereits umgebaut wird, sind leider keine Änderungen zu erwarten. Im Detail:</p>

    <h5>Nördlicher Teil</h5>
    <p>Die Lösung für die Radroute+ Lüneburg ist gelungen. Auch sonst schafft es die Planung, Rad- und KFZ-Verkehr voneinander zu trennen und die Furten möglichst kurz zu halten. Anders als im vorigen Entwurf haben damit auch Kinder und Anfänger eine Chance die Kreuzung zu benutzen.</p>

    <p>Allerdings entfernt man auch direkte Querungsmöglichkeiten und zwingt den Radverkehr zu Zick-Zack-Fahrten. Die Präsentation beschreibt das als „intuitive Radverkehrsführung“ – naja. Immerhin ist genug Platz, um gut um die Kurve zu kommen. Sofern die Ampelschaltung halbwegs passt, spart man dann trotzdem erheblich Zeit.</p>

    <h5>Südlicher Teil</h5>
    <p>Der Radweg endet nicht mehr an der Zufahrt zum Bahnhof – sehr gut. Bis auf Ausnahmen sind auch die Breiten ansprechend. Schade ist, dass man auf Trennelemente zum KFZ-Verkehr verzichtet. Das man dem Radverkehr eine Engstelle aufbürdet, nur um eine KFZ-Ampel unterzubringen, zeigt noch die Prioritäten der Planung.</p>

    <p>Die Fahrt durch den Busbahnhof wird unangenehm: der Radfahrstreifen verläuft zwischen KFZ-Spuren links und Busspuren bzw. Bushalten rechts. Das fehlender Schulterblick eine häufige Unfallursache ist, war auch damals schon bekannt. Die Planung versagt hier, dem Radverkehr trotzdem sichere Wege anzubieten.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
