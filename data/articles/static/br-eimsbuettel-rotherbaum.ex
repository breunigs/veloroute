defmodule Data.Article.Static.BrEimsbuettelRotherbaum do
  use Article.Static

  def id(), do: "br-eimsbuettel-rotherbaum"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Eimsbüttel – Rotherbaum"

  def color(), do: "#969696"

  def summary(),
    do:
      "Die Bezirksroute „Rotherbaum“ in Eimsbüttel verläuft in Nord-Süd-Richtung entlang des Mittelwegs. Beginn ab Dammtor, Ende auf der Heilwigbrücke."

  def tags(), do: [id(), "br-eimsbuettel"]

  def tracks(),
    do: [
      # TODO: check gpx
      %Video.Track{
        renderer: 3,
        group: "rotherbaum",
        direction: :forward,
        from: "Dammtor",
        to: "Heilwigstraße",
        parent_ref: __MODULE__,
        text: "vom Dammtor zur Heilwigstraße",
        videos: [
          {"2023-02-25-eimsbuettel-br2/GX015234", :start, :end},
          {"2023-02-25-eimsbuettel-br2/GX015235", :start, :end},
          {"2023-02-25-eimsbuettel-br2/GX015236", :start, "00:01:23.400"}
        ]
      },
      # TODO: check gpx
      %Video.Track{
        renderer: 3,
        group: "rotherbaum",
        direction: :backward,
        from: "Heilwigstraße",
        to: "Dammtor",
        parent_ref: __MODULE__,
        text: "von der Heilwigstraße zum Dammtor",
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
       "https://www.hamburg.de/eimsbuettel/bezirksrouten/"}
    ]
  end

  # TODO: links
  def text(assigns) do
    ~H"""
    <p>Die Bezirksroute „Rotherbaum“ in Eimsbüttel verläuft vom Dammtor in Nord-Süd-Richtung entlang des Mittelweg und endet auf der Heilwigbrücke. Auf einem Teilstück teilt sie sich den Weg mit der Bezirksroute Isebek.</p>

    <h4>Speziell für diese Route</h4>
    <p>Wo heute noch keine <.ref>Radfahrstreifen</.ref> sind, sollen sie eingerichtet werden. Wo zu wenig Platz für normalbreite Radfahrstreifen ist, werden als Alternative <.ref>Schutzstreifen</.ref> vorgeschlagen. Das wäre von Johnsallee bis Milchstraße der Fall.</p>

    <p>Für die anderen Stellen werden Detailverbesserungen vorschlagen, wie etwa bessere Abgrenzung zu fahrenden und parkenden KFZ. Der letzte Abschnitt vor der Heilwigbrücke wird in der Planung nicht betrachtet.</p>

    <%= Data.Article.Shared.bezirksroute(:eimsbuettel) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
