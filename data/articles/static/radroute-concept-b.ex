defmodule Data.Article.Static.RadrouteConceptB do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-concept-b"
  def display_id(), do: "?"
  def title(), do: "Neue Radroute (Konzept)"
  def color(), do: RouteColors.blue1()

  def summary(),
    do:
      "Die Radroute im Konzeptstand soll einmal auf dem Autobahndeckel Altona verlaufen. Im Süden führt sie in Richtung der Elbfähre Teufelsbrück, im Norden Anschluss an den Radschnellweg Elmshorn."

  def tags(), do: [id()]

  def tracks(), do: []

  def point_of_interest(), do: %{lon: 9.902204, lat: 53.570442, zoom: 13}

  def links(_assigns) do
    [
      {"Infoseite des Freiraums-Planungsbüro Deckel Altona",
       "https://arbos-landscape.de/project/parklandschaft-auf-dem-deckel-der-bundesautobahn-7-hamburg"}
    ]
  end

  def text(assigns) do
    ~H"""
      <p><strong>Hinweis:</strong> für diese Route ist kein Video verfügbar<br><br></p>

      <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-concept-b</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon name="rsw-elmshorn">RSW</.icon><.icon>FR11</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.m bounds="9.897192,53.58043,9.934115,53.601819">Bahnhof Stellingen</.m></td>
      </tr>
      <tr>
        <td><.icon name="rsw-elmshorn">RSW</.icon><.icon>FR11</.icon><.icon>FR9</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.m bounds="9.895153,53.573313,9.925385,53.593845">Altonaer Volkspark</.m></td>
      </tr>
      <tr>
        <td><.icon>radroute-7</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.m bounds="9.88538,53.554264,9.922912,53.584083">Bahrenfeld</.m></td>
      </tr>
      <tr>
        <td><.icon>radroute-18</.icon><.icon>radroute-1</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.m bounds="9.855987,53.541338,9.898595,53.569189">Othmarschen</.m></td>
      </tr>
    </table>


    <p>Die geplante Route soll einmal größtenteils auf dem Autobahndeckel Altona verlaufen. Im Süden ist via dem <.m bounds="9.873357,53.545485,9.90875,53.561809">Klein Flottbeker Weg</.m> ein Anschluss an die <.a name="radroute-18">Radroute 18</.a> angedacht. Im Norden soll eine Anbindung an den <.a name="rsw-elmshorn">Radschnellweg nach Elmshorn</.a> und den <.m bounds="9.896069,53.580297,9.931436,53.601243">Bahnhof Stellingen</.m> erfolgen.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Route ist ein reiner Konzeptstand. Sie kann bis auf winzige Abschnitte <em>nicht</em> befahren werden. Es gibt auch keine ortsnahen Alternativen.</p>

    <h4>Meinung</h4>
    <p>Da die Route bis auf einige zu querende Straßen autofrei wäre, könnte sie eine hervorragende Nord-Süd-Verbindung für den Bezirk Altona herstellen. Leider werden noch Jahre vergehen, ehe die Route auch nur annähernd benutzbar ist.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={false}/>
    """
  end
end
