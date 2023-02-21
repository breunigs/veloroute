defmodule Data.Article.Static.BrEimsbuettelIsebek do
  use Article.Static

  def id(), do: "br-eimsbuettel-isebek"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Eimsbüttel – Isebek"

  def color(), do: "#969696"

  def summary(),
    do:
      "Die Bezirksroute „Isebek“ in Eimsbüttel verläuft von der Waterloostraße nach Nordenosten Richtung Streekbrücke."

  def tags(), do: [id(), "br-eimsbuettel"]

  def tracks(),
    do: [
      # GPX OK
      %Video.Track{
        renderer: 3,
        group: "Isebek",
        direction: :forward,
        from: "Waterloostraße",
        to: "Streekbrücke",
        parent_ref: __MODULE__,
        text: "von der Waterloostraße zur Streekbrücke",
        videos: [
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015170", "00:01:19.646", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015171", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015172", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015173", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015174", :start, "00:00:29.596"},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015175", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015176", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015177", :start, "00:00:24.057"}
        ]
      },
      ## GPX OK
      %Video.Track{
        renderer: 3,
        group: "Isebek",
        direction: :backward,
        from: "Streekbrücke",
        to: "Waterloostraße",
        parent_ref: __MODULE__,
        text: "von der Streekbrücke zur Waterloostraße",
        videos: [
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015177", "00:00:53.487", "00:01:12.039"},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015177", "00:01:18.478", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015178", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015179", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015180", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015181", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015182", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015183", :start, "00:00:28.690"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Vorstellung Bezirksrouten Eimsbüttel",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1008163"},
      {"Infoseite Eimsbüttels zu den Bezirksrouten",
       "https://www.hamburg.de/eimsbuettel/bezirksrouten/"}
    ]
  end

  def text(assigns) do
    ~H"""

    <%= Data.Article.Shared.bezirksroute(:eimsbuettel) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
