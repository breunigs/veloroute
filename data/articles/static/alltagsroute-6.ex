defmodule Data.Article.Static.Alltagsroute6 do
  use Article.Static

  def id(), do: "6"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 6"

  def color(), do: "#2a3283"

  def summary(),
    do:
      "Alltagsroute 6 führt vom Rathaus nach Volksdorf. Dort schließt der künftige Radschnellweg nach Ahrensburg an."

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
        text: "aus der Innenstadt nach Volksdorf und Ahrensburg",
        historic: %{
          "ccb2ebc8df134044c5b9356322b13853" => ~d[2023-07],
          "d0e15711298a41ecbefec751b3199a2f" => ~d[2022-05],
          "72143674b74709247f36b15a8f72d968" => ~d[2021-06]
        },
        videos: [
          {"2023-07-08-vr6-rsw-ahr/GX010010", "00:00:06.907", :end},
          {"2023-07-08-vr6-rsw-ahr/GX010011", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010012", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010013", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010014", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010015", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010016", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010017", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010018", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010019", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010020", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010021", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010022", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010023", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010024", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010025", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010026", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010027", :start, "00:00:19.682"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "6",
        direction: :backward,
        from: "Volksdorf",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "aus Ahrensburg und Volksdorf in die Innenstadt",
        historic: %{
          "ad11718b6d75961f72c3841eeff084ad" => ~d[2023-07],
          "90460e690f3f5258649b1cdd9e3c4d75" => ~d[2022-05],
          "76ea19b0a672d5d88c4007fb2785c44b" => ~d[2021-06]
        },
        videos: [
          {"2023-07-08-vr6-rsw-ahr/GX010028", "00:01:07.721", :end},
          {"2023-07-08-vr6-rsw-ahr/GX010029", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010030", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010031", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010032", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010033", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010034", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010035", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010036", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010037", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010038", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010039", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010040", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010041", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010042", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010043", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010044", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010045", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010046", :start, :end},
          {"2023-07-08-vr6-rsw-ahr/GX010047", :start, "00:00:11.511"}
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
        <td><.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.993833} lat={53.550924} dir="forward" ref="6" highlight="Rathausmarkt">Rathaus</.v></td>
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
