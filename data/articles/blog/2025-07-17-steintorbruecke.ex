defmodule Data.Article.Blog.Steintorbruecke do
  use Article.Default

  def title(), do: "Steintorbrücke – Hauptbahnhof (Radrouten 1, 2, 7 und 1. Grüner Ring)"

  def summary(),
    do:
      "Neue Haltestelle auf Seite des Bahnhofgebäudes. Gestaltung ähnlich wie die Südseite mit 2,5m breitem Radweg. Kreuzungen werden vereinfacht und bieten mehr Platz für Fußverkehr."

  def type(), do: :planned
  def tags(), do: ["radroute-1", "radroute-2", "radroute-7", "1GR"]

  def start(), do: ~d[2025Q3]
  def stop(), do: ~d[2025Q3]

  def links(_assigns) do
    [
      {"fertiger Entwurf – Bericht und Karten", ~d[2024-11],
       "https://fragdenstaat.de/anfrage/steintorbruecke-1/#nachricht-1017200"}
    ]
  end

  def point_of_interest(), do: %{lon: 10.0073647, lat: 53.5520514, zoom: 17}

  def map_image do
    {name(),
     [
       {"ReGe Hamburg", "https://www.rege.hamburg/kontakt/"},
       {"ARGUS Stadt und Verkehr • Partnerschaft mbB", "https://www.argus-hh.de/kontakt-argus/"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Am <.v bounds="10.00498,53.551304,10.009721,53.553296" lon={10.007915} lat={53.552148} dir="backward" ref="radroute-7">Bahnhofsgebäude</.v> wird der Radverkehr auf einem  1,63m breiten <.ref>Hochbordradweg</.ref> geführt. Sowohl der Radweg als auch der angrenzende Gehweg unterschreiten Mindestmaße und sind überlastet.</p>

    <p>Auf der <.v bounds="10.00494,53.551034,10.009658,53.552736" lon={10.006934} lat={53.551771} dir="forward" ref="radroute-7">Südseite der Brücke</.v> wurde vor einigen Jahren eine Bushaltestelle eingerichtet. Der Radweg verläuft dabei zwischen dem Gehweg und der Wartefläche für Fahrgäste. Er ist auf beiden Seiten mit verkleideten Geländern abgetrennt. An zwei Stellen befinden sich Durchlässe, damit vom Gehweg zur Bushaltestelle gewechselt werden kann.</p>

    <p>In Richtung <.v bounds="10.004041,53.549441,10.007591,53.552738" lon={10.006286} lat={53.551879} dir="backward" ref="radroute-7" highlight="Mönckebergstraße,Klosterwall">Mönckebergstraße bzw. Klosterwall</.v> quert man zunächst den KFZ-Rechtsabbieger, um eine Aufstelltasche („<.ref>ARAS</.ref>“) zu erreichen. Von dort kann geradeaus oder <.ref>direkt links abgebogen</.ref> werden.</p>

    <p>In der <.m bounds="10.007121,53.551518,10.010247,53.554821">Kirchenallee</.m> gibt es keine eigenen Radwege.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Am <.v bounds="10.00498,53.551304,10.009721,53.553296" lon={10.007915} lat={53.552148} dir="backward" ref="radroute-7">Bahnhofsgebäude</.v> soll eine Bushaltestelle ergänzt werden. Die Gestaltung wird dabei ähnlich wie auf der Südseite:</p>
    <ul>
      <li>4,75m Gehweg (alter Geh- und Radweg)</li>
      <li>2,50m Radweg (alte KFZ-Parkplätze)</li>
      <li>3,00m Wartebereich Fahrgäste (alte KFZ-Spur)</li>
      <li>3,25m Busspur, Taxi frei (wie heute)</li>
      <li>3,25m Busspur, Taxi frei (grob wie heute – der Linksabbiegestreifen verschiebt sich leicht)</li>
      <li>(Straßenmitte)</li>
    </ul>

    <p>Damit die Bushaltestelle zu Fuß ebenerdig erreicht werden kann, sind Rampen auf dem Radweg vorgesehen. Anders als auf der <.v bounds="10.00494,53.551034,10.009658,53.552736" lon={10.006934} lat={53.551771} dir="forward" ref="radroute-7">Südseite</.v> werden zwei einzelne Rampen gebaut, statt einer langen, durchgängigen Rampe. Diese wurde auf der Südseite häufig als Gehweg missverstanden, was man so verhindern möchte.</p>

    <p>Privater KFZ-Verkehr darf die Steintorbrücke künftig nur noch in Fahrtrichtung Osten nutzen.</p>

    <p>Die <.v bounds="10.004041,53.549441,10.007591,53.552738" lon={10.006286} lat={53.551879} dir="backward" ref="radroute-7" highlight="Mönckebergstraße,Steintorwall,Steintordamm">westliche Kreuzung</.v> wird umgestaltet. Der ehemalige KFZ-Rechtsabbieger wird zum Gehweg. Der Radweg verschwenkt noch leicht, bleibt aber sonst immer rechts der Busse und Taxen. Zum <.ref>indirekten Linksabbiegen</.ref> wird ein Aufstellbereich auf der <.v bounds="10.004427,53.550924,10.00749,53.552663" lon={10.005482} lat={53.551927} dir="forward" ref="radroute-2">anderen Straßenseite</.v> vorgesehen. Der <.v bounds="10.003929,53.550596,10.008349,53.553732" lon={10.005958} lat={53.552012} dir="backward" ref="radroute-2">Radweg in Richtung Alster</.v> bleibt so wie heute.</p>

    <p>In der <.m bounds="10.007121,53.551518,10.010247,53.554821">Kirchenallee</.m> sind nahe der Kreuzung <.ref>Radfahrstreifen</.ref> geplant. Auf Seite des Bahnhofs als gemeinsame Bus- und Fahrradspur. Auch hier wird der KFZ-Rechtsabbieger zum Gehweg.</p>

    <p>Weil die <.v bounds="10.007882,53.55151,10.010977,53.552923" lon={10.009752} lat={53.552346} dir="backward" ref="radroute-7" highlight="Steintordamm">KFZ-Geradeaus-Spur in Richtung Steintorbrücke</.v> nicht mehr benötigt wird, wird auch die Zufahrt aus Richtung Adenauerallee umgestaltet. Die ehemalige geteilte Rechtsabbiegerspur wird dem Radverkehr zugeschlagen. Die vorhandene kurze Mittelinsel wird verlängert, sodass der <.ref>Radfahrstreifen in Mittellage</.ref> entfällt. Die alte KFZ-Geradaus-Spur wird zum neuen KFZ-Rechtsabbieger.</p>

    <h4>Meinung</h4>
    <p>Am überlasteten Hauptbahnhof sind ÖPNV und Fußverkehr die mit Abstand wichtigsten Verkehrsteilnehmer. Gut, dass beide endlich mehr Platz bekommen.</p>

    <p>Die Radweg-Lösung auf der Südseite hat sich bewährt. Sie wird auch das Durchkommen auf der Bahnhofsseite erheblich verbessern. Wenn die doppelte Rampe zu weniger Verwechslung führt, ist der extra Huckel völlig in Ordnung.</p>

    <p>Auch die Kreuzungen werden angenehmer als vorher. Durch die Umgestaltung kreuzen sich die Wege von Rad und KFZ/Bus seltener. So muss man weniger für die unachtsamen Leute im Auto mitdenken. Dass der Radweg nun immer rechts der KFZ verläuft, ist auch für Ungeübte leichter verständlich.</p>

    <p>Es handelt sich um einen kleineren Umbau. Der große Wurf am Hauptbahnhof lässt also weiterhin auf sich warten.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
