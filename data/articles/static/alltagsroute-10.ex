defmodule Data.Article.Static.Alltagsroute10 do
  use Article.Static

  def id(), do: "10"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 10"

  def color(), do: "#552976"

  def summary(),
    do: "Alltagsroute 10 führt vom Rathaus nach Neugraben"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "10",
        direction: :forward,
        from: "Innenstadt",
        to: "Neugraben",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Neugraben",
        historic: %{
          "68237f112e08a6f5789aab8f94012e0f" => ~d[2023-06],
          "f1964c8fe5ee29abc54cebf0c317a47b" => ~d[2022-05],
          "66f557954990887bd48abc56f496cd47" => ~d[2021-07]
        },
        videos: [
          {"2023-06-03-vr10-vr7/GX015866", "00:00:33.667", :end},
          {"2023-06-03-vr10-vr7/GX015867", :start, :end},
          {"2023-06-03-vr10-vr7/GX015868", :start, "00:00:32.933"},
          {"2022-05-07-v10-v7-u-rodigallee/GX013714", "00:00:34.301", "00:00:47.681"},
          {"2023-06-03-vr10-vr7/GX015870", "00:00:28.695", :end},
          {"2023-06-03-vr10-vr7/GX015871", :start, :end},
          {"2023-06-03-vr10-vr7/GX015872", :start, :end},
          {"2023-06-03-vr10-vr7/GX015873", :start, :end},
          {"2023-06-03-vr10-vr7/GX015874", :start, :end},
          {"2023-06-03-vr10-vr7/GX015875", :start, :end},
          {"2023-06-03-vr10-vr7/GX015877", :start, :end},
          {"2023-06-03-vr10-vr7/GX015878", :start, :end},
          {"2023-06-03-vr10-vr7/GX015880", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "10",
        direction: :backward,
        from: "Neugraben",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "von Neugraben in die Innenstadt",
        historic: %{
          "a03ee11a72a828fded2e4d98135e8a1d" => ~d[2023-06],
          "601d3041a6e9da1aaeccbacbea6eeb62" => ~d[2022-05],
          "a1e2dba44dfcd2b8e2df7343d1f6773a" => ~d[2021-07]
        },
        videos: [
          {"2023-06-03-vr10-vr7/GX015881", :start, "00:01:19.613"},
          {"2023-06-03-vr10-vr7/GX015882", "00:00:05.372", :end},
          {"2023-06-03-vr10-vr7/GX015883", :start, :end},
          {"2023-06-03-vr10-vr7/GX015884", :start, :end},
          {"2023-06-03-vr10-vr7/GX015885", :start, :end},
          {"2023-06-03-vr10-vr7/GX015886", :start, :end},
          {"2023-06-03-vr10-vr7/GX015887", :start, :end},
          {"2023-06-03-vr10-vr7/GX015888", :start, "00:01:55.482"},
          {"2023-06-03-vr10-vr7/GX015889", "00:00:07.441", :end},
          {"2023-06-03-vr10-vr7/GX015890", :start, :end},
          {"2023-06-03-vr10-vr7/GX015891", :start, "00:00:10.177"},
          {"2022-05-07-v10-v7-u-rodigallee/GX013726", "00:00:00.467", :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013727", :start, "00:00:02.369"},
          {"2023-06-03-vr10-vr7/GX015892", "00:00:02.803", :end},
          {"2023-06-03-vr10-vr7/GX015893", :start, :end},
          {"2023-06-03-vr10-vr7/GX015894", :start, :end},
          {"2023-06-03-vr10-vr7/GX015895", :start, :end},
          {"2023-06-03-vr10-vr7/GX015896", :start, :end},
          {"2023-06-03-vr10-vr7/GX015897", :start, :end},
          {"2023-06-03-vr10-vr7/GX015898", :start, "00:00:13.914"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/426738/veloroute-10/"},
      {"Komoot Routenplaner: nach Neugraben", "https://www.komoot.com/de-de/tour/225135899"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/231965"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="13" style="background-image: url(/images/route10.svg)">
          <.icon>10</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.993833} lat={53.550924} dir="forward" ref="10" highlight="Rathausmarkt">Rathaus</.v></td>
      </tr>
      <tr>
        <td><.icon>1GR</.icon></td>
        <td><.v bounds="9.994898,53.5349,10.02677,53.551173" lon={10.00608} lat={53.54055} dir="forward" ref="10">HafenCity</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>rsw-lueneburg</.icon>
          <.icon>11</.icon>
          <.icon>FR6</.icon>
          <.icon>FR11</.icon>
        </td>
        <td><.v bounds="10.003899,53.517116,10.04876,53.543914" lon={10.020232} lat={53.524786} dir="forward" ref="10">Veddel</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="10.006914,53.496028,10.041611,53.525479" lon={10.0212} lat={53.509739} dir="forward" ref="10">Niedergeorgswerder</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon></td>
        <td><.v bounds="9.982587,53.471138,10.044783,53.503317" lon={10.01744} lat={53.486457} dir="forward" ref="10">Kirchdorf</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>11</.icon>
          <.icon>FR6</.icon>
        </td>
        <td><.v bounds="9.968901,53.459236,10.012536,53.489947" lon={9.995871} lat={53.475326} dir="forward" ref="10">Alte Harburger Elbbrücke</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR6</.icon>
        </td>
        <td><.v bounds="9.934425,53.452084,10.016485,53.479857" lon={9.985618} lat={53.466457} dir="forward" ref="10">Harburg Binnenhafen</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR11</.icon>
          <.icon>FR14</.icon>
        </td>
        <td><.v bounds="9.924809,53.461964,9.963757,53.480283" lon={9.939523} lat={53.471678} dir="forward" ref="10">Heimfeld</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.867189,53.462401,9.918748,53.492071" lon={9.884645} lat={53.473508} dir="forward" ref="10">Neuwiedenthal</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.820314,53.457785,9.897137,53.487145" lon={9.854338} lat={53.474284} dir="forward" ref="10">Neugraben</.v></td>
      </tr>
      <tr>
        <td>
          <.icon name="rsw-stade" bounds="9.820314,53.457785,9.897137,53.487145" lon={9.839442} lat={53.47481} dir="forward">RSW</.icon>
        </td>
        <td><.v bounds="9.820314,53.457785,9.897137,53.487145" lon={9.839442} lat={53.47481} dir="forward" ref="rsw-stade">Fischbek</.v></td>
      </tr>
      <tr>
        <td>
          <.icon name="rsw-stade" bounds="9.690203,53.461829,9.857113,53.485878" lon={9.845019} lat={53.475031} dir="forward">RSW</.icon>
        </td>
        <td>
          <.v bounds="9.690203,53.461829,9.857113,53.485878" lon={9.845019} lat={53.475031} dir="forward" ref="rsw-stade">Neu Wulmstorf</.v>
        </td>
      </tr>
    </table>

    <p>Die Alltagsroute 10 (auch: Veloroute 10 oder Radroute 10) führt vom <.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.993833} lat={53.550924} dir="forward" ref="10" highlight="Rathausmarkt">Rathaus</.v> über die Elbinseln <.v bounds="10.003899,53.517116,10.04876,53.543914" lon={10.020232} lat={53.524786} dir="forward" ref="10">Veddel</.v> und <.v bounds="9.982587,53.471138,10.044783,53.503317" lon={10.01744} lat={53.486457} dir="forward" ref="10">Kirchdorf</.v> nach Süden. In <.v bounds="9.934425,53.452084,10.016485,53.479857" lon={9.985618} lat={53.466457} dir="forward" ref="10">Harburg</.v> knickt sie nach Westen ab und führt bis <.v bounds="9.820314,53.457785,9.897137,53.487145" lon={9.854338} lat={53.474284} dir="forward" ref="10">Neugraben</.v>. Dort schließt sie nahtlos an die <.a name="rsw-stade">Radroute Plus</.a> nach <.v bounds="9.38526,53.435238,9.920297,53.642004" lon={9.490194} lat={53.592411} dir="forward" ref="rsw-stade">Stade</.v> an.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Sie sind meist asphaltiert.</p>

    <h4>Meinung</h4>
    <p>Sofern man nicht an genau in einen der von der Route angebundenen Stadtteile möchte, ist man auf anderen Routen meist schneller. In Hamburg ist dies etwa die <.v bounds="9.989253,53.530646,10.044428,53.55536" lon={10.008659} lat={53.544733} dir="forward" ref="9">Radroute 9</.v>, auf Wilhelmsburg die <.v bounds="9.925024,53.469115,10.052357,53.542339" lon={9.997872} lat={53.495984} dir="forward" ref="11">Radroute 11</.v> und aus dem Westen die (geplante) <.v bounds="9.757953,53.460665,9.937051,53.576378" lon={9.873717} lat={53.496859} dir="backward" ref="rsw-stade">Radroute Plus von Stade</.v> bzw. eine Abwandlung der <.v bounds="9.884274,53.455264,10.00134,53.558152" lon={9.949894} lat={53.494546} dir="backward" ref="FR14">Freizeitroute 14</.v> durch den Hafen.</p>

    <p>Auch ist die Route kaum ausgebaut (Stand Ende 2023). In vielen Abschnitten gibt es daher gar keine oder unbenutzbare Radwege, wie etwa <.v bounds="9.982231,53.472631,10.05017,53.524332" lon={10.019523} lat={53.489407} dir="forward" ref="10">auf Wilhelmsburg</.v>. Im Süden sind sogar mehrere fehlende Durchfahrtmöglichkeiten, die Umwege erfordern: <.v bounds="9.952802,53.460182,9.99538,53.479121" lon={9.977234} lat={53.466265} dir="forward" ref="10">An der Hafenbahn</.v>, <.v bounds="9.906721,53.469337,9.928368,53.47739" lon={9.915974} lat={53.472669} dir="forward" ref="10">am Heykenaubrook</.v>, <.v bounds="9.854872,53.469327,9.912212,53.477839" lon={9.903927} lat={53.473147} dir="forward" ref="10">am Dubben</.v> und <.v bounds="9.854872,53.472644,9.866931,53.477839" lon={9.861493} lat={53.474919} dir="forward" ref="10">am Gleisstieg</.v>.</p>

    <p>Kurzum: aktuell präsentiert sich die Radroute 10 als wenig brauchbar.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
