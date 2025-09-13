defmodule Data.Article.Static.Radroute2 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-2"
  def display_id(), do: "2"
  def title(), do: "Radroute 2"
  def color(), do: RouteColors.red1()

  def summary(),
    do:
      "Radroute 2 verbindet Eidelstedt mit Bergedorf. Im Westen orientiert sie sich an der Kieler Straße, quert zwischen Binnen- und Außenalster und orientiert sich zunächst an der Norderelbe und schließlich der Bahnlinie."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "2",
        direction: :backward,
        from: "Bergedorf",
        to: "Eidelstedt",
        parent_ref: __MODULE__,
        text: "von Bergedorf nach Eidelstedt",
        historic: %{
          "6239bfa2f98f5250611de0e2d3e316fc" => ~d[2025-08],
          "69678d959518354be36e12c51ef09004" => ~d[2025-02]
        },
        end_action: %{
          action: :play,
          route: Data.Article.Static.Radroute18,
          group: "18",
          direction: :backward
        },
        videos: [
          {"2024-05-06-vr9/GX017447", "00:00:21.722", "00:00:30.225"},
          {"2024-05-06-vr9/GX017450", "00:00:02.603", "00:00:08.907"},
          {"2024-05-06-vr9/GX017451", :start, "00:00:31.098"},
          {"2025-08-16-br-berge/GX018591", "00:00:36.737", "00:00:48.780"},
          {"2025-08-16-br-berge/GX018610", "00:00:01.817", "00:00:09.034"},
          {"2024-05-06-vr9/GX017451", "00:00:47.905", "00:05:46.077"},
          {"2024-05-06-vr9/GX017452", :start, "00:01:07.890"},
          {"2024-05-06-vr9/GX017453", :start, "00:02:29.586"},
          {"2024-05-06-vr9/GX017454", :start, "00:00:09.207"},
          {"2024-05-06-vr9/GX017455", :start, "00:00:10.142"},
          {"2024-05-06-vr9/GX017456", :start, "00:00:05.797"},
          {"2024-03-26-fr5/GX016962", "00:01:32.558", "00:01:34.576"},
          {"2024-03-26-fr5/GX016963", :start, "00:00:02.803"},
          {"2025-02-09-innenstadt/GX017961", "00:00:02.536", "00:00:33.107"},
          {"2025-02-09-innenstadt/GX017962", :start, "00:00:22.914"},
          {"2025-02-09-innenstadt/GX017963", "00:00:00.067", :end},
          {"2025-02-09-innenstadt/GX017964", :start, :end},
          {"2025-02-09-innenstadt/GX017965", :start, "00:00:16.660"},
          {"2025-02-09-innenstadt/GX017966", "00:00:00.267", "00:00:04.838"},
          {"2024-04-21-vr2-rand/GX017222", "00:00:04.671", "00:00:19.416"},
          {"2024-04-21-vr2-rand/GX017223", "00:00:00.067", "00:01:58.061"},
          {"2024-04-21-vr2-rand/GX017224", "00:00:00.033", :end},
          {"2024-04-21-vr2-rand/GX017225", :start, :end},
          {"2024-04-21-vr2-rand/GX017226", :start, "00:00:04.271"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "2",
        direction: :forward,
        from: "Eidelstedt",
        to: "Bergedorf",
        parent_ref: __MODULE__,
        text: "von Eidelstedt nach Bergedorf",
        historic: %{
          "c560c17e192a72eeae020313061c86e0" => ~d[2025-08],
          "86330ff9a5c7b741f94be03d59ff1e34" => ~d[2025-03]
        },
        videos: [
          {"2024-04-21-vr2-rand/GX017228", :start, :end},
          {"2024-04-21-vr2-rand/GX017229", :start, "00:02:56.575"},
          {"2024-04-21-vr2-rand/GX017230", :start, :end},
          {"2024-04-21-vr2-rand/GX017231", :start, "00:00:02.236"},
          {"2025-02-09-innenstadt/GX017968", :start, :end},
          {"2025-02-09-innenstadt/GX017969", :start, :end},
          {"2025-02-09-innenstadt/GX017970", :start, :end},
          {"2025-02-09-innenstadt/GX017971", :start, :end},
          {"2025-02-09-innenstadt/GX017972", :start, "00:00:04.455"},
          {"2025-02-09-innenstadt/GX017973", :start, "00:00:14.739"},
          {"2024-03-16-fr8-gr1uhr/GX016877", "00:00:03.253", "00:00:15.930"},
          {"2025-03-01-west/GX018370", "00:00:09.299", :end},
          {"2025-03-01-west/GX018371", :start, :end},
          {"2025-03-01-west/GX018372", :start, "00:00:01.969"},
          {"2024-05-06-vr9/GX017443", "00:00:02.202", "00:07:21.586"},
          {"2025-08-16-br-berge/GX018610", "00:00:10.660", "00:00:15.275"},
          {"2025-08-16-br-berge/GX018591", "00:00:15.508", "00:00:27.961"},
          {"2024-05-06-vr9/GX017444", "00:00:15.482", :end},
          {"2024-05-06-vr9/GX017445", :start, "00:00:02.202"},
          {"2024-05-06-vr9/GX017447", :start, "00:00:11.009"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643491"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-2</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.863279,53.588716,9.927906,53.622897" lon={9.920595} lat={53.601212} dir="forward" ref={@ref}>Eidelstedt</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.914985,53.584883,9.949393,53.601333" lon={9.932624} lat={53.595197} dir="forward" ref={@ref}>Stellingen</.v></td>
      </tr>
      <tr>
        <td><.icon bounds="9.861396,53.57754,9.93999,53.615691" lon={9.938191} lat={53.58115} dir="forward" name="rsw-elmshorn">RSW</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.919166,53.573,9.959761,53.593032" lon={9.9383} lat={53.583977} dir="forward" ref={@ref}>Langenfelde</.v></td>
      </tr>
      <tr>
        <td><.icon>br-eimsbuettel-nord-sued</.icon><.icon>radroute-16</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.933678,53.562581,9.973695,53.5803" lon={9.960707} lat={53.57117} dir="forward" ref={@ref}>Eimsbüttel</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-14</.icon><.icon>radroute-4</.icon><.icon>radroute-3</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.956738,53.556305,9.998142,53.57543" lon={9.974565} lat={53.565185} dir="forward" ref={@ref}>Rotherbaum</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td><.v bounds="9.984197,53.550924,10.011943,53.568344" lon={9.997136} lat={53.558055} dir="forward" ref={@ref}>Alster</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-7</.icon><.icon>radroute-6</.icon><.icon>radroute-1</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.990706,53.548979,10.02214,53.564202" lon={10.000946} lat={53.555335} dir="forward" ref={@ref}>St. Georg</.v></td>
      </tr>
      <tr>
        <td><.icon>FR6</.icon><.icon>FR5</.icon><.icon>1GR</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.996321,53.533251,10.042449,53.55335" lon={10.025175} lat={53.539818} dir="forward" ref={@ref}>Hammerbrook</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-12</.icon></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td><.v bounds="10.018992,53.529226,10.038427,53.541264" lon={10.028427} lat={53.534647} dir="forward" ref={@ref}>Elbbrücken</.v></td>
      </tr>
      <tr>
        <td><.icon>FR5</.icon><.icon>radroute-22</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.014536,53.514916,10.085184,53.54875" lon={10.031814} lat={53.533813} dir="forward" ref={@ref}>Rothenburgsort</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="10.046612,53.511643,10.115238,53.539686" lon={10.070447} lat={53.526582} dir="forward" ref={@ref}>Billbrook</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:bridge} ref={@ref}/></td>
        <td><.v bounds="10.083734,53.511235,10.107035,53.524651" lon={10.09533} lat={53.516086} dir="forward" ref={@ref}>Berlin-Hamburger-Bahn</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:bridge} ref={@ref}/></td>
        <td><.v bounds="10.094083,53.503581,10.128389,53.521115" lon={10.104184} lat={53.512383} dir="forward" ref={@ref}>Autobahn A1</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="10.05662,53.487065,10.148226,53.53134" lon={10.093425} lat={53.514654} dir="forward" ref={@ref}>Billwerder-Moorfleet</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.091461,53.482151,10.208285,53.52026" lon={10.132656} lat={53.498364} dir="forward" ref={@ref}>Mittlerer Landweg</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="10.129129,53.473917,10.199398,53.50286" lon={10.158331} lat={53.490722} dir="forward" ref={@ref}>Neuallermöhe</.v></td>
      </tr>
      <tr>
        <td><.icon name="rsw-geesthacht" bounds="10.181904,53.471171,10.25402,53.49209" lon={10.185906} lat={53.486877} dir="forward">RSW</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.165734,53.47197,10.205238,53.501956" lon={10.181091} lat={53.488272} dir="forward" ref={@ref}>Nettelnburg</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.195803,53.485261,10.210012,53.493715" lon={10.203556} lat={53.488861} dir="forward" ref={@ref}>Berlin-Hamburger-Bahn</.v></td>
      </tr>
      <tr>
        <td><.icon>FR4</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.192215,53.480637,10.225609,53.498853" lon={10.206561} lat={53.48894} dir="forward" ref={@ref}>Bergedorf</.v></td>
      </tr>
    </table>

    <p>Radroute 2 verläuft grob in Ost-West Richtung, allerdings leicht diagonal um <.v bounds="9.863279,53.588716,9.927906,53.622897" lon={9.920595} lat={53.601212} dir="forward" ref={@ref}>Eidelstedt</.v> mit <.v bounds="10.192215,53.480637,10.225609,53.498853" lon={10.206561} lat={53.48894} dir="forward" ref={@ref}>Bergedorf</.v> verbinden zu können. Im Westen orientiert sie sich an der <.v bounds="9.893093,53.558504,9.991455,53.614345" lon={9.936523} lat={53.587453} dir="forward" ref={@ref}>Kieler Straße</.v>. In der <.v bounds="9.955234,53.539663,10.039434,53.57665" lon={9.997363} lat={53.557787} dir="forward" ref={@ref} highlight="Altstadt,Neustadt">Innenstadt</.v> wird die Alster zwischen Binnen- und Außenalster überquert. Anschließend orientiert sich zunächst an der <.v bounds="9.988433,53.500429,10.09825,53.564395" lon={10.026957} lat={53.538561} dir="forward" ref={@ref}>Norderelbe</.v> und danach an der <.v bounds="10.064229,53.479217,10.187732,53.540494" lon={10.119301} lat={53.505047} dir="forward" ref={@ref}>Bahnlinie</.v>.</p>


    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich – größtenteils fährt man auf Asphalt oder Betonpflaster. Der östliche Teil bis Bergedorf verläuft durch Industriegebiete oder Überlandstrecken, sodass vor allem in Nachtstunden wenig los ist. Teils ist die Strecke nicht beleuchtet.</p>

    <h4>Meinung</h4>
    <p>Die Route ist durchwachsen.</p>

    <p>Im Westen kommt man als Erwachsener trotz vieler Ampeln gut durch und wird in der Regel keine Probleme haben. Allerdings sind die wenigsten Abschnitte kindgerecht, wie z.B. die bereits umgebaute <.v bounds="9.977846,53.559729,9.994839,53.567213" lon={9.984959} lat={53.563753} dir="forward" ref={@ref}>Edmund-Siemers-Allee</.v>.</p>

    <p>Im Osten sind dagegen kaum Ampeln und oft breite Wege ohne gefährlichen KFZ-Verkehr. Man kommt hier super durch und erreicht auch ohne Anstrengung eine gute Durchschnittsgeschwindigkeit – starker Gegenwind mal außen vor. Auch die Kleinen können hier üben und sich austoben. Dafür ist dort nachts wenig bis nichts los und weil die Beleuchtung auf den <.v bounds="9.977846,53.485255,10.164447,53.567213" lon={10.117581} lat={53.506601} dir="forward" ref={@ref}>Überlandwegen</.v> fehlt, auch nur mäßig spaßig.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
