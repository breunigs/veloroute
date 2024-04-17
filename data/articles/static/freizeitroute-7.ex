defmodule Data.Article.Static.Freizeitroute7 do
  use Article.Static

  def id(), do: "FR7"
  def route_group(), do: :freizeit
  def title(), do: "Harburger Berge (FR7)"

  def color(), do: "#006106"
  def color_faded(), do: "#77ba7b"

  def summary(),
    do: "Video und Beschreibung zur Freizeit Radroute „Harburger Berge“ (FR7)"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "Harburger Berge",
        direction: :forward,
        from: "Harburger Rathaus",
        to: "Harburger Berge",
        parent_ref: __MODULE__,
        text: "vom Harburger Rathaus in die Harburger Berge",
        historic: %{
          "53788aa9b7f9d5e55ae0c10ab8b532c2" => ~d[2024-03],
          "9c89119a863209d6cbacac9911a81bb7" => ~d[2021-04]
        },
        videos: [
          {"2024-03-30-fr6-fr7/GX017016", "00:00:28.462", :end},
          {"2024-03-30-fr6-fr7/GX017017", :start, "00:01:06.433"},
          {"2024-03-30-fr6-fr7/GX017019", "00:07:06.159", "00:07:13.099"},
          {"2024-03-30-fr6-fr7/GX017017", "00:01:14.775", "00:01:43.770"},
          {"2024-03-30-fr6-fr7/GX017017", "00:01:52.346", "00:07:45.565"},
          {"2024-03-30-fr6-fr7/GX017017", "00:07:55.275", :end}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "Harburger Berge",
        direction: :backward,
        from: "Harburger Berge",
        to: "Harburger Rathaus",
        parent_ref: __MODULE__,
        text: "von den Harburger Bergen zum Harburger Rathaus",
        historic: %{
          "44bfb25e78ea6b0e384602f3970e1a2f" => ~d[2024-03],
          "bee14c93babd1e32fcbb131eedf34fd5" => ~d[2021-04]
        },
        videos: [
          {"2024-03-30-fr6-fr7/GX017018", :start, :end},
          {"2024-03-30-fr6-fr7/GX017019", :start, "00:06:56.082"},
          {"2024-03-30-fr6-fr7/GX017019", "00:07:24.210", :end},
          {"2024-03-30-fr6-fr7/GX017020", :start, :end},
          {"2024-03-30-fr6-fr7/GX017021", :start, :end},
          {"2024-03-30-fr6-fr7/GX017022", :start, :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294578/radtour-harburg-harburger-berge/"},
      {"Komoot Routenplaner: in die Harburger Berge",
       "https://www.komoot.com/de-de/tour/227478972"},
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
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
