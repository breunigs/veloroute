defmodule Data.Article.Static.Radroute4 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-4"
  def display_id(), do: "4"
  def title(), do: "Radroute 4"
  def color(), do: RouteColors.blue3()

  def summary(),
    do:
      "Radroute 4 verbindet Hamburgs Norden beim Ochsenzoll mit dem Süden bei Sinstorf. Die Elbquerung erfolgt durch den Alten Elbtunnel bzw. die Alte Harburger Elbbrücke."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "4",
        direction: :forward,
        from: "Ochsenzoll",
        to: "Harburger Berge",
        parent_ref: __MODULE__,
        text: "vom Ochsenzoll nach Sinstorf",
        historic: %{
          "591e6c671d9fe78b25a23fb632c7a9d8" => ~d[2025-09],
          "f8afb4160450776b7c4fed1b86b8f60c" => ~d[2025-02]
        },
        end_action: %{
          action: :play,
          route: Data.Article.Static.RSWTostedt,
          group: "Radroute Plus Tostedt",
          direction: :forward
        },
        videos: [
          {"2024-05-12-vr4/GX017526", "00:00:26.593", "00:00:40.332"},
          {"2024-05-12-vr4/GX017527", :start, "00:02:20.779"},
          {"2024-05-12-vr4/GX017528", :start, "00:01:30.639"},
          {"2024-05-12-vr4/GX017529", :start, :end},
          {"2024-05-12-vr4/GX017530", :start, "00:00:13.044"},
          {"2024-05-12-vr4/GX017531", :start, "00:01:25.279"},
          {"2025-09-20-random/GX018648", "00:00:27.733", :end},
          {"2025-09-20-random/GX018649", :start, :end},
          {"2025-09-20-random/GX018650", :start, "00:00:16.401"},
          {"2025-09-20-random/GX018665", "00:00:10.274", :end},
          {"2025-09-20-random/GX018666", :start, "00:00:04.814"},
          {"2025-09-20-random/GX018667", "00:00:01.835", "00:00:02.269"},
          {"2025-02-10-innenstadt/GX018000", :start, :end},
          {"2025-02-10-innenstadt/GX018001", :start, "00:00:04.429"},
          {"2025-02-20-harburg/GX018176", "00:00:22.288", :end},
          {"2025-02-20-harburg/GX018177", :start, "00:00:02.560"},
          {"2024-04-21-vr2-rand/GX017237", "00:00:43.835", "00:00:51.041"},
          {"2024-03-17-fr14/GX016929", "00:00:06.689", :end},
          {"2024-03-17-fr14/GX016930", :start, "00:00:07.774"},
          {"2025-02-19-sued/GX018144", "00:00:39.106", :end},
          {"2025-02-19-sued/GX018145", :start, "00:00:39.681"},
          {"2024-05-16-vr11/GX017585", "00:00:26.647", "00:01:07.968"},
          {"2025-02-19-sued/GX018146", "00:00:26.827", :end},
          {"2025-02-19-sued/GX018147", :start, "00:00:36.603"},
          {"2025-02-19-sued/GX018147", "00:00:39.907", :end},
          {"2025-02-19-sued/GX018148", :start, "00:02:00.821"},
          {"2025-02-19-sued/GX018148", "00:02:04.491", :end},
          {"2025-02-19-sued/GX018149", :start, :end},
          {"2025-02-19-sued/GX018150", :start, "00:00:07.760"},
          {"2025-02-19-sued/GX018151", :start, :end},
          {"2025-02-19-sued/GX018152", :start, :end},
          {"2025-02-19-sued/GX018153", :start, :end},
          {"2025-02-19-sued/GX018154", :start, :end},
          {"2025-02-19-sued/GX018155", :start, "00:02:01.521"},
          {"2025-02-19-sued/GX018155", "00:02:04.224", :end}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "4",
        direction: :backward,
        from: "Harburger Berge",
        to: "Ochsenzoll",
        parent_ref: __MODULE__,
        text: "von Sinstorf zum Ochsenzoll",
        historic: %{
          "8a216415b1869fb174b44f4965640489" => ~d[2025-09],
          "2ecd7dacb71c343047a2592f093cb4f2" => ~d[2025-02]
        },
        videos: [
          {"2025-02-19-sued/GX018156", :start, "00:00:35.194"},
          {"2025-02-19-sued/GX018157", "00:00:00.200", :end},
          {"2025-02-19-sued/GX018158", :start, "00:01:19.379"},
          {"2025-02-19-sued/GX018159", "00:00:05.439", :end},
          {"2025-02-19-sued/GX018160", :start, :end},
          {"2025-02-19-sued/GX018161", :start, :end},
          {"2025-02-19-sued/GX018162", :start, :end},
          {"2025-02-19-sued/GX018163", :start, :end},
          {"2025-02-19-sued/GX018164", :start, :end},
          {"2025-02-19-sued/GX018165", :start, "00:00:13.514"},
          {"2024-05-16-vr11/GX017604", "00:00:05.305", :end},
          {"2024-05-16-vr11/GX017605", :start, "00:00:46.804"},
          {"2024-05-16-vr11/GX017606", "00:00:04.738", "00:00:15.679"},
          {"2024-05-16-vr11/GX017607", "00:00:00.834", :end},
          {"2024-05-16-vr11/GX017608", :start, "00:00:51.975"},
          {"2024-03-17-fr14/GX016907", "00:00:04.137", "00:00:50.550"},
          {"2024-03-17-fr14/GX016907", "00:00:55.923", "00:01:13.351"},
          {"2025-02-20-harburg/GX018209", "00:00:03.445", "00:00:08.941"},
          {"2025-02-20-harburg/GX018210", :start, :end},
          {"2025-02-20-harburg/GX018211", :start, "00:00:26.454"},
          {"2025-02-10-innenstadt/GX018001", "00:00:23.234", :end},
          {"2025-02-10-innenstadt/GX018002", :start, "00:00:02.536"},
          {"2025-09-20-random/GX018635", "00:00:01.735", "00:00:40.307"},
          {"2025-02-10-innenstadt/GX018002", "00:00:47.514", "00:00:54.388"},
          {"2025-09-20-random/GX018635", "00:00:48.248", :end},
          {"2025-09-20-random/GX018636", :start, "00:01:27.387"},
          {"2024-05-12-vr4/GX017516", "00:01:18.145", :end},
          {"2024-05-12-vr4/GX017517", :start, "00:00:18.482"},
          {"2024-05-12-vr4/GX017518", :start, "00:00:45.403"},
          {"2024-05-12-vr4/GX017519", :start, "00:00:16.513"},
          {"2024-05-12-vr4/GX017520", "00:00:00.501", "00:00:20.216"},
          {"2024-05-12-vr4/GX017521", :start, :end},
          {"2024-05-12-vr4/GX017522", :start, :end},
          {"2024-05-12-vr4/GX017523", :start, "00:01:28.237"},
          {"2024-05-12-vr4/GX017524", :start, :end},
          {"2024-05-12-vr4/GX017525", :start, :end},
          {"2024-05-12-vr4/GX017526", :start, "00:00:03.670"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643494"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-4</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon>FR12</.icon><.icon>br-nord-n1</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.977439,53.66203,10.038788,53.691304" lon={10.000972} lat={53.677668} dir="forward" ref={@ref}>Ochsenzoll</.v></td>
      </tr>
      <tr>
        <td><.icon>br-nord-n9</.icon><.icon>radroute-19</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.995048,53.639135,10.036705,53.668201" lon={10.019096} lat={53.651482} dir="forward" ref={@ref}>Langenhorn</.v></td>
      </tr>
      <tr>
        <td><.icon>br-nord-n8</.icon><.icon>br-nord-n1</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.992711,53.615578,10.059315,53.652951" lon={10.025592} lat={53.634073} dir="forward" ref={@ref}>Fuhlsbüttel</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.009926,53.610182,10.028264,53.622244" lon={10.017354} lat={53.615497} dir="forward" ref={@ref}>Alster</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon><.icon>FR1</.icon><.icon>br-nord-n1</.icon><.icon>radroute-12</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.98676,53.594237,10.025619,53.615897" lon={9.998388} lat={53.608649} dir="forward" ref={@ref}>Alsterdorf</.v></td>
      </tr>
      <tr>
        <td><.icon>FR1</.icon><.icon>br-nord-n7</.icon><.icon>radroute-16</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.978373,53.581676,10.035228,53.624715" lon={9.995184} lat={53.5967} dir="forward" ref={@ref}>Winterhude</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-17</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.982344,53.578684,10.012225,53.596683" lon={9.997799} lat={53.58716} dir="forward" ref={@ref}>Eppendorf</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="9.990005,53.575406,10.007315,53.58752" lon={9.999299} lat={53.580084} dir="forward" ref={@ref}>Alster</.v></td>
      </tr>
      <tr>
        <td><.icon>br-eimsbuettel-isebek</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.970993,53.560178,10.012197,53.58808" lon={9.998293} lat={53.578018} dir="forward" ref={@ref}>Harvestehude</.v></td>
      </tr>
      <tr>
        <td><.icon>br-eimsbuettel-rotherbaumring</.icon><.icon>radroute-2</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.974848,53.554813,10.009154,53.586694" lon={10.000255} lat={53.571326} dir="forward" ref={@ref}>Rotherbaum</.v></td>
      </tr>
      <tr>
        <td><.icon>1GR</.icon><.icon>radroute-15</.icon><.icon>radroute-7</.icon><.icon>radroute-6</.icon><.icon>radroute-3</.icon><.icon>radroute-1</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.963584,53.544451,10.012806,53.572363" lon={9.992305} lat={53.556329} dir="forward" ref={@ref}>Neustadt</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:tunnel} ref={@ref}/></td>
        <td><.v bounds="9.958137,53.521845,9.993724,53.549976" lon={9.966592} lat={53.544303} dir="forward" ref={@ref}>Alter Elbtunnel</.v></td>
      </tr>
      <tr>
        <td><.icon>FR14</.icon><.icon>radroute-11</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.954913,53.520612,9.988097,53.546909" lon={9.96852} lat={53.535508} dir="forward" ref={@ref}>Hafen</.v></td>
      </tr>
      <tr>
        <td><.icon>FR6</.icon><.icon>radroute-21</.icon><.icon>radroute-12</.icon><.icon>radroute-11</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.969596,53.503746,9.996222,53.527843" lon={9.987412} lat={53.51533} dir="forward" ref={@ref}>Reiherstiegviertel</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.973268,53.478859,10.017935,53.51145" lon={9.997452} lat={53.495672} dir="forward" ref={@ref}>Wilhelmsburger Inselpark</.v></td>
      </tr>
      <tr>
        <td><.icon>FR6</.icon><.icon>radroute-23</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.978594,53.471914,10.018407,53.488394" lon={9.996758} lat={53.478203} dir="forward" ref={@ref}>Finkenriek</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-10</.icon></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td><.v bounds="9.973211,53.457654,10.020346,53.489013" lon={9.996038} lat={53.475209} dir="forward" ref={@ref}>Alte Harburger Elbbrücke</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-13</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.984519,53.45331,9.996765,53.462077" lon={9.988546} lat={53.45778} dir="forward" ref={@ref}>Bahnhof Harburg</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.969852,53.441954,10.003798,53.466775" lon={9.986756} lat={53.449762} dir="forward" ref={@ref}>Wilstorf</.v></td>
      </tr>
      <tr>
        <td><.icon>FR6</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.964431,53.42459,10.000875,53.445341" lon={9.98484} lat={53.435332} dir="forward"  ref={@ref}>Langenbek</.v></td>
      </tr>
      <tr>
        <td><.icon ref={RSWTostedt} bounds="9.912692,53.372081,10.016808,53.433831" lon={9.974786} lat={53.420143}dir="forward">RSW</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.962334,53.415553,9.99241,53.432378" lon={9.976682} lat={53.424286} dir="forward" ref={@ref}>Sinstorf</.v></td>
      </tr>
    </table>

    <p>Radroute 4 verbindet den Nachbarort Norderstedt im Norden mit dem Stadtteil Sinstorf im Süden. Von dort soll einmal der <.a ref={RSWTostedt}>Radschnellweg nach Tostedt</.a> anschließen. Im Norden soll der geplante <.a ref={RSWBadBramstedt}>Radschnellweg nach Bad Bramstedt</.a> teils parallel verlaufen – weniger Anschlüsse an die umliegenden Straßen, dafür mit weniger Kreuzungen.</p>

    <p>Die Radroute selbst verläuft in Nord-Süd-Richtung. Sie quert die Norderelbe durch den Alten Elbtunnel und die Süderelbe über die Alte Harburger Elbbrücke.</p>

    <img src="/images/radroute4sign.webp" width="78" height="326" style="float:right;shape-outside:url(/images/radroute4sign.webp);shape-margin: 0.5rem;margin-left:0.6rem;" alt="Wegweiser für Radroute 4"/>
    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nur um die Alster herum beschildert (<.a href="https://veloroute.hamburg/crowdsourcing/upload" rel="nofollow">Wo genau? Hilf mit!</.a>). Für die meisten Abschnitte benötigt man daher Navi oder Ortskenntnis.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Am häufigsten sind die Oberflächen asphaltiert, aber auch modernes Betonsteinpflaster kommt zum Einsatz. Bis auf eine Ausbaulücke in <.v bounds="9.976827,53.434736,9.999982,53.455868" lon={9.983349} lat={53.445397} dir="backward" ref={@ref}>Wilstorf</.v> ist die Route bereits heute in beide Richtungen durchgängig befahrbar.</p>

    <h4>Meinung</h4>
    <p>Die <.v bounds="9.991681,53.558899,10.00515,53.593009" lon={9.999808} lat={53.57179} dir="forward" ref={@ref}>Fahrradstraßen an der Alster</.v> sind das Aushängeschild der Radrouten Planung in Hamburg. Die <.v bounds="9.989903,53.592799,10.015337,53.614187" lon={9.994343} lat={53.597756} dir="forward" ref={@ref}>Bebelallee</.v> und die noch nicht ausgebaute <.v bounds="9.989903,53.592799,10.015337,53.614187" lon={9.999008} lat={53.608785} dir="forward" ref={@ref}>Rathenaustraße</.v> sind dagegen eine Zumutung.</p>

    <p>Im Norden bietet die Führung über Nebenstraßen zwar gute eine Anbindung, macht längere Distanzen jedoch etwas müßig. Der <.a ref={RSWBadBramstedt}>geplante Radschnellweg</.a> stellt daher eine gute Ergänzung dar.</p>

    <p>Im Süden merkt man vor allem, dass die Strecke nicht Teil des alten Fahrradnetzes war – ab Wilstorf gibt es keinen ausgebauten Abschnitt. Dafür kommt mit dem <.a ref={ZOBHarburg}>Umbau des Busbahnhofs Harburg</.a> aber auch endlich ein Lückenschluss.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
