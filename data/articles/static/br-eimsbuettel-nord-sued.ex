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
      # TODO: GPX check
      %Video.Track{
        renderer: 3,
        group: "Isebek",
        direction: :forward,
        from: "Glückburger Platz",
        to: "Burgwedel",
        parent_ref: __MODULE__,
        text: "vom Glückburger Platz nach Burgwedel",
        videos: [
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015184", "00:00:13.981", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015186", :start, "00:00:12.980"},
          {"2023-02-25-eimsbuettel-br2/GX015244", "00:00:23.857", :end},
          {"2023-02-25-eimsbuettel-br2/GX015245", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015189", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015190", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015191", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015193", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015194", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015195", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015196", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015197", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015198", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015199", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015200", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015201", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015202", :start, "00:00:19.349"}
        ]
      },
      # TODO: GPX check
      %Video.Track{
        renderer: 3,
        group: "Isebek",
        direction: :backward,
        from: "Burgwedel",
        to: "Glückburger Platz",
        parent_ref: __MODULE__,
        text: "von Burgwedel zum Glückburger Platz",
        videos: [
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015202", "00:00:36.029", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015203", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015204", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015205", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015208", :start, "00:00:11.745"},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015209", "00:00:01.134", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015210", :start, "00:00:03.403"},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015212", "00:00:02.970", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015213", "00:00:02.302", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015214", :start, "00:00:22.055"},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015218", "00:00:01.668", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015219", :start, "00:00:20.921"},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015219", "00:00:45.679", "00:01:22.316"},
          {"2023-02-25-eimsbuettel-br2/GX015257", "00:01:38.865", :end},
          {"2023-02-25-eimsbuettel-br2/GX015258", :start, :end},
          {"2023-02-25-eimsbuettel-br2/GX015259", :start, :end},
          {"2023-02-25-eimsbuettel-br2/GX015260", :start, :end},
          {"2023-02-25-eimsbuettel-br2/GX015261", :start, "00:00:18.014"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Vorstellung Bezirksrouten Eimsbüttel", "Februar 2023, Details in Anhang I",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1008163"},
      {"Infoseite Eimsbüttels zu den Bezirksrouten",
       "https://www.hamburg.de/eimsbuettel/bezirksrouten/"}
    ]
  end

  # TODO: text
  def text(assigns) do
    ~H"""
    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
