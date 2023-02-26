defmodule Data.Article.Static.BrEimsbuettelEidelstedtNiendorf do
  use Article.Static

  def id(), do: "br-eimsbuettel-niendorf"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Eimsbüttel – Eidelstedt/Niendorf"

  def color(), do: "#969696"

  def summary(),
    do:
      "Die Bezirksrouten „Eidelstedt“ und „Niendorf“ in Eimsbüttel verlaufen grob in Ost-West-Richtung und verbinden die beiden Stadtteile."

  def tags(), do: [id(), "br-eimsbuettel"]

  def tracks(),
    do: [
      # TODO: gpx check
      %Video.Track{
        renderer: 3,
        group: "eidelstedt-niendorf",
        direction: :forward,
        from: "Lohkampstraße",
        to: "König-Heinrich-Weg",
        parent_ref: __MODULE__,
        text: "von der Lohkampstraße zum König-Heinrich-Weg (→ Niendorf)",
        videos: [
          {"2023-02-25-eimsbuettel-br2/GX015253", "00:02:04.099", :end},
          {"2023-02-25-eimsbuettel-br2/GX015254", :start, :end},
          {"2023-02-25-eimsbuettel-br2/GX015257", :start, "00:01:38.865"},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015219", "00:01:22.349", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015220", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015221", :start, "00:01:20.397"}
        ]
      },
      # TODO: gpx check
      %Video.Track{
        renderer: 3,
        group: "eidelstedt-niendorf",
        direction: :backward,
        from: "König-Heinrich-Weg",
        to: "Lohkampstraße",
        parent_ref: __MODULE__,
        text: "vom König-Heinrich-Weg zur Lohkampstraße (→ Eidelstedt)",
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
      {"Vorstellung Bezirksrouten Eimsbüttel", "Februar 2023, Details in Anhängen II und III",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1008163"},
      {"Infoseite Eimsbüttels zu den Bezirksrouten",
       "https://www.hamburg.de/eimsbuettel/bezirksrouten/"}
    ]
  end

  # TODO: text
  def text(assigns) do
    ~H"""
    <%= Data.Article.Shared.bezirksroute(:eimsbuettel) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
