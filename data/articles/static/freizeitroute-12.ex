defmodule Data.Article.Static.Freizeitroute12 do
  use Article.Static

  def id(), do: "FR12"
  def route_group(), do: :freizeit
  def title(), do: "Tarpenbekradweg (FR12)"

  def color(), do: "#006106"

  def summary(),
    do: "Freizeitroute 12 führt entlang der Tarpenbek nach Garstedt"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        group: "Tarpenbekradweg",
        direction: :forward,
        from: "Lattenkamp",
        to: "Garstedt",
        parent_ref: __MODULE__,
        text: "entlang der Tarpenbek nach Garstedt",
        videos: [
          {"2021-04-04-freizeitroute-12-speedup-5x/GX011155", "00:00:04.338", "00:00:16.783"},
          {"2021-04-04-freizeitroute-12-speedup-5x/GX011157", :start, "00:01:48.342"},
          {"2021-04-04-freizeitroute-12-speedup-5x/GX011158", "00:00:00.234", "00:00:23.490"},
          {"2021-04-04-freizeitroute-12-speedup-5x/GX011159", "00:00:00.601", "00:02:33.587"},
          {"2021-04-04-freizeitroute-12-speedup-5x/GX011160", "00:00:00.100", "00:00:50.083"},
          {"2021-04-04-freizeitroute-12-speedup-5x/GX011161", "00:00:00.100", :end},
          {"2021-04-04-freizeitroute-12-speedup-5x/GX011162", :start, "00:00:01.802"},
          {"2021-04-04-freizeitroute-12-speedup-5x/GX011164", "00:00:14.081", "00:01:15.642"},
          {"2021-04-04-freizeitroute-12-speedup-5x/GX011164", "00:01:21.281", :end},
          {"2021-04-04-freizeitroute-12-speedup-5x/GX011165", :start, "00:03:02.282"}
        ]
      },
      %Video.Track{
        group: "Tarpenbekradweg",
        direction: :backward,
        from: "Garstedt",
        to: "Lattenkamp",
        parent_ref: __MODULE__,
        text: "entlang der Tarpenbek zum Lattenkamp",
        videos: [
          {"2021-04-04-freizeitroute-12-speedup-5x/GX011165", "00:03:04.084", "00:03:06.720"},
          {"2021-04-04-freizeitroute-12-realtime/GX011166.MP4_time_lapse.mkv", "00:00:17.384",
           "00:01:26.286"},
          {"2021-04-04-freizeitroute-12-realtime/GX011166.MP4_time_lapse.mkv", "00:01:37.464",
           :end},
          {"2021-04-04-freizeitroute-12-realtime/GX021166.MP4_time_lapse.mkv", :start, :end},
          {"2021-04-04-freizeitroute-12-realtime/GX011167.MP4_time_lapse.mkv", :start, :end},
          {"2021-04-04-freizeitroute-12-realtime/GX011168.MP4_time_lapse.mkv", :start, :end},
          {"2021-04-04-freizeitroute-12-realtime/GX011169.MP4_time_lapse.mkv", :start,
           "00:00:49.883"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011612", "00:00:04.037", "00:01:46.573"},
          {"2021-04-04-freizeitroute-12-realtime/GX011171.MP4_time_lapse.mkv", "00:00:05.772",
           "00:00:41.909"},
          {"2021-04-04-freizeitroute-12-realtime/GX011171.MP4_time_lapse.mkv", "00:00:44.178",
           :end},
          {"2021-04-04-freizeitroute-12-speedup-5x/GX011172", :start, "00:01:28.288"},
          {"2021-04-04-freizeitroute-12-speedup-5x/GX011156", "00:00:11.411", "00:00:12.045"},
          {"2021-04-04-freizeitroute-12-speedup-5x/GX011172", "00:01:46.273", :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294586/radtour-alsterlauf-tarpenbek-langenhorn/"},
      {"Komoot Routenplaner: entlang der Tarpenbek", "https://www.komoot.de/tour/227482526"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/5821671"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 12 – Tarpenbekradweg <.icon>FR12</.icon></h3>
    <span class="updated">Länge rund 14km (+5km bis zur Innenstadt)</span>

    <p>Die Tour beginnt am <.m bounds="9.985424,53.595857,9.998391,53.601647" lon="9.992583" lat="53.599168" dir="forward">Lattenkamp</.m>, lässt sich aber mit einer Fahrt um die Außenalster ergänzen. Bis zum <.m bounds="9.959435,53.612511,9.979618,53.627382" lon="9.967577" lat="53.615979" dir="forward">Flughafen</.m> folgt man der Tarpenbek, die dort in einem Rohr unter der Landebahn fließt. Mit dem Rad fährt man stattdessen <.m bounds="9.967811,53.614742,10.014486,53.624708" lon="9.994048" lat="53.61962" dir="forward">nach Osten</.m> um am Flughafen vorbeizukommen. Über <.m bounds="9.990546,53.625224,10.013622,53.662223" lon="10.000591" lat="53.649747" dir="forward">verschiedene Grünanlagen</.m> gelangt man letztlich <.m bounds="9.988175,53.665365,10.001593,53.682097" lon="9.991246" lat="53.666542" dir="forward">wieder zur Tarpenbek</.m> und folgt dieser bis <.m bounds="9.992926,53.677008,10.000502,53.6817" lon="9.994644" lat="53.677988" dir="forward">zur Landesgrenze</.m>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht durchgehend beschildert und es gibt einige schwierig zu navigierende Stellen. In den Grünabschnitten bzw. Parks gibt es aber meist einen naheliegenden Weg. Ein Navi ist zwar hilfreich, aber mit etwas Vorbereitung könnte es auch ohne gehen.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Wege sind meist aus Feinschotter, zwischendurch gibt es immer mal wieder befestigte Abschnitte. Stellenweise ist die Route gut besucht und die Wege zu schmal um zu überholen. Hier muss man entweder Schrittgeschwindigkeit fahren oder schieben. Sei bitte exzellent zu Anderen und steige ab bevor es brenzlig wird.</p>

    <h4>Meinung</h4>
    <p>Die Route ist schön und in sich stimmig. Wer es nicht eilig hat kann die Route abseits des Autoverkehrs genießen. Ausnahme bildet der <.m bounds="9.990835,53.617861,10.010534,53.62397" lon="9.996549" lat="53.620475" dir="forward">Weg beim Jäger</.m>, der mit wenig Grün daherkommt und wo die Radwege einfach im Nichts enden. Die <.m bounds="10.008442,53.621868,10.014844,53.625248" lon="10.009999" lat="53.623919" dir="forward">anschließende Kreuzung</.m> ist fahrradfeindlich – wer sich hier verfährt wird mit mehreren Minuten Wartezeit bestraft. Wer diesen Abschnitt nicht mag kann den Flughafen stattdessen <.m bounds="9.954241,53.613989,9.977322,53.625393">auf der Westseite</.m> umfahren und über den <.m bounds="9.971521,53.643221,9.991455,53.654183">Krohnstieg-Tunnel</.m> der Tarpenbek weiter folgen.</p>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
