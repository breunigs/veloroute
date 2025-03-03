defmodule Data.Article.Static.Radroute1 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-1"
  def display_id(), do: "1"
  def title(), do: "Radroute 1"
  def color(), do: RouteColors.red4()

  def summary(),
    do:
      "Radroute 1 verläuft in Ost-West Richtung und verbindet die westlichen Elbvororte ab Rissen via Ottensen und Altstadt mit den östlichen Stadtteilen bis nach Billstedt"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :forward,
        from: "Rissen",
        to: "Öjendorf",
        parent_ref: __MODULE__,
        text: "von Rissen nach Öjendorf",
        historic: %{
          "e194b682cf30e89d7e13a42a657f8418" => ~d[2025-02]
        },
        videos: [
          {"2024-05-03-vr1/GX017411", "00:02:38.460", "00:05:34.501"},
          {"2024-05-03-vr1/GX017412", :start, :end},
          {"2024-05-03-vr1/GX017413", :start, "00:00:02.536"},
          {"2025-02-08-west/GX017940", "00:00:02.336", "00:00:28.061"},
          {"2024-05-03-vr1/GX017413", "00:00:23.590", "00:02:21.080"},
          {"2024-05-03-vr1/GX017414", :start, "00:02:10.364"},
          {"2024-05-03-vr1/GX017420", :start, "00:00:15.379"},
          {"2024-05-03-vr1/GX017421", "00:00:00.634", "00:00:03.470"},
          {"2024-05-03-vr1/GX017422", :start, "00:00:01.168"},
          {"2024-05-03-vr1/GX017426", "00:00:00.067", "00:01:16.761"},
          {"2024-05-03-vr1/GX017427", :start, "00:00:01.702"},
          {"2024-05-03-vr1/GX017428", :start, "00:00:41.600"},
          {"2024-05-03-vr1/GX017429", :start, "00:00:00.934"},
          {"2025-02-06-whburg/GX017918", "00:00:00.534", :end},
          {"2025-02-06-whburg/GX017919", "00:00:00.167", :end},
          {"2025-02-06-whburg/GX017920", :start, "00:00:24.880"},
          {"2025-02-06-whburg/GX017921", :start, "00:00:27.268"},
          {"2024-01-27-bergedorf/GX016737", "00:00:25.821", "00:00:32.426"},
          {"2025-02-09-innenstadt/GX017956", "00:00:50.274", :end},
          {"2025-02-09-innenstadt/GX017957", :start, :end},
          {"2025-02-09-innenstadt/GX017958", :start, :end},
          {"2025-02-09-innenstadt/GX017959", :start, "00:00:41.256"},
          {"2025-02-17-ost/GX018120", "00:00:46.669", :end},
          {"2025-02-17-ost/GX018121", :start, :end},
          {"2025-02-17-ost/GX018122", :start, "00:00:02.803"},
          {"2025-02-23-ost/GX018250", "00:00:06.574", :end},
          {"2025-02-23-ost/GX018251", :start, "00:00:37.561"},
          {"2025-02-23-ost/GX018252", :start, :end},
          {"2025-02-23-ost/GX018253", :start, :end},
          {"2025-02-23-ost/GX018254", :start, "00:01:29.089"},
          {"2025-02-23-ost/GX018255", :start, "00:01:03.200"},
          {"2025-02-23-ost/GX018256", :start, "00:00:10.310"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :backward,
        from: "Öjendorf",
        to: "Rissen",
        parent_ref: __MODULE__,
        text: "von Öjendorf nach Rissen",
        historic: %{
          "aeb2c97623ddee226781b61b7b64a75f" => ~d[2025-02]
        },
        videos: [
          {"2025-02-23-ost/GX018271", "00:00:29.363", "00:01:11.387"},
          {"2025-02-23-ost/GX018272", :start, :end},
          {"2025-02-23-ost/GX018273", :start, "00:00:03.370"},
          {"2025-02-23-ost/GX018274", "00:00:00.133", "00:00:48.115"},
          {"2025-02-23-ost/GX018278", "00:00:22.055", :end},
          {"2025-02-23-ost/GX018279", :start, :end},
          {"2025-02-23-ost/GX018280", "00:00:00.167", :end},
          {"2025-02-23-ost/GX018281", :start, "00:01:32.400"},
          {"2025-02-23-ost/GX018282", :start, "00:00:02.302"},
          {"2025-02-17-ost/GX018139", "00:00:33.500", "00:01:39.380"},
          {"2025-02-17-ost/GX018140", :start, "00:00:21.768"},
          {"2025-02-09-innenstadt/GX017974", "00:00:02.181", "00:00:23.924",
           vf: "curves=lighter"},
          {"2024-04-30-fr3/GX017317", "00:00:33.367", "00:01:01.061"},
          {"2025-02-09-innenstadt/GX017975", "00:00:05.272", "00:00:29.167"},
          {"2025-02-09-innenstadt/GX017976", :start, :end},
          {"2025-02-09-innenstadt/GX017977", "00:00:00.267", :end},
          {"2025-02-09-innenstadt/GX017978", :start, :end},
          {"2025-02-09-innenstadt/GX017979", :start, "00:00:14.567", vf: "curves=lighter"},
          {"2025-02-06-whburg/GX017929", "00:00:01.668", "00:01:13.230", vf: "curves=lighter"},
          {"2025-02-10-innenstadt/GX018015", "00:00:08.676", "00:00:12.874"},
          {"2025-02-10-innenstadt/GX018016", :start, :end, vf: "curves=lighter"},
          {"2025-02-10-innenstadt/GX018017", :start, "00:00:06.673", vf: "curves=lighter"},
          {"2024-05-03-vr1/GX017407", "00:00:11.612", "00:00:48.239"},
          {"2024-05-03-vr1/GX017408", :start, :end},
          {"2024-05-03-vr1/GX017409", :start, :end},
          {"2024-05-03-vr1/GX017410", :start, "00:01:44.938"},
          {"2025-02-08-west/GX017941", "00:00:00.434", "00:00:25.959"},
          {"2024-05-03-vr1/GX017410", "00:02:07.494", "00:02:26.350"},
          {"2024-05-03-vr1/GX017411", :start, "00:02:35.791"}
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
          <.icon>radroute-1</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.733138,53.574751,9.780336,53.593962" lon={9.758658} lat={53.583422} dir="forward" ref={@ref}>Rissen</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.776786,53.568237,9.818757,53.586265" lon={9.793236} lat={53.578416} dir="forward" ref={@ref}>Sülldorf</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.789294,53.552567,9.840135,53.565533" lon={9.817201} lat={53.561758} dir="forward" ref={@ref}>Blankenese</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.824293,53.547423,9.870253,53.567174" lon={9.849254} lat={53.556615} dir="forward" ref={@ref}>Nienstedten</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.852981,53.548917,9.883378,53.563805" lon={9.863942} lat={53.557208} dir="forward" ref={@ref}>Klein Flottbek</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-18</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.867349,53.547993,9.918397,53.563768" lon={9.888057} lat={53.557353} dir="forward" ref={@ref}>Othmarschen</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.910939,53.546744,9.940556,53.555464" lon={9.93064} lat={53.5505} dir="forward" ref={@ref}>Ottensen</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-14</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.924007,53.542707,9.96465,53.556679" lon={9.943182} lat={53.548216} dir="forward" ref={@ref}>Altona-Altstadt</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-15</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.947507,53.541377,9.998245,53.559683" lon={9.96116} lat={53.549343} dir="forward" ref={@ref}>St. Pauli</.v></td>
      </tr>
      <tr>
        <td><.icon>1GR</.icon><.icon>radroute-4</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.960256,53.542106,10.011855,53.560631" lon={9.979321} lat={53.549012} dir="forward" ref={@ref}>Neustadt</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-3</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.986915,53.542322,10.027925,53.562909" lon={9.99286} lat={53.549914} dir="forward" ref={@ref}>Altstadt</.v></td>
      </tr>
      <tr>
        <td><.icon>1GR</.icon><.icon>radroute-7</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.986915,53.542322,10.027925,53.562909" lon={10.012181} lat={53.552291} dir="forward" ref={@ref}>St. Georg</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-9</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.016678,53.546457,10.044401,53.561226" lon={10.024269} lat={53.553693} dir="forward" ref={@ref}>Berliner Tor</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-17</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.023414,53.550082,10.044723,53.56092" lon={10.032518} lat={53.554878} dir="forward" ref={@ref}>Borgfelde</.v></td>
      </tr>
      <tr>
        <td><.icon>FR4</.icon><.icon>radroute-22</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.038368,53.545995,10.073167,53.563162" lon={10.048562} lat={53.556059} dir="forward" ref={@ref}>Hamm</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-8</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.066028,53.539699,10.109812,53.560557" lon={10.087253} lat={53.551596} dir="forward" ref={@ref}>Horn</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-20</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.078657,53.536994,10.149144,53.566751" lon={10.109659} lat={53.559194} dir="forward" ref={@ref}>Billstedt</.v></td>
      </tr>
    </table>

    <p>Radroute 1 verläuft in Ost-West Richtung. Sie durchquert die <.v bounds="9.739851,53.540979,9.908972,53.599901" lon={9.814274} lat={53.56206} dir="forward" ref={@ref} highlight="Rissen,Sülldorf,Blankenese,Nienstedten,Othmarschen">Elbvororte</.v>, die <.v bounds="9.948498,53.530398,10.031608,53.569045" lon={9.997111} lat={53.550626} dir="forward" ref={@ref} highlight="Altstadt,Neustadt">Innenstadt</.v> zwischen Binnenalster und Elbe, und folgt in Richtung Osten den <.v bounds="10.015665,53.547393,10.158133,53.575883" lon={10.077934} lat={53.554741} dir="forward" ref={@ref} highlight="Horn,Hamm,Billstedt,Borgefelde">Wohngebieten die an der U4</.v> liegen. In <.v bounds="10.098652,53.541347,10.15366,53.573332" lon={10.118308} lat={53.557028} dir="forward" ref={@ref}>Billstedt</.v> bzw. am Öjendorfer Friedhof endet die Route.</p>

    <h4>Auffindbarkeit</h4>
    <.roaddiagram src="temp_routing" width={100} alt="Beispiel eines vorläufigen Radwegweisers" class="right"/>
    <p>Die Route ist nicht durchgängig beschildert und nur mit Navi oder Ortskenntnis auffindbar. In den Elbvororten bis etwa Ottensen helfen Baustellen-Wegweiser die Abzweigung zu finden. Leider sind diese nicht überall zu finden, und bei tatsächlichen Baustellen auch leicht zu verwechseln. Im Osten ist die Route wegen ihrer Durchgängigkeit auch gut ohne Hilfsmittel auffindbar. Im Innenstadtbereich muss man sich auskennen um sich nicht zu verfahren.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Fahrt erfolgt meist auf Asphalt. Stellenweise sind gepflasterte Radwege vorhanden. Für kurze Abschnitte sind auch Waldwege, Parkwege oder Kopfsteinpflaster vorhanden (<.v bounds="9.780002,53.572885,9.807811,53.588461" lon={9.78866} lat={53.578766} dir="forward" ref={@ref}>in Sülldorf</.v>, <.v bounds="9.816969,53.558793,9.825326,53.562589" lon={9.820918} lat={53.560023} dir="backward" ref={@ref}>Gätgensstraße</.v> und <.v bounds="9.911628,53.549806,9.919438,53.552776" lon={9.914394} lat={53.551203} dir="backward" ref={@ref}>Bleickenallee</.v>). Am <.v bounds="9.797766,53.569686,9.809384,53.575914" lon={9.799146} lat={53.574893} dir="backward" ref={@ref}>Friedhof in Blankenese</.v> verhindern enge Drängelgitter die Durchfahrt mit längeren Fahrrädern oder mit Anhängern.</p>

    <h4>Meinung</h4>
    <p>Prinzipiell ist die Route gut zu befahren und auch schon größtenteils ausgebaut. Die Ausbaulücken merkt man dafür aber umso deutlicher.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
