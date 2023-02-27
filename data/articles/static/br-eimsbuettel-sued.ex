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
    <p>Die Bezirksroute „Süd“ in Eimsbüttel verbindet Tiergartenstraße und Schulterblatt in Ost-West Richtung. Dort knickt sie nach Norden ab und verläuft grob parallel zur Kieler Straße. Am Langenfelder Damm mündet sie in die Veloroute <.icon>2</.icon> bzw. den Radschnellweg <.icon>RSW</.icon> nach Elmshorn.</p>

    <h4>Speziell für diese Route</h4>
    <p>Für die meisten Abschnitte ist vorgesehen, sie als Fahrradstraßen herzurichten. Das bedeuetet meist Vorfahrt und geradlinige Führung. Auch <.ref name="dooring">gefahrenvolles KFZ-Parken</.ref> soll reduziert werden. Ergänzend dazu werden Geschwindigkeitsdämpfer (z.B. Schwellen) oder KFZ-Reduktion (z.B. Diagonaltrenner) vorgeschlagen. Es gibt einige besondere Abschnitte:</p>

    <ul>
      <li>Kreuzung Weidenallee/Kleiner Schäferkamp/Dänenweg: Die Fahrtbeziehung entlang der Route soll verbessert werden.</li>
      <li>Altonaer Straße: Es gibt zwei Vorschläge. Der Erste sieht vor die Radwege auf Kosten der Baumreihen zu verbreitern. Der Zweite ist eine komplette Neugestaltung, wo die jeweiligen Fahrtrichtungen durch eine großzügige Mittelinsel mit Parken, Bäumen und Fußweg getrennt sind. Der Radverkehr führe auf <.ref>Protected-Bike-Lanes</.ref>. Das Planungsbüro spricht sich für die zweite Variante aus, sofern sich diese umsetzen lässt.</li>
      <li>Kreuzungen Altonaer Straße/Schulterblatt/Eimsbütteler Straße: Die Fahrtbeziehung soll verbessert werden. Man schlägt zwei Kreisverkehre vor. Alternativ könnte ein kurzer Zweirichtungsradweg die Eimsbütteler Straße leichter erreichbar machen.</li>
      <li>Glücksburger Platz: Neugestaltung, idealerweise asphaltiert und mit Vorfahrt entlang der Route.</li>
      <li>Eduardstraße: Verbindungsstück soll zu getrennten Rad- und Fußweg ausgebaut werden.</li>
      <li>Eimsbütteler Marktplatz: direkte Querungsmöglichkeit.</li>
    </ul>

    <p>Da die Eimsbütteler Straße und Sternschanze im Bezirk Altona liegen, ist dort eine Abstimmung notwendig.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
