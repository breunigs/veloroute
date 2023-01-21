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
        videos: [
          {"2022-04-23-velo3-velo12altona/GX013521", "00:00:16.683", :end},
          {"2022-04-23-velo3-velo12altona/GX013522", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013523", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013524", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013525", :start, :end},
          {"2022-04-23-velo3-velo12altona/GX013526", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013651", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013652", :start, "00:00:09.176"},
          {"2021-07-04-veloroute11/GX012108", "00:00:00.467", :end},
          {"2021-07-04-veloroute11/GX012109", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013655", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013656", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013657", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013658", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013659", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013660", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013661", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013662", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013663", :start, "00:00:36.503"},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013664", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013665", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013666", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013667", :start, "00:00:35.936"}
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
        videos: [
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013668", "00:00:08.108", :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013669", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013670", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013671", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013672", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013673", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013674", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013675", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013676", :start, "00:00:08.141"},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013687", "00:04:09.916", :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX023687", :seamless, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013688", :start, "00:00:16.917"},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013693", "00:01:38.365", :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013694", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013695", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013696", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013697", :start, "00:01:05.966"},
          {"2021-07-04-veloroute11/GX012142", "00:00:00.167", :end},
          {"2021-07-04-veloroute11/GX012143", :start, "00:00:37.738"},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013698", "00:01:27.120", :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013699", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013700", :start, "00:00:02.703"},
          {"2022-04-30-velo5-u-12innenstadt/GX013572", "00:00:02.302", :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013573", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013574", :start, :end},
          {"2021-06-27-veloroute9/GX012021", :start, "00:00:11.645"},
          {"2022-04-30-velo5-u-12innenstadt/GX013575", "00:00:13.146", :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013576", :start, "00:00:39.740"}
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
        videos: [
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013692", "00:00:06.506", :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013693", :start, "00:01:37.097"}
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
        videos: [
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013688", "00:00:20.187", "00:01:15.642"},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013689", "00:00:01.935", :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013690", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013691", :start, "00:00:06.206"}
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
