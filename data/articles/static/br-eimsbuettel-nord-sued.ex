defmodule Data.Article.Static.BrEimsbuettelNordSued do
  use Article.Static

  def id(), do: "br-eimsbuettel-nord-sued"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Eimsbüttel – Nord-Süd"

  def color(), do: "#969696"

  def summary(),
    do:
      "Die Bezirksroute „Nord-Süd“ in Eimsbüttel verläuft vom Glücksburger Platz bis nach Burgwedel."

  def tags(), do: [id(), "br-eimsbuettel"]

  def tracks(),
    do: [
      # TODO: GPX check
      %Video.Track{
        renderer: 3,
        group: "Isebek",
        direction: :forward,
        from: "Glückburger Platz",
        to: "Burgwedel",
        parent_ref: __MODULE__,
        text: "vom Glückburger Platz nach Burgwedel",
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
      # TODO: GPX check
      %Video.Track{
        renderer: 3,
        group: "Isebek",
        direction: :backward,
        from: "Burgwedel",
        to: "Glückburger Platz",
        parent_ref: __MODULE__,
        text: "von Burgwedel zum Glückburger Platz",
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
       "https://www.hamburg.de/eimsbuettel/bezirksrouten/"}
    ]
  end

  # TODO: links
  def text(assigns) do
    ~H"""
    <p>Die Bezirksroute „Nord-Süd“ in Eimsbüttel beginnt am Glückburger Platz und folgt grob der U2 bis Hagenbecks Tierpark. Dort knickt sie leicht nach Westen ab und führt durch Schnelsen bis nach Burgwedel, wo die Route an der Landesgrenze zu Bönningstedt endet.</p>

    <h4>Speziell für diese Route</h4>
    <p>Die vorgeschlagenen Führungsformen für die Route sind vielfältig, da sich die Gegebenheiten entlang der Strecke stark unterscheiden. Das Planungsbüro hebt daher hervor, dass die Übergänge klar gestaltet werden müssen, damit die Routenführung erkennbar bleibt.</p>

    <p>Die bevorzugten Vorschläge des Planungsbüro in Fahrtrichtung Norden lauten:</p>

    <ul>
      <li>Sandweg: Fahrradstraße; mit Anschluss an <.a name="br-eimsbuettel-sued">Bezirksroute Süd</.a></li>
      <li>Fruchtallee: Queren vereinfachen, etwa mit Zweirichtungsradweg auf der Nordseite und dafür angepassten Ampeln</li>
      <li>Heußweg: keine Änderung</li>
      <li>Stellinger Weg: Fahrradstraße</li>
      <li>Methfesselstraße: <.ref>Radfahrstreifen</.ref>, bereits <.a name="2020-11-13-methfesselstrasse">im Umbau</.a></li>
      <li>Lenzweg: <.ref>Kopenhagener Radwege</.ref>, ggf. mit Zweirichtungsradweg ab Brehmweg, um häufiges Queren zu vermeiden</li>
      <li>Kleingartenvereine/Sportpark: Ausbau zu getrennten Rad- und Fußwegen</li>
      <li>Koppelstraße: einfachere Querung durch geradere Furten und eigene Ampelphasen</li>
      <li>Lokstedter Grenzstraße: Fahrradstraße mit baulicher Mittelinsel</li>
      <li>Deelwisch: Fahrradstraße; Sackgassenstück bleibt so, ggf. nicht mehr als Spielstraße</li>
      <li>Kleingartenverein: getrennte Rad- und Fußwege; Neubau der Brücke; geradliniger Anschluss, wo heute das Tor ist</li>
      <li>Bondenwald (Waldweg): getrennte Rad- und Fußwege, bevorzugt asphaltiert</li>
      <li>Bondenwald (Straße): Fahrradstraße</li>
      <li>Weg beim Freizeitbad Bondenwald: Verbreiterung</li>
      <li>Friedrich-Ebert-Straße/Frohmestraße (bis Wendlohstraße): Zweirichtungsradweg auf der Westseite</li>
      <li>Frohmestraße (bis A7 Deckel): Radfahrstreifen wo heute Bäume/KFZ-Parkplätze sind; stattdessen neue Bäume auf grünem Mittelstreifen</li>
      <li>A7 Deckel: keine Änderung</li>
      <li>Frohmestraße (bis Oldesloer Straße): Kopenhagener Radwege</li>
      <li>Burgwedel (bis Uphoffweg): <.ref>Schutzstreifen</.ref>; langfristig Fahrradstraße mit KFZ-Einbahnstraße, falls Buslinie 5 verlegt werden kann</li>
      <li>Burgwedel: Radfahrstreifen</li>
      <li>Schleswiger Damm (Kreuzungen bis Burgwedelkamp): bessere Querung/Abbiegemöglichkeiten; etwa durch Kreisverkehre oder einen Zweirichtungsradweg auf der Westseite</li>
      <li>Schleswiger Damm (bis Marek-James-Straße): Verbreiterung <.ref>Hochbordradwege</.ref>, zu Lasten von Gehweg und Fahrbahn</li>
      <li>Schlesweiger Damm: Fahrradstraße, ggf. mit KFZ Durchfahrtssperren (Modalfilter)</li>
      <li>Holsteiner Chaussee: wird in Vorplanung nicht erwähnt</li>
    </ul>

    <%= Data.Article.Shared.bezirksroute(:eimsbuettel) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
