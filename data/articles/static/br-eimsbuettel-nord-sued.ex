defmodule Data.Article.Static.BrEimsbuettelNordSued do
  use Article.Static

  def id(), do: "br-eimsbuettel-nord-sued"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Eimsbüttel – Nord-Süd"

  def color(), do: "#969696"

  def summary(),
    do:
      "Die Bezirksroute „Nord-Süd“ in Eimsbüttel verläuft vom Glücksburger Platz bis nach Burgwedel."

  def tags(), do: [id(), "br-eimsbuettel"]

  def tracks(),
    do: [
      # %Video.Track{
      #   renderer: 3,
      #   group: "Isebek",
      #   direction: :forward,
      #   from: "Glückburger Platz",
      #   to: "Burgwedel",
      #   parent_ref: __MODULE__,
      #   text: "vom Glückburger Platz nach Burgwedel",
      #   videos: [
      #     {"2023-02-19-bezirksrouten-eimsbuettel/GX015184", "00:00:13.981", :end}
      #     {"2023-02-19-bezirksrouten-eimsbuettel/GX015186", :start, :end}
      #     {"2023-02-19-bezirksrouten-eimsbuettel/GX015187", :start, ""}
      #     {"2023-02-19-bezirksrouten-eimsbuettel/GX015188", "", :end}
      #   ]
      # }
      # %Video.Track{
      #   renderer: 3,
      #   group: "Isebek",
      #   direction: :backward,
      #   from: "Burgwedel",
      #   to: "Glückburger Platz",
      #   parent_ref: __MODULE__,
      #   text: "von Burgwedel zum Glückburger Platz",
      #   videos: []
      # }
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
