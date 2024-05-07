defmodule Data.Article.Static.Alltagsroute9 do
  use Article.Static

  def id(), do: "9"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 9"

  def color(), do: "#9d2928"

  def summary(),
    do: "Alltagsroute 9 führt vom Rathaus nach Bergedorf"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "9 Bergedorf",
        direction: :forward,
        from: "Innenstadt",
        to: "Bergedorf",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Bergedorf",
        historic: %{
          "2b20b4188c88397e498b71b7b4afea60" => ~d[2024-05],
          "90542232243953b0fa05742042bb935c" => ~d[2023-05],
          "5f3fd921c2d6569012c2118a1a5e1d31" => ~d[2022-04],
          "567ae7e915fff4f8a5987f41b1d9f57f" => ~d[2021-06]
        },
        videos: [
          {"2024-05-02-vr7/GX017365", :start, "00:00:25.192",
           vf: "rotate=enable='gte(t,3)':angle=-0.8/t"},
          {"2024-05-06-vr9/GX017440", "00:00:00.701", :end},
          {"2024-05-06-vr9/GX017441", :start, :end},
          {"2024-05-06-vr9/GX017442", :start, :end},
          {"2024-05-06-vr9/GX017443", :start, :end},
          {"2024-05-06-vr9/GX017444", :start, :end},
          {"2024-05-06-vr9/GX017445", :start, :end},
          {"2024-05-06-vr9/GX017447", :start, "00:00:10.675"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "9 Bergedorf",
        direction: :backward,
        from: "Bergedorf",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Bergedorf in die Innenstadt",
        historic: %{
          "cb6d5b72f7c74ae524e057636029d75b" => ~d[2024-05],
          "6367ea206d3ed2850baad0a3910f0de7" => ~d[2023-05],
          "62ec2031bfb3e36f91731bc150672a5e" => ~d[2022-04],
          "e10fc9b56544e6792f2c36bbf479f7de" => ~d[2021-06]
        },
        videos: [
          {"2024-05-06-vr9/GX017447", "00:00:22.018", "00:00:29.263"},
          {"2024-05-06-vr9/GX017450", "00:00:02.102", :end},
          {"2024-05-06-vr9/GX017451", :start, :end},
          {"2024-05-06-vr9/GX017452", :start, "00:00:57.190"},
          {"2024-05-06-vr9/GX017453", :start, :end},
          {"2024-05-06-vr9/GX017454", :start, :end},
          {"2024-05-06-vr9/GX017455", :start, :end},
          {"2024-05-06-vr9/GX017456", :start, :end},
          {"2024-05-06-vr9/GX017457", :start, :end},
          {"2024-05-06-vr9/GX017458", :start, "00:00:19.019"},
          {"2024-05-02-vr7/GX017398", "00:00:31.465", "00:00:39.706"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/426734/veloroute-9/"},
      {"Komoot Routenplaner: nach Bergedorf", "https://www.komoot.com/de-de/tour/225135288"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/229823"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="13" style="background-image: url(/images/route9.svg)">
          <.icon>9</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.993833} lat={53.550924} dir="forward" ref="9" highlight="Rathausmarkt">Rathaus</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>7</.icon>
          <.icon>8</.icon>
        </td>
        <td><.v bounds="10.001344,53.54857,10.012683,53.555924" lon={10.005096} lat={53.551678} dir="forward" ref="9">Hauptbahnhof</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.996321,53.533251,10.042449,53.55335" lon={10.025175} lat={53.539818} dir="forward" ref="9">Hammerbrook</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR5</.icon>
          <.icon>FR6</.icon>
          <.icon>FR11</.icon>
        </td>
        <td><.v bounds="10.014536,53.514916,10.085184,53.54875" lon={10.031814} lat={53.533813} dir="forward" ref="9">Rothenburgsort</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.046612,53.511643,10.115238,53.539686" lon={10.070447} lat={53.526582} dir="forward" ref="9">Billbrook</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.05662,53.487065,10.148226,53.53134" lon={10.093425} lat={53.514654} dir="forward" ref="9">Billwerder-Moorfleet</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR11</.icon>
        </td>
        <td><.v bounds="10.091461,53.482151,10.208285,53.52026" lon={10.132656} lat={53.498364} dir="forward" ref="9">Mittlerer Landweg</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.129129,53.473917,10.199398,53.50286" lon={10.158331} lat={53.490722} dir="forward" ref="9">Neuallermöhe</.v></td>
      </tr>
      <tr>
        <td>
          <.icon name="rsw-geesthacht" bounds="10.181904,53.471171,10.25402,53.49209" lon={10.185906} lat={53.486877} dir="forward">RSW</.icon>
        </td>
        <td><.v bounds="10.165734,53.47197,10.205238,53.501956" lon={10.181091} lat={53.488272} dir="forward" ref="9">Nettelnburg</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR4</.icon>
          <.icon>8</.icon>
        </td>
        <td><.v bounds="10.192215,53.480637,10.225609,53.498853" lon={10.206561} lat={53.48894} dir="forward" ref="9">Bergedorf</.v></td>
      </tr>
      <tr>
        <td></td>
        <td class="dir"><.v bounds="10.20543,53.47785,10.272808,53.508133" lon={10.234991} lat={53.496298} dir="forward" ref="FR4">(Wentorf)</.v></td>
      </tr>
      <tr>
        <td></td>
        <td class="dir"><.m bounds="10.180119,53.474427,10.287147,53.533122">(Reinbek)</.m></td>
      </tr>
    </table>

    <p>Die Alltagsroute 9 (auch: Veloroute 9 oder Radroute 9) führt vom <.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.994001} lat={53.550809} dir="forward" ref="9" highlight="Rathausmarkt">Rathaus</.v> in Richtung Südosten nach <.v bounds="10.195148,53.485948,10.218407,53.499701" lon={10.208244} lat={53.490393} dir="forward" ref="8">Bergedorf</.v>. Dies passiert zu einem großen Teil auf autofreien wegen an Industriegebieten oder Grünflächen. Letztere sind nachts nicht beleuchtet. Einen großen Teil der Strecke teilt sie sich mit der <.a name="rsw-geesthacht">Radroute Plus nach Geesthacht</.a>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Sie sind meist asphaltiert.</p>

    <h4>Meinung</h4>
    <p>Da die Route oft abseits dichter Bebauung verläuft kommt sie mit wenigen Ampeln aus und ermöglicht so schnelles vorankommen. Abends oder nachts ist sie durch ihre fehlende Beleuchtung allerdings wenig attraktiv. Aus Bergedorf stellt sie die schnellere Alternative zur <.a name="alltagsroute-8">Radroute 8</.a> dar.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
