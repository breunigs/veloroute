defmodule Data.Article.Blog.BillwerderBilldeich do
  use Article.Default

  def title(),
    do: "Billwerder Billdeich (Zugang Oberbillwerder; Freizeitroute 4)"

  def summary(),
    do:
      "Billwerder Billdeich soll bis zum Neubaugebiet Oberbillwerder je 1,85m breite Kopenhagener Radwege erhalten. Einseitiger Gehweg mit 2,15m."

  def type(), do: :planned

  def tags(), do: ["FR4"]

  def links(_assigns) do
    [
      {"Lagepläne", "Januar 2024",
       "https://sitzungsdienst-bergedorf.hamburg.de/bi/vo020.asp?VOLFDNR=1007805"},
      {"Abwägung Varianten", "April 2021",
       "https://www.oberbillwerder-hamburg.de/wp-content/uploads/Oberbillwerder-Anbindung-Nordost-2021.pdf"},
      {"Verkehrsuntersuchung Oberbillwerder", "Mai 2017",
       "https://www.oberbillwerder-hamburg.de/wp-content/uploads/4.3_Verkehrsuntersuchung.pdf"},
      {"Infoseite zum Stadtteil Oberbillwerder", "https://www.oberbillwerder-hamburg.de"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Nahe der Kreuzung mit dem <.m bounds="10.178891,53.495736,10.180625,53.496624">Ladenbeker Furtweg</.m> sind beidseitig <.ref>Hochbordradwege</.ref> mit 1,62m Breite vorhanden. Ab dem <.m bounds="10.17719,53.495566,10.179319,53.496422">Karlshof</.m> dann nur noch auf der Nordseite und ab <.m bounds="10.173997,53.495469,10.178606,53.497003">Auf der Bojenwiese</.m> fährt man mit dem Rad im <.ref>Mischverkehr</.ref>.</p>

    <p>Zur Querung des <.m bounds="10.178981,53.495181,10.181253,53.497075">Ladenbeker Furtweg</.m> steht nur auf der Südseite eine <.ref>Bedarfsampel</.ref> zur Verfügung, die mit dem Fahrrad in beide Richtungen benutzt werden darf. </p>

    <h4>Planung</h4>
    <p>Im Zuge des <.a href="https://www.oberbillwerder-hamburg.de/">neuen Stadtteils Oberbillwerder</.a> soll der <.m bounds="10.173549,53.495181,10.180836,53.497342">Billwerder Billdeich</.m> als Erschließungsstraße ausgebaut werden.</p>

    <p><.m bounds="10.174484,53.495546,10.179912,53.49658" highlight="Billwerder Billdeich">Entlang der Strecke</.m> sind beidseitig 1,85m breite <.ref>Kopenhagener Radwege</.ref> geplant. Hinzu kommen zwei KFZ-Spuren mit je 3,25m und ein einseitiger Gehweg im Süden mit rund 2,15m Breite. An einmündenden Straßen wird die Radweg jeweils auf Fahrbahnniveau abgesenkt um Linksabbiegen zu ermöglichen. Ausnahme: Linksabbiegen in den Karlshof vom Radweg wurde nicht vorgesehen.</p>

    <p>Die <.m bounds="10.173187,53.494855,10.177752,53.497388">Verkehrsführung zum neuen Stadtteil</.m> wird als abknickende Vorfahrt gestaltet. Die Mittelinsel in der Kurvenmitte bietet KFZ-, Rad- und Fußverkehr eine Aufstellfläche, um in zwei Zügen abzubiegen bzw. zu queren. Auf der nördlichen Seite ist eine Anbindung an die <.v bounds="10.173187,53.494855,10.177752,53.497388" lon={10.17526} lat={53.496162} dir="backward" ref="FR4">Freizeitroute 4</.v> vorgesehen. Auf der Innenseite der Kurve im Süden verläuft der Radweg leicht von der Fahrbahn abgesetzt.</p>

    <p>In <.m bounds="10.170376,53.493575,10.176305,53.496884">Richtung Neubaugebiet</.m>, auf der angedeuteten neuen Straße, sollen die Radwege mit 2,5m breiter werden. Auch der Gehweg wird mit 2,75m breiter.</p>

    <p>Die Kreuzung mit dem <.m bounds="10.179025,53.495131,10.18171,53.497091">Ladenbeker Furtweg</.m> wird zu einem Kreisel umgebaut. Der rundumlaufende Hochbordradweg soll 1,60m breit werden und von der Kreisfahrbahn abgesetzt verlaufen. Seine Form gleicht daher eher einem Achteck als einem Kreis. Alle Seitenarme erhalten Zebrastreifen.</p>

    <h4>Meinung</h4>
    <p>Die Radwege und der Gehweg sind zu eng – oft nur Mindestmaße und im Kreisverkehr sogar noch weniger. Man begründet dies mit Baum- und Biotoperhalt. Das wirkt wenig glaubhaft, da man dem Autoverkehr eine Fahrbahn in perfekter Breite bereitstellt.</p>

    <p>Das gleiche Planungsbüro stellte bei einer <.a href="https://www.oberbillwerder-hamburg.de/wp-content/uploads/4.3_Verkehrsuntersuchung.pdf">Verkehrsuntersuchung von 2017</.a> noch fest, dass die umliegenden Straßen einen hohen Anteil an KFZ-Verkehr gar nicht aufnehmen können. Entsprechend müssten ÖPNV, Fuß- und Radverkehr möglichst attraktiv sein. Ein schmaler Radweg ohne Überholmöglichkeiten, der nah an einer Schnellstrecke für Autos verläuft ist das aber sicher nicht.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
