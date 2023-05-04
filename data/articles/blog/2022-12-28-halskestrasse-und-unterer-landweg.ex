defmodule Data.Article.Blog.HalskestrasseUndUntererLandweg do
  use Article.Default

  def title(),
    do: "Halskestraße und Unterer Landweg (Veloroute 9 / RSW Geesthacht)"

  def summary(),
    do:
      "Mindestens 3,60m breiter Zweirichtungsradweg in der Halskestraße bis zur Eisenbahnbrücke Unterer Landweg. Verbreiterung Rampe/Unterführung am S-Bahnhof Billwerder-Moorfleet."

  def start(), do: ~d[2023-04-17]
  def stop(), do: ~d[2025-04-30]
  def construction_site_id_hh(), do: [367_780]

  def type(), do: :construction
  def tags(), do: ["9", "rsw-geesthacht", "M11.3"]

  def links(_assigns) do
    [
      {"Bauvergabe", "Dezember 2022",
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/api/external/deeplink/subproject/3f07b42a-bc28-4b03-bb8d-e736d73daf8b"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In der <.v bounds="10.06885,53.513272,10.095818,53.528238" lon={10.071223} lat={53.526862} dir="forward" ref="9">Halskestraße</.v> muss sich der Radverkehr meist die Fahrbahn mit KFZ und LKW teilen, also im <.ref>Mischverkehr</.ref> fahren. Auf der Straße <.v bounds="10.089626,53.512583,10.101026,53.519672" lon={10.094313} lat={53.515233} dir="forward" ref="9">Unterer Landweg</.v> stehen beidseitig <.ref>Hochbordradwege</.ref> zur Verfügung, die <.v bounds="10.089626,53.512583,10.101026,53.519672" lon={10.094849} lat={53.515762} dir="forward" ref="9">auf der Eisenbahnbrücke</.v> jedoch zu gemeinsamen Rad- und Fußwegen werden. Um den Höhenunterschied zum <.v bounds="10.093832,53.514716,10.099805,53.518147" lon={10.096613} lat={53.51635} dir="forward" ref="9" highlight="Alter Landweg">Alten Landweg</.v> zu überwinden, steht nur eine <.v bounds="10.093832,53.514716,10.099805,53.518147" lon={10.095823} lat={53.516749} dir="forward" ref="9">sehr schmale Rampe</.v> zur Verfügung, die bereits mit einem normalen Fahrrad Probleme bereitet. Über den <.v bounds="10.093832,53.514716,10.099805,53.518147" lon={10.096284} lat={53.516389} dir="forward" ref="9">Zugang zum S-Bahnhof</.v> erreicht man die Straße.</p>

    <h4>Planung</h4>
    <p>Im Wesentlichen wird ein Zweirichtungsradweg geplant, der nördlich Halskestraße bzw. westlich Unterer Landweg verläuft. Er wird meist 4,0m breit; es gibt einige Engstellen verschiedener Breiten, mindestens jedoch 3,60m. Im Unteren Landweg sind nur 3,75m für den Zweirichtungsradweg vorgesehen, dafür bleibt der <.v bounds="10.091459,53.513337,10.098215,53.517271" lon={10.094297} lat={53.515386} dir="forward" ref="9">Radweg auf der Ostseite</.v> erhalten. Die <.v bounds="10.09379,53.515051,10.097417,53.517354" lon={10.095381} lat={53.516115} dir="forward" ref="9">Eisenbahnbrücke</.v> soll nicht umgebaut werden.</p>

    <p>Am S-Bahnhof wird <.v bounds="10.094719,53.515894,10.097851,53.517565" lon={10.096044} lat={53.516907} dir="forward" ref="9">die Rampe</.v> auf 2,50m verbreitert und mehr Fläche im Kurvenbereich bereitgestellt. Bis unter der Brücke ist alles ein gemeinsamer Rad- und Fußweg. Durch eine neue Stützwand steht <.v bounds="10.093832,53.514716,10.099805,53.518147" lon={10.095479} lat={53.516491} dir="forward" ref="9">im Gleisbereich</.v> mehr Platz zur Verfügung, sodass hier ein rund 3,0m breiter Radweg anschließt, der ohne Unterbrechung bis zum <.v bounds="10.093832,53.514716,10.099805,53.518147" lon={10.096613} lat={53.51635} dir="forward" ref="9" highlight="Alter Landweg">Alten Landweg</.v> führt.</p>

    <p>Details:</p>
    <ul>
      <li>Der Zweirichtungsradweg wird vom <.v bounds="10.067372,53.523101,10.083471,53.530962" lon={10.073243} lat={53.526267} dir="forward" ref="9">Tidekanal</.v> bis zum <.v bounds="10.086424,53.512398,10.098029,53.520052" lon={10.090901} lat={53.515377} dir="forward" ref="9">LKW-Umschlagplatz</.v> asphaliert. Ansonsten sind rote Betonpflastersteine vorgesehen.</li>
      <li>Die Einmündung <.v bounds="10.067177,53.525678,10.073116,53.528487" lon={10.070681} lat={53.526929} dir="forward" ref="9">Grusonstraße</.v> wird angepasst, damit der Zweirichtungsradweg gut erreicht werden kann. Im näheren Umfeld werden die Hochbordradwege auf 1,75m verbreitert. Aus der Innenstadt kommend wird der Hochbordradweg zu einem <.ref>Radfahrstreifen</.ref>.</li>
      <li>In der Halskestraße ist auf der Südseite nur ein Gehweg, auf der Nordseite nur der Zweirichtungsradweg geplant.</li>
      <li>Die Brücke über den <.v bounds="10.067372,53.523101,10.083471,53.530962" lon={10.073243} lat={53.526267} dir="forward" ref="9">Tidekanal</.v> ist nicht Teil dieser Planung. Sie soll aber die gleiche Straßenaufteilung bekommen und zeitgleich umgebaut werden.</li>
      <li>Wo die <.v bounds="10.082434,53.517836,10.088817,53.521346" lon={10.085523} lat={53.519721} dir="forward" ref="9">Schienen die Halskestraße</.v> kreuzen wird der Radweg verschwenkt damit die Schienen in einem besseren Winkel gequert werden können.</li>
      <li>Die Einfahrt zum <.v bounds="10.086424,53.512398,10.098029,53.520052" lon={10.090901} lat={53.515377} dir="forward" ref="9">LKW-Umschlagplatz</.v> wird für den Radverkehr ebenerdig. Für die wartepflichtigen LKW wird eine Rampe gebaut. Zur besseren Haltbarkeit des Radwegs wird dieser Abschnitt betoniert statt asphaltiert.</li>
      <li>Um die <.v bounds="10.088038,53.513102,10.096641,53.517782" lon={10.090926} lat={53.51482} dir="forward" ref="9">Abzweigung der Halskestraße nach Süden</.v> zu erreichen, wird der Bordstein über ein längeres Stück abgesenkt. Zusätzlich wird eine Querungshilfe in der Straßenmitte gebaut, sodass man nur eine Fahrtrichtung zur gleichen Zeit beachten muss.</li>
      <li>Die <.v bounds="10.089545,53.51246,10.094934,53.515544" lon={10.091945} lat={53.514129} dir="forward" ref="9">Kreuzung Unterer Landweg</.v> wird angepasst, damit die Fahrt vom bzw. zum Zweirichtungsradweg klar ist.</li>
      <li>Der Zweirichtungsradweg endet etwa auf <.v bounds="10.092412,53.514299,10.097476,53.517261" lon={10.094787} lat={53.515921} dir="backward" ref="9">Höhe der Treppe vor der Eisenbahnbrücke</.v>. Dort bleibt es beim gemeinsamen Rad- und Fußweg.</li>
      <li>Der <.v bounds="10.092412,53.514299,10.097476,53.517261" lon={10.095747} lat={53.516414} dir="forward" ref="9">Zebrasteifen über den Unteren Landweg</.v> wird durch eine Ampel ersetzt.</li>
      <li>Im <.m bounds="10.09513,53.515986,10.10001,53.519237">weiteren Verlauf Unterer Landweg</.m> wird der Radverkehr durch den Wartebereich der Busse geführt und danach in den <.ref>Mischverkehr</.ref> geschickt.</li>
      <li>An der <.v bounds="10.094719,53.515894,10.097851,53.517565" lon={10.096044} lat={53.516907} dir="forward" ref="9">Rampe zum Bahnhof</.v> wird ein geradliniger Anschluss in Richtung <.m bounds="10.092665,53.515657,10.10028,53.520111">Bredowstraße</.m> gebaut. Die heute notwendige Schikane entfällt damit.</li>
      <li>Die <.v bounds="10.094252,53.515576,10.098262,53.517643" lon={10.096232} lat={53.516387} dir="backward" ref="9">Treppe zum Bahnhof</.v> wird umgebaut, sodass sie nicht direkt auf dem Radweg endet. Der Radweg muss gequert werden, um zur S-Bahn bzw. den Bussen zu kommen.</li>
      <li>StadtRAD Station, Fahrradboxen und Anlehnbügel werden ebenfalls umgesetzt, sodass sie nicht im Weg stehen.</li>
      <li>Die neuen Verbindungen die für den Radschnellweg Geesthacht vorgesehen sind (<.v bounds="10.086432,53.514257,10.098718,53.520259" lon={10.095479} lat={53.516498} dir="backward" ref="9">am Bahnhof</.v> und <.m bounds="10.067853,53.525588,10.073911,53.528497">an der Grusonstraße</.m>), werden in diesem Umbau noch nicht berücksichtigt.</li>
    </ul>

    <h4>Meinung</h4>
    <p>Es ist schön, dass die Stadt hier den Radschnellweg-Standard zu einem großen Teil umsetzten wird. Warum man im Unteren Landweg und vorm Tidekanal auf minderwertige Pflastersteine statt Asphalt setzt erschließt sich jedoch nicht.</p>

    <p>Schade ist, dass man es am S-Bahnhof nicht geschafft hat den Rad- und Fußverkehr voneinander zu trennen, indem man den Radweg z.B. unter bzw. hinter der Treppe führt. Da der Erläuterungsbericht nicht veröffentlicht wurde, ist unklar warum das nicht möglich war. So verbleibt eine Konfliktstelle.</p>

    <p>Trotz Verbreiterung bleibt die Rampe ein problematisches Nadelöhr. Sofern die <.m bounds="10.086696,53.514921,10.097575,53.519819">angedachte Fuß- und Radbrücke über die Gleise</.m> tatsächlich kommt, ist die Übergangszeit aber sicher zu verschmerzen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
