defmodule Data.Article.Static.Freizeitroute7 do
  use Article.Static

  def id(), do: "FR7"
  def route_group(), do: :freizeit
  def title(), do: "Harburger Berge (FR7)"

  def color(), do: "#006106"

  def summary(),
    do: "Video und Beschreibung zur Freizeit Radroute „Harburger Berge“ (FR7)"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        group: "Harburger Berge",
        direction: :forward,
        from: "Harburger Rathaus",
        to: "Harburger Berge",
        parent_ref: __MODULE__,
        text: "vom Harburger Rathaus in die Harburger Berge",
        videos: [
          {"2021-04-17-freizeitrouten-6und-7/GX011284", "00:00:01.869", :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011285", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011286", :start, "00:00:15.782"},
          {"2021-04-17-freizeitrouten-6und-7/GX011287", "00:00:00.400", "00:01:15.242"},
          {"2021-04-17-freizeitrouten-6und-7/GX011288", "00:00:01.401", :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011289", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011290", :start, "00:00:29.830"},
          {"2021-04-17-freizeitrouten-6und-7/GX011291", "00:00:00.901", "00:00:47.681"},
          {"2021-04-17-freizeitrouten-6und-7/GX011292", "00:00:04.004", :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011293", :start, "00:01:42.002"},
          {"2021-04-17-freizeitrouten-6und-7/GX011294", "00:00:02.769", "00:00:15.482"}
        ]
      },
      %Video.Track{
        group: "Harburger Berge",
        direction: :backward,
        from: "Harburger Berge",
        to: "Harburger Rathaus",
        parent_ref: __MODULE__,
        text: "von den Harburger Bergen zum Harburger Rathaus",
        videos: [
          {"2021-04-17-freizeitrouten-6und-7/GX011294", "00:00:17.784", :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011295", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX021295", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011296", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011297", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011298", :start, :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294578/radtour-harburg-harburger-berge/"},
      {"Komoot Routenplaner: in die Harburger Berge", "https://www.komoot.de/tour/227478972"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/9064960"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 7 – Harburger Berge <.icon>FR7</.icon></h3>
    <span class="updated">Länge rund 12km</span>

    <p>Nach rund 2,5km auf Harburger Stadtgebiet befindet man sich schon im bewaldteten und – für norddeutsche Verhältnisse – bergigen Gebiet. Rund 200 Höhenmeter sind auf der nur 12km langen Strecke zu überwinden.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und viele der Waldwege haben auch keine herkömmlichen Wegweiser. Wer eine bestimmte Strecke abfahren möchte, sollte ein Navi mitnehmen. Man kann aber auch nach Gefühl fahren, da die exakten Wege im Waldgebiet nicht so wichtig sind.</p>


    <h4>Befahrbarkeit</h4>
    <p>Außerhalb der Stadtgebiete führt die Route über gute bis mäßige naturnahe Waldwege. Mit Laub, Erde und groben Schotter ist zu rechnen, wobei die meisten Wege aber in Grand ausgeführt sind. Die teils größeren Steigungen machen je nach Kondition Schieben erforderlich.</p>

    <h4>Meinung</h4>
    <p>Die Waldgebiete sind schön und einen Ausflug wert, auch abseits dieser Route. Die Abschnitte durch die bebauten Gebiete lohnen sich nicht, wer hier anders plant verpasst nichts. </p>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
