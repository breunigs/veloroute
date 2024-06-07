defmodule Data.Article.Static.Alltagsroute5 do
  use Article.Static

  def id(), do: "5"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 5"

  def color(), do: "#078a3d"

  def summary(),
    do:
      "Alltagsroute 5 führt vom Rathaus zum Flughafen bzw. nach Duvenstedt. Die Route spaltet sich dazu an der Hamburger Meile auf."

  def tags(), do: [id(), "5N"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "5",
        direction: :forward,
        from: "Innenstadt",
        to: "Duvenstedt",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Duvenstedt",
        historic: %{
          "75bec604005ee1e1bd856b4936ceaf23" => ~d[2024-06],
          "3e4199822d555e6cd92ca1a971b306c8" => ~d[2023-07],
          "e2af2b96121f8a6d64a7def8e6fa5ea6" => ~d[2022-04],
          "8f35f063edcc6c17f5e2cb22419b8b66" => ~d[2021-09]
        },
        videos: [
          {"2024-06-06-vr5/GX017638", "00:00:16.717", :end},
          {"2024-06-06-vr5/GX017639", :start, :end},
          {"2024-06-06-vr5/GX017640", :start, :end},
          {"2024-06-06-vr5/GX017641", :start, :end},
          {"2024-06-06-vr5/GX017642", :start, :end},
          {"2024-06-06-vr5/GX017643", :start, :end},
          {"2024-06-06-vr5/GX017657", :start, :end},
          {"2024-06-06-vr5/GX017658", :start, :end},
          {"2024-06-06-vr5/GX017659", :start, :end},
          {"2024-06-06-vr5/GX017660", :start, "00:00:24.258"},
          {"2024-06-06-vr5/GX017660", "00:00:28.295", :end},
          {"2024-06-06-vr5/GX017661", :start, :end},
          {"2024-06-06-vr5/GX017662", :start, :end},
          {"2024-06-06-vr5/GX017663", :start, :end},
          {"2024-06-06-vr5/GX017664", :start, "00:03:31.836"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "5",
        direction: :backward,
        from: "Duvenstedt",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "von Duvenstedt in die Innenstadt",
        historic: %{
          "34c78a47e7aad8e508362ccddff7f40b" => ~d[2024-06],
          "4d16236f1880945ff73319526eff409f" => ~d[2023-07],
          "4ad987f9aae61fb035d7317b944dea10" => ~d[2022-04],
          "34568a80252f5daab563eb9ebce3893e" => ~d[2021-06]
        },
        videos: [
          {"2024-06-06-vr5/GX017664", "00:03:32.879", :end},
          {"2024-06-06-vr5/GX017665", :start, :end},
          {"2024-06-06-vr5/GX017666", :start, :end},
          {"2024-06-06-vr5/GX017667", :start, "00:02:41.261"},
          {"2024-06-06-vr5/GX017668", :start, :end},
          {"2024-06-06-vr5/GX017669", :start, :end},
          {"2024-06-06-vr5/GX017670", :start, :end},
          {"2024-06-06-vr5/GX017671", :start, :end},
          {"2024-06-06-vr5/GX017672", :start, :end},
          {"2024-06-06-vr5/GX017673", :start, :end},
          {"2024-06-06-vr5/GX017674", :start, :end},
          {"2024-06-06-vr5/GX017675", :start, :end},
          {"2024-06-06-vr5/GX017676", :start, :end},
          {"2024-06-06-vr5/GX017677", :start, :end},
          {"2024-06-06-vr5/GX017678", :start, :end},
          {"2024-06-06-vr5/GX017679", :start, :end},
          {"2024-06-06-vr5/GX017680", :start, "00:00:11.676"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "5N",
        direction: :forward,
        from: "Hamburger Meile",
        to: "City Nord",
        parent_ref: __MODULE__,
        text: "Hamburger Meile zur City Nord",
        historic: %{
          "eeab93a8f01949422474881b775189f1" => ~d[2024-06],
          "b0b53d5543210c46fbfe2397291a7fa4" => ~d[2023-07],
          "0564511a98d53f27dd754ae1a4af11fa" => ~d[2022-04],
          "7cdaf2d2df2ac71669fab5292b882c95" => ~d[2021-06]
        },
        end_action: :reverse,
        videos: [
          {"2024-06-06-vr5/GX017644", :start, :end},
          {"2024-06-06-vr5/GX017645", :start, :end},
          {"2024-06-06-vr5/GX017646", :start, :end},
          {"2024-06-06-vr5/GX017647", :start, :end},
          {"2024-06-06-vr5/GX017648", :start, :end},
          {"2024-06-06-vr5/GX017649", :start, "00:00:01.001"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "5N",
        direction: :backward,
        from: "City Nord",
        to: "Hamburger Meile",
        parent_ref: __MODULE__,
        text: "City Nord zur Hamburger Meile",
        end_action: %{action: :play, route: __MODULE__, group: "5", direction: :forward},
        historic: %{
          "4039ae0d2dfbae34b70b8da5a187cf8d" => ~d[2024-06],
          "f6524e1bfb7c5405dad1cdb01c7c386e" => ~d[2023-07],
          "495adb7cbe7ae5df22ef39eae21f65dc" => ~d[2022-04],
          "695e28731f9a008ea8fab77b48a12dc5" => ~d[2021-06]
        },
        videos: [
          {"2024-06-06-vr5/GX017649", "00:00:01.001", :end},
          {"2024-06-06-vr5/GX017650", :start, :end},
          {"2024-06-06-vr5/GX017651", :start, :end},
          {"2024-06-06-vr5/GX017652", :start, :end},
          {"2024-06-06-vr5/GX017653", :start, :end},
          {"2024-06-06-vr5/GX017654", :start, :end},
          {"2024-06-06-vr5/GX017655", :start, :end},
          {"2024-06-06-vr5/GX017656", :start, :end}
        ]
      }
    ]

  def links(assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/426674/veloroute-5/"},
      ~H{Komoot Routenplaner: <.a href="https://www.komoot.com/de-de/tour/228654173">zum Flughafen</.a> oder <.a href="https://www.komoot.com/de-de/tour/204278537">nach Duvenstedt</.a>},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/226032"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="14" style="background-image: url(/images/route5.svg)">
          <.icon>5</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.982519,53.545759,10.013633,53.55792" lon={9.993806} lat={53.55096} dir="forward" ref="5" highlight="Rathausmarkt">Rathaus</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.988166,53.549291,10.035541,53.570707" lon={10.00817} lat={53.558734} dir="forward" ref="5">St. Georg</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>6</.icon>
        </td>
        <td><.v bounds="10.008254,53.558594,10.064174,53.587554" lon={10.024997} lat={53.568648} dir="forward" ref="5">Uhlenhorst</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.008254,53.558594,10.064174,53.587554" lon={10.031848} lat={53.572135} dir="forward" ref="5">Hamburger Meile</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR2</.icon>
          <.icon>13</.icon>
        </td>
        <td><.v bounds="10.020213,53.570726,10.054219,53.586163" lon={10.039445} lat={53.578668} dir="forward" ref="5">Barmbek-Süd</.v></td>
      </tr>
      <tr>
        <td><.v bounds="9.990573,53.579565,10.050525,53.606417" lon={10.032489} lat={53.593741} dir="forward" ref="5">Stadtpark</.v></td>
        <td><.v bounds="10.024222,53.577397,10.064373,53.593791" lon={10.044584} lat={53.586575} dir="forward" ref="5">Bahnhof Barmbek</.v></td>
      </tr>
      <tr>
        <td><.v bounds="10.004079,53.596666,10.047279,53.616115" lon={10.029098} lat={53.604042} dir="forward" ref="5">City Nord</.v></td>
        <td><.v bounds="10.023938,53.59136,10.080642,53.614938" lon={10.044369} lat={53.599221} dir="forward" ref="5">Barmbek-Nord</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR11</.icon> <.icon>4</.icon> <.v bounds="9.941035,53.606256,10.037278,53.652622" lon={10.018998} lat={53.614844} dir="forward" ref="5">Flughafen</.v>
        </td>
        <td><.v bounds="10.03323,53.601041,10.088375,53.622663" lon={10.063269} lat={53.611417} dir="forward" ref="5">Steilshoop</.v> <.icon>FR11</.icon></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.050457,53.609667,10.105602,53.631288" lon={10.07513} lat={53.618863} dir="forward" ref="5">Bramfeld</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.058328,53.626782,10.116455,53.660951" lon={10.096322} lat={53.640164} dir="forward" ref="5">Wellingsbüttel</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.053294,53.637465,10.111422,53.671634" lon={10.096484} lat={53.65258} dir="forward" ref="5">Poppenbüttel</.v>
          <.icon>14</.icon>
        </td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.06466,53.65537,10.150552,53.691535" lon={10.113857} lat={53.674322} dir="forward" ref="5">Bergstedt</.v> <.icon>FR1</.icon></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.073114,53.682036,10.154135,53.720004" lon={10.11192} lat={53.701265} dir="forward" ref="5">Duvenstedt</.v></td>
      </tr>
    </table>

    <p>Die Alltagsroute 5 (auch: Veloroute 5 oder Radroute 5) führt vom <.v bounds="9.982519,53.545759,10.013633,53.55792" lon={9.993806} lat={53.55096} dir="forward" ref="5" highlight="Rathausmarkt">Rathaus</.v> entweder zum <.v bounds="9.941035,53.606256,10.037278,53.652622" lon={10.018998} lat={53.614844} dir="forward" ref="5">Flughafen</.v> oder ganz in den Norden nach <.v bounds="10.051116,53.64911,10.178574,53.725028" lon={10.111704} lat={53.695508} dir="forward" ref="5">Duvenstedt</.v>. Die Äste trennen sich nach dem <.v bounds="10.012908,53.569733,10.051036,53.584139" lon={10.032242} lat={53.572568} dir="forward" ref="5">Einkaufszentrum Hamburger Meile</.v>.</p>

    <h5>Gemeinsamer Abschnitt</h5>
    <p>Die Route folgt der <.v bounds="9.988623,53.552844,10.020534,53.569388" lon={10.00766} lat={53.558452} dir="forward" ref="5" highlight="An der Alster">Außenalster auf der Ostseite</.v>. Wahlweise kann auch stadtauswärts direkt an der Alster gefahren werden, was leicht umständlicher ist. Im Anschluss verläuft die Route entlang der Hauptverkehrsstraße <.v bounds="10.0061,53.560306,10.053304,53.581248" lon={10.023889} lat={53.567906} dir="forward" ref="5">Mundsburger Damm / Hamburger Straße / Oberaltenallee</.v>.</p>

    <h5>Richtung Flughafen</h5>
    <p>Die Route knickt hier ab und folgt der <.v bounds="10.019562,53.572101,10.047068,53.602124" lon={10.034224} lat={53.586002} dir="forward" ref="5" highlight="Adolph-Schönfelder-Straße,Schleidenstraße,Biedermannplatz,Saarlandstraße">Hauptverkehrsstraße in Richtung Stadtpark</.v>. Dort wechselt man auf einen <.v bounds="10.017709,53.592957,10.040274,53.61746" lon={10.029588} lat={53.603438} dir="forward" ref="5">autofreien Abschnitt</.v> bevor man wieder auf eine <.v bounds="10.014022,53.606718,10.030201,53.619073" lon={10.022339} lat={53.612264} dir="forward" ref="5" highlight="Sengelmannstraße">vom KFZ dominierte Straße</.v> gelangt. Via <.a name="alltagsroute-4">Alltagsroute 4</.a> bzw. <.a name="br-nord-n1">Bezirksroute Nord N1</.a> erfolgt die Weiterfahrt.</p>

    <h5>Richtung Duvenstedt</h5>
    <p>Man folgt der <.v bounds="10.022023,53.569685,10.056543,53.588874" lon={10.037815} lat={53.57637} dir="forward" ref="5" highlight="Hamburger Straße">Hauptverkehrstraße</.v> noch ein wenig, knickt dann Richtung <.v bounds="10.035228,53.577288,10.053687,53.593027" lon={10.044446} lat={53.586493} dir="forward" ref="5">U- und S-Bahnhof Barmbek</.v> ab. Auf größtenteils Nebenstraßen erreicht man <.v bounds="10.045616,53.603251,10.125043,53.643104" lon={10.072621} lat={53.616446} dir="forward" ref="5">Bramfeld</.v>. Dort gelangt man wieder auf die <.v bounds="10.065162,53.612867,10.129021,53.652993" lon={10.082795} lat={53.621065} dir="forward" ref="5" highlight="Bramfelder Chaussee,Saseler Chaussee">zuvor verlassene Hauptverkehrsstraße</.v>. Auf Höhe des <.v bounds="10.078355,53.64266,10.117201,53.671456" lon={10.096849} lat={53.651285} dir="forward" ref="5">S-Bahnhof Poppenbüttel</.v> wird die Route wieder auf Nebenstraßen und Wohnstraßen verlagert. So erreicht man schließlich <.v bounds="10.086043,53.673708,10.135107,53.710476" lon={10.111041} lat={53.695048} dir="forward" ref="5">Duvenstedt</.v>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Asphalt und Betonplatten halten sich in etwa die Waage. Es gibt kurze Abschnitte mit Kopfsteinpflaster.</p>

    <h4>Meinung</h4>
    <p>Die ursprüngliche Idee war, die Routen abseits der KFZ-Hauptstraßen verlaufen zu lassen. Weniger Lärm- und Abgasbelastung einerseits, dem Autoverkehr keine Spur wegnehmen müssen andererseits. Das Konzept ging bei der Route nicht auf. Lange Abschnitte verlaufen an vierspuren Autoschneisen, auch in den Nebenstraßen dominiert häufig das Auto. Die Führung über die Nebenstraßen stellt auch häufig einen Umweg dar, für den man nur mäßige Radinfrastruktur erhält (<.v bounds="10.040056,53.596837,10.052131,53.603119" lon={10.044521} lat={53.59917} dir="forward" ref="5">viele schmale Schutzstreifen</.v>, <.v bounds="10.048642,53.602003,10.057001,53.605721" lon={10.052648} lat={53.603928} dir="forward" ref="5">unterbrochene Radwege</.v>).</p>

    <p>Andererseits hat die Route mit der <.v bounds="10.017216,53.596828,10.038291,53.611129" lon={10.030781} lat={53.601319} dir="forward" ref="5">Strecke im Pergolenviertel</.v> auch einen der besten Radwege Hamburgs – gute Oberfläche, keine KFZ, genug Platz zum Klönen und Überholen.</p>

    <p>Erwähnenswert ist auch die Versuchsstrecke <.v bounds="9.999015,53.556062,10.016522,53.562532" lon={10.00686} lat={53.558218} dir="forward" ref="5">An der Alster</.v> Richtung stadtauswärts. Regelmäßig setzt die Stadt hier kleine Verbesserungen um, die ohne großen Umbau auskommen. So hat sie die Qualität für den Radverkehr dort stetig erhöht, auch wenn noch einiges zu tun bleibt. Aber lieber kleine Verbesserungen heute, als einen großen Umbau der erst in Jahren – oder nie – kommt.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
