defmodule Data.Article.Static.Radroute7 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-7"
  def display_id(), do: "7"
  def title(), do: "Radroute 7"
  def color(), do: RouteColors.red2()

  def summary(),
    do:
      "Radroute 7 verläuft in einem leichten Bogen vom Nordwesten (Schenefeld/Osdorf), via Jungfernstieg, nach Nordosten (Rahlstedt)."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "7",
        direction: :forward,
        from: "Düpenau",
        to: "Rahlstedt",
        parent_ref: __MODULE__,
        text: "vom Osdorfer Born nach Rahlstedt",
        historic: %{
          "39da71571fbcf75b9a868287cd172d73" => ~d[2025-02]
        },
        videos: [
          {"2025-02-08-west/GX017943", "00:01:19.500", "00:02:50.771"},
          {"2024-05-03-vr1/GX017416", "00:02:39.226", "00:02:56.708"},
          {"2024-05-03-vr1/GX017417", :start, "00:00:32.593"},
          {"2025-02-08-west/GX017943", "00:04:14.661", :end},
          {"2025-02-08-west/GX017944", :start, "00:01:15.074"},
          {"2025-02-08-west/GX017945", :start, :end},
          {"2025-02-08-west/GX017946", :start, :end},
          {"2025-02-08-west/GX017947", :start, :end},
          {"2025-02-08-west/GX017948", :start, :end},
          {"2025-02-08-west/GX017949", :start, :end},
          {"2025-02-09-innenstadt/GX017953", "00:00:11.247", "00:00:28.061"},
          {"2024-03-11-fr3/GX016782", "00:00:00.167", "00:00:33.928"},
          {"2024-03-11-fr3/GX016783", :start, "00:00:12.043"},
          {"2024-03-11-fr3/GX016784", "00:00:00.234", "00:00:14.178"},
          {"2024-03-11-fr3/GX016785", :start, :end},
          {"2025-02-17-ost/GX018118", :start, :end},
          {"2025-02-17-ost/GX018119", :start, :end},
          {"2025-02-17-ost/GX018120", :start, "00:00:27.060"},
          {"2025-02-17-ost/GX018120", "00:00:30.030", :end},
          {"2025-02-17-ost/GX018121", :start, "00:00:02.569"},
          {"2024-05-02-vr7/GX017366", "00:00:02.369", "00:00:18.381"},
          {"2024-05-02-vr7/GX017367", "00:00:00.267", "00:00:12.977"},
          {"2024-05-02-vr7/GX017368", "00:00:00.434", :end},
          {"2024-05-02-vr7/GX017369", :start, "00:00:24.787"},
          {"2024-05-02-vr7/GX017370", "00:00:00.734", "00:00:21.784"},
          {"2024-05-02-vr7/GX017371", "00:00:00.334", :end},
          {"2024-05-02-vr7/GX017372", :start, :end},
          {"2024-05-02-vr7/GX017373", :start, "00:00:55.311"},
          {"2024-05-02-vr7/GX017374", :start, "00:00:16.880"},
          {"2024-05-02-vr7/GX017375", :start, "00:00:02.236"},
          {"2024-05-02-vr7/GX017376", :start, :end},
          {"2024-05-02-vr7/GX017377", :start, "00:00:02.736"},
          {"2024-05-02-vr7/GX017378", :start, "00:00:19.249"},
          {"2024-05-02-vr7/GX017379", "00:00:00.400", "00:00:16.346"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "7",
        direction: :backward,
        from: "Rahlstedt",
        to: "Düpenau",
        parent_ref: __MODULE__,
        text: "von Rahlstedt zum Osdorfer Born",
        historic: %{
          "040b27b5b2679d8b3d0a84502a24a11d" => ~d[2025-12],
          "ffe07bc2fc302fa5e6907822c85ad525" => ~d[2025-02]
        },
        videos: [
          {"2024-05-02-vr7/GX017379", "00:00:20.016", "00:00:33.861"},
          {"2024-05-02-vr7/GX017380", :start, "00:00:32.726"},
          {"2024-05-02-vr7/GX017381", :start, "00:00:15.746"},
          {"2024-05-02-vr7/GX017382", :start, "00:01:13.493"},
          {"2024-05-02-vr7/GX017383", :start, "00:00:30.958"},
          {"2024-05-02-vr7/GX017384", :start, "00:00:01.602"},
          {"2024-05-02-vr7/GX017389", "00:00:01.668", "00:01:22.082"},
          {"2024-05-02-vr7/GX017389", "00:01:30.691", "00:01:41.081"},
          {"2024-05-02-vr7/GX017390", :start, "00:00:40.333"},
          {"2024-05-02-vr7/GX017391", :start, "00:00:36.930"},
          {"2024-05-02-vr7/GX017392", "00:00:00.501", "00:00:48.239"},
          {"2024-05-02-vr7/GX017393", :start, "00:00:07.140"},
          {"2024-05-02-vr7/GX017394", :start, "00:00:07.740"},
          {"2024-05-02-vr7/GX017395", :start, "00:00:10.142"},
          {"2024-05-02-vr7/GX017396", "00:00:00.267", "00:00:08.774"},
          {"2024-05-02-vr7/GX017397", :start, "00:00:01.168"},
          {"2025-12-30-hohenfelde/GX018732", "00:00:31.832", :end},
          {"2025-12-30-hohenfelde/GX018734", :start, "00:00:05.239"},
          {"2025-02-17-ost/GX018140", "00:00:22.222", :end},
          {"2025-02-17-ost/GX018141", :start, :end},
          {"2024-05-06-vr9/GX017461", :start, "00:00:03.103"},
          {"2024-05-06-vr9/GX017462", :start, :end},
          {"2024-05-06-vr9/GX017463", :start, :end},
          {"2024-05-06-vr9/GX017464", :start, "00:00:47.138"},
          {"2024-05-06-vr9/GX017430", "00:00:00.434", "00:00:10.476"},
          {"2025-02-06-whburg/GX017885", "00:00:04.140", "00:00:05.973"},
          {"2025-02-08-west/GX017931", "00:00:00.801", :end},
          {"2025-02-08-west/GX017932", :start, "00:00:41.014"},
          {"2025-02-08-west/GX017933", :start, :end},
          {"2025-02-08-west/GX017934", :start, :end},
          {"2025-02-08-west/GX017935", :start, :end},
          {"2025-02-08-west/GX017936", :start, "00:00:35.403"},
          {"2024-05-03-vr1/GX017414", "00:03:29.580", "00:03:59.725"},
          {"2024-05-03-vr1/GX017415", "00:00:00.701", "00:00:36.530"},
          {"2025-02-08-west/GX017937", "00:00:20.892", :end},
          {"2025-02-08-west/GX017938", :start, :end},
          {"2025-02-08-west/GX017939", :start, "00:01:11.040"}
        ]
      }
    ]

  def links(_assigns) do
    [{"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643498"}]
  end

  def text(assigns) do
    ~H"""
    <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-7</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.835515,53.585905,9.866588,53.602117" lon={9.839939} lat={53.594863} dir="forward" ref={@ref}>Schenefeld</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.843916,53.577778,9.870581,53.597167" lon={9.852154} lat={53.58816} dir="forward" ref={@ref}>Osdorfer Born</.v></td>
      </tr>
      <tr>
        <td><.icon>FR9</.icon><.icon>FR11</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.850926,53.565935,9.889587,53.585715" lon={9.867691} lat={53.577649} dir="forward" ref={@ref}>Osdorf</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-18</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.86309,53.562222,9.893909,53.580816" lon={9.880944} lat={53.568993} dir="forward" ref={@ref}>Groß Flottbek</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:bridge} ref={@ref}/></td>
        <td><.v bounds="9.885011,53.558706,9.916382,53.576142" lon={9.900419} lat={53.565096} dir="forward" ref={@ref}>Autobahn A7</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.883958,53.553057,9.926561,53.57738" lon={9.904803} lat={53.562624} dir="forward" ref={@ref}>Bahrenfeld</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.906117,53.546694,9.940621,53.56497" lon={9.919695} lat={53.556476} dir="forward" ref={@ref}>Ottensen</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:tunnel} ref={@ref}/></td>
        <td><.v bounds="9.924716,53.55131,9.94703,53.562043" lon={9.934513} lat={53.555604} dir="forward" ref={@ref}>Lessingtunnel</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-16</.icon><.icon>radroute-14</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.93142,53.548879,9.961036,53.557599" lon={9.947007} lat={53.555567} dir="forward" ref={@ref}>Altona-Altstadt</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-15</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.94718,53.552172,9.976797,53.560891" lon={9.963071} lat={53.556828} dir="forward" ref={@ref}>St. Pauli</.v></td>
      </tr>
      <tr>
        <td><.icon>1GR</.icon><.icon>radroute-4</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.968204,53.546274,9.99372,53.561463" lon={9.980858} lat={53.555548} dir="forward" ref={@ref}>Neustadt</.v></td>
      </tr>
      <tr>
        <td><.icon>1GR</.icon><.icon>radroute-6</.icon><.icon>radroute-3</.icon><.icon>radroute-2</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.990316,53.545391,10.008831,53.556884" lon={9.998925} lat={53.550753} dir="forward" ref={@ref}>Altstadt</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:bridge} ref={@ref}/></td>
        <td><.v bounds="10.000913,53.548653,10.011413,53.55599" lon={10.006489} lat={53.551702} dir="forward" ref={@ref}>Hauptbahnhof</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-1</.icon><.icon>radroute-9</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.999532,53.549681,10.017545,53.556575" lon={10.007068} lat={53.551788} dir="forward" ref={@ref}>St. Georg</.v></td>
      </tr>
      <tr>
        <td><.icon>br-nord-n1</.icon><.icon>radroute-12</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.015691,53.554022,10.032917,53.562543" lon={10.022447} lat={53.55794} dir="forward" ref={@ref}>Hohenfelde</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-17</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.030704,53.557958,10.055372,53.571052" lon={10.043693} lat={53.563793} dir="forward" ref={@ref}>Eilbek</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.069079,53.565952,10.079392,53.571986" lon={10.072597} lat={53.569186} dir="forward" ref={@ref} highlight="Robert-Schuman-Brücke">Robert-Schuman-Brücke (Ring 2)</.v></td>
      </tr>
      <tr>
        <td><.icon>br-wandsbek-w2</.icon><.icon>radroute-8</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.05379,53.563592,10.094062,53.577387" lon={10.071139} lat={53.569574} dir="forward" ref={@ref}>Marienthal</.v></td>
      </tr>
      <tr>
        <td><.icon>br-wandsbek-w8</.icon><.icon>FR11</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.099615,53.569629,10.144723,53.585955" lon={10.121581} lat={53.578746} dir="forward" ref={@ref}>Jenfeld</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-20</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.115525,53.576405,10.148118,53.596693" lon={10.126294} lat={53.581843} dir="forward" ref={@ref}>Tonndorf</.v></td>
      </tr>
      <tr>
        <td><.icon>FR3</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.145341,53.594407,10.160741,53.60604" lon={10.154252} lat={53.602163} dir="forward" ref={@ref}>Rahlstedt</.v></td>
      </tr>
    </table>


    <p>Radroute 7 verläuft in Ost-West Richtung und verbindet <.v bounds="9.835515,53.585905,9.866588,53.602117" lon={9.839939} lat={53.594863} dir="forward" ref={@ref}>Schenefeld</.v> (Vorort) mit <.v bounds="10.145341,53.594407,10.160741,53.60604" lon={10.154252} lat={53.602163} dir="forward" ref={@ref}>Rahlstedt</.v> (Ortsteil). Die Route quert die Alster am <.v bounds="9.981551,53.539851,10.041784,53.576141" lon={9.992399} lat={53.553296} dir="forward" ref={@ref}>Jungfernstieg</.v> – wodurch sie eine leichte Bogenform erhält.</p>

    <.roaddiagram src="radroute-07-wegweiser" width={115} alt="Zwischenwegweiser für Radroute 07" class="right"/>
    <h4>Auffindbarkeit</h4>
    <p>Die Route ist im Zentrum von etwa <.v bounds="9.93142,53.548879,9.961036,53.557599" lon={9.947007} lat={53.555567} dir="forward" ref={@ref}>Altona-Altstadt</.v> bis <.v bounds="10.030704,53.557958,10.055372,53.571052" lon={10.043693} lat={53.563793} dir="forward" ref={@ref}>Eilbek</.v> beschildert (<.a href="https://veloroute.hamburg/crowdsourcing/upload" rel="nofollow">Wo genau? Hilf mit!</.a>). Weiter außerhalb benötigt man Ortskenntnis oder ein Navi.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Route verläuft größtenteils auf befestigten Wegen. Ausnahme ist der <.v bounds="9.861843,53.566464,9.890328,53.585628" lon={9.87419} lat={53.575726} dir="forward" ref={@ref}>Lise-Meitner-Park</.v>, dessen sandige Wege nicht wetterfest sind.</p>

    <p>Im Bereich der Innenstadt sorgen die vielen Ampeln für häufiges Anhalten. Um <.v bounds="9.861843,53.563806,10.113148,53.585628" lon={10.085094} lat={53.571593} dir="forward" ref={@ref}>Wandsbek herum</.v> verläuft die Route zudem im Zickzack.</p>

    <h4>Meinung</h4>
    <p>Die Route ist bisher nur in Teilabschnitten ausgebaut, vor allem im Innenstadtbereich. Nicht jeder Ausbau ist gelungen. Der <.v bounds="10.01062,53.55043,10.029629,53.56072" lon={10.015018} lat={53.554664} dir="forward" ref={@ref}>Steindamm</.v> bleibt ein Paradies für wildes Parken, und die <.v bounds="10.035153,53.557937,10.069892,53.57409" lon={10.048856} lat={53.564196} dir="forward" ref={@ref}>Hasselbrookstraße</.v> eine Rennstrecke für Halbstarke. Dabei zeigt die Stadt mit dem Umbau der <.v bounds="9.946608,53.551839,9.97133,53.563404" lon={9.957007} lat={53.557097} dir="forward" ref={@ref}>Thadenstraße</.v>, dass sie es auch besser kann.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
