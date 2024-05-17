defmodule Data.Article.Static.Alltagsroute11 do
  use Article.Static

  def id(), do: "11"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 11"

  def color(), do: "#00a0e2"

  def summary(),
    do: "Alltagsroute 11 führt vom Rathaus bzw. ab der Veddel nach Eißendorf"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "11 Eißendorf",
        direction: :forward,
        from: "Innenstadt",
        to: "Eißendorf",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Eißendorf",
        historic: %{
          "f05e0b987337e531335d934d5ae2c2d1" => ~d[2024-05],
          "0418cd7dcedb68e4c370ed752d33cecb" => ~d[2023-07],
          "6c5ec4b87553c5a86fac6b206345e318" => ~d[2022-04]
        },
        videos: [
          {"2024-04-30-fr3/GX017317", "00:00:27.861", :end, vf: "curves=lighter"},
          {"2024-04-30-fr3/GX017318", :start, "00:00:09.977"},
          {"2024-04-21-vr2-rand/GX017237", "00:00:15.516", "00:00:43.977"},
          {"2024-03-17-fr14/GX016929", "00:00:02.002", :end},
          {"2024-03-17-fr14/GX016930", :start, "00:00:06.940"},
          {"2024-03-17-fr14/GX016893", "00:00:56.690", :end},
          {"2024-03-17-fr14/GX016894", :start, "00:01:12.606"},
          {"2024-05-16-vr11/GX017582", "00:01:34.761", :end},
          {"2024-05-16-vr11/GX017583", :start, :end},
          {"2024-05-16-vr11/GX017584", :start, :end},
          {"2024-05-16-vr11/GX017585", :start, :end},
          {"2024-05-16-vr11/GX017586", :start, :end},
          {"2024-05-16-vr11/GX017587", :start, "00:00:47.514"},
          {"2024-05-16-vr11/GX017588", :start, "00:01:26.687"},
          {"2024-05-16-vr11/GX017592", :start, :end},
          {"2024-05-16-vr11/GX017593", :start, "00:00:41.033"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "11 Eißendorf",
        direction: :backward,
        from: "Eißendorf",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Eißendorf in die Innenstadt",
        historic: %{
          "8e2c6033fb4804c9945fb9091ca8ec5f" => ~d[2024-05],
          "f8ae15e42784a7f58846dd631a34f0f1" => ~d[2023-07],
          "b4997cc9bce6de5126d1a2c294cc8265" => ~d[2022-04]
        },
        videos: [
          {"2024-05-16-vr11/GX017593", "00:00:51.041", "00:01:04.798"},
          {"2024-05-16-vr11/GX017594", "00:00:00.300", :end},
          {"2024-05-16-vr11/GX017595", :start, :end},
          {"2024-05-16-vr11/GX017596", :start, :end},
          {"2024-05-16-vr11/GX017597", :start, :end},
          {"2024-05-16-vr11/GX017598", :start, :end},
          {"2024-05-16-vr11/GX017599", :start, :end},
          {"2024-05-16-vr11/GX017600", :start, :end},
          {"2024-05-16-vr11/GX017601", :start, :end},
          {"2024-05-16-vr11/GX017602", :start, :end},
          {"2024-05-16-vr11/GX017603", :start, :end},
          {"2024-05-16-vr11/GX017604", :start, :end},
          {"2024-05-16-vr11/GX017605", :start, :end},
          {"2024-05-16-vr11/GX017606", "00:00:04.404", :end},
          {"2024-05-16-vr11/GX017607", :start, :end},
          {"2024-05-16-vr11/GX017608", :start, :end},
          {"2024-03-17-fr14/GX016907", "00:00:07.875", "00:00:50.550"},
          {"2024-03-17-fr14/GX016907", "00:00:55.923", :end},
          {"2024-03-17-fr14/GX016908", :start, "00:00:07.608"},
          {"2024-04-30-fr3/GX017290", "00:00:06.273", :end},
          {"2024-04-30-fr3/GX017291", :start, :end},
          {"2024-04-30-fr3/GX017292", :start, "00:00:32.766"}
        ]
      },

      # videos are only the short segments, GPX should be the full tracks
      %Video.Track{
        renderer: 3,
        group: "11 Veddel",
        direction: :forward,
        from: "Veddel",
        to: "Bürgerhaus Wilhelmsburg",
        parent_ref: __MODULE__,
        text: "von der Veddel zum Bürgerhaus Wilhelmsburg",
        historic: %{
          "df8cc38b888ae9c65d70df36d9b779db" => ~d[2023-07],
          "5d955ccf2971302202fe02fbdefe1616" => ~d[2022-05]
        },
        videos: [
          {"2023-07-09-vr11-und-erwrtng/GX010092", "00:00:31.999", :end},
          {"2023-07-09-vr11-und-erwrtng/GX010093", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010094", :start, "00:01:25.735"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "11 Veddel",
        direction: :backward,
        from: "Bürgerhaus Wilhelmsburg",
        to: "Veddel",
        parent_ref: __MODULE__,
        text: "vom Bürgerhaus Wilhelmsburg zur Veddel",
        historic: %{
          "a63faf1e4d34e8770ad599746ce522fe" => ~d[2023-07],
          "3c8980283b9a8d3730bb35a8e18e48fd" => ~d[2022-05]
        },
        videos: [
          {"2023-07-09-vr11-und-erwrtng/GX010074", "00:00:07.040", :end},
          {"2023-07-09-vr11-und-erwrtng/GX010075", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010076", :start, "00:00:07.074"}
        ]
      }
    ]

  def links(assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/426790/veloroute-11/"},
      ~H{Komoot Routenplaner: <.a href="https://www.komoot.com/de-de/tour/225145133">ab Rathaus</.a> oder <.a href="https://www.komoot.com/de-de/tour/229606335">ab der Veddel</.a> nach Eißendorf},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/233959"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="15" style="background-image: url(/images/route11.svg)">
          <.icon>11</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.993833} lat={53.550924} dir="forward" ref="11" highlight="Rathausmarkt">Rathaus</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>1</.icon>
          <.icon>12</.icon>
          <.icon>2</.icon>
        </td>
        <td><.v bounds="9.977057,53.542542,9.99718,53.553605" lon={9.986901} lat={53.54872} dir="forward" ref="11">Rödingsmarkt</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>1GR</.icon>
          <.icon>FR8</.icon>
          <.icon>12</.icon>
        </td>
        <td><.v bounds="9.957407,53.535802,9.976696,53.551442" lon={9.972308} lat={53.545537} dir="forward" ref="11">Landungsbrücken</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>12</.icon>
        </td>
        <td><.v bounds="9.958137,53.521845,9.993724,53.549976" lon={9.966592} lat={53.544303} dir="forward" ref="11">Alter Elbtunnel</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR14</.icon>
        </td>
        <td><.v bounds="9.954913,53.520612,9.988097,53.546909" lon={9.96852} lat={53.535508} dir="forward" ref="11">Hafen</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.969596,53.503746,9.996222,53.527843" lon={9.987412} lat={53.51533} dir="forward" ref="11">Reiherstiegviertel</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.973268,53.478859,10.017935,53.51145" lon={9.997452} lat={53.495672} dir="forward" ref="11">Wilhelmsburger Inselpark</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR6</.icon>
          <.icon>10</.icon>
        </td>
        <td><.v bounds="9.973211,53.457654,10.020346,53.489013" lon={9.996038} lat={53.475209} dir="forward" ref="11">Alte Harburger Elbbrücke</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>10</.icon> <.v bounds="10.000199,53.506988,10.047087,53.534351" lon={10.0155} lat={53.520488} dir="backward" ref="11">Veddel</.v>
        </td>
        <td><.v bounds="9.984519,53.45331,9.996765,53.462077" lon={9.988546} lat={53.45778} dir="forward" ref="11">Bahnhof Harburg</.v></td>
      </tr>
      <tr>
        <td class="dir"><.m bounds="9.9214907,53.3167401,10.1074035,53.4639106">(Seevetal)</.m></td>
        <td><.v bounds="9.968763,53.452748,9.99928,53.465024" lon={9.984501} lat={53.459484} dir="forward" ref="11">Harburg</.v> <.icon>FR7</.icon></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.957122,53.454716,9.984472,53.463618" lon={9.970439} lat={53.460433} dir="forward" ref="11">TUHH</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.934683,53.453683,9.973803,53.466567" lon={9.959735} lat={53.460863} dir="forward" ref="11">Heimfeld</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon></td>
        <td><.v bounds="9.934683,53.453683,9.973803,53.466567" lon={9.947303} lat={53.457857} dir="forward" ref="11">Eißendorf</.v></td>
      </tr>
      <tr>
        <td></td>
        <td class="dir"><.m bounds="9.8044452,53.3347794,9.9580681,53.4579631">(Rosengarten)</.m></td>
      </tr>
    </table>

    <p>Die Alltagsroute 11 (auch: Veloroute 11 oder Radroute 11) führt vom Rathaus über <.v bounds="9.966664,53.476236,10.039598,53.528563" lon={9.997804} lat={53.496027} dir="forward" ref="11">Wilhelmsburg</.v> und <.v bounds="9.963366,53.448875,10.009879,53.476496" lon={9.988009} lat={53.457319} dir="forward" ref="11">Harburg</.v> nach <.v bounds="9.928056,53.444615,9.974061,53.468019" lon={9.952239} lat={53.458779} dir="forward" ref="11">Eißendorf</.v>. Auf Wilhelmsburg gibt es einen <.v bounds="9.966664,53.476236,10.039598,53.528563" lon={9.982593} lat={53.517019} dir="forward" ref="11">westlichen Ast</.v> über den <.v bounds="9.958137,53.521845,9.993724,53.549976" lon={9.966592} lat={53.544303} dir="forward" ref="11">alten Elbtunnel</.v> und einen <.v bounds="9.966664,53.476236,10.039598,53.528563" lon={10.005779} lat={53.515965} dir="forward" ref="11">östlichen Ast</.v> in Richtung <.v bounds="9.966664,53.476236,10.039598,53.528563" lon={10.015064} lat={53.521855} dir="backward" ref="11">Veddel</.v>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Meist sind sie asphaltiert, es gibt aber auch kurze Abschnitte mit Kopfsteinpflaster. Der alte Elbtunnel ist ganztägig befahrbar. In der Nebenverkehrszeit stehen nur die seitlichen Personenaufzüge zur Verfügung.</p>

    <h4>Meinung</h4>
    <p>Gerade auf Wilhelmsburg macht die Route Spaß: wenig Kreuzungen und autofreie Abschnitte. Nördlich und südlich der Elbe trüben die noch nicht ausgebauten Abschnitte und schlechte Ampelschaltungen den Eindruck. Negativbeispiel ist die <.v bounds="9.982957,53.544552,9.987049,53.546294" lon={9.984063} lat={53.545369} dir="backward" ref="11">Schaartorbrücke</.v>, an der man zum Linksabbiegen mindestens drei Mal halten muss.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
