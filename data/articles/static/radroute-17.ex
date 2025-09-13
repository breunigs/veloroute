defmodule Data.Article.Static.Radroute17 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-17"
  def display_id(), do: "17"
  def title(), do: "Radroute 17"
  def color(), do: RouteColors.red1()

  def summary(),
    do:
      "Radroute 17 verbindet das UKE mit Hamm. Die Strecke verläuft dabei in einem leichten Bogen und bindet die östlichen Stadtteile an, die etwas weiter von der Außenalster entfernt sind."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "17",
        direction: :forward,
        from: "Geschwister-Scholl-Straße",
        to: "Hamm",
        parent_ref: __MODULE__,
        text: "vom UKE nach Hamm",
        historic: %{
          "e0066291c967c52a0e8eb904cb3a5d46" => ~d[2025-06],
          "05894a2ed20453acdb96288ee0dfd087" => ~d[2025-02]
        },
        videos: [
          {"2025-02-16-mitte/GX018077", :start, :end},
          {"2025-02-16-mitte/GX018078", :start, :end},
          {"2025-02-16-mitte/GX018079", :start, :end},
          {"2025-02-16-mitte/GX018080", :start, "00:00:02.681"},
          {"2025-02-16-mitte/GX018081", :start, "00:00:17.587"},
          {"2025-02-16-mitte/GX018082", :start, :end},
          {"2025-02-16-mitte/GX018083", :start, :end},
          {"2025-02-16-mitte/GX018084", :start, :end},
          {"2025-02-16-mitte/GX018085", :start, :end},
          {"2025-02-16-mitte/GX018086", :start, :end},
          {"2025-02-16-mitte/GX018087", :start, "00:00:00.968"},
          {"2025-06-15-rando/GX018528", "00:00:00.601", :end},
          {"2025-06-15-rando/GX018529", :start, :end},
          {"2025-06-15-rando/GX018530", :start, "00:00:15.115"},
          {"2025-02-16-mitte/GX018089", "00:00:15.782", :end},
          {"2025-02-16-mitte/GX018090", :start, :end},
          {"2025-02-16-mitte/GX018091", :start, "00:00:12.579"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "17",
        direction: :backward,
        from: "Hamm",
        to: "Geschwister-Scholl-Straße",
        parent_ref: __MODULE__,
        text: "von Hamm zum UKE",
        historic: %{
          "2788220b644820c6e7be25989f2d43b5" => ~d[2025-06],
          "95e4081d3405c78a6e9a5b6f422f2572" => ~d[2025-02]
        },
        videos: [
          {"2025-02-16-mitte/GX018091", "00:00:12.579", "00:00:48.916"},
          {"2025-06-15-rando/GX018522", "00:00:18.619", :end},
          {"2025-06-15-rando/GX018523", :start, :end},
          {"2025-06-15-rando/GX018524", :start, :end},
          {"2025-06-15-rando/GX018525", "00:00:00.501", "00:00:17.317"},
          {"2025-02-16-mitte/GX018094", "00:00:27.594", "00:00:33.540"},
          {"2025-02-16-mitte/GX018095", :start, :end},
          {"2025-02-16-mitte/GX018096", :start, "00:00:04.561"},
          {"2024-06-20-14im-13gg/GX017824", "00:00:03.570", "00:00:09.408"},
          {"2024-06-20-14im-13gg/GX017825", :start, "00:00:22.685"},
          {"2024-06-20-14im-13gg/GX017826", :start, "00:00:21.755"},
          {"2025-02-16-mitte/GX018103", "00:00:27.628", "00:00:36.047"},
          {"2025-02-16-mitte/GX018104", :start, :end},
          {"2025-02-16-mitte/GX018105", :start, "00:00:04.094"},
          {"2025-02-16-mitte/GX018105", "00:00:48.060", "00:00:57.647"},
          {"2025-02-16-mitte/GX018106", :start, :end},
          {"2025-02-16-mitte/GX018107", :start, "00:00:26.535"},
          {"2025-02-16-mitte/GX018071", "00:00:43.802", :end},
          {"2025-02-16-mitte/GX018072", :start, "00:00:12.254"},
          {"2025-02-16-mitte/GX018073", :start, :end},
          {"2025-02-16-mitte/GX018074", :start, :end},
          {"2025-02-16-mitte/GX018075", :start, "00:00:33.667"}
        ]
      }
    ]

  def links(_assigns) do
    [{"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643643"}]
  end

  def text(assigns) do
    ~H"""
    <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-17</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon>br-nord-n7</.icon><.icon>br-nord-n6</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.964992,53.582081,9.998056,53.597674" lon={9.978094} lat={53.59424} dir="forward" ref={@ref} highlight="UKE,Universitätsklinikum Eppendorf">UKE</.v></td>
      </tr>
      <tr>
        <td><.icon>br-nord-n2</.icon><.icon>radroute-16</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.977545,53.583751,10.003633,53.598911" lon={9.987054} lat={53.590269} dir="forward" ref={@ref}>Eppendorf</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="9.985561,53.581004,10.016733,53.595026" lon={9.996742} lat={53.588373} dir="forward" ref={@ref}>Alster</.v></td>
      </tr>
      <tr>
        <td><.icon>br-nord-n5</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.989723,53.569451,10.037628,53.598632" lon={10.007019} lat={53.584787} dir="forward" ref={@ref}>Winterhude</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.007139,53.576124,10.031847,53.586655" lon={10.019197} lat={53.582373} dir="forward" ref={@ref}>Osterbekkanal</.v></td>
      </tr>
      <tr>
        <td><.icon>FR2</.icon><.icon>FR3</.icon><.icon>br-nord-n4</.icon><.icon>radroute-12</.icon><.icon>radroute-6</.icon><.icon>radroute-5</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.00869,53.558584,10.068238,53.596449" lon={10.024617} lat={53.577189} dir="forward" ref={@ref}>Barmbek-Süd</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.031313,53.563978,10.057161,53.576764" lon={10.039722} lat={53.570979} dir="forward" ref={@ref}>Eilbekkanal</.v></td>
      </tr>
      <tr>
        <td><.icon>br-wandsbek-w1</.icon><.icon>radroute-7</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.02911,53.56041,10.063795,53.579883" lon={10.042522} lat={53.568886} dir="forward" ref={@ref}>Eilbek</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-1</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.016085,53.541857,10.072816,53.576033" lon={10.041672} lat={53.55962} dir="forward" ref={@ref}>Hamm</.v></td>
      </tr>
    </table>

    <p>Radroute 17 verbindet das <.v bounds="9.964992,53.582081,9.998056,53.597674" lon={9.978094} lat={53.59424} dir="forward" ref={@ref} highlight="UKE,Universitätsklinikum Eppendorf">UKE (Universitätsklinikum Eppendorf)</.v> mit dem Stadtteil <.v bounds="10.016085,53.541857,10.072816,53.576033" lon={10.041672} lat={53.55962} dir="forward" ref={@ref}>Hamm</.v>. Die Route verläuft in einem leichten Bogen meist östlicher der Alster. Sie bindet damit die Stadtteile ans Radnetz an, die nicht direkt am Alsterufer liegen.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Asphalt und Betonplatten halten sich in etwa die Waage. Es gibt kurze Abschnitte mit Kopfsteinpflaster.</p>

    <h4>Meinung</h4>
    <p>Die Route ist bisher an nur wenigen Stellen ausgebaut und dort auch nur mit mäßigem Erfolg – man setzt <.ref>Schutzstreifen</.ref> statt ordentlicher Lösungen.</p>

    <p>Wegen dem Zickzackkurs über Nebenstraßen fehlt auch eine Durchgängigkeit. Das bremst aus und macht die Wegfindung schwierig. Das ließe sich nur durch Vorfahrt entlang der Radroute an jeder Kreuzung ändern – das ist jedoch kaum realistisch.</p>


    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
