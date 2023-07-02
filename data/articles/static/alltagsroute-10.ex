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
      {"Komoot Routenplaner: nach Neugraben", "https://www.komoot.de/tour/225135899"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/231965"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="11" style="background-image: url(/images/route10.svg)">
          <.icon>10</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.993833} lat={53.550924} dir="forward" ref="10">Rathaus</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9803816,53.5300578,10.0315651,53.5469165">HafenCity</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>11</.icon>
        </td>
        <td><.m bounds="10.011765,53.5095885,10.0597062,53.5329804">Veddel</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9948007,53.4678065,10.0348007,53.5078065">Kirchdorf</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>11</.icon>
        </td>
        <td><.m bounds="9.9938767,53.4714464,9.9961153,53.4755551">Alte Harburger Elbbrücke</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.983502,53.5440542,9.9873381,53.5443446">Binnenhafen</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.8774298,53.472953,9.8775298,53.473053">Neuwiedenthal</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.8569684,53.469918,9.8570684,53.470018">Neugraben</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.8193917,53.4747242,9.8194917,53.4748242">Fischbek</.m></td>
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

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
