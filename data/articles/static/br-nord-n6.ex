defmodule Data.Article.Static.BrNordN6 do
  use Article.Static

  def id(), do: "br-nord-n6"
  def display_id(), do: "N6"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N6 – Stadtpark-Süd"

  def color(), do: "#bf95ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N6 – Stadtpark-Süd“ im Bezirk Hamburg-Nord führt vom UKE nach Barmbek."

  def tags(), do: [id(), display_id(), "br-nord"]

  # note: W3 and N6 connect at the admin border of Barmbek/Barmfeld, hence the slight naming difference
  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "n6-main",
        direction: :forward,
        from: "UKE",
        to: "Barmbek",
        parent_ref: __MODULE__,
        text: "vom UKE nach Barmfeld",
        videos: [
          {"2023-10-18-brnord/GX016390", :start, :end},
          {"2023-10-18-brnord/GX016391", :start, :end},
          {"2023-10-18-brnord/GX016392", :start, :end},
          {"2023-10-18-brnord/GX016393", :start, :end},
          {"2023-10-18-brnord/GX016394", :start, :end},
          {"2023-10-18-brnord/GX016395", :start, :end},
          {"2023-10-18-brnord/GX016396", :start, :end},
          {"2023-10-18-brnord/GX016397", :start, :end},
          {"2023-10-18-brnord/GX016398", :start, :end},
          {"2023-10-18-brnord/GX016399", :start, :end},
          {"2023-10-18-brnord/GX016400", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n6-main",
        direction: :backward,
        from: "Barmbek",
        to: "UKE",
        parent_ref: __MODULE__,
        text: "von Barmfeld zum UKE",
        videos: [
          {"2023-10-18-brnord/GX016402", :start, :end},
          {"2023-10-18-brnord/GX016403", :start, :end},
          {"2023-10-18-brnord/GX016434", "00:00:00.467", "00:00:12.980"},
          {"2023-10-18-brnord/GX016435", :start, :end},
          {"2023-10-18-brnord/GX016436", :start, :end},
          {"2023-10-18-brnord/GX016437", :start, "00:00:05.105"},
          {"2023-10-18-brnord/GX016446", "00:00:29.563", :end},
          {"2023-10-18-brnord/GX016447", :start, :end},
          {"2023-10-18-brnord/GX016448", :start, "00:00:10.210"},
          {"2023-10-22-br-nord-reg/GX016462", "00:00:03.070", "00:00:07.741"},
          {"2023-10-18-brnord/GX016449", "00:00:04.104", :end},
          {"2023-10-18-brnord/GX016450", :start, "00:00:18.014"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n6-leg",
        direction: :forward,
        from: "Grasweg",
        to: "Pestalozzistraße",
        parent_ref: __MODULE__,
        text: "vom Grasweg zur Pestalozzistraße",
        videos: [
          {"2023-10-18-brnord/GX016439", "00:00:09.977", "00:00:32.366"},
          {"2023-10-18-brnord/GX016439", "00:01:09.002", :end},
          {"2023-10-18-brnord/GX016440", :start, :end},
          {"2023-10-18-brnord/GX016441", :start, :end},
          {"2023-10-18-brnord/GX016442", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n6-leg",
        direction: :backward,
        from: "Pestalozzistraße",
        to: "Grasweg",
        parent_ref: __MODULE__,
        text: "von der Pestalozzistraße zum Grasweg",
        videos: [
          {"2023-10-18-brnord/GX016443", :start, :end},
          {"2023-10-18-brnord/GX016444", :start, :end},
          {"2023-10-18-brnord/GX016445", :start, :end},
          {"2023-10-18-brnord/GX016446", :start, "00:00:27.355"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Entwurf Radverkehrskonzept", "Oktober 2023",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1013264"},
      {"Untersuchung Erweiterung Stadtpark", "September 2022",
       "https://www.hamburg.de/hamburg-nord/pressemitteilungen/16514806/stadtparkuntersuchung/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Bezirksroute HH-Nord – Stadtpark-Süd <.icon>N6</.icon></h3>
    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N6 – Stadtpark-Süd“ künftig verlaufen könnte. Die eingezeichnete und gefahrene Strecke orientiert sich dabei am heute Möglichen. Die vom Planungsbüro vorgeschlagenen Wege sind hellgrau gestrichelt eingezeichnet.</p>

    <p>Die Route beginnt im Westen <.v bounds="9.963552,53.585306,9.989991,53.594789" lon={9.968999} lat={53.586253} dir="forward" ref="br-nord-n6">am UKE</.v>. Von dort führt sie zum <.v bounds="9.994059,53.590657,10.006361,53.596918" lon={9.99981} lat={53.594216} dir="forward" ref="br-nord-n6">Winterhuder Marktplatz</.v> und teilt sich dort in zwei Äste auf.</p>

    <p>Der <.v bounds="9.995985,53.584454,10.052035,53.597472" lon={10.002676} lat={53.592375} dir="forward" ref="br-nord-n6" highlight="Barmbeker Straße,Wiesendamm,Pestalozzistraße">südliche Zweig</.v> über <.v bounds="9.997907,53.58697,10.018732,53.59527" lon={10.006146} lat={53.591502} dir="forward" ref="br-nord-n6">Barmbeker Straße</.v> und <.v bounds="10.009784,53.583281,10.044367,53.594702" lon={10.025256} lat={53.588614} dir="forward" ref="br-nord-n6">Wiesendamm</.v> bindet die <.v bounds="10.036653,53.583525,10.053462,53.590938" lon={10.044038} lat={53.58683} dir="forward" ref="br-nord-n6">U+S Bahn Station Barmbek</.v> an. Die <.v bounds="10.042912,53.585974,10.050532,53.58915" lon={10.047369} lat={53.587257} dir="forward" ref="br-nord-n6">Pestalozzistraße</.v> stellt den Lückenschluss zur <.a name="br-nord-n3">Bezirksroute Nord N3</.a> her.</p>

    <p>Der <.v bounds="10.000087,53.588079,10.066679,53.597037" lon={10.003246} lat={53.59285} dir="forward" ref="br-nord-n6" highlight="Grasweg,Südring,Hellbrookstraße">nördliche Zweig</.v> über <.v bounds="10.000087,53.588079,10.066679,53.597037" lon={10.018938} lat={53.591592} dir="forward" ref="br-nord-n6">Südring</.v> und <.v bounds="10.028828,53.588901,10.063464,53.597082" lon={10.041975} lat={53.591461} dir="forward" ref="br-nord-n6">Hellbrookstraße</.v> schließt in der <.v bounds="10.052165,53.590396,10.067968,53.599346" lon={10.058705} lat={53.593147} dir="forward" ref="br-nord-n6">Bramfelder Straße</.v> an die <.a name="br-wandsbek-w3">Bezirksroute Wandsbek W3</.a> an.</p>

    <h4>Speziell für diese Route</h4>
    <p>Fahrradstraßen werden für die <.v bounds="9.965346,53.584044,9.984663,53.59382" lon={9.974955} lat={53.588531} dir="forward" ref="br-nord-n6">Martinistraße</.v> (West), <.v bounds="10.001096,53.586404,10.035188,53.596719" lon={10.016174} lat={53.591903} dir="forward" ref="br-nord-n6" highlight="Grasweg,Südring">südlich des Stadtparks</.v> und in der <.v bounds="10.042912,53.585974,10.050532,53.58915" lon={10.047369} lat={53.587257} dir="forward" ref="br-nord-n6">Pestalozzistraße</.v> vorgeschlagen.</p>

    <p>Für <.v bounds="9.997907,53.58697,10.018732,53.59527" lon={10.006146} lat={53.591502} dir="forward" ref="br-nord-n6">Barmbeker Straße</.v>, <.v bounds="10.009784,53.583281,10.044367,53.594702" lon={10.025256} lat={53.588614} dir="forward" ref="br-nord-n6">Wiesendamm</.v> und <.v bounds="10.028828,53.588901,10.063464,53.597082" lon={10.041975} lat={53.591461} dir="forward" ref="br-nord-n6">Hellbrookstraße</.v> sollen vor allem die vorhandenen Radwege aufgewertet und Lücken geschlossen werden. Je nach Örtlichkeit wären das <.ref>Hochbordradwege</.ref>, <.ref>Protected-Bike-Lanes</.ref> und <.ref>Radfahrstreifen</.ref>.</p>

    <h5>Plätze, Kreuzungen und Einmündungen</h5>
    <ul>
      <li><.v bounds="9.982566,53.590613,9.9931,53.596254" lon={9.98905} lat={53.592727} dir="forward" ref="br-nord-n6">Eppendorfer Marktplatz</.v>: Siehe <.a name="2023-10-28-eppendorfer-marktplatz">Artikel Eppendorfer Marktplatz</.a> bzw. <.a name="2023-10-25-martinistrasse-ost">Artikel Martinistraße Ost</.a></li>
      <li><.v bounds="9.996809,53.593114,10.002023,53.595695" lon={9.998197} lat={53.594351} dir="forward" ref="br-nord-n6">Winterhuder Marktplatz</.v>: großflächige Umgestaltung</li>
      <li>Fahrt von der <.v bounds="9.999718,53.591538,10.004627,53.593589" lon={10.001411} lat={53.592673} dir="forward" ref="br-nord-n6">Barmbeker Straße</.v> in den <.v bounds="9.999718,53.591538,10.004627,53.593589" lon={10.002763} lat={53.592796} dir="forward" ref="br-nord-n6">Grasweg</.v> soll vereinfacht werden</li>
      <li><.v bounds="10.011889,53.589698,10.021077,53.59522" lon={10.015247} lat={53.591911} dir="forward" ref="br-nord-n6">Otto-Wels-Straße</.v>: KFZ-Verkehr soll der Radroute nicht mehr „geradeaus“ folgen können</li>
      <li><.v bounds="10.027676,53.58935,10.038169,53.594612" lon={10.031384} lat={53.591653} dir="forward" ref="br-nord-n6">Stadthallenbrücke</.v>: Umbau zur reinen Fuß- und Radbrücke</li>
      <li><.v bounds="10.040864,53.58534,10.047527,53.588125" lon={10.043394} lat={53.586941} dir="forward" ref="br-nord-n6">Bahnhof Barmbek</.v>: Kommunaltrasse (Bus, Taxi, Fahrrad, Fuß – aber keine privaten KFZ)</li>
    </ul>

    <%= Data.Article.Shared.bezirksroute(:nord) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
