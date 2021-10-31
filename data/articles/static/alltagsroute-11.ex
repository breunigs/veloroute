defmodule Data.Article.Static.Alltagsroute11 do
  use Article.Static

  def id(), do: "11"
  def route_group(), do: :alltag
  @spec name :: <<_::104>>
  def name(), do: "alltagsroute-11"
  def title(), do: "Alltagsroute 11"

  def color(), do: "#00a0e2"

  def summary(),
    do: "Alltagsroute 11 führt vom Rathaus bzw. ab der Veddel nach Eißendorf"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        group: "11 Eißendorf",
        direction: :forward,
        from: "Innenstadt",
        to: "Eißendorf",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Eißendorf",
        videos: [
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011832", :start, :end},
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011833", :start, :end},
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011834", :start, :end},
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011835", :start, "00:00:07.908"},
          {"2021-07-04-veloroute11/GX012106", :start, :end},
          {"2021-07-04-veloroute11/GX012107", :start, :end},
          {"2021-07-04-veloroute11/GX012108", :start, :end},
          {"2021-07-04-veloroute11/GX012109", :start, :end},
          {"2021-07-04-veloroute11/GX012111", :start, :end},
          {"2021-07-04-veloroute11/GX012112", :start, :end},
          {"2021-07-04-veloroute11/GX012113", :start, :end},
          {"2021-07-04-veloroute11/GX012114", :start, "00:00:31.632"},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012373", "00:00:21.488", :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012374", :start, "00:00:57.391"},
          {"2021-07-04-veloroute11/GX012120", "00:01:08.535", :end},
          {"2021-07-04-veloroute11/GX012121", :start, :end},
          {"2021-07-04-veloroute11/GX012122", :start, :end},
          {"2021-07-04-veloroute11/GX012123", :start, :end},
          {"2021-07-04-veloroute11/GX012124", :start, :end},
          {"2021-07-04-veloroute11/GX012125", :start, :end},
          {"2021-07-04-veloroute11/GX012126", :start, "00:01:35.462"}
        ]
      },
      %Video.Track{
        group: "11 Eißendorf",
        direction: :backward,
        from: "Eißendorf",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Eißendorf in die Innenstadt",
        videos: [
          {"2021-07-04-veloroute11/GX012126", "00:01:37.264", :end},
          {"2021-07-04-veloroute11/GX012128", :start, :end},
          {"2021-07-04-veloroute11/GX012129", :start, :end},
          {"2021-07-04-veloroute11/GX012130", :start, :end},
          {"2021-07-04-veloroute11/GX012131", :start, :end},
          {"2021-07-04-veloroute11/GX012132", :start, :end},
          {"2021-07-04-veloroute11/GX012133", :start, :end},
          {"2021-07-04-veloroute11/GX012134", :start, :end},
          {"2021-07-04-veloroute11/GX012135", :start, :end},
          {"2021-07-04-veloroute11/GX012136", :start, "00:01:42.336"},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012374", "00:01:10.804", :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012375", :start, :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012376", :start, "00:00:06.540"},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012373", "00:00:01.802", "00:00:12.479"},
          {"2021-07-04-veloroute11/GX012138", "00:00:11.278", :end},
          {"2021-07-04-veloroute11/GX012139", :start, :end},
          {"2021-07-04-veloroute11/GX012140", :start, :end},
          {"2021-07-04-veloroute11/GX012141", :start, :end},
          {"2021-07-04-veloroute11/GX012142", :start, :end},
          {"2021-07-04-veloroute11/GX012143", :start, :end},
          {"2021-07-04-veloroute11/GX012144", :start, :end},
          {"2021-06-27-veloroute9/GX012017", :start, :end},
          {"2021-06-27-veloroute9/GX012018", :start, :end},
          {"2021-06-27-veloroute9/GX012019", :start, :end},
          {"2021-06-27-veloroute9/GX012020", :start, :end},
          {"2021-06-27-veloroute9/GX012021", :start, "00:00:13.413"},
          {"2021-06-22-velo7-und-pauli-altona/GX011901", "00:00:04.238", "00:00:16.450"},
          {"2021-06-05-velorouten-1-1a-2/GX011655", "00:00:34.601", "00:00:48.215"}
        ]
      },

      # videos are only the short segments, GPX should be the full tracks
      %Video.Track{
        group: "11 Veddel",
        direction: :forward,
        from: "Veddel",
        to: "Wilhelmsburg",
        parent_ref: __MODULE__,
        text: "von der Veddel nach Wilhelmsburg",
        videos: [
          {"2021-07-18-whburg-and-on/GX012389", "00:00:42.242", :end},
          {"2021-07-18-whburg-and-on/GX012390", :start, :end},
          {"2021-07-18-whburg-and-on/GX012391", :start, :end},
          {"2021-07-18-whburg-and-on/GX012392", :start, "00:00:02.302"},
          {"2021-04-17-freizeitrouten-6und-7/GX011264", "00:00:02.169", "00:01:15.008"},
          {"2021-07-04-veloroute11/GX012118", "00:00:03.704", "00:00:13.747"},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012372", :start, "00:00:12.479"}
        ]
      },
      %Video.Track{
        group: "11 Veddel",
        direction: :backward,
        from: "Wilhelmsburg",
        to: "Veddel",
        parent_ref: __MODULE__,
        text: "von Wilhelmsburg zur Veddel",
        videos: [
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012376", "00:00:06.840", "00:00:08.609"},
          {"2021-07-04-veloroute11/GX012117", "00:00:08.308", "00:00:26.860"},
          {"2021-04-17-freizeitrouten-6und-7/GX011303", "00:00:39.540", :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011304", :start, :end},
          {"2021-07-18-whburg-and-on/GX012396", :start, :end},
          {"2021-07-18-whburg-and-on/GX012397", :start, "00:00:03.270"}
        ]
      }
    ]

  def links() do
    assigns = {}

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
        <td><.m bounds="9.9915695,53.5499061,9.9931782,53.5509096">Rathaus</.m></td>
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
    <.structured_links gpx="yes"/>
    """
  end
end
