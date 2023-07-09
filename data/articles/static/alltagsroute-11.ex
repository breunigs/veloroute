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
        renderer: 3,
        group: "11 Eißendorf",
        direction: :forward,
        from: "Innenstadt",
        to: "Eißendorf",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Eißendorf",
        historic: %{
          "6c5ec4b87553c5a86fac6b206345e318" => ~d[2022-04],
          "b21da7f0c0224b1dffb37d34ae51648f" => ~d[2021-07]
        },
        videos: [
          {"2023-07-09-vr11-und-erwrtng/GX010050", "00:00:14.181", :end},
          {"2023-07-09-vr11-und-erwrtng/GX010051", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010052", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010053", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010054", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010055", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010056", :start, "00:00:02.936"},
          {"2023-07-09-vr11-und-erwrtng/GX010056", "00:00:09.042", :end},
          {"2023-07-09-vr11-und-erwrtng/GX010057", :start, "00:01:54.448"},
          {"2023-07-09-vr11-und-erwrtng/GX010057", "00:02:06.126", :end},
          {"2023-07-09-vr11-und-erwrtng/GX010058", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010059", :start, "00:00:05.873"},
          {"2023-07-09-vr11-und-erwrtng/GX010060", "00:00:01.168", :end},
          {"2023-07-09-vr11-und-erwrtng/GX010061", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010062", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010063", :start, "00:01:10.070"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "11 Eißendorf",
        direction: :backward,
        from: "Eißendorf",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Eißendorf in die Innenstadt",
        historic: %{
          "b4997cc9bce6de5126d1a2c294cc8265" => ~d[2022-04],
          "da9f1f6cfdee27f19a7a44778e7708f2" => ~d[2021-07]
        },
        videos: [
          {"2023-07-09-vr11-und-erwrtng/GX010063", "00:01:10.070", :end},
          {"2023-07-09-vr11-und-erwrtng/GX010064", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010065", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010066", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010067", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010068", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010069", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010070", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010071", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010072", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010073", :start, "00:00:03.270"},
          {"2023-07-09-vr11-und-erwrtng/GX010096", "00:00:02.336", :end},
          {"2023-07-09-vr11-und-erwrtng/GX010097", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010098", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010099", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010100", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010101", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010102", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010103", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010104", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010105", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010106", :start, "00:00:33.734"}
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
          "5d955ccf2971302202fe02fbdefe1616" => ~d[2022-05],
          "85e45f5b7958efca1803585db2256047" => ~d[2021-07]
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
          "3c8980283b9a8d3730bb35a8e18e48fd" => ~d[2022-05],
          "f7bc9a5473aa1b8ec99b8a8635205521" => ~d[2021-07]
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
      ~H{Komoot Routenplaner: <.a href="https://www.komoot.de/tour/225145133">ab Rathaus</.a> oder <.a href="https://www.komoot.de/tour/229606335">ab der Veddel</.a> nach Eißendorf},
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
        <td><.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.993833} lat={53.550924} dir="forward" ref="11">Rathaus</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>1</.icon>
          <.icon>12</.icon>
          <.icon>2</.icon>
        </td>
        <td><.m bounds="9.9866263,53.5479641,9.9871242,53.548472">Rödingsmarkt</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>12</.icon>
        </td>
        <td><.m bounds="9.9661435,53.5412334,9.9761435,53.5512334">Landungsbrücken</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>12</.icon>
        </td>
        <td><.m bounds="9.9663729,53.5457403,9.9668345,53.5459993">Alter Elbtunnel</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9680097,53.5282526,9.9779,53.5371424">Hafen</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9900452,53.5120979,9.9901452,53.5121979">Reiherstiegviertel</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9914036,53.4830863,10.0046595,53.5004532">Wilhelmsburger Inselpark</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>10</.icon>
        </td>
        <td><.m bounds="9.9938767,53.4714464,9.9961153,53.4755551">Alte Harburger Elbbrücke</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>10</.icon> <.m bounds="10.011765,53.5095885,10.0597062,53.5329804">Veddel</.m>
        </td>
        <td><.m bounds="9.9897252,53.4555445,9.9908486,53.4564216">Bahnhof Harburg</.m></td>
      </tr>
      <tr>
        <td class="dir"><.m bounds="9.9214907,53.3167401,10.1074035,53.4639106">(Seevetal)</.m></td>
        <td><.m bounds="9.9651274,53.4487475,10.0067877,53.4753374">Harburg</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9669587,53.4583205,9.9713544,53.4638611">TUHH</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.8912454,53.4465814,9.9845052,53.4850189">Heimfeld</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9066994,53.4140472,9.9770598,53.4614522">Eißendorf</.m></td>
      </tr>
      <tr>
        <td></td>
        <td class="dir"><.m bounds="9.8044452,53.3347794,9.9580681,53.4579631">(Rosengarten)</.m></td>
      </tr>
    </table>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
