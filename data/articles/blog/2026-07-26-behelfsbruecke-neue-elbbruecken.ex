defmodule Data.Article.Blog.BehelfsbrueckeNeueElbbruecken do
  use Article.Default

  def title(),
    do:
      "Behelfsbrücke an den Neuen Elbbrücken (Radrouten 2, 3 und 12, Bezirksroute M4, Freizeitrouten 6 und 2. Grüner Ring)"

  def summary(),
    do:
      "Neue westliche Behelfsbrücke während der Brückensanierungen. Rad- und Fuß teilen sich dort 1,5m Breite bei umständlicher Führung."

  def type(), do: :planned

  def tags(), do: ["radroute-2", "radroute-3", "radroute-12", "br-mitte-m4", "FR6", "FR11"]

  def start(), do: ~d[2026-12]

  # def map_image do
  #   {name(),
  #    [
  #      {"Hamburg Port Authority AöR",
  #       "https://www.hamburg-port-authority.de/de/info-port/contact-center"},
  #      {"ReGe Hamburg", "https://www.rege.hamburg/kontakt/"},
  #      {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"},
  #      {"ARGUS Stadt und Verkehr • Partnerschaft mbB", "https://www.argus-hh.de/kontakt-argus/"}
  #    ]}
  # end

  def links(_assigns) do
    [
      {"1. Entwurf: Lagepläne und Erläuterung", ~d[2026-07],
       "https://sitzungsdienst-hamburg-mitte.hamburg.de/bi/vo020.asp?VOLFDNR=1020392"}
    ]
  end

  def point_of_interest(), do: %{lon: 10.026607, lat: 53.532953, zoom: 15}

  def text(assigns) do
    ~H"""
    <h4>Aktueller Zustand</h4>
    <p>Auf den <.v bounds="10.017946,53.528558,10.030246,53.536877" lon={10.026287} lat={53.532718} dir="forward" ref={Radroute12} highlight="Neue Elbbrücke">Neuen Elbbrücken</.v> sind beidseitig gemeinsame Rad- und Gehwege von etwa 2,0m Breite vorhanden. Sie führen geradlinig über die einmündende <.v bounds="10.027751,53.534114,10.027751,53.534114" lon={10.027751} lat={53.534114} dir="forward" ref={Radroute12}>Zweibrückenstraße</.v> („HafenCity“). <.v bounds="10.021319,53.529233,10.026134,53.531337" lon={10.024181} lat={53.530274} dir="forward" ref={Freizeitroute6}>Auf der Veddel</.v> erfolgt der Anschluss nicht direkt, sondern über leichte Umwege.</p>

    <p>Die ortsnahe <.v bounds="10.016936,53.530416,10.027055,53.536585" lon={10.022518} lat={53.533663} dir="forward" ref={Radroute3}>Freihafenelbbrücke</.v> ist vollgesperrt, seit sie 2025 von einem Schiff gerammt wurde. Sie soll zwar saniert werden, muss danach aber als Behelfsbrücke für den Bahnverkehr dienen. Eine vollständige Öffnung ist nicht vor 2038 zu erwarten. Ob Rad und Fuß die Brücke vorher nutzen können wurde nicht gesagt.</p>

    <h4>Planung</h4>
    <p>Auf der Westseite der vorhandenen Neuen Elbbrücken soll eine Behelfsbrücke entstehen. Sie soll den Verkehr aufnehmen, während die anderen Brücken saniert werden. Für Rad- und Fuß bleiben alle Verkehrsbeziehungen wie heute erhalten.</p>

    <p>Die neue Breite des gemeinsamen Fuß- und Radwegs auf der Westseite (in Fahrtrichtung Veddel/Wilhlemsburg) beträgt 1,5m. Die Querung der <.v bounds="10.027751,53.534114,10.027751,53.534114" lon={10.027751} lat={53.534114} dir="forward" ref={Radroute12}>Zweibrückenstraße</.v> erfolgt voraussichtlich <.v bounds="10.02631,53.533965,10.02631,53.533965" lon={10.02631} lat={53.533965} dir="forward" ref={Radroute3}>dort wo heute schon die Ampel</.v> für die Unterführung steht.</p>

    <h4>Meinung</h4>
    <p>Die Neuen Elbbrücken sind eine von zwei verbleibenden Elbquerungen für den Radverkehr. Die Planung macht diese in Richtung Süden zunichte.</p>

    <p>An Fußgängern vorbeifahren war bei 2,0m und Wind schon schwierig, ist bei 1,5m Breite aber praktisch ausgeschlossen. Zum Vergleich: es ist die gleiche Breite wie bei der <.m bounds="9.928637,53.560834,9.94279,53.565951" highlight="Stresemannstraße">Bahnbrücke Stresemannstraße</.m>, aber rund 6 mal so lang.</p>

    <p>Zusätzlich bürdet man an der Zweibrückenstraße noch Umwege und eine Ampel auf, was einem auch die Möglichkeit nimmt langsamere Radler und Fußgänger brauchbar zu überholen.</p>

    <p>Es war ja absehbar, dass Rad- und Fuß während der Sanierung der Elbbrücken leiden müssen. Dass man die Verbindung effektiv kappt überrascht mich dann doch.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
