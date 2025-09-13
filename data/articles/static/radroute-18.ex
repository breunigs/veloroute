defmodule Data.Article.Static.Radroute18 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-18"
  def display_id(), do: "18"
  def title(), do: "Radroute 18"
  def color(), do: RouteColors.blue3()

  def summary(),
    do:
      "Verläuft in Hamburgs Westen und verbindet den südlichen Stadtteil Neugraben-Fischbek mit dem nördlichen Stadteil Eidelstedt. Überquerung der Elbe mittels HVV-Fähre."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "18",
        direction: :backward,
        from: "Francoper Straße",
        to: "Eidelstedt Zentrum",
        parent_ref: __MODULE__,
        text: "von Neugraben nach Eidelstedt",
        historic: %{
          "d1732d3542f7b475e9c3e0d835fa0412" => ~d[2025-02]
        },
        end_action: %{
          action: :play,
          route: Data.Article.Static.Radroute19,
          group: "19",
          direction: :forward
        },
        videos: [
          {"2025-02-12-west/GX018038", "00:07:18.204", :end},
          {"2025-02-12-west/GX018039", :start, :end},
          {"2025-02-12-west/GX018040", "00:00:00.167", "00:01:52.646"},
          {"2025-02-12-west/GX018042", "00:00:00.367", "00:00:04.371"},
          {"2025-02-12-west/GX018043", "00:00:18.452", :end},
          {"2025-02-12-west/GX018044", :start, "00:04:15.555"},
          {"2024-06-20-14im-13gg/GX017790", "00:00:57.558", :end},
          {"2024-06-20-14im-13gg/GX017791", "00:00:00.234", :end},
          {"2024-06-20-14im-13gg/GX017792", :start, "00:01:00.882"},
          {"2024-06-20-14im-13gg/GX017793", "00:00:00.100", "00:00:29.690"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "18",
        direction: :forward,
        from: "Eidelstedt Zentrum",
        to: "Francoper Straße",
        parent_ref: __MODULE__,
        text: "von Eidelstedt nach Neugraben",
        historic: %{
          "cf98fd0805ff35555754050ccf0ae555" => ~d[2025-02]
        },
        videos: [
          {"2024-06-18-14gg/GX017766", "00:01:17.729", "00:01:43.884"},
          {"2024-06-18-14gg/GX017767", :start, "00:00:30.991"},
          {"2024-06-18-14gg/GX017768", "00:00:00.067", "00:00:34.328"},
          {"2024-06-18-14gg/GX017769", "00:00:00.067", "00:00:21.718"},
          {"2024-06-18-14gg/GX017770", "00:00:00.033", :end},
          {"2024-06-18-14gg/GX017771", "00:00:00.033", "00:00:12.510"},
          {"2024-06-18-14gg/GX017772", "00:00:00.667", "00:00:53.153"},
          {"2024-06-18-14gg/GX017772", "00:00:55.355", :end},
          {"2024-06-18-14gg/GX017773", "00:00:00.067", "00:00:11.168"},
          {"2024-05-03-vr1/GX017418", "00:00:09.391", "00:00:49.306"},
          {"2024-05-03-vr1/GX017418", "00:01:03.384", "00:01:22.115"},
          {"2025-02-12-west/GX018031", "00:02:39.159", "00:02:50.167"},
          {"2025-02-12-west/GX018032", "00:00:01.034", "00:00:20.368"},
          {"2025-02-12-west/GX018033", :start, "00:00:21.894"},
          {"2025-02-12-west/GX018034", "00:00:00.400", :end},
          {"2025-02-12-west/GX018035", :start, :end},
          {"2025-02-12-west/GX018036", :start, :end},
          {"2025-02-12-west/GX018037", :start, :end},
          {"2025-02-12-west/GX018038", "00:00:04.672", "00:06:07.100"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643644"},
      {"Präsentation zum Planungsstand", ~d[2025-05],
       "https://sitzungsdienst-harburg.hamburg.de/bi/vo020.asp?VOLFDNR=1012998"},
      {"Fahrplan Elbfähre (Linie 64)",
       "https://geofox.hvv.de/web/de/connections?execute=true&start=Teufelsbr%C3%BCck&startCity=Hamburg&startType=STATION&destination=R%C3%BCschpark&destinationCity=Hamburg&destinationType=STATION&timeIsDeparture=1&wayBy=train&forVisitors=1&useStationPosition=1"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-18</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon>br-eimsbuettel-eidelstedt</.icon><.icon>radroute-2</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.860992,53.597536,9.923414,53.623251" lon={9.899308} lat={53.61082} dir="forward" ref={@ref}>Eidelstedt</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.85267,53.580706,9.90902,53.609351" lon={9.883579} lat={53.595384} dir="forward" ref={@ref}>Lurup</.v></td>
      </tr>
      <tr>
        <td><.icon>FR9</.icon><.icon>FR11</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.840751,53.559165,9.906136,53.595516" lon={9.874989} lat={53.573992} dir="forward" ref={@ref}>Bahrenfeld</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-7</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.863938,53.552675,9.900001,53.571562" lon={9.87778} lat={53.564497} dir="forward" ref={@ref}>Groß Flottbek</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-1</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.868765,53.543924,9.903855,53.564236" lon={9.88141} lat={53.55637} dir="forward" ref={@ref}>Othmarschen</.v></td>
      </tr>
      <tr>
        <td><.icon>FR8</.icon><.icon>FR11</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.846671,53.535897,9.885771,53.560993" lon={9.863624} lat={53.547401} dir="forward" ref={@ref}>Teufelsbrück</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:ferry} ref={@ref}/></td>
        <td class="dim"><.v bounds="9.846671,53.535842,9.885771,53.560993" lon={9.862653} lat={53.544651} dir="forward" ref={@ref}>Elbe (HVV Fähre €)</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.846671,53.535842,9.885771,53.560993" lon={9.863312} lat={53.541502} dir="forward" ref={@ref}>Rüschpark</.v></td>
      </tr>
      <tr>
        <td><.icon>e</.icon><.icon>FR13</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.842335,53.525041,9.8877,53.544827" lon={9.873983} lat={53.533651} dir="forward" ref={@ref}>Finkenwerder</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.863488,53.490711,9.904639,53.515022" lon={9.876682} lat={53.505695} dir="forward" ref={@ref}>Francop</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:bridge} ref={@ref}/></td>
        <td><.v bounds="9.864228,53.486049,9.895878,53.501562" lon={9.874224} lat={53.495354} dir="forward" ref="radroute-18">Autobahn A26</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-10</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.85366,53.469382,9.884477,53.495517" lon={9.862979} lat={53.476357} dir="forward" ref={@ref}>Neugraben-Fischbek</.v></td>
      </tr>
    </table>

    <p>Radroute 18 verläuft in Nord-Süd Richtung und verbindet die Stadtteile <.v bounds="9.860992,53.597536,9.923414,53.623251" lon={9.899308} lat={53.61082} dir="forward" ref={@ref}>Eidelstedt</.v> im Nordwesten mit <.v bounds="9.85366,53.469382,9.884477,53.495517" lon={9.862979} lat={53.476357} dir="forward" ref={@ref}>Neugraben-Fischbek</.v> im Südwesten Hamburgs. Die <.v bounds="9.846671,53.535842,9.885771,53.560993" lon={9.862653} lat={53.544651} dir="forward" ref={@ref}>Querung der Elbe</.v> erfolgt mittels HVV-Fähre: Ticket erforderlich, Fahrradmitnahme kostenlos, Teil des HVV-Tarifs und damit im Deutschlandticket, <.a href="https://geofox.hvv.de/web/de/connections?execute=true&start=Teufelsbr%C3%BCck&startCity=Hamburg&startType=STATION&destination=R%C3%BCschpark&destinationCity=Hamburg&destinationType=STATION&timeIsDeparture=1&wayBy=train&forVisitors=1&useStationPosition=1">Fahrplan</.a>.</p>

    <p>Die Route liegt hauptsächlich auf größeren Nebenstraßen, wobei mit <.v bounds="9.863559,53.581998,9.906126,53.609894" lon={9.884035} lat={53.595709} dir="forward" ref={@ref}>Elbgaustraße</.v>, <.v bounds="9.848585,53.534968,9.896296,53.558941" lon={9.874306} lat={53.547136} dir="forward" ref={@ref}>Elbchaussee</.v> und der <.v bounds="9.858148,53.483119,9.887444,53.504203" lon={9.872228} lat={53.490844} dir="forward" ref={@ref}>Francoper Straße</.v> auch Hauptstraßen mit viel KFZ-Verkehr dabei sind. Nur kleine Abschnitte sind in <.v bounds="9.865523,53.570893,9.87958,53.586322" lon={9.874688} lat={53.580797} dir="forward" ref={@ref}>Wohnstraßen</.v> bzw. <.v bounds="9.865523,53.570893,9.87958,53.586322" lon={9.874119} lat={53.576144} dir="forward" ref={@ref}>Parks</.v>, vor allem in <.v bounds="9.840751,53.559165,9.906136,53.595516" lon={9.874989} lat={53.573992} dir="forward" ref={@ref}>Bahrenfeld</.v>.</p>

    <p>In <.v bounds="9.867685,53.491132,9.895424,53.511083" lon={9.876884} lat={53.505612} dir="forward" ref={@ref}>Francop</.v> kann wahlweise auf der Straße mit glattem Asphalt ohne eigene Radwege oder auf der Deichkrone mit holprigem Pflaster und wenig Platz gefahren werden. Langfristig soll hier ein eigener, abgetrennter Radweg entstehen.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Viele Wege sind asphaltiert oder gepflastert und allwettertauglich. Problemstelle ist der <.v bounds="9.865523,53.570893,9.87958,53.586322" lon={9.874119} lat={53.576144} dir="forward" ref={@ref}>Lise-Meitner-Park</.v> mit seinen Erd- bzw. Sandwegen. Wegen des <.a name="2022-04-15-parkstrasse">Baus der Fernwärmeleitung</.a> ist die Route in <.v bounds="9.863938,53.552675,9.900001,53.571562" lon={9.87778} lat={53.564497} dir="forward" ref={@ref}>Groß Flottbek</.v> und <.v bounds="9.868765,53.543924,9.903855,53.564236" lon={9.88141} lat={53.55637} dir="forward" ref={@ref}>Othmarschen</.v> kaum praktisch benutzbar (Stand: Frühjahr 2025).</p>

    <p>Für die <.v bounds="9.874075,53.516333,9.890152,53.523472" lon={9.884742} lat={53.519176} dir="forward" ref={@ref} highlight="Aue">Querung der Aue</.v> ist neue Brücke geplant. Bis zum Lückenschluss steht aber eine gut benutzbare Alternative bereit.</p>

    <h4>Meinung</h4>
    <p>Die bereits ausgebauten Abschnitte zeigen, was sein könnte. Etwa das <.v bounds="9.857898,53.531689,9.880779,53.544361" lon={9.865413} lat={53.540501} dir="forward" ref={@ref}>Kaiufer in Finkenwerder</.v> oder der Weg auf der <.v bounds="9.874404,53.518307,9.886899,53.532274" lon={9.87769} lat={53.525143} dir="forward" ref={@ref}>ehemaligen Bahnstrecke</.v>. Dass man diese weiterführen will und dafür eine eigene, markante Brücke plant zeigt auch, dass Hamburg Fuß- und Radverkehr ernster nimmt als vor einem Jahrzehnt.</p>

    <p>Leider überwiegen aber die nicht sanierten Abschnitte. Diese sind zwar befahrbar, aber unkomfortabel. Auch wenn teilweise die Planungen schon laufen, wird es noch Jahre dauern, bis die Route durchgängig gut benutzbar ist.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
