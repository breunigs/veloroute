defmodule Data.Article.Static.BrEimsbuettelEidelstedt do
  use Article.Static

  def id(), do: "br-eimsbuettel-eidelstedt"
  def display_id(), do: "E3"

  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Eimsbüttel – E3 – Eidelstedt"

  def color(), do: "#969696"

  def summary(),
    do:
      "Die Bezirksroute „Eidelstedt“ in Eimsbüttel verläuft grob in Ost-West-Richtung zum Niendorfer Gehege."

  def tags(), do: [id(), display_id(), "br-eimsbuettel"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "eidelstedt",
        direction: :forward,
        from: "Lohkampstraße",
        to: "Niendorfer Gehege",
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
        group: "eidelstedt",
        direction: :backward,
        from: "Niendorfer Gehege",
        to: "Lohkampstraße",
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
      {"Vorstellung Bezirksrouten Eimsbüttel", "Februar 2023, Details in Anhang III",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1008163"},
      {"Infoseite Eimsbüttels zu den Bezirksrouten",
       "https://www.hamburg.de/eimsbuettel/bezirksrouten/"},
      {"Beteiligungsverfahren", "abgeschlossen, 2021",
       "https://bezirksrouten-eimsbuettel.beteiligung.hamburg/#/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Bezirksroute Eimsbüttel – Eidelstedt <.icon>E3</.icon></h3>

    <p>Die Bezirksroute „Eidelstedt“ verbindet den Stadtteil mit dem <.v bounds="9.911016,53.601417,9.959618,53.625074" lon={9.930162} lat={53.613314} dir="forward" ref={@ref}>Niendorfer Gehege</.v>. Über die äußere Ringroute <.icon>14</.icon> und die <.a name="br-eimsbuettel-nord-sued">Bezirksroute Nord-Süd</.a> besteht Anschluss an den Rest der Stadt.</p>

    <h4>Speziell für diese Route</h4>
    <p>Das Planungsbüro schlägt vor, die meisten Abschnitte als Fahrradstraßen herzurichten. Das meint häufig Vorfahrt, aufgeräumteres KFZ-Parken, geradlinige Führung und andere kleinere Maßnahmen, die das Radfahren verbessern sollen. Die Fahrradstraßen würden KFZ weiter erlauben („KFZ frei“).</p>

    <p>Abweichungen und Details:</p>
    <ul>
      <li><.v bounds="9.869343,53.606701,9.907028,53.619031" lon={9.885921} lat={53.613658} dir="forward" ref={@ref}>Lohkampstraße</.v>: wegen des Busverkehrs wird ein Zweirichtungsradweg auf der Südseite (Grundschule) vorgeschlagen. Der <.v bounds="9.869343,53.606701,9.907028,53.619031" lon={9.901771} lat={53.608956} dir="forward" ref={@ref}>Einkaufsbereich</.v> soll jedoch Fahrradstraße werden und stark begrünt werden. In der maximalen Ausbaustufe wäre dieser Abschnitt sogar KFZ-frei.</li>
      <li><.v bounds="9.901286,53.60633,9.908298,53.609882" lon={9.904441} lat={53.608202} dir="forward" ref={@ref}>Eidelstedter Platz</.v>: der Zweirichtungsradweg neben dem Busbahnhof soll so bleiben, aber verbreitert werden. Die Anschlüsse an <.v bounds="9.901286,53.60633,9.908298,53.609882" lon={9.902927} lat={53.608593} dir="forward" ref={@ref}>Lohkampstraße</.v> bzw. <.v bounds="9.901286,53.60633,9.908298,53.609882" lon={9.905339} lat={53.607936} dir="forward" ref={@ref}>Eidelstedter Dorfstraße</.v> sollen aber einfacher werden.</li>
      <li><.v bounds="9.909202,53.606882,9.918288,53.61159" lon={9.912826} lat={53.609031} dir="forward" ref={@ref}>Verbindung Dörpsweg mit Steinwiesenweg</.v>: Trennung von Fuß- und Radverkehr; Radweg asphaltiert.</li>
      <li><.v bounds="9.911907,53.607794,9.920992,53.612503" lon={9.915636} lat={53.609849} dir="forward" ref={@ref}>Einmündung Steinwiesenweg und Niendorfer Gehege</.v>: es wird ein Kreisverkehr vorgeschlagen, um das Abbiegen zu vereinfachen.</li>
    </ul>

    <%= Data.Article.Shared.bezirksroute(:eimsbuettel) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
