defmodule Data.Article.Static.Freizeitroute12 do
  use Article.Static

  def id(), do: "FR12"
  def route_group(), do: :freizeit
  def title(), do: "Tarpenbekradweg (FR12)"

  def color(), do: "#006106"
  def color_faded(), do: "#77ba7b"

  def summary(),
    do: "Freizeitroute 12 führt entlang der Tarpenbek nach Garstedt"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "Tarpenbekradweg",
        direction: :forward,
        from: "Lattenkamp",
        to: "Garstedt",
        parent_ref: __MODULE__,
        text: "entlang der Tarpenbek nach Garstedt",
        historic: %{
          "4ef30f7ec91cd9a62bca863457b19791" => ~d[2024-03],
          "5664efe2e6b29770db42231be814d95d" => ~d[2021-04]
        },
        videos: [
          {"2024-03-14-fr12-fr1a/GX016845", :start, "00:03:28.442"},
          {"2024-03-14-fr12-fr1a/GX016845", "00:03:34.915", :end},
          {"2024-03-14-fr12-fr1a/GX016846", :start, :end},
          {"2024-03-14-fr12-fr1a/GX016847", :start, :end},
          {"2024-03-14-fr12-fr1a/GX016848", :start, :end},
          {"2024-03-14-fr12-fr1a/GX016849", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "Tarpenbekradweg",
        direction: :backward,
        from: "Garstedt",
        to: "Lattenkamp",
        parent_ref: __MODULE__,
        text: "entlang der Tarpenbek zum Lattenkamp",
        historic: %{
          "96217cd176e871908426e8b7fb3f1a5b" => ~d[2024-03],
          "8b859d67fa2d9cedcd5df2e305e426cf" => ~d[2021-04]
        },
        videos: [
          {"2024-03-14-fr12-fr1a/GX016850", :start, :end},
          {"2024-03-14-fr12-fr1a/GX016851", :start, :end},
          {"2024-03-14-fr12-fr1a/GX016852", :start, "00:02:57.144"},
          {"2024-03-14-fr12-fr1a/GX016852", "00:03:06.720", "00:06:33.793"},
          {"2024-03-14-fr12-fr1a/GX016852", "00:06:45.872", :end},
          {"2024-03-14-fr12-fr1a/GX016853", :start, :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294586/radtour-alsterlauf-tarpenbek-langenhorn/"},
      {"Komoot Routenplaner: entlang der Tarpenbek",
       "https://www.komoot.com/de-de/tour/227482526"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/5821671"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 12 – Tarpenbekradweg <.icon>FR12</.icon></h3>
    <span class="updated">Länge rund 14km (+5km bis zur Innenstadt)</span>

    <p>Die Tour beginnt am <.v bounds="9.985424,53.595857,9.998391,53.601647" lon={9.992583} lat={53.599168} dir="forward" ref={@ref}>Lattenkamp</.v>, lässt sich aber mit einer Fahrt um die Außenalster ergänzen. Bis zum <.v bounds="9.959435,53.612511,9.979618,53.627382" lon={9.967577} lat={53.615979} dir="forward" ref={@ref}>Flughafen</.v> folgt man der Tarpenbek, die dort in einem Rohr unter der Landebahn fließt. Mit dem Rad fährt man stattdessen <.v bounds="9.967811,53.614742,10.014486,53.624708" lon={9.994048} lat={53.61962} dir="forward" ref={@ref}>nach Osten</.v> um am Flughafen vorbeizukommen. Über <.v bounds="9.990546,53.625224,10.013622,53.662223" lon={10.000591} lat={53.649747} dir="forward" ref={@ref}>verschiedene Grünanlagen</.v> gelangt man letztlich <.v bounds="9.988175,53.665365,10.001593,53.682097" lon={9.991246} lat={53.666542} dir="forward" ref={@ref}>wieder zur Tarpenbek</.v> und folgt dieser bis <.v bounds="9.992926,53.677008,10.000502,53.6817" lon={9.994644} lat={53.677988} dir="forward" ref={@ref}>zur Landesgrenze</.v>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht durchgehend beschildert und es gibt einige schwierig zu navigierende Stellen. In den Grünabschnitten bzw. Parks gibt es aber meist einen naheliegenden Weg. Ein Navi ist zwar hilfreich, aber mit etwas Vorbereitung könnte es auch ohne gehen.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Wege sind meist aus Feinschotter, zwischendurch gibt es immer mal wieder befestigte Abschnitte. Stellenweise ist die Route gut besucht und die Wege zu schmal um zu überholen. Hier muss man entweder Schrittgeschwindigkeit fahren oder schieben. Sei bitte exzellent zu Anderen und steige ab bevor es brenzlig wird.</p>

    <h4>Meinung</h4>
    <p>Die Route ist schön und in sich stimmig. Wer es nicht eilig hat kann die Route abseits des Autoverkehrs genießen. Ausnahme bildet der <.v bounds="9.990835,53.617861,10.010534,53.62397" lon={9.996549} lat={53.620475} dir="forward" ref={@ref}>Weg beim Jäger</.v>, der mit wenig Grün daherkommt und wo die Radwege einfach im Nichts enden. Die <.v bounds="10.008442,53.621868,10.014844,53.625248" lon={10.009999} lat={53.623919} dir="forward" ref={@ref}>anschließende Kreuzung</.v> ist fahrradfeindlich – wer sich hier verfährt wird mit mehreren Minuten Wartezeit bestraft. Wer diesen Abschnitt nicht mag kann den Flughafen stattdessen <.m bounds="9.954241,53.613989,9.977322,53.625393">auf der Westseite</.m> umfahren und über den <.m bounds="9.971521,53.643221,9.991455,53.654183">Krohnstieg-Tunnel</.m> der Tarpenbek weiter folgen.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
