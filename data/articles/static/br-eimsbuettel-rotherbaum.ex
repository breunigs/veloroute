defmodule Data.Article.Static.BrEimsbuettelRotherbaum do
  use Article.Static

  def id(), do: "br-eimsbuettel-rotherbaum"
  def display_id(), do: "E5"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Eimsbüttel – E5 – Rotherbaum"

  def color(), do: "#969696"

  def summary(),
    do:
      "Die Bezirksroute „Rotherbaum“ in Eimsbüttel verläuft in Nord-Süd-Richtung entlang des Mittelwegs. Beginn ab Dammtor, Ende auf der Heilwigbrücke."

  def tags(), do: [id(), display_id(), "br-eimsbuettel"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "rotherbaum",
        direction: :forward,
        from: "Dammtor",
        to: "Heilwigstraße",
        parent_ref: __MODULE__,
        text: "Bezirksroute Eimsbüttel „Rotherbaum“ → Heilwigbrücke",
        videos: [
          {"2023-02-25-eimsbuettel-br2/GX015234", :start, :end},
          {"2023-02-25-eimsbuettel-br2/GX015235", :start, :end},
          {"2023-02-25-eimsbuettel-br2/GX015236", :start, "00:01:23.400"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "rotherbaum",
        direction: :backward,
        from: "Heilwigstraße",
        to: "Dammtor",
        parent_ref: __MODULE__,
        text: "Bezirksroute Eimsbüttel „Rotherbaum“ → Dammtor",
        videos: [
          {"2023-02-25-eimsbuettel-br2/GX015236", "00:01:26.736", :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Vorstellung Bezirksrouten Eimsbüttel", "Februar 2023, Details in Anhang V",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1008163"},
      {"Infoseite Eimsbüttels zu den Bezirksrouten",
       "https://www.hamburg.de/eimsbuettel/bezirksrouten/"},
      {"Beteiligungsverfahren", "abgeschlossen, 2021",
       "https://bezirksrouten-eimsbuettel.beteiligung.hamburg/#/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Bezirksroute Eimsbüttel – Rotherbaum <.icon>E5</.icon></h3>

    <p>Die Bezirksroute „Rotherbaum“ in Eimsbüttel verläuft vom <.v bounds="9.984348,53.558459,9.998315,53.565785" lon={9.990748} lat={53.560337} dir="forward" ref="br-eimsbuettel-rotherbaum">Dammtor</.v> in Nord-Süd-Richtung entlang des <.v bounds="9.984562,53.559162,10.003159,53.579949" lon={9.994316} lat={53.572317} dir="forward" ref="br-eimsbuettel-rotherbaum">Mittelweg</.v> und endet auf der <.v bounds="9.990061,53.579781,10.00024,53.587175" lon={9.993936} lat={53.584425} dir="forward" ref="br-eimsbuettel-rotherbaum">Heilwigbrücke</.v>. Auf einem Teilstück teilt sie sich den Weg mit der <.a name="br-eimsbuettel-isebek">Bezirksroute Isebek</.a>.</p>

    <h4>Speziell für diese Route</h4>
    <p>Wo heute noch keine <.ref>Radfahrstreifen</.ref> sind, sollen sie eingerichtet werden. Wo zu wenig Platz für normalbreite Radfahrstreifen ist, werden als Alternative <.ref>Schutzstreifen</.ref> vorgeschlagen. Das wäre von <.v bounds="9.993365,53.566095,9.998871,53.570937" lon={9.995976} lat={53.566645} dir="forward" ref="br-eimsbuettel-rotherbaum">Johnsallee</.v> bis <.v bounds="9.993365,53.566095,9.998871,53.570937" lon={9.995238} lat={53.570308} dir="forward" ref="br-eimsbuettel-rotherbaum">Milchstraße</.v> der Fall.</p>

    <p>Für die anderen Stellen werden Detailverbesserungen vorschlagen, wie etwa bessere Abgrenzung zu fahrenden und parkenden KFZ. Der <.v bounds="9.990474,53.580743,9.998193,53.586719" lon={9.993804} lat={53.583731} dir="forward" ref="br-eimsbuettel-rotherbaum">letzte Abschnitt vor der Heilwigbrücke</.v> wird in der Planung nicht betrachtet.</p>

    <%= Data.Article.Shared.bezirksroute(:eimsbuettel) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
