defmodule Data.Article.Static.Alltagsroute1 do
  use Article.Static

  def name(), do: "alltagsroute-1"
  def title(), do: "Alltagsroute 1"

  def summary(),
    do: "Alltagsroute 1 führt vom Rathaus nach Rissen bzw. zum Osdorfer Born"

  def tags(), do: ["1", "1a"]

  def links() do
    assigns = {}

    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/418898/veloroute-1/"},
      ~H{Komoot Routenplaner: <a href="https://www.komoot.de/tour/228243760">zum Osdorfer Born</a> oder <a href="https://www.komoot.de/tour/225147673">nach Rissen</a>},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/194843"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="14" style="background-image: url(/images/route1.svg)">
          <.icon>1</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9915695,53.5499061,9.9931782,53.5509096">Rathaus</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>11</.icon>
          <.icon>12</.icon>
          <.icon>2</.icon>
        </td>
        <td><.m bounds="9.9866263,53.5479641,9.9871242,53.548472">Rödingsmarkt</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9672602,53.5511364,9.9745376,53.5571361">Heiligengeistfeld</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>7</.icon>
        </td>
        <td><.m bounds="9.9549651,53.5431746,9.9902942,53.5638046">St. Pauli</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.92758,53.5417787,9.9602617,53.5627471">Altona-Altstadt</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9093475,53.5415333,9.9348885,53.5600679">Ottensen</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>14</.icon>
        </td>
        <td><.m bounds="9.8638682,53.5415406,9.917539,53.5600054">Othmarschen</.m></td>
      </tr>
      <tr>
        <td><.m bounds="9.8637341,53.5583216,9.9004188,53.5715607">Groß Flottbek</.m></td>
        <td><.m bounds="9.8558825,53.5531648,9.8658825,53.5631648">Klein Flottbek</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>14</.icon> <.m bounds="9.8266622,53.5577662,9.8669147,53.5950351">Osdorf</.m>
        </td>
        <td><.m bounds="9.8204171,53.5442254,9.8650723,53.5653583">Nienstedten</.m></td>
      </tr>
      <tr>
        <td><.m bounds="9.8399615,53.5752492,9.8456209,53.5917348">Osdorfer Born</.m></td>
        <td><.m bounds="9.7617571,53.5508,9.8266896,53.5742528">Blankenese</.m></td>
      </tr>
      <tr>
        <td class="dir"><.m bounds="9.7897061,53.5841903,9.8681548,53.6156231">(Schenefeld)</.m></td>
        <td><.m bounds="9.7788518,53.5709306,9.8184877,53.6067525">Sülldorf</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.7301155,53.5551486,9.7990198,53.6314046">Rissen</.m></td>
      </tr>
      <tr>
        <td></td>
        <td class="dir"><.m bounds="9.6333439,53.5575882,9.7592222,53.6187534">(Wedel)</.m></td>
      </tr>
    </table>

    <h3>Externe Links</h3>
    <.structured_links gpx="yes"/>
    """
  end
end
