defmodule Data.Article.Static.Radroute19 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-19"
  def display_id(), do: "19"
  def title(), do: "Radroute 19"
  def color(), do: RouteColors.green1()

  def summary(),
    do: "Radroute 19 verbindet Eidelstedt – via Schnelsen und Niendorf – mit Langenhorn."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "19",
        direction: :backward,
        from: "Langenhorner Markt",
        to: "Eidelstedt Zentrum",
        parent_ref: __MODULE__,
        text: "von Langenhorn nach Eidelstedt",
        historic: %{
          "a5d1ef2ff2b9c4272e225c1acb76282d" => ~d[2024-06]
        },
        end_action: %{
          action: :play,
          route: Data.Article.Static.Radroute18,
          group: "18",
          direction: :forward
        },
        videos: [
          {"2024-06-16-13im-14gg/GX017729", :start, "00:00:16.413"},
          {"2024-06-16-13im-14gg/GX017730", :start, "00:00:52.609"},
          {"2024-06-16-13im-14gg/GX017731", "00:00:00.033", "00:00:48.374"},
          {"2024-06-18-14gg/GX017762", "00:00:47.807", "00:02:11.172"},
          {"2024-06-18-14gg/GX017763", "00:00:00.033", "00:00:01.468"},
          {"2023-06-25-13im-14gg/GX016126", "00:00:01.134", "00:00:42.576"},
          {"2024-06-18-14gg/GX017764", "00:00:09.543", "00:00:17.514"},
          {"2024-06-18-14gg/GX017765", :start, "00:00:54.978"},
          {"2024-06-18-14gg/GX017766", :start, "00:01:20.064"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "19",
        direction: :forward,
        from: "Eidelstedt Zentrum",
        to: "Langenhorner Markt",
        parent_ref: __MODULE__,
        text: "von Eidelstedt nach Langenhorn",
        historic: %{
          "56a69e15e58e08338eb823c76a0dde76" => ~d[2024-06]
        },
        videos: [
          {"2024-06-20-14im-13gg/GX017793", "00:00:26.021", "00:01:39.813"},
          {"2024-06-20-14im-13gg/GX017794", :start, "00:00:30.992"},
          {"2024-06-20-14im-13gg/GX017795", "00:00:00.067", "00:00:25.053"},
          {"2024-06-20-14im-13gg/GX017796", :start, "00:00:02.169"},
          {"2024-06-20-14im-13gg/GX017797", "00:00:00.100", "00:00:05.538"},
          {"2023-06-17-vr14-halb/GX015957", "00:00:04.737", "00:02:12.773"},
          {"2024-06-20-14im-13gg/GX017798", "00:02:15.241", "00:03:57.390"}
        ]
      }
    ]

  def links(_assigns) do
    [{"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643645"}]
  end

  def text(assigns) do
    ~H"""
    <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-19</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon>br-eimsbuettel-eidelstedt</.icon><.icon>radroute-18</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.882946,53.599509,9.929624,53.623448" lon={9.899191} lat={53.61139} dir="forward" ref={@ref}>Eidelstedt</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:bridge} ref={@ref}/></td>
        <td><.v bounds="9.890714,53.614971,9.915002,53.629028" lon={9.899394} lat={53.621923} dir="forward" ref={@ref}>Autobahn A23</.v></td>
      </tr>
      <tr>
        <td><.icon>br-eimsbuettel-nord-sued</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.897549,53.616903,9.953993,53.64607" lon={9.919298} lat={53.627305} dir="forward" ref={@ref}>Schnelsen</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:bridge} ref={@ref}/></td>
        <td><.v bounds="9.904991,53.622195,9.946018,53.635278" lon={9.921083} lat={53.628042} dir="forward" ref={@ref}>Autobahn A7</.v></td>
      </tr>
      <tr>
        <td><.icon>FR10</.icon></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="9.930688,53.627984,9.938368,53.632394" lon={9.934169} lat={53.630266} dir="forward" ref={@ref}>Kollau</.v></td>
      </tr>
      <tr>
        <td><.icon>br-eimsbuettel-niendorf</.icon><.icon>radroute-3</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.924002,53.620501,9.98224,53.649794" lon={9.94734} lat={53.639663} dir="forward" ref={@ref}>Niendorf Nord</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:tunnel} ref={@ref}/></td>
        <td><.v bounds="9.95919,53.635821,10.01014,53.656725" lon={9.977334} lat={53.646222} dir="forward" ref={@ref}>Flughafen</.v></td>
      </tr>
      <tr>
        <td><.icon>FR12</.icon></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="9.981542,53.643713,10.003149,53.653922" lon={9.987915} lat={53.649304} dir="forward" ref={@ref}>Tarpenbek</.v></td>
      </tr>
      <tr>
        <td><.icon>br-nord-n9</.icon><.icon>br-nord-n1</.icon><.icon>radroute-4</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.986298,53.635994,10.043677,53.66859" lon={10.009066} lat={53.648155} dir="forward" ref={@ref}>Langenhorn</.v></td>
      </tr>
    </table>

    <p>Die Radroute 19 verbindet die nordwestlichen äußeren Stadtteile <.v bounds="9.882946,53.599509,9.929624,53.623448" lon={9.899191} lat={53.61139} dir="forward" ref={@ref}>Eidelstedt</.v>, <.v bounds="9.897549,53.616903,9.953993,53.64607" lon={9.919298} lat={53.627305} dir="forward" ref={@ref}>Schnelsen</.v>, <.v bounds="9.924002,53.620501,9.98224,53.649794" lon={9.94734} lat={53.639663} dir="forward" ref={@ref}>Niendorf</.v> und <.v bounds="9.986298,53.635994,10.043677,53.66859" lon={10.009066} lat={53.648155} dir="forward" ref={@ref}>Langenhorn</.v>. Westlich des Flughafens verläuft sie meist auf größeren Nebenstraßen. Vom Flughafen bis Langenhorn folgt sie einer Hauptstraße.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die meisten Wege sind befestigt und allwettertauglich. Ausnahme ist der <.v bounds="9.862932,53.570632,9.904986,53.624813" lon={9.900168} lat={53.622777} dir="forward" ref="14">Brookgraben</.v> und einige kurze unbefestigte Stellen an Bäumen.</p>

    <h4>Meinung</h4>
    <p>Die Route ist bisher (Stand: Mitte 2024) kaum ausgebaut und daher nur schlecht befahrbar. Die Radwege sind eng, holprig, fehlen ganz, enden ohne brauchbare Überleitung oder werden mit Gittern versperrt.</p>

    <p>Bis die Route hergerichtet wird, ist es sinnvoller den direktesten Weg zu wählen. Es spricht aber auch nichts dagegen Abschnitte der Route zu benutzen, wenn sie auf dem Weg liegen.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
