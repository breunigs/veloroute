defmodule Data.Article.Static.NorderstedtVeloroute4 do
  use Article.Static

  def id(), do: "norderstedt-4"
  def display_id(), do: "4"
  def route_group(), do: :alltag
  def title(), do: "Norderstedt: Veloroute 4"

  def color(), do: "#d14a1f"

  def summary(),
    do: "Veloroute 4 führt von Garstedt nach Glashütte"

  def tags(), do: [id(), "norderstedt"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "norderstedt 4",
        direction: :forward,
        from: "Garstedt",
        to: "Glashütte",
        parent_ref: __MODULE__,
        text: "von Garstedt nach Glashütte",
        videos: [
          {"2022-05-28-norderstedt/GX014070", "00:01:58.885", "00:02:50.937"},
          {"2022-05-28-norderstedt/GX014073", "00:00:01.568", "00:00:03.403"},
          {"2022-05-28-norderstedt/GX014074", :start, :end},
          {"2022-05-28-norderstedt/GX014075", :start, :end},
          {"2022-05-28-norderstedt/GX014076", :start, "00:00:01.802"},
          {"2022-05-28-norderstedt/GX014077", "00:00:01.468", :end},
          {"2022-05-28-norderstedt/GX014078", :start, "00:00:43.644"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "norderstedt 4",
        direction: :backward,
        from: "Glashütte",
        to: "Garstedt",
        parent_ref: __MODULE__,
        text: "von Glashütte nach Garstedt",
        videos: [
          {"2022-05-28-norderstedt/GX014079", "00:00:02.736", :end},
          {"2022-05-28-norderstedt/GX014080", :start, "00:00:56.456"},
          {"2022-05-28-norderstedt/GX014081", "00:00:03.103", :end},
          {"2022-05-28-norderstedt/GX014082", :start, "00:00:00.901"},
          {"2022-05-28-norderstedt/GX014070", "00:00:01.468", "00:00:51.418"}
        ]
      }
    ]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h3>Norderstedt: Veloroute 4</h3>
    <.roaddiagram src="logo-norderstedt-4" width="100" alt="Logo der Veloroute 4 in Norderstedt" style="float: right; padding: 0 0 1rem 1rem"/>

    <p>Die Veloroute führt von <.m bounds="9.977046,53.679559,9.988665,53.684982" lon="9.980631" lat="53.682232" dir="forward" ref="norderstedt-4">Garstedt</.m> entlang der <.m bounds="9.985277,53.679645,9.999215,53.682982" lon="9.991317" lat="53.681592" dir="forward" ref="norderstedt-4">Ochsenzoller Straße</.m> und der <.m bounds="10.007605,53.681698,10.037713,53.689052" lon="10.014211" lat="53.683523" dir="forward" ref="norderstedt-4">Segeberger Chaussee</.m> nach <.m bounds="10.024115,53.685393,10.045516,53.695013" lon="10.035206" lat="53.687964" dir="forward" ref="norderstedt-4">Glashütte</.m>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nur dort ausgeschildert, wo sich verschiedene Radrouten treffen. Die Wegweiser sind klein und häufig außerhalb des Blickfelds angebracht, z.B. in Fahrtrichtung hinter dem Pfosten. Es muss daher an jeglichen Rad-Wegweisern genau geschaut werden. Da die Route aber im Wesentlichen nur geradeaus führt, ist es sehr leicht ihr zu folgen.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Route ist durchgehend befestigt, meist mit in die Jahre gekommenen Pflaster. Häufig stehen eigene Radwege zur Verfügung, teilweise müssen sich Fuß- und Radverkehr auf <.m bounds="10.02388,53.684615,10.031099,53.687483" lon="10.025608" lat="53.685847" dir="forward" ref="norderstedt-4">schmalen Abschnitten</.m> jedoch den Platz teilen.</p>

    <h4>Meinung</h4>
    <p>Durch ihre Führung an einer lauten KFZ-Straße ist die Veloroute nur bedingt attraktiv. Dafür kommt man schnell voran, auch wenn die Wartezeiten an der Kreuzung mit der  <.m bounds="10.024017,53.683007,10.04304,53.693039" lon="10.029904" lat="53.686541" dir="forward" ref="norderstedt-4">Poppenbütteler Straße</.m> teils lang sind. In der aktuellen Führung würde ein durchgängiger Ausbau der Radwege aus Asphalt den Komfort erhöhen, selbst wenn weiterhin Engstellen verbleiben.</p>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
