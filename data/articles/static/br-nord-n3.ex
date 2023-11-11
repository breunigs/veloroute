defmodule Data.Article.Static.BrNordN3 do
  use Article.Static

  def id(), do: "br-nord-n3"
  def display_id(), do: "N3"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N3 – Barmbek ↔ Fuhlsbüttel"

  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N3 – Barmbek ↔ Fuhlsbüttel“ im Bezirk Hamburg-Nord führt vom Ohlsdorfer Friedhof nach Süden und schließt in zwei Ästen an die Veloroute 6 an."

  def tags(), do: [id(), display_id(), "br-nord"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "n3-main",
        direction: :forward,
        from: "Lortzingstraße",
        to: "Ohlsdorf",
        parent_ref: __MODULE__,
        text: "von der Lortzingstraße nach Ohlsdorf",
        videos: [
          {"2023-10-18-brnord/GX016410", "00:00:34.361", :end},
          {"2023-10-18-brnord/GX016411", :start, "00:00:24.591"},
          {"2023-10-18-brnord/GX016429", "00:00:20.053", :end},
          {"2023-10-18-brnord/GX016430", :start, :end},
          {"2023-10-18-brnord/GX016431", :start, :end},
          {"2023-10-18-brnord/GX016432", :start, :end},
          {"2023-10-18-brnord/GX016433", :start, "00:00:10.511"},
          {"2023-10-23-brnrod/GX016531", "00:00:15.482", :end},
          {"2023-10-23-brnrod/GX016532", :start, :end},
          {"2023-10-23-brnrod/GX016533", :start, :end},
          {"2023-10-23-brnrod/GX016534", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n3-main",
        direction: :backward,
        from: "Ohlsdorf",
        to: "Lortzingstraße",
        parent_ref: __MODULE__,
        text: "von Ohlsdorf zur Lortzingstraße",
        videos: [
          {"2023-10-23-brnrod/GX016501", :start, :end},
          {"2023-10-23-brnrod/GX016502", :start, :end},
          {"2023-10-23-brnrod/GX016503", :start, :end},
          {"2023-10-23-brnrod/GX016504", :start, :end},
          {"2023-10-23-brnrod/GX016505", :start, :end},
          {"2023-10-23-brnrod/GX016506", :start, :end},

          # XXX
          {"2023-10-23-brnrod/GX016507", :start, "00:00:05.572"},
          {"2023-10-18-brnord/GX016406", "00:00:06.740", :end},
          {"2023-10-18-brnord/GX016407", :start, :end},
          {"2023-10-18-brnord/GX016408", :start, :end},
          {"2023-10-18-brnord/GX016409", :start, :end},
          {"2023-10-18-brnord/GX016410", :start, "00:00:31.358"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n3-leg",
        direction: :forward,
        from: "Eulenkamp",
        to: "Steilshooper Straße",
        parent_ref: __MODULE__,
        text: "vom Eulenkamp zur Steilshooper Straße",
        videos: [
          {"2023-10-23-brnrod/GX016529", "00:00:14.481", "00:00:17.317"},
          {"2023-10-23-brnrod/GX016529", "00:00:37.004", :end},
          {"2023-10-23-brnrod/GX016530", :start, :end},
          {"2023-10-23-brnrod/GX016531", :start, "00:00:09.007"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n3-leg",
        direction: :backward,
        from: "Steilshooper Straße",
        to: "Eulenkamp",
        parent_ref: __MODULE__,
        text: "von der Steilshooper Straße zum Eulenkamp",
        videos: [
          {"2023-10-23-brnrod/GX016507", "00:00:10.744", :end},
          {"2023-10-23-brnrod/GX016508", :start, :end},
          {"2023-10-23-brnrod/GX016509", :start, :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Entwurf Radverkehrskonzept", "Oktober 2023",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1013264"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Bezirksroute HH-Nord N3 – Barmbek ↔ Fuhlsbüttel <.icon>N3</.icon></h3>
    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N3 – Barmbek ↔ Fuhlsbüttel“ künftig verlaufen könnte.</p>

    <p>Von Süden hat die Route zwei Äste. Der eine beginnt am <.v bounds="10.023639,53.563958,10.065952,53.585827" lon={10.044109} lat={53.572055} dir="forward" ref="br-nord-n3">Eilbekkanal</.v> – also mit Lücke zur <.a name="br-wandsbek-w1">Bezirksroute Wandsbek W1</.a>, aber direktem Anschluss an die <.a name="alltagsroute-6">Radroute 6</.a>. Der andere startet vom <.v bounds="10.042516,53.574043,10.071541,53.587678" lon={10.065262} lat={53.578942} dir="forward" ref="br-nord-n3">Elsässer Platz</.v> und hat Anschluss an beide genannten Routen.</p>

    <p>An der <.v bounds="10.031232,53.583997,10.064837,53.61692" lon={10.050127} lat={53.589395} dir="forward" ref="br-nord-n3">Steilshooper Straße</.v> treffen sich die Äste und führen gemeinsam via <.v bounds="10.035099,53.591044,10.051598,53.606789" lon={10.046748} lat={53.59766} dir="forward" ref="br-nord-n3">Otto-Speckter-Straße</.v> zur <.v bounds="10.021903,53.613281,10.046323,53.631651" lon={10.034428} lat={53.618104} dir="forward" ref="br-nord-n3">Fuhlsbüttler Straße</.v> nach Norden. Dort findet sie Anschluss an zahlreiche Routen wie die <.a name="br-nord-n8">Bezirksroute Nord N8</.a>, die <.a name="rsw-bad-bramstedt">Radroute Plus nach Bad Bramstedt</.a> und die Freizeitroute <.a name="FR11">2. Grüner Ring</.a>.</p>

    <h4>Speziell zu dieser Route</h4>
    <p>In der <.v bounds="10.021903,53.613281,10.046323,53.631651" lon={10.034428} lat={53.618104} dir="forward" ref="br-nord-n3">Fuhlsbüttler Straße</.v> werden die vorhandenen <.ref>Hochbordradwege</.ref> und <.ref>Radfahrstreifen</.ref> als vorerst ausreichend angesehen.</p>

    <p>Ansonsten ist auf den meisten Abschnitten der Umbau als Fahrradstraße vorgesehen. Ausnahmen bilden vor allem die Kreuzungen:</p>
    <ul>
      <li><.v bounds="10.045029,53.589833,10.053033,53.592966" lon={10.048482} lat={53.59169} dir="forward" ref="br-nord-n3">Hellbrookstraße</.v>: verschiedene Maßnahmen sollen geprüft werden (Fahrradstraße, Kreisverkehre, <.ref>Modalfilter</.ref>, <.ref>Protected-Bike-Lane</.ref>).</li>
      <li><.v bounds="10.04332,53.581354,10.051317,53.585592" lon={10.047261} lat={53.583487} dir="forward" ref="br-nord-n3">Bramfelder Straße</.v>: vollständiger Umbau. Es soll auch der <.a name="FR2">Osterbekradweg</.a> berücksichtigt werden. Auf den Radrouten soll der KFZ-Verkehr möglichst reduziert werden.</li>
      <li><.v bounds="10.040978,53.569895,10.051459,53.575488" lon={10.044092} lat={53.572495} dir="forward" ref="br-nord-n3">Uferstraße</.v>: KFZ-Durchgangsverkehr soll unterbunden werden.</li>
      <li><.v bounds="10.061278,53.5803,10.066078,53.582959" lon={10.063301} lat={53.581399} dir="forward" ref="br-nord-n3">Straßburger Platz</.v>: Radquerung soll verbessert werden.</li>
      <li><.v bounds="10.05668,53.583887,10.06127,53.587267" lon={10.05954} lat={53.58562} dir="forward" ref="br-nord-n3">Osterbekbrücke</.v>: soll verbessert werden.</li>
    </ul>

    <%= Data.Article.Shared.bezirksroute(:nord) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
