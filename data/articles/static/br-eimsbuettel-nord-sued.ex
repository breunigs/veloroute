defmodule Data.Article.Static.BrEimsbuettelNordSued do
  use Article.Static

  def id(), do: "br-eimsbuettel-nord-sued"
  def display_id(), do: "E1"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Eimsbüttel – E1 – Nord-Süd"

  def color(), do: "#969696"

  def summary(),
    do:
      "Die Bezirksroute „Nord-Süd“ in Eimsbüttel verläuft vom Glücksburger Platz bis nach Burgwedel."

  def tags(), do: [id(), display_id(), "br-eimsbuettel"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Isebek",
        direction: :forward,
        from: "Glücksburger Platz",
        to: "Burgwedel",
        parent_ref: __MODULE__,
        text: "Bezirksroute Eimsbüttel „Nord-Süd“ → Burgwedel",
        videos: [
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015184", "00:00:13.981", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015186", :start, "00:00:12.980"},
          {"2023-02-25-eimsbuettel-br2/GX015244", "00:00:23.857", :end},
          {"2023-02-25-eimsbuettel-br2/GX015245", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015189", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015190", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015191", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015193", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015194", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015195", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015196", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015197", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015198", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015199", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015200", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015201", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015202", :start, "00:00:19.349"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Isebek",
        direction: :backward,
        from: "Burgwedel",
        to: "Glücksburger Platz",
        parent_ref: __MODULE__,
        text: "Bezirksroute Eimsbüttel „Nord-Süd“ → Glücksburger Platz",
        videos: [
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015202", "00:00:36.029", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015203", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015204", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015205", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015208", :start, "00:00:11.745"},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015209", "00:00:01.134", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015210", :start, "00:00:03.403"},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015212", "00:00:02.970", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015213", "00:00:02.302", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015214", :start, "00:00:22.055"},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015218", "00:00:01.668", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015219", :start, "00:00:20.921"},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015219", "00:00:45.679", "00:01:22.316"},
          {"2023-02-25-eimsbuettel-br2/GX015257", "00:01:38.865", :end},
          {"2023-02-25-eimsbuettel-br2/GX015258", :start, :end},
          {"2023-02-25-eimsbuettel-br2/GX015259", :start, :end},
          {"2023-02-25-eimsbuettel-br2/GX015260", :start, :end},
          {"2023-02-25-eimsbuettel-br2/GX015261", :start, "00:00:18.014"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Vorstellung Bezirksrouten Eimsbüttel", "Februar 2023, Details in Anhang I",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1008163"},
      {"Infoseite Eimsbüttels zu den Bezirksrouten",
       "https://www.hamburg.de/eimsbuettel/bezirksrouten/"},
      {"Beteiligungsverfahren", "abgeschlossen, 2021",
       "https://bezirksrouten-eimsbuettel.beteiligung.hamburg/#/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Bezirksroute Eimsbüttel – Nord-Süd <.icon>E1</.icon></h3>

    <p>Die Bezirksroute „Nord-Süd“ in Eimsbüttel beginnt am <.v bounds="9.943479,53.567342,9.955551,53.572634" lon={9.949668} lat={53.569664} dir="forward" ref={@ref}>Glücksburger Platz</.v> und folgt grob der U2 bis <.v bounds="9.932576,53.589804,9.950399,53.602511" lon={9.943559} lat={53.593049} dir="forward" ref={@ref}>Hagenbecks Tierpark</.v>. Dort knickt sie leicht nach Westen ab und führt durch <.v bounds="9.876666,53.610462,9.962394,53.650796" lon={9.93425} lat={53.627539} dir="forward" ref={@ref}>Schnelsen</.v> bis nach <.v bounds="9.897464,53.638002,9.924717,53.653339" lon={9.90931} lat={53.648256} dir="forward" ref={@ref}>Burgwedel</.v>, wo die Route an der Landesgrenze zu <.v bounds="9.897028,53.649074,9.915632,53.66811" lon={9.907129} lat={53.652477} dir="forward" ref={@ref}>Bönningstedt</.v> endet.</p>

    <h4>Speziell für diese Route</h4>
    <p>Die vorgeschlagenen Führungsformen für die Route sind vielfältig, da sich die Gegebenheiten entlang der Strecke stark unterscheiden. Das Planungsbüro hebt daher hervor, dass die Übergänge klar gestaltet werden müssen, damit die Routenführung erkennbar bleibt.</p>

    <p>Die bevorzugten Vorschläge des Planungsbüro in Fahrtrichtung Norden lauten:</p>

    <ul>
      <li><.v bounds="9.946644,53.568542,9.954033,53.574193" lon={9.949549} lat={53.570213} dir="forward" ref={@ref}>Sandweg</.v>: Fahrradstraße; mit Anschluss an <.a name="br-eimsbuettel-sued">Bezirksroute Süd</.a></li>
      <li><.v bounds="9.94583,53.569863,9.955667,53.576234" lon={9.950177} lat={53.572865} dir="forward" ref={@ref}>Fruchtallee</.v>: Queren vereinfachen, etwa mit Zweirichtungsradweg auf der Nordseite und dafür angepassten Ampeln</li>
      <li><.v bounds="9.945762,53.571711,9.955598,53.578081" lon={9.95052} lat={53.574509} dir="forward" ref={@ref}>Heußweg</.v>: keine Änderung</li>
      <li><.v bounds="9.945609,53.576268,9.954709,53.581293" lon={9.949777} lat={53.579034} dir="forward" ref={@ref}>Stellinger Weg</.v>: Fahrradstraße</li>
      <li><.v bounds="9.945008,53.579196,9.949777,53.584459" lon={9.947738} lat={53.581844} dir="forward" ref={@ref}>Methfesselstraße</.v>: <.ref>Radfahrstreifen</.ref>, bereits <.a name="2020-11-13-methfesselstrasse">im Umbau</.a></li>
      <li><.v bounds="9.94317,53.582622,9.950141,53.588424" lon={9.947915} lat={53.585054} dir="forward" ref={@ref}>Lenzweg</.v>: <.ref>Kopenhagener Radwege</.ref>, ggf. mit Zweirichtungsradweg ab Brehmweg, um häufiges Queren zu vermeiden</li>
      <li><.v bounds="9.938881,53.584973,9.949263,53.593831" lon={9.944925} lat={53.589797} dir="forward" ref={@ref}>Kleingartenvereine/Sportpark</.v>: Ausbau zu getrennten Rad- und Fußwegen; Zufahrt vom Lenzweg soll klarer werden</li>
      <li><.v bounds="9.940674,53.591762,9.947258,53.595267" lon={9.943511} lat={53.593483} dir="forward" ref={@ref}>Koppelstraße</.v>: einfachere Querung durch geradere Furten und eigene Ampelphasen</li>
      <li><.v bounds="9.940552,53.592811,9.946495,53.599415" lon={9.94225} lat={53.596351} dir="forward" ref={@ref}>Lokstedter Grenzstraße</.v>: Fahrradstraße mit baulicher Mittelinsel</li>
      <li><.v bounds="9.936012,53.598804,9.944081,53.60759" lon={9.940668} lat={53.602803} dir="forward" ref={@ref}>Deelwisch</.v>: Fahrradstraße; <.v bounds="9.93789,53.604258,9.943205,53.607465" lon={9.939091} lat={53.606236} dir="forward" ref="br-eimsbuettel-nord-sued">Sackgassenstück</.v> bleibt so, ggf. nicht mehr als Spielstraße</li>
      <li><.v bounds="9.93662,53.605956,9.941999,53.609799" lon={9.938563} lat={53.608085} dir="forward" ref={@ref}>Kleingartenverein</.v>: getrennte Rad- und Fußwege; Neubau der <.v bounds="9.93662,53.605956,9.941999,53.609799" lon={9.938746} lat={53.607008} dir="forward" ref={@ref}> Brücke</.v>; geradliniger Anschluss, wo heute das <.v bounds="9.93662,53.605956,9.941999,53.609799" lon={9.938685} lat={53.607237} dir="forward" ref={@ref}>Tor</.v> ist</li>
      <li><.v bounds="9.936927,53.608162,9.944447,53.614613" lon={9.938665} lat={53.610267} dir="forward" ref={@ref}>Bondenwald (Waldweg)</.v>: getrennte Rad- und Fußwege, bevorzugt asphaltiert</li>
      <li><.v bounds="9.936979,53.612893,9.945456,53.624149" lon={9.940766} lat={53.617667} dir="forward" ref={@ref} highlight="Bondenwald">Bondenwald (Straße)</.v>: Fahrradstraße</li>
      <li><.v bounds="9.933822,53.622805,9.940734,53.625872" lon={9.938443} lat={53.624003} dir="forward" ref={@ref}>Weg beim Freizeitbad Bondenwald</.v>: Verbreiterung</li>
      <li><.v bounds="9.926713,53.622698,9.943204,53.63091" lon={9.937126} lat={53.626364} dir="forward" ref={@ref}>Friedrich-Ebert-Straße</.v>/<.v bounds="9.926713,53.622698,9.943204,53.63091" lon={9.93294} lat={53.628117} dir="forward" ref={@ref}>Frohmestraße</.v> (bis <.v bounds="9.926713,53.622698,9.943204,53.63091" lon={9.931344} lat={53.629311} dir="forward" ref={@ref}>Wendlohstraße</.v>): Zweirichtungsradweg auf der Westseite</li>
      <li><.v bounds="9.919152,53.627357,9.932888,53.633873" lon={9.927341} lat={53.630134} dir="forward" ref={@ref}>Frohmestraße</.v> (bis A7 Deckel): Radfahrstreifen wo heute Bäume bzw. KFZ-Parkplätze sind; stattdessen neue Bäume auf grünem Mittelstreifen</li>
      <li><.v bounds="9.921533,53.630382,9.925091,53.632337" lon={9.923207} lat={53.631747} dir="forward" ref={@ref}>A7 Deckel</.v>: keine Änderung</li>
      <li><.v bounds="9.91391,53.629062,9.924528,53.639104" lon={9.919885} lat={53.633828} dir="forward" ref={@ref}>Frohmestraße</.v> (bis <.v bounds="9.91391,53.629062,9.924528,53.639104" lon={9.918123} lat={53.636097} dir="forward" ref={@ref}>Oldesloer Straße</.v>): Kopenhagener Radwege</li>
      <li><.v bounds="9.914422,53.634614,9.921084,53.643865" lon={9.917216} lat={53.637265} dir="forward" ref={@ref}>Burgwedel</.v> (bis <.v bounds="9.914422,53.634614,9.921084,53.643865" lon={9.916214} lat={53.640534} dir="forward" ref={@ref}>Uphoffweg</.v>): <.ref>Schutzstreifen</.ref>; langfristig Fahrradstraße mit KFZ-Einbahnstraße, falls Buslinie 5 verlegt werden kann</li>
      <li><.v bounds="9.914422,53.634614,9.921084,53.643865" lon={9.916415} lat={53.641328} dir="forward" ref={@ref}>Burgwedel</.v> (nördlicher Teil): Radfahrstreifen</li>
      <li><.v bounds="9.909992,53.641148,9.919067,53.646908" lon={9.91658} lat={53.642144} dir="forward" ref={@ref}>Schleswiger Damm</.v> (Kreuzungen bis <.v bounds="9.909992,53.641148,9.919067,53.646908" lon={9.91598} lat={53.64266} dir="forward" ref={@ref}>Burgwedelkamp</.v>): bessere Querung/Abbiegemöglichkeiten; etwa durch Kreisverkehre oder einen Zweirichtungsradweg auf der Westseite</li>
      <li><.v bounds="9.909992,53.641148,9.919067,53.646908" lon={9.913579} lat={53.64447} dir="forward" ref={@ref}>Schleswiger Damm</.v> (bis <.v bounds="9.909992,53.641148,9.919067,53.646908" lon={9.91157} lat={53.646095} dir="forward" ref={@ref}>Marek-James-Straße</.v>): Verbreiterung <.ref>Hochbordradwege</.ref>, zu Lasten von Gehweg und Fahrbahn</li>
      <li><.v bounds="9.906723,53.645728,9.912858,53.650427" lon={9.909651} lat={53.648039} dir="forward" ref={@ref}>Schleswiger Damm</.v> (nördlicher Teil): Fahrradstraße, ggf. mit KFZ Durchfahrtssperren (Modalfilter)</li>
      <li><.v bounds="9.904577,53.648311,9.90976,53.653621" lon={9.907024} lat={53.650721} dir="forward" ref={@ref}>Holsteiner Chaussee</.v>: wird in Vorplanung nicht erwähnt</li>
    </ul>

    <%= Data.Article.Shared.bezirksroute(:eimsbuettel) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
