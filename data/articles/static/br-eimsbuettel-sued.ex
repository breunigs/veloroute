defmodule Data.Article.Static.BrEimsbuettelSued do
  use Article.Static

  def id(), do: "br-eimsbuettel-sued"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Eimsbüttel – Süd"

  def color(), do: "#969696"

  def summary(),
    do:
      "Die Bezirksroute „Süd“ in Eimsbüttel verläuft von der Tiergartenstraße nach Westen über das Schulterblatt, knickt dann leicht nördlich Richtung Langenfelder Damm ab."

  def tags(), do: [id(), "br-eimsbuettel"]

  def tracks(),
    do: [
      # TODO : gpx check
      %Video.Track{
        renderer: 3,
        group: "sued",
        direction: :backward,
        from: "Langenfelder Damm",
        to: "Tiergartenstraße",
        parent_ref: __MODULE__,
        text: "vom Langenfelder Damm zur Tiergartenstraße",
        videos: [
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015169", "00:01:12.606", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015170", :start, "00:01:02.596"},
          {"2023-02-25-eimsbuettel-br2/GX015230", "00:00:39.006", :end},
          {"2023-02-25-eimsbuettel-br2/GX015231", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015164", :start, "00:00:10.675"}
        ]
      },

      ## GPX OK
      %Video.Track{
        renderer: 3,
        group: "sued",
        direction: :forward,
        from: "Tiergartenstraße",
        to: "Langenfelder Damm",
        parent_ref: __MODULE__,
        text: "von der Tiergartenstraße zum Langenfelder Damm",
        videos: [
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015165", :start, :end},
          {"2021-08-01-freizeit9-anfang/GX012482", :start, :end},
          {"2021-08-01-freizeit9-anfang/GX012483", :start, "00:00:02.569"},
          {"2022-05-14-velo6-u-bundesstr/GX013895", "00:00:01.101", "00:00:10.677"},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015166", "00:00:42.776", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015167", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015169", :start, "00:00:51.451"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Vorstellung Bezirksrouten Eimsbüttel", "Februar 2023, Details in Anhang VI",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1008163"},
      {"Infoseite Eimsbüttels zu den Bezirksrouten",
       "https://www.hamburg.de/eimsbuettel/bezirksrouten/"},
      {"Beteiligungsverfahren", "abgeschlossen, 2021",
       "https://bezirksrouten-eimsbuettel.beteiligung.hamburg/#/"}
    ]
  end

  # TODO links
  def text(assigns) do
    ~H"""
    <p>Die Bezirksroute „Süd“ in Eimsbüttel verbindet <.v bounds="9.973229,53.56279,9.981719,53.567371" lon={9.97769} lat={53.56373} dir="forward" ref="br-eimsbuettel-sued">Tiergartenstraße</.v> und <.v bounds="9.95012,53.561201,9.966466,53.56867" lon={9.959837} lat={53.564074} dir="forward" ref="br-eimsbuettel-sued">Schulterblatt</.v> in Ost-West Richtung. Dort knickt sie nach Norden ab und verläuft grob parallel zur <.v bounds="9.939885,53.564294,9.95721,53.573998" lon={9.949839} lat={53.569237} dir="forward" ref="br-eimsbuettel-sued">Kieler Straße</.v>. Am <.v bounds="9.933825,53.575375,9.944016,53.583987" lon={9.938682} lat={53.580075} dir="forward" ref="br-eimsbuettel-sued">Langenfelder Damm</.v> mündet sie in die Veloroute <.icon>2</.icon> bzw. den Radschnellweg <.icon>RSW</.icon> nach <.a name="rsw-elmshorn">Elmshorn</.a>.</p>

    <h4>Speziell für diese Route</h4>
    <p>Für die meisten Abschnitte ist vorgesehen, sie als Fahrradstraßen herzurichten. Das bedeutet meist Vorfahrt und geradlinige Führung. Auch <.ref name="dooring">gefahrenvolles KFZ-Parken</.ref> soll reduziert werden. Ergänzend dazu werden Geschwindigkeitsdämpfer (z.B. Schwellen) oder KFZ-Reduktion (z.B. Diagonaltrenner) vorgeschlagen. Es gibt einige besondere Abschnitte:</p>

    <ul>
      <li><.v bounds="9.964152,53.564326,9.968062,53.566993" lon={9.966432} lat={53.565565} dir="forward" ref="br-eimsbuettel-sued">Kreuzung Weidenallee/Kleiner Schäferkamp/Dänenweg</.v>: Die Fahrtbeziehung entlang der Route soll verbessert werden.</li>
      <li><.v bounds="9.958487,53.563046,9.966751,53.566215" lon={9.964107} lat={53.564868} dir="forward" ref="br-eimsbuettel-sued">Altonaer Straße</.v>: Es gibt zwei Vorschläge. Der Erste sieht vor die Radwege auf Kosten der Baumreihen zu verbreitern. Der Zweite ist eine komplette Neugestaltung, wo die jeweiligen Fahrtrichtungen durch eine großzügige Mittelinsel mit Parken, Bäumen und Fußweg getrennt sind. Der Radverkehr führe auf <.ref>Protected-Bike-Lanes</.ref>. Das Planungsbüro spricht sich für die zweite Variante aus, sofern sich diese umsetzen lässt.</li>
      <li><.v bounds="9.958478,53.562782,9.962263,53.565125" lon={9.960097} lat={53.56394} dir="forward" ref="br-eimsbuettel-sued">Kreuzungen Altonaer Straße/Schulterblatt/Eimsbütteler Straße</.v>: Die Fahrtbeziehung soll verbessert werden. Man schlägt zwei Kreisverkehre vor. Alternativ könnte ein kurzer Zweirichtungsradweg die Eimsbütteler Straße leichter erreichbar machen.</li>
      <li><.v bounds="9.947482,53.567879,9.952413,53.57139" lon={9.949696} lat={53.569668} dir="forward" ref="br-eimsbuettel-sued">Glücksburger Platz</.v>: Neugestaltung, idealerweise asphaltiert und mit Vorfahrt entlang der Route.</li>
      <li><.v bounds="9.944125,53.569031,9.951614,53.57383" lon={9.947733} lat={53.57196} dir="forward" ref="br-eimsbuettel-sued">Eduardstraße</.v>: Verbindungsstück soll zu getrennten Rad- und Fußweg ausgebaut werden.</li>
      <li><.v bounds="9.943047,53.571687,9.948207,53.574453" lon={9.945262} lat={53.57284} dir="forward" ref="br-eimsbuettel-sued">Eimsbütteler Marktplatz</.v>: direkte Querungsmöglichkeit.</li>
    </ul>

    <p>Da die <.v bounds="9.95019,53.562143,9.961856,53.567878" lon={9.957313} lat={53.564963} dir="forward" ref="br-eimsbuettel-sued">Eimsbütteler Straße</.v> teils und <.v bounds="9.963794,53.563015,9.978542,53.5665" lon={9.971351} lat={53.56395} dir="forward" ref="br-eimsbuettel-sued">Sternschanze</.v> ganz im Bezirk Altona liegen, ist dort eine Abstimmung notwendig.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
