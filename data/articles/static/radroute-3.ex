defmodule Data.Article.Static.Radroute3 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-3"
  def display_id(), do: "3"
  def title(), do: "Radroute 3"
  def color(), do: RouteColors.purple2()

  def summary(),
    do:
      "Radroute 3 verbindet Niendorf mit der Elbinsel Veddel. Zumindest soll sie das einmal, da der Teil ab der Freihafenelbbrücke noch fehlt."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "3",
        direction: :forward,
        from: "Niendorf",
        to: "Wilhelmsburger Brücke",
        parent_ref: __MODULE__,
        text: "von Niendorf zur Veddel",
        historic: %{
          "124a77df4de6492718e6dec32b4638a4" => ~d[2025-09],
          "1b43a13d31a3b83a22442679a15950f8" => ~d[2024-05]
        },
        videos: [
          {"2024-04-30-fr3/GX017305", "00:00:02.669", "00:00:03.904"},
          {"2024-04-30-fr3/GX017306", :start, "00:00:36.963"},
          {"2024-04-30-fr3/GX017307", :start, "00:00:47.872"},
          {"2024-04-30-fr3/GX017308", :start, "00:00:02.336"},
          {"2024-04-30-fr3/GX017309", "00:00:00.067", "00:00:27.622"},
          {"2024-04-30-fr3/GX017310", "00:00:00.200", "00:00:44.102"},
          {"2024-04-30-fr3/GX017311", "00:00:00.033", "00:00:22.356"},
          {"2025-02-28-schnelsen/GX018351", "00:02:45.399", "00:02:56.810"},
          {"2024-04-30-fr3/GX017311", "00:00:30.729", "00:01:00.627"},
          {"2024-04-30-fr3/GX017311", "00:01:06.233", "00:01:20.331"},
          {"2024-04-30-fr3/GX017312", "00:00:00.167", "00:00:56.245"},
          {"2024-04-30-fr3/GX017313", "00:00:00.100", :end},
          {"2024-04-30-fr3/GX017314", "00:00:00.033", "00:00:45.303"},
          {"2024-04-30-fr3/GX017315", "00:00:01.068", "00:00:23.252"},
          {"2024-04-30-fr3/GX017316", :start, "00:00:09.741"},
          {"2025-09-20-random/GX018664", "00:00:02.481", :end},
          {"2025-09-20-random/GX018665", :start, "00:00:10.775"},
          {"2025-09-20-random/GX018650", "00:00:16.368", :end},
          {"2025-09-20-random/GX018651", :start, :end},
          {"2025-09-20-random/GX018652", :start, :end},
          {"2025-09-20-random/GX018653", :start, :end},
          {"2025-09-20-random/GX018654", :start, "00:00:10.274"},
          {"2025-09-20-random/GX018655", :start, "00:00:16.449"},
          {"2021-05-02-gruener-ring-sued-uhrzeigersinn/GX011460.MP4_time_lapse.mkv",
           "00:00:28.795", "00:01:01.828"},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012366", "00:01:01.962", "00:01:12.973"},
          {"2021-12-23-veddel-und-so/GX013063", "00:00:21.755", "00:01:27.154"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "3",
        direction: :backward,
        from: "Wilhelmsburger Brücke",
        to: "Niendorf",
        parent_ref: __MODULE__,
        text: "von der Veddel nach Niendorf",
        historic: %{
          "816c20281dc0eaf7c7dbcf297e42b170" => ~d[2025-09],
          "1a1e39a49a98cd12926098dadf87c3ce" => ~d[2025-02]
        },
        videos: [
          {"2021-12-23-veddel-und-so/GX013061", :start, "00:00:15.749"},
          {"2025-02-19-sued/GX018166", "00:00:17.184", :end},
          {"2025-02-19-sued/GX018167", "00:00:00.067", "00:01:08.201"},
          {"2025-09-20-random/GX018655", "00:01:59.319", "00:02:23.888"},
          {"2025-09-20-random/GX018656", :start, :end},
          {"2025-09-20-random/GX018657", :start, :end},
          {"2025-09-20-random/GX018658", :seamless, :end},
          {"2025-09-20-random/GX018659", :start, :end},
          {"2025-09-20-random/GX018660", :start, :end},
          {"2025-09-20-random/GX018661", :start, "00:00:09.315"},
          {"2025-09-20-random/GX018662", :start, "00:00:12.934"},
          {"2025-09-20-random/GX018663", :start, "00:00:16.744"},
          {"2025-02-19-sued/GX018173", "00:00:24.024", "00:00:25.759"},
          {"2024-04-30-fr3/GX017293", "00:00:24.424", "00:00:48.239"},
          {"2024-04-30-fr3/GX017294", :start, "00:00:11.709"},
          {"2024-04-30-fr3/GX017295", :start, "00:00:02.236"},
          {"2024-04-30-fr3/GX017295", "00:00:04.404", :end},
          {"2024-04-30-fr3/GX017296", :start, :end},
          {"2024-04-30-fr3/GX017297", :start, "00:00:10.609"},
          {"2024-04-30-fr3/GX017298", :start, "00:00:43.434"},
          {"2024-04-30-fr3/GX017299", :start, "00:00:13.178"},
          {"2024-04-30-fr3/GX017300", :start, "00:00:33.027"},
          {"2025-02-28-schnelsen/GX018341", "00:00:01.835", "00:00:14.181"},
          {"2024-04-30-fr3/GX017300", "00:00:46.413", "00:01:08.555"},
          {"2024-04-30-fr3/GX017301", :start, "00:00:48.606"},
          {"2024-04-30-fr3/GX017302", :start, :end},
          {"2024-04-30-fr3/GX017303", :start, "00:00:28.989"},
          {"2024-04-30-fr3/GX017304", :start, :end},
          {"2024-04-30-fr3/GX017305", :start, "00:00:02.669"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "brücken",
        direction: :forward,
        from: "Elbbrücken",
        to: "Versmannstraße",
        parent_ref: __MODULE__,
        text: "Abzweig zur Billhorner Brücke",
        historic: %{
          "cde14b4f3f760ed5b06f3230cdb7983a" => ~d[2024-05]
        },
        videos: [
          {"2024-05-18-vr10/GX017627", "00:00:55.144", "00:01:23.600"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "brücken",
        direction: :backward,
        from: "Versmannstraße",
        to: "Elbbrücken",
        parent_ref: __MODULE__,
        text: "Abzweig von Billhorner Brücke",
        historic: %{
          "89cbc34df4fb05f9069f14088e1d0bce" => ~d[2025-09],
          "7debe952c525f343e5a36cc164e58a2e" => ~d[2025-05]
        },
        videos: [
          {"2025-09-20-random/GX018655", "00:00:34.547", "00:01:09.367"}
        ],
        end_action: %{
          action: :play,
          route: __MODULE__,
          group: "3",
          direction: :backward
        }
      }
    ]

  def links(_assigns) do
    [
      {"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643492"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-3</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon>radroute-19</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.943576,53.62753,9.959497,53.644837" lon={9.952295} lat={53.635892} dir="forward" ref={@ref} highlight="Niendorf">Niendorf Nord</.v></td>
      </tr>
      <tr>
        <td><.icon>br-eimsbuettel-niendorf</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.937511,53.614054,9.962625,53.626908" lon={9.950974} lat={53.617107} dir="forward" ref={@ref} highlight="Niendorf">Niendorf Markt</.v></td>
      </tr>
      <tr>
        <td><.icon>br-nord-n8</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.94817,53.607197,9.963024,53.615494" lon={9.955007} lat={53.611829} dir="forward" ref={@ref}>Papenreye</.v></td>
      </tr>
      <tr>
        <td><.icon>br-nord-n7</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.941223,53.593841,9.972655,53.611805" lon={9.957517} lat={53.600192} dir="forward" ref={@ref}>Lokstedt</.v></td>
      </tr>
      <tr>
        <td><.icon>FR10</.icon><.icon>radroute-16</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.948743,53.576206,9.975451,53.594578" lon={9.95665} lat={53.583018} dir="forward" ref={@ref} highlight="Hoheluft-West,Hoheluft-Ost">Hoheluft</.v></td>
      </tr>
      <tr>
        <td><.icon>br-eimsbuettel-isebek</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.961251,53.56934,9.980547,53.579594" lon={9.972527} lat={53.574495} dir="forward" ref={@ref}>Harvestehude</.v></td>
      </tr>
      <tr>
        <td><.icon>br-eimsbuettel-rotherbaumring</.icon><.icon>radroute-14</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.977633,53.562873,9.991701,53.572189" lon={9.986438} lat={53.56676} dir="forward" ref={@ref}>Rotherbaum</.v></td>
      </tr>
      <tr>
        <td><.icon>br-eimsbuettel-rotherbaum</.icon><.icon>radroute-2</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.984204,53.558084,9.997137,53.565301" lon={9.989757} lat={53.561101} dir="forward" ref={@ref}>Bahnhof Dammtor</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-7</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.984306,53.553785,9.9935,53.559082" lon={9.989699} lat={53.55492} dir="forward" ref={@ref}>Gänsemarkt</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-4</.icon><.icon>radroute-6</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.986669,53.550813,9.999086,53.556134" lon={9.992185} lat={53.553435} dir="forward" ref={@ref}>Jungfernstieg</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-7</.icon><.icon>radroute-1</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.991577,53.548894,10.001633,53.553472" lon={9.995611} lat={53.550744} dir="forward" ref={@ref}>Mönckebergstraße</.v></td>
      </tr>
      <tr>
        <td><.icon>1GR</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.991527,53.539658,10.006269,53.549412" lon={9.997218} lat={53.545056} dir="forward" ref={@ref}>Speicherstadt</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.999826,53.532353,10.027768,53.547084" lon={10.008557} lat={53.540383} dir="forward" ref={@ref}>HafenCity</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon><.icon>FR6</.icon><.icon>radroute-12</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.017017,53.528631,10.037137,53.541594" lon={10.026236} lat={53.534083} dir="forward" ref={@ref}>Elbbrücken</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-23</.icon><.icon>radroute-21</.icon><.icon>radroute-2</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.008277,53.517568,10.032748,53.533264" lon={10.014803} lat={53.523731} dir="forward" ref={@ref}>Veddel</.v></td>
      </tr>
    </table>

    <p>Radroute 3 verläuft grob in Nord-Süd Richtung. Sie hat dabei einen leichten Knick in Richtung Osten, da sie über die <.v bounds="9.995362,53.511605,10.053813,53.549289" lon={10.022983} lat={53.534114} dir="forward" ref={@ref}>Freihafenelbbrücke</.v> geführt wird. Besonders deutlich merkt man das um <.v bounds="9.938551,53.568031,9.998724,53.598326" lon={9.961207} lat={53.578337} dir="forward" ref={@ref}>Hoheluft</.v> und in der <.v bounds="9.993795,53.532876,10.028179,53.547919" lon={10.008361} lat={53.540415} dir="forward" ref={@ref}>HafenCity</.v>.</p>

    <.roaddiagram src="radroute-03-wegweiser" width={115} alt="Zwischenwegweiser für Radroute 03" class="right"/>
    <h4>Auffindbarkeit</h4>
    <p>Die Route soll bis Ende 2025 von <.v bounds="9.943576,53.62753,9.959497,53.644837" lon={9.952295} lat={53.635892} dir="forward" ref={@ref}>Niendorf</.v> bis zur <.v bounds="9.986669,53.550813,9.999086,53.556134" lon={9.992185} lat={53.553435} dir="forward" ref={@ref}>Neustadt</.v> beschildert werden (<.a href="https://veloroute.hamburg/crowdsourcing/upload" rel="nofollow">Wo genau? Hilf mit!</.a>). Für die Fahrt weiter in Richtung Süden benötigt man entweder Ortskenntnis oder ein Navi.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Asphaltierte Abschnitte überwiegen deutlich. Die Fahrt <.v bounds="10.007657,53.520421,10.029471,53.534909" lon={10.017893} lat={53.528092} dir="forward" ref={@ref}>Am Moldauhafen</.v> ist zwar schon heute möglich, aber weil der <.v bounds="10.006272,53.518344,10.025731,53.52786" lon={10.012246} lat={53.523055} dir="forward" ref={@ref}>Anschluss am südlichen Ende</.v> zu umständlich ist, bisher nicht zu empfehlen. Bis der geplante Radweg gebaut wird, empfiehlt sich die Fahrt über die Neue Elbbrücke auf der <.a name="radroute-12">Radroute 12</.a>.</p>

    <h4>Meinung</h4>
    <p>Die Umbauten haben die Situation verbessert, dennoch bleibt die Radroute ein Kniefall vorm Autoverkehr. Nur auf den wenigsten Abschnitten stehen eigene Wege für den Radverkehr zur Verfügung – häufig setzt man auf Alibi-Lösungen mit <.ref>Schutzstreifen</.ref>, etwa in der <.v bounds="9.954151,53.582244,9.961593,53.591627" lon={9.956983} lat={53.587444} dir="forward" ref={@ref}>Stresemannallee</.v> oder der <.v bounds="9.946787,53.631541,9.956402,53.64021" lon={9.952253} lat={53.636735} dir="forward" ref={@ref}>Paul-Sorge-Straße</.v>.</p>

    <p>Positiv sind die hingegen die <.v bounds="9.978006,53.561869,9.993006,53.573155" lon={9.986577} lat={53.567697} dir="forward" ref={@ref}>Fahrradstraßen in Rotherbaum</.v>. Auch die Grüne Welle in der <.v bounds="9.968698,53.570018,9.979453,53.576889" lon={9.977128} lat={53.571688} dir="forward" ref={@ref}>Bogenstraße</.v> ist eine sinnvolle Ergänzung.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
