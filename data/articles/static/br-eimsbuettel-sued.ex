defmodule Data.Article.Static.BrEimsbuettelSued do
  use Article.Static

  def id(), do: "br-eimsbuettel-sued"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Eimsbüttel – Süd"

  def color(), do: "#969696"

  def summary(),
    do:
      "Die Bezirksroute „Süd“ in Eimsbüttel verläuft von der Tiergartenstraße nach Westen über den Glücksburger Platz, knickt dann leicht nördlich Richtung Langenfelder Damm ab."

  def tags(), do: [id(), "br-eimsbuettel"]

  def tracks(),
    do: [
      # %Video.Track{
      #   renderer: 3,
      #   group: "sued",
      #   direction: :backward,
      #   from: "Langenfelder Damm",
      #   to: "Tiergartenstraße",
      #   parent_ref: __MODULE__,
      #   text: "vom Langenfelder Damm zur Tiergartenstraße",
      #   videos: [
      #     {"2023-02-19-bezirksrouten-eimsbuettel/GX015169", "00:01:12.606",:end}
      #     {"2023-02-19-bezirksrouten-eimsbuettel/GX015170",:start}

      #   ]
      # }

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
      {"Vorstellung Bezirksrouten Eimsbüttel",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1008163"},
      {"Infoseite Eimsbüttels zu den Bezirksrouten",
       "https://www.hamburg.de/eimsbuettel/bezirksrouten/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
