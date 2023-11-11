defmodule Data.Article.Static.BrEimsbuettelNiendorf do
  use Article.Static

  def id(), do: "br-eimsbuettel-niendorf"
  def display_id(), do: "E2"

  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Eimsbüttel – E2 – Niendorf"

  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Die Bezirksroute „Niendorf“ in Eimsbüttel verläuft leicht südwestlich zum Niendorfer Gehege."

  def tags(), do: [id(), display_id(), "br-eimsbuettel"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "niendorf",
        direction: :forward,
        from: "Niendorfer Gehege",
        to: "König-Heinrich-Weg",
        parent_ref: __MODULE__,
        text: "Bezirksroute E2+E3 Eimsbüttel „Eidelstedt“ → „Niendorf“",
        videos: [
          {"2023-02-25-eimsbuettel-br2/GX015253", "00:02:04.099", :end},
          {"2023-02-25-eimsbuettel-br2/GX015254", :start, :end},
          {"2023-02-25-eimsbuettel-br2/GX015257", :start, "00:01:38.865"},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015219", "00:01:22.349", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015220", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015221", :start, "00:01:20.397"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "niendorf",
        direction: :backward,
        from: "König-Heinrich-Weg",
        to: "Niendorfer Gehege",
        parent_ref: __MODULE__,
        text: "Bezirksroute E2+E3 Eimsbüttel „Niendorf“ → „Eidelstedt“",
        videos: [
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015221", "00:01:24.734", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015222", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015223", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015224", :start, "00:00:19.353"},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015226", "00:00:23.390", :end},
          {"2023-02-25-eimsbuettel-br2/GX015252", :start, :end},
          {"2023-02-25-eimsbuettel-br2/GX015253", :start, "00:01:23.400"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Vorstellung Bezirksrouten Eimsbüttel", "Februar 2023, Details in Anhang II",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1008163"},
      {"Infoseite Eimsbüttels zu den Bezirksrouten",
       "https://www.hamburg.de/eimsbuettel/bezirksrouten/"},
      {"Beteiligungsverfahren", "abgeschlossen, 2021",
       "https://bezirksrouten-eimsbuettel.beteiligung.hamburg/#/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Bezirksroute Eimsbüttel – Niendorf <.icon>E2</.icon></h3>

    <p>Die Bezirksroute „Nienstedt“ verbindet den Stadtteil mit dem <.v bounds="9.911016,53.601417,9.959618,53.625074" lon={9.930162} lat={53.613314} dir="forward" ref={@ref}>Niendorfer Gehege</.v>. Über die Velorouten <.icon>3</.icon> und <.icon>14</.icon>, sowie die <.a name="br-eimsbuettel-nord-sued">Bezirksroute Nord-Süd</.a> besteht Anschluss zum Rest der Stadt.</p>

    <h4>Speziell für diese Route</h4>
    <p>Das Planungsbüro schlägt vor, die meisten Abschnitte als Fahrradstraßen herzurichten. Das meint häufig Vorfahrt, aufgeräumteres KFZ-Parken, geradlinige Führung und andere kleinere Maßnahmen, die das Radfahren verbessern sollen. Die Fahrradstraßen würden KFZ weiter erlauben („KFZ frei“).</p>

    <p>Abweichungen und Details:</p>
    <ul>
      <li><.v bounds="9.916756,53.607604,9.948968,53.620713" lon={9.933577} lat={53.61612} dir="forward" ref={@ref}>Niendorfer Gehege</.v>: zur Verringerung des KFZ-Durchgangsverkehrs werden Modalfilter vorgeschlagen, die nur für Bus- und Radverkehr passierbar sind. Auch soll die Strecke beleuchtet werden.</li>
      <li><.v bounds="9.943229,53.617818,9.948651,53.621989" lon={9.946296} lat={53.61959} dir="forward" ref={@ref}>Friedrich-Ebert-Straße</.v>: kurzfristig sollen die <.ref>Hochbordradwege</.ref> verbreitert werden. Um das Queren mit dem Fahrrad zu vereinfachen, sollen beide Einmündungen umgebaut werden.</li>
      <li><.v bounds="9.94372,53.619882,9.956291,53.624668" lon={9.947864} lat={53.621655} dir="forward" ref={@ref}>Max-Zelck-Straße</.v>: komplizierte Abwägung mit vier Varianten. Empfohlen wird eine KFZ-Einbahnstraße und ein <.ref>Radfahrstreifen</.ref> in Fahrtrichtung Osten. Rechts des Radfahrstreifens blieben KFZ-Parkplätze. Entgegen der Einbahnstraße soll der Radweg als <.ref>Protected-Bike-Lane</.ref> ausgeführt werden.</li>
      <li><.v bounds="9.94372,53.619882,9.956291,53.624668" lon={9.951749} lat={53.623876} dir="forward" ref={@ref}>An Der Lohe</.v>: ähnlich komplizierte Abwägung. Um die Buslinie 24 nicht zu verdrängen, werden hier jedoch beidseitige Protected-Bike-Lanes vorgeschlagen. Da der KFZ-Zweirichtungsverkehr bleiben soll, ginge dies auf Kosten der Bäume und KFZ-Parkplätze.</li>
    </ul>

    <%= Data.Article.Shared.bezirksroute(:eimsbuettel) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
