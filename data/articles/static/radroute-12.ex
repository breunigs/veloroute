defmodule Data.Article.Static.Radroute12 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-12"
  def display_id(), do: "12"
  def title(), do: "Radroute 12"
  def color(), do: RouteColors.blue1()

  def summary(),
    do:
      "Radroute 12 verläuft in Nord-Süd-Richtung und verbindet Alsterdorf mit Wilhelmsburg. Die Norderelbe wird über die Neue Elbbrücke gequert."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "12",
        direction: :forward,
        from: "City Nord",
        to: "Bürgerhaus Wilhelmsburg",
        parent_ref: __MODULE__,
        text: "von der City Nord nach Wilhelmsburg",
        historic: %{
          "d170335db3e18c90ccd9350cd1047bff" => ~d[2025-02]
        },
        videos: [
          {"2024-06-06-vr5/GX017650", :start, :end},
          {"2024-06-06-vr5/GX017651", :start, "00:00:02.602"},
          {"2024-06-06-vr5/GX017652", :start, "00:00:26.187"},
          {"2024-06-06-vr5/GX017653", :start, "00:00:39.899"},
          {"2024-06-06-vr5/GX017654", :start, "00:00:28.556"},
          {"2024-06-06-vr5/GX017655", :start, "00:00:05.338"},
          {"2022-04-30-velo5-u-12innenstadt/GX013626", "00:00:05.404", "00:00:23.123"},
          {"2025-02-16-mitte/GX018097", "00:00:05.305", :end},
          {"2025-02-16-mitte/GX018098", "00:00:00.167", :end},
          {"2025-02-16-mitte/GX018099", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010087", :start, "00:00:01.935"},
          {"2023-07-09-vr11-und-erwrtng/GX010087", "00:00:06.940", "00:00:40.933"},
          {"2023-07-09-vr11-und-erwrtng/GX010088", :start, "00:00:19.682"},
          {"2023-07-09-vr11-und-erwrtng/GX010089", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010090", :start, "00:00:22.919"},
          {"2023-07-09-vr11-und-erwrtng/GX010091", :start, "00:00:19.616"},
          {"2024-03-30-fr6-fr7/GX017005", "00:00:41.033", "00:01:20.598"},
          {"2024-03-30-fr6-fr7/GX017006", :start, "00:00:40.800"},
          {"2024-03-30-fr6-fr7/GX017007", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010094", :start, "00:01:26.069"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "12",
        direction: :backward,
        from: "Bürgerhaus Wilhelmsburg",
        to: "City Nord",
        parent_ref: __MODULE__,
        text: "von Wilhelmsburg zur City Nord",
        historic: %{
          "be43e21ae0ce275b16cd6844d8fe5af7" => ~d[2025-02]
        },
        videos: [
          {"2023-07-09-vr11-und-erwrtng/GX010074", "00:00:06.707", "00:01:22.716"},
          {"2024-03-30-fr6-fr7/GX017027", "00:01:16.061", "00:01:44.951"},
          {"2024-04-21-vr2-rand/GX017209", "00:00:00.667", "00:00:10.568"},
          {"2024-05-18-vr10/GX017627", "00:00:26.997", "00:00:45.821"},
          {"2024-03-30-fr6-fr7/GX017028", "00:00:18.641", "00:00:54.477"},
          {"2024-03-30-fr6-fr7/GX017029", :start, "00:00:17.281"},
          {"2024-03-30-fr6-fr7/GX017030", :start, "00:00:10.675"},
          {"2024-03-30-fr6-fr7/GX017031", :start, "00:00:07.507"},
          {"2023-07-09-vr11-und-erwrtng/GX010078", "00:00:14.838", :end},
          {"2023-07-09-vr11-und-erwrtng/GX010079", :start, "00:00:12.110"},
          {"2023-07-09-vr11-und-erwrtng/GX010080", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010081", :start, "00:00:02.461"},
          {"2025-02-25-nordost/GX018295", "00:01:31.206", :end},
          {"2025-02-25-nordost/GX018296", :start, "00:00:02.202"},
          {"2025-02-25-nordost/GX018297", :start, :end},
          {"2025-02-25-nordost/GX018298", :start, :end},
          {"2025-02-25-nordost/GX018299", :start, "00:00:15.808"},
          {"2024-06-06-vr5/GX017645", "00:00:15.029", :end},
          {"2024-06-06-vr5/GX017646", "00:00:00.400", "00:00:55.411"},
          {"2024-06-06-vr5/GX017647", :start, "00:00:30.258"},
          {"2024-06-06-vr5/GX017648", :start, "00:00:12.844"},
          {"2024-06-06-vr5/GX017649", :start, :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643637"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-12</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon>br-nord-n1</.icon><.icon>radroute-4</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.007087,53.603238,10.039558,53.618623" lon={10.018336} lat={53.614711} dir="forward" ref={@ref}>Alsterdorf</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.017953,53.602548,10.033942,53.614494" lon={10.02384} lat={53.610256} dir="forward" ref={@ref}>U-Bahn-Brücke</.v></td>
      </tr>
      <tr>
        <td><.icon>br-nord-n7</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.010745,53.595123,10.042176,53.610952" lon={10.028882} lat={53.603848} dir="forward" ref={@ref}>Pergolenviertel / City-Nord</.v></td>
      </tr>
      <tr>
        <td><.icon>br-nord-n6</.icon></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.026307,53.586411,10.040023,53.598203" lon={10.032005} lat={53.593035} dir="forward" ref={@ref}>Goldbekkanal</.v></td>
      </tr>
      <tr>
        <td><.icon>br-nord-n3</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.019411,53.580037,10.064912,53.599864" lon={10.032506} lat={53.589523} dir="forward" ref={@ref}>Barmbek-Nord</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.023628,53.581267,10.041231,53.592032" lon={10.033488} lat={53.584994} dir="forward" ref={@ref}>Osterbekkanal</.v></td>
      </tr>
      <tr>
        <td><.icon>FR2</.icon><.icon>br-nord-n5</.icon><.icon>br-nord-n4</.icon><.icon>radroute-17</.icon><.icon>radroute-5</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.019818,53.565688,10.064543,53.588157" lon={10.031899} lat={53.578712} dir="forward" ref={@ref}>Barmbek-Süd</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.019621,53.563161,10.030686,53.569201" lon={10.02461} lat={53.565983} dir="forward" ref={@ref}>Munsburger Kanal</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-7</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.01399,53.546908,10.045729,53.573934" lon={10.024311} lat={53.563192} dir="forward" ref={@ref}>Hohenfelde</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:bridge} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.021614,53.550416,10.031663,53.560685" lon={10.025927} lat={53.556658} dir="forward" ref={@ref}>Bahnbrücke</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.021614,53.550416,10.031663,53.560685" lon={10.025762} lat={53.554081} dir="forward" ref={@ref}>Berlinertordammbrücke</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="10.011737,53.525495,10.049803,53.554644" lon={10.029383} lat={53.546205} dir="forward" ref={@ref}>Hammerbrook</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.020038,53.533842,10.04439,53.549001" lon={10.032214} lat={53.542729} dir="forward" ref={@ref}>Bille</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon><.icon>FR6</.icon><.icon>FR5</.icon><.icon>radroute-2</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.016782,53.520612,10.045637,53.544952" lon={10.030166} lat={53.537554} dir="forward" ref={@ref}>Rothenburgsort</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-3</.icon></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td><.v bounds="10.015638,53.52294,10.038338,53.538135" lon={10.026748} lat={53.533052} dir="forward" ref={@ref}>Neue Elbbrücke</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-21</.icon><.icon>radroute-23</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.009451,53.516953,10.030152,53.533303" lon={10.021081} lat={53.527607} dir="forward" ref={@ref}>Veddel</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon><.icon>FR6</.icon><.icon>radroute-4</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.98436,53.491212,10.038521,53.525634" lon={9.998888} lat={53.508012} dir="forward" ref={@ref}>Reiherstiegviertel</.v></td>
      </tr>
    </table>

    <p>Radroute 12 verläuft in Nord-Süd-Richtung und bleibt immer östlich der Alster. Beginning ab <.v bounds="10.007087,53.603238,10.039558,53.618623" lon={10.018336} lat={53.614711} dir="forward" ref={@ref}>Alsterdorf</.v> kommt sie östlich am <.v bounds="10.016438,53.580193,10.051746,53.609293" lon={10.031066} lat={53.596998} dir="forward" ref={@ref}>Stadtpark</.v> vorbei, quert dann über die <.v bounds="10.015638,53.52294,10.038338,53.538135" lon={10.026748} lat={53.533052} dir="forward" ref={@ref}>Neue Elbbrücke</.v> die Norderelbe und stößt auf <.v bounds="9.98436,53.491212,10.038521,53.525634" lon={9.998888} lat={53.508012} dir="forward" ref={@ref}>Wilhelmsburg</.v> auf die <.a ref={Radroute4}>Radroute 4</.a>, die weiter nach Süden führt.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich.</p>

    <h4>Meinung</h4>
    <p>Die Route verläuft hauptsächlich an lauten KFZ-Trassen und hat deswegen auch viele unvorteilhaft geschaltete Ampeln. Dafür sind mit dem <.v bounds="10.010745,53.595123,10.042176,53.610952" lon={10.028882} lat={53.603848} dir="forward" ref={@ref}>Pergolenviertel</.v> und den <.v bounds="9.986856,53.494577,10.013294,53.521333" lon={9.999848} lat={53.513612} dir="forward" ref={@ref}>Wegen auf Wilhelmsburg</.v> auch zwei hervorragende Abschnitte Teil der Route. </p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
