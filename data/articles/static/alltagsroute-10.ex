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
        videos: [
          {"2022-05-07-v10-v7-u-rodigallee/GX013707", "00:00:01.168", :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013708", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013709", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013710", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013711", :start, "00:00:08.008"},
          {"2022-05-07-v10-v7-u-rodigallee/GX013712", "00:00:01.368", :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013713", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013714", :start, "00:00:52.920"},
          {"2022-05-07-v10-v7-u-rodigallee/GX013714", "00:00:53.220", :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013715", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013716", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013717", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013718", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013719", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013720", :start, "00:00:40.741"},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013661", "00:01:28.689", "00:01:56.016"},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013676", "00:00:12.779", "00:00:53.186"},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013687", "00:00:51.051", "00:02:09.229"},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013678", "00:00:19.186", :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013679", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013680", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013681", "00:00:00.467", "00:01:23.951"}
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
        videos: [
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013681", "00:01:26.720", :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013682", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013683", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013685", :start, "00:02:57.611"},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013685", "00:03:33.480", :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013686", :start, :end},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013687", :start, "00:00:47.648"},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013687", "00:03:28.809", "00:04:38.111"},
          {"2022-05-07-v10-v7-u-rodigallee/GX013722", "00:00:00.834", :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013723", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013724", :start, "00:00:42.309"},
          {"2022-05-07-v10-v7-u-rodigallee/GX013724", "00:00:51.418", :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013725", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013726", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013727", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013728", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013729", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013730", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013731", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013732", :start, :end}
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
