defmodule Data.Article.Static.Freizeitroute6 do
  use Article.Static

  def id(), do: "FR6"
  def route_group(), do: :freizeit
  def title(), do: "Elbbrücken (FR6)"

  def color(), do: "#006106"
  def color_faded(), do: "#77ba7b"

  def summary(),
    do: "Die Radtour „Elbbrücken“ führt über Wilhelmsburg in die Harburger Berge"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "Elbbrücken",
        direction: :forward,
        from: "Hauptbahnhof",
        to: "Harburger Berge",
        parent_ref: __MODULE__,
        text: "vom Hauptbahnhof in die Harburger Berge",
        historic: %{
          "fafd30ac381066a3abea469a0b4759db" => ~d[2024-03],
          "3e9632801a744419aa7606acae44cac4" => ~d[2021-07]
        },
        videos: [
          {"2024-03-26-fr5/GX016951", :start, :end},
          {"2024-03-26-fr5/GX016952", :start, :end},
          {"2024-03-26-fr5/GX016953", :start, :end},
          {"2024-03-26-fr5/GX016954", :start, :end},
          {"2024-03-26-fr5/GX016955", :start, :end},
          {"2024-03-26-fr5/GX016956", :start, :end},
          {"2024-03-26-fr5/GX016957", :start, :end},
          {"2024-03-30-fr6-fr7/GX017005", :start, :end},
          {"2024-03-30-fr6-fr7/GX017006", :start, :end},
          {"2024-03-30-fr6-fr7/GX017007", :start, :end},
          {"2024-03-30-fr6-fr7/GX017008", :start, :end},
          {"2024-03-30-fr6-fr7/GX017009", :start, :end},
          {"2024-03-30-fr6-fr7/GX017010", :start, :end},
          {"2024-03-30-fr6-fr7/GX017011", :start, :end},
          {"2024-03-30-fr6-fr7/GX017012", :start, :end},
          {"2024-03-30-fr6-fr7/GX017013", :start, :end},
          {"2024-03-30-fr6-fr7/GX017014", :start, "00:00:03.437"},
          {"2024-03-30-fr6-fr7/GX017014", "00:00:14.514", "00:02:40.127"},
          {"2024-03-30-fr6-fr7/GX017014", "00:02:51.171", "00:03:44.224"},
          {"2024-03-30-fr6-fr7/GX017015", "00:01:17.277", "00:01:36.229"},
          {"2024-03-30-fr6-fr7/GX017014", "00:04:00.607", :end}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "Elbbrücken",
        direction: :backward,
        from: "Harburger Berge",
        to: "Hauptbahnhof",
        parent_ref: __MODULE__,
        text: "von den Harburger Bergen zum Hauptbahnhof",
        historic: %{
          "ba823ff14dcc320ab707b5613e7fed27" => ~d[2024-03],
          "0f98c32b6fd9d7b907a93cca312c3452" => ~d[2021-07]
        },
        videos: [
          {"2024-03-30-fr6-fr7/GX017015", :start, "00:01:16.543"},
          {"2024-03-30-fr6-fr7/GX017015", "00:01:58.118", "00:05:23.023"},
          {"2024-03-30-fr6-fr7/GX017016", :start, "00:00:27.861"},
          {"2024-03-30-fr6-fr7/GX017023", "00:00:01.101", :end},
          {"2024-03-30-fr6-fr7/GX017024", :start, :end},
          {"2024-03-30-fr6-fr7/GX017025", :start, :end},
          {"2024-03-30-fr6-fr7/GX017026", :start, :end},
          {"2024-03-30-fr6-fr7/GX017027", :start, :end},
          {"2024-03-30-fr6-fr7/GX017028", :start, "00:00:52.252"},
          {"2024-03-26-fr5/GX016961", "00:15:47.547", :end},
          {"2024-03-26-fr5/GX016962", :start, "00:01:17.744"},
          {"2024-03-26-fr5/GX016962", "00:01:26.587", :end},
          {"2024-03-26-fr5/GX016963", :start, "00:00:10.342"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294576/radtour-city-wilhelmsburg-harburger-stadtpark/"},
      {"Komoot Routenplaner: über die Elbbrücken", "https://www.komoot.de/tour/227478472"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/8847600"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 6 – Elbbrücken <.icon>FR6</.icon></h3>
    <span class="updated">Länge rund 21km</span>
    <p>Beginnend am <.v bounds="9.993132,53.549269,10.01548,53.556036" dir="forward" lat={53.5516} lon={10.0056} ref={@ref}>Hauptbahnhof</.v> folgt man grob der <.v lat={53.5449} lon={10.0172} bounds="9.995601,53.536759,10.048165,53.552678" dir="forward" ref={@ref}>Amsinckstraße</.v> um über die <.v dir="forward" lat={53.5346} lon={10.0282} bounds="10.018778,53.527385,10.033289,53.536906" ref={@ref}>Elbbrücken</.v> auf die <.v bounds="10.009405,53.52204,10.032666,53.532834" lon={10.023808} lat={53.530213} dir="forward" ref={@ref}>Veddel</.v> zu gelangen.</p>
    <p>Von dort geht es weiter auf <.v bounds="9.96971,53.47396,10.049128,53.525687" lon={9.991852} lat={53.504458} dir="forward" ref={@ref}>Wilhelmsburg</.v> und durch <.v bounds="9.972304,53.450751,9.994229,53.465226" lon={9.978722} lat={53.461352} dir="forward" ref={@ref}>Harburgs Zentrum</.v>. Der <.v bounds="9.967672,53.439201,9.983253,53.452214" lon={9.978441} lat={53.440041} dir="forward" ref="10">Engelbek</.v> folgend erreicht man schließlich die <.v bounds="9.864695,53.383146,10.003912,53.439215" lon={9.97499} lat={53.421967} dir="forward" ref={@ref}>Landsgrenze kurz vor den Harburger Bergen</.v>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und stellenweise ist die Führung nicht ersichtlich. Ein Navi ist daher empfehlenswert.</p>

    <h4>Befahrbarkeit</h4>
    <p>Zu einem großen Teil ist die Route befestigt, also asphaltiert oder gepflastert. Ausnahmen sind der leicht umfahrbare <.v bounds="9.9775,53.454145,9.982341,53.45807" lon={9.980286} lat={53.456916} dir="forward" ref={@ref}>alte Harburger Friedhof</.v> und eine <.v bounds="9.981074,53.431467,9.984331,53.435518" lon={9.98204} lat={53.433727} dir="forward" ref={@ref}>kleinere Grünfläche</.v> gegen Ende der Tour.</p>
    <p>Viele der Grünanlagen sind stark besucht, sodass hohe Geschwindigkeiten nicht möglich sind. Zu Stau kommt es selten, und falls doch: sei exzellent zu anderen und steige ab, bevor es eng wird.</p>

    <h4>Meinung</h4>
    <p>Die Tour hat einige schöne Stellen, gerade ab Harburgs Innenstadt ist man fast ausschließlich im Grünen unterwegs. Auf den Elbinseln und in Hamburgs Innenstadt ist die Streckenführung jedoch sehr autolastig und weniger empfehlenswert. Hier merkt man, das die Freizeitroute geplant wurde als die Alltagsrouten noch nicht brauchbar ausgebaut waren.</p>

    <p>Eine ähnliche, aber ruhigere Führung ist grob: <.a name="alltagsroute-9">Alltagsroute <.icon link={false}>9</.icon></.a> bis Elbbrücken; Veddel wie gehabt; auf Wilhelmsburg stattdessen der <.a name="alltagsroute-11">Alltagsroute <.icon link={false}>11</.icon></.a> folgen; Rest wie gehabt.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
