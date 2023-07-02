defmodule Data.Article.Static.Alltagsroute6 do
  use Article.Static

  def id(), do: "6"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 6"

  def color(), do: "#2a3283"

  def summary(),
    do: "Alltagsroute 6 führt vom Rathaus nach Volksdorf"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "6",
        direction: :forward,
        from: "Innenstadt",
        to: "Volksdorf",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Volksdorf",
        historic: %{
          "d0e15711298a41ecbefec751b3199a2f" => ~d[2022-05],
          "72143674b74709247f36b15a8f72d968" => ~d[2021-06]
        },
        videos: [
          {"2022-04-30-velo5-u-12innenstadt/GX013576", "00:00:38.872", :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013577", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013578", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013579", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013580", :start, "00:00:31.431"},
          {"2022-04-30-velo5-u-12innenstadt/GX013581", "00:00:22.256", "00:00:58.425"},
          {"2022-05-14-velo6-u-bundesstr/GX013857", "00:00:16.316", "00:02:05.158"},
          {"2022-05-14-velo6-u-bundesstr/GX013879", "00:00:23.223", :end},
          {"2022-05-14-velo6-u-bundesstr/GX013880", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013881", :start, "00:00:02.803"},
          {"2022-05-14-velo6-u-bundesstr/GX013860", "00:00:02.569", :end},
          {"2022-05-14-velo6-u-bundesstr/GX013861", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013862", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013863", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013864", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013865", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013866", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013867", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013868", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013869", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013870", :start, "00:01:58.385"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "6",
        direction: :backward,
        from: "Volksdorf",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Volksdorf in die Innenstadt",
        historic: %{
          "90460e690f3f5258649b1cdd9e3c4d75" => ~d[2022-05],
          "76ea19b0a672d5d88c4007fb2785c44b" => ~d[2021-06]
        },
        videos: [
          {"2022-05-14-velo6-u-bundesstr/GX013870", "00:02:36.723", :end},
          {"2022-05-14-velo6-u-bundesstr/GX013871", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013872", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013873", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013874", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013875", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013876", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013877", :start, "00:01:47.174"},
          {"2022-05-14-velo6-u-bundesstr/GX013877", "00:01:47.741", :end},
          {"2022-05-14-velo6-u-bundesstr/GX013878", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013879", :start, "00:00:03.403"},
          {"2022-05-14-velo6-u-bundesstr/GX013884", "00:00:03.637", :end},
          {"2022-05-14-velo6-u-bundesstr/GX013885", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013886", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013887", :start, "00:00:03.670"},
          {"2022-04-30-velo5-u-12innenstadt/GX013627", "00:00:27.594", :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013628", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013629", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013630", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013631", :start, :end},
          {"2022-04-30-velo5-u-12innenstadt/GX013632", :start, "00:00:09.042"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/426692/veloroute-6/"},
      {"Komoot Routenplaner: nach Volksdorf", "https://www.komoot.de/tour/204279360"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/227477"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="14" style="background-image: url(/images/route6.svg)">
          <.icon>6</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.993833} lat={53.550924} dir="forward" ref="6">Rathaus</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>5</.icon>
        </td>
        <td><.m bounds="9.9974811,53.5497575,10.0264608,53.5652488">St. Georg</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>5</.icon>
        </td>
        <td><.m bounds="10.0038075,53.5652488,10.0378378,53.582101">Uhlenhorst</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0082327,53.5563894,10.037771,53.5665697">Hohenfelde</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>13</.icon>
        </td>
        <td><.m bounds="10.0440274,53.5707023,10.0441274,53.5708023">Auenviertel</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0573709,53.5764469,10.0574709,53.5765469">Friedrichsberg</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0531511,53.5758428,10.0755084,53.5910451">Dulsberg</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0693469,53.5873256,10.0793469,53.5973256">Wandsbek-Gartenstadt</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.0978727,53.593434,10.1078727,53.603434">Trabrennbahn Farmsen</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>14</.icon>
        </td>
        <td><.m bounds="10.1127994,53.602222,10.1227994,53.612222">Farmsen</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>14</.icon>
        </td>
        <td><.m bounds="10.1349662,53.6220857,10.1449662,53.6320857">Berne</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="10.1368101,53.6342243,10.1988518,53.6760647">Volksdorf</.m></td>
      </tr>
      <tr>
        <td>
          <.icon name="rsw-ahrensburg" bounds="10.162031,53.649846,10.273755,53.688831" lon={10.164112} lat={53.651525} dir="backward">RSW</.icon>
        </td>
        <td>
          <.v bounds="10.162031,53.649846,10.273755,53.688831" lon={10.164112} lat={53.651525} dir="backward" ref="rsw-ahrensburg">Ahrensburg</.v>
        </td>
      </tr>
    </table>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
