defmodule Data.Article.Static.Radroute16 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-16"
  def display_id(), do: "16"
  def title(), do: "Radroute 16"
  def color(), do: RouteColors.green1()

  def summary(),
    do:
      "Radroute verbindet die westlichen Stadtteile Altona-Altstadt mit Winterhude. Die Route orientiert sich grob am Ring 2/B5."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "16",
        direction: :backward,
        from: "Winterhuder Kai",
        to: "Bahnhof Altona",
        parent_ref: __MODULE__,
        text: "von Winterhude nach Altona",
        historic: %{
          "181a1f57cfb0c898f315d8d9a1549602" => ~d[2025-02]
        },
        videos: [
          {"2025-02-16-mitte/GX018068", "00:00:18.452", :end},
          {"2025-02-16-mitte/GX018069", :start, :end},
          {"2025-02-16-mitte/GX018070", :start, "00:00:07.140"},
          {"2025-02-16-mitte/GX018108", "00:00:10.310", :end},
          {"2024-06-20-14im-13gg/GX017833", :start, "00:00:08.874"},
          {"2024-06-20-14im-13gg/GX017834", :start, "00:00:16.698"},
          {"2025-02-16-mitte/GX018110", "00:00:10.901", :end},
          {"2025-02-16-mitte/GX018111", "00:00:00.100", "00:00:21.054"},
          {"2025-02-16-mitte/GX018111", "00:00:23.790", :end},
          {"2025-02-16-mitte/GX018112", :start, :end},
          {"2025-02-16-mitte/GX018113", :start, :end},
          {"2025-02-16-mitte/GX018114", :start, :end},
          {"2025-02-16-mitte/GX018115", :start, "00:00:02.359"},
          {"2024-06-20-14im-13gg/GX017836", "00:00:38.031", "00:01:02.796"},
          {"2024-03-26-fr5/GX016975", "00:00:25.626", "00:00:27.861"},
          {"2025-02-10-innenstadt/GX017987", "00:00:12.980", :end},
          {"2025-02-10-innenstadt/GX017988", :start, "00:00:01.880"},
          {"2025-02-10-innenstadt/GX017989", :start, :end},
          {"2025-02-10-innenstadt/GX017990", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "16",
        direction: :forward,
        from: "Bahnhof Altona",
        to: "Winterhuder Kai",
        parent_ref: __MODULE__,
        text: "von Altona nach Winterhude",
        historic: %{
          "c34480d13869ad466807d4326a462657" => ~d[2025-02]
        },
        videos: [
          {"2025-02-09-innenstadt/GX017983", "00:00:01.735", :end},
          {"2025-02-09-innenstadt/GX017984", :start, "00:00:16.750"},
          {"2024-06-16-13im-14gg/GX017689", "00:00:39.673", "00:01:38.579"},
          {"2024-06-16-13im-14gg/GX017690", :start, :end},
          {"2024-06-16-13im-14gg/GX017691", :start, "00:00:54.144"},
          {"2024-06-16-13im-14gg/GX017692", :start, "00:00:19.216"},
          {"2024-06-16-13im-14gg/GX017693", :start, "00:00:40.807"},
          {"2025-02-16-mitte/GX018070", "00:00:31.932", :end},
          {"2025-02-16-mitte/GX018071", :start, "00:00:02.921"},
          {"2025-02-16-mitte/GX018068", "00:00:03.228", "00:00:18.452"}
        ]
      }
    ]

  def links(_assigns) do
    [{"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643642"}]
  end

  def text(assigns) do
    ~H"""
    <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-16</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon>radroute-14</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.921524,53.540571,9.962418,53.572968" lon={9.935969} lat={53.552669} dir="forward" ref={@ref}>Bahnhof Altona</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-7</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.928649,53.552437,9.970323,53.578695" lon={9.944946} lat={53.560711} dir="forward" ref={@ref}>Neue Mitte Altona</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td><.v bounds="9.939634,53.557722,9.958403,53.567011" lon={9.948542} lat={53.561866} dir="forward" ref={@ref}>Holstenplatz</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.928649,53.552437,9.970323,53.578695" lon={9.950378} lat={53.564617} dir="forward" ref={@ref}>Altona-Nord</.v></td>
      </tr>

      <tr>
        <td><.icon>FR9</.icon><.icon>br-eimsbuettel-sued</.icon><.icon>br-eimsbuettel-isebek</.icon><.icon>radroute-2</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.944314,53.561902,9.978609,53.583084" lon={9.957945} lat={53.570385} dir="forward" ref={@ref}>Eimsbüttel</.v></td>
      </tr>
      <tr>
        <td><.icon>FR10</.icon><.icon>radroute-3</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.948954,53.568737,9.991251,53.59632" lon={9.965336} lat={53.579061} dir="forward" ref={@ref}>Hoheluft-West</.v></td>
      </tr>
      <tr>
        <td><.icon>br-nord-n2</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.95867,53.573557,10.000967,53.60114" lon={9.981215} lat={53.582936} dir="forward" ref={@ref}>Hoheluft-Ost</.v></td>
      </tr>
      <tr>
        <td><.icon>br-nord-n6</.icon><.icon>br-nord-n2</.icon><.icon>radroute-17</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.971149,53.579917,10.012186,53.606714" lon={9.991804} lat={53.590551} dir="forward" ref={@ref}>Eppendorf</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="9.980389,53.588653,10.002787,53.600304" lon={9.993551} lat={53.592971} dir="forward" ref={@ref}>Alster</.v></td>
      </tr>
      <tr>
        <td><.icon>FR1</.icon><.icon>br-nord-n6</.icon><.icon>radroute-4</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.971149,53.579917,10.012186,53.606714" lon={9.993815} lat={53.592938} dir="forward" ref={@ref}>Winterhude</.v></td>
      </tr>
    </table>

    <p>Radroute 16 verläuft vom <.v bounds="9.921524,53.540571,9.962418,53.572968" lon={9.935969} lat={53.552669} dir="forward" ref={@ref}>Bahnhof Altona</.v> in nordöstliche Richtung nach <.v bounds="9.971149,53.579917,10.012186,53.606714" lon={9.993815} lat={53.592938} dir="forward" ref={@ref}>Winterhude</.v>. Sie stellt damit eine Querverbindung in den zentrumsnahen, westlichen Stadtteilen her. Sie verläuft fast parallel zur <.a ref={Radroute14}>Radroute 14</.a>, die ein paar Blöcke südlicher liegt.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Meist fährt man auf Asphalt, nur sehr kurze Abschnitte sind mit modernem Betonpflaster ausgelegt.</p>

    <h4>Meinung</h4>
    <p>An bereits ausgebauten Stellen ist die Route gut zu befahren. Leider fehlen noch viele Abschnitte, allen voran der <.a ref={EppendorferWeg}>Eppendorfer Weg</.a>. Die Planungen dafür wurden zwar gestartet, aber es werden noch Jahre bis zum Umbau vergehen. Bis dahin werden die Wildparker von der Polizei geduldet – vermutlich weil sonst noch mehr gerast würde.</p>


    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
