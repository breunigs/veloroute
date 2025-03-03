defmodule Data.Article.Static.Radroute5 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-5"
  def display_id(), do: "5"
  def title(), do: "Radroute 5"
  def color(), do: RouteColors.blue3()

  def summary(),
    do:
      "Radroute 5 startet an der Mundsburger Brücke („östliche Außenalster“) und führt via Steilshoop bis nach Duvenstedt."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "5",
        direction: :backward,
        from: "Duvenstedt",
        to: "Mundsburger Brücke",
        parent_ref: __MODULE__,
        text: "von Duvenstedt zur Mundsburger Brücke",
        historic: %{
          "f1a33ae01ec03b02620f17adf9e75d6b" => ~d[2024-06]
        },
        videos: [
          {"2024-06-06-vr5/GX017664", "00:03:32.879", "00:07:02.138"},
          {"2024-06-06-vr5/GX017665", :start, "00:00:02.669"},
          {"2024-06-06-vr5/GX017666", :start, :end},
          {"2024-06-06-vr5/GX017667", :start, "00:02:41.363"},
          {"2024-06-06-vr5/GX017668", :start, :end},
          {"2024-06-06-vr5/GX017669", "00:00:00.200", "00:00:46.504"},
          {"2024-06-06-vr5/GX017670", :start, "00:00:04.403"},
          {"2024-06-06-vr5/GX017671", :start, "00:00:17.747"},
          {"2024-06-06-vr5/GX017672", :start, "00:00:20.150"},
          {"2024-06-06-vr5/GX017673", :start, "00:00:32.193"},
          {"2024-06-06-vr5/GX017674", "00:00:00.033", "00:00:40.433"},
          {"2024-06-06-vr5/GX017675", "00:00:00.067", "00:00:06.806"},
          {"2024-06-06-vr5/GX017676", "00:00:00.033", "00:00:27.461"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "5",
        direction: :forward,
        from: "Mundsburger Brücke",
        to: "Duvenstedt",
        parent_ref: __MODULE__,
        text: "von der Mundsburger Brücke nach Duvenstedt",
        historic: %{
          "4f0edc0907da27f684f9b3767e4d673e" => ~d[2024-06]
        },
        videos: [
          {"2024-06-06-vr5/GX017641", "00:00:15.015", "00:00:19.082"},
          {"2024-06-06-vr5/GX017642", :start, "00:00:22.385"},
          {"2024-06-06-vr5/GX017643", "00:00:00.067", "00:00:26.121"},
          {"2024-06-06-vr5/GX017657", "00:00:00.033", "00:00:20.217"},
          {"2024-06-06-vr5/GX017658", :start, "00:00:02.602"},
          {"2024-06-06-vr5/GX017659", "00:00:00.033", "00:00:51.741"},
          {"2024-06-06-vr5/GX017660", :start, "00:00:24.258"},
          {"2024-06-06-vr5/GX017660", "00:00:28.295", :end},
          {"2024-06-06-vr5/GX017661", "00:00:00.067", "00:00:30.091"},
          {"2024-06-06-vr5/GX017662", :start, :end},
          {"2024-06-06-vr5/GX017663", "00:00:00.100", "00:00:34.694"},
          {"2024-06-06-vr5/GX017664", "00:00:00.067", "00:03:31.836"}
        ]
      }
    ]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-5</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon>radroute-6</.icon></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.014524,53.563501,10.030842,53.569621" lon={10.019702} lat={53.565339} dir="forward" ref={@ref}>Mundsburger Kanal</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-12</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.008254,53.558594,10.064174,53.587554" lon={10.024997} lat={53.568648} dir="forward" ref={@ref}>Uhlenhorst</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="10.008254,53.558594,10.064174,53.587554" lon={10.031848} lat={53.572135} dir="forward" ref={@ref}>Hamburger Meile</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>br-nord-n4</.icon>
          <.icon>radroute-17</.icon>
        </td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.020213,53.570726,10.054219,53.586163" lon={10.039445} lat={53.578668} dir="forward" ref={@ref}>Barmbek-Süd</.v></td>
      </tr>
      <tr>
        <td><.icon>FR2</.icon></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.038393,53.581883,10.048706,53.588705" lon={10.042083} lat={53.584805} dir="forward" ref={@ref}>Osterbekkanal</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.024222,53.577397,10.064373,53.593791" lon={10.044584} lat={53.586575} dir="forward" ref={@ref}>Bahnhof Barmbek</.v></td>
      </tr>
      <tr>
        <td><.icon>br-nord-n7</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.023938,53.59136,10.080642,53.614938" lon={10.044369} lat={53.599221} dir="forward" ref={@ref}>Barmbek-Nord</.v></td>
      </tr>
      <tr>
        <td><.icon>br-wandsbek-w5</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.03323,53.601041,10.088375,53.622663" lon={10.063269} lat={53.611417} dir="forward" ref={@ref}>Steilshoop</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.060137,53.611246,10.081465,53.620959" lon={10.068714} lat={53.615297} dir="forward" ref={@ref}>Seebek</.v></td>
      </tr>
      <tr>
        <td><.icon>br-wandsbek-w3</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.050457,53.609667,10.105602,53.631288" lon={10.07513} lat={53.618863} dir="forward" ref={@ref}>Bramfeld</.v></td>
      </tr>
      <tr>
        <td><.icon>br-wandsbek-w6</.icon><.icon>br-wandsbek-w8</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.058328,53.626782,10.116455,53.660951" lon={10.096322} lat={53.640164} dir="forward" ref={@ref}>Wellingsbüttel</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="10.053294,53.637465,10.111422,53.671634" lon={10.096484} lat={53.65258} dir="forward" ref={@ref}>Poppenbüttel</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.096274,53.663315,10.122581,53.676142" lon={10.10831} lat={53.669912} dir="forward" ref={@ref} highlight="Saselbek">Saselbek (Alte Mühle)</.v></td>
      </tr>
      <tr>
        <td><.icon>br-wandsbek-w4</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.06466,53.65537,10.150552,53.691535" lon={10.113857} lat={53.674322} dir="forward" ref={@ref}>Bergstedt</.v></td>
      </tr>
      <tr>
        <td><.icon>FR1</.icon></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.108111,53.680184,10.125444,53.688969" lon={10.116634} lat={53.683429} dir="forward" ref={@ref}>Alster</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="10.073114,53.682036,10.154135,53.720004" lon={10.11192} lat={53.701265} dir="forward" ref={@ref}>Duvenstedt</.v></td>
      </tr>
    </table>


    <p>Die Radroute 5 führt ab der <.v bounds="10.014524,53.563501,10.030842,53.569621" lon={10.019702} lat={53.565339} dir="forward" ref={@ref}>Mundsburger Brücke</.v> ganz in den Norden nach <.v bounds="10.051116,53.64911,10.178574,53.725028" lon={10.111704} lat={53.695508} dir="forward" ref={@ref}>Duvenstedt</.v>.</p>

    <p>Sie verläuft zunächst entlang der Hauptverkehrsstraße <.v bounds="10.0061,53.560306,10.053304,53.581248" lon={10.023889} lat={53.567906} dir="forward" ref={@ref}>Mundsburger Damm / Hamburger Straße / Oberaltenallee</.v>, knickt dann Richtung <.v bounds="10.035228,53.577288,10.053687,53.593027" lon={10.044446} lat={53.586493} dir="forward" ref={@ref}>U- und S-Bahnhof Barmbek</.v> ab. Auf größtenteils Nebenstraßen erreicht man <.v bounds="10.045616,53.603251,10.125043,53.643104" lon={10.072621} lat={53.616446} dir="forward" ref={@ref}>Bramfeld</.v>. Dort gelangt man wieder auf die <.v bounds="10.065162,53.612867,10.129021,53.652993" lon={10.082795} lat={53.621065} dir="forward" ref={@ref} highlight="Bramfelder Chaussee,Saseler Chaussee">zuvor verlassene Hauptverkehrsstraße</.v>. Auf Höhe des <.v bounds="10.078355,53.64266,10.117201,53.671456" lon={10.096849} lat={53.651285} dir="forward" ref={@ref}>S-Bahnhof Poppenbüttel</.v> wird die Route wieder auf Nebenstraßen und Wohnstraßen verlagert. So erreicht man schließlich <.v bounds="10.086043,53.673708,10.135107,53.710476" lon={10.111041} lat={53.695048} dir="forward" ref={@ref}>Duvenstedt</.v>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Asphalt und Betonplatten halten sich in etwa die Waage. Es gibt kurze Abschnitte mit Kopfsteinpflaster.</p>

    <h4>Meinung</h4>
    <p>Die ursprüngliche Idee war, die Routen abseits der KFZ-Hauptstraßen verlaufen zu lassen. Weniger Lärm- und Abgasbelastung einerseits, dem Autoverkehr keine Spur wegnehmen müssen andererseits. Das Konzept ging bei der Route nicht auf. Lange Abschnitte verlaufen an vierspurigen Autoschneisen, auch in den Nebenstraßen dominiert häufig das Auto. Die Führung über die Nebenstraßen stellt auch einen Umweg dar, für den man nur mäßige Radinfrastruktur erhält (<.v bounds="10.040056,53.596837,10.052131,53.603119" lon={10.044521} lat={53.59917} dir="forward" ref={@ref}>viele schmale Schutzstreifen</.v>, <.v bounds="10.048642,53.602003,10.057001,53.605721" lon={10.052648} lat={53.603928} dir="forward" ref={@ref}>unterbrochene Radwege</.v>).</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
