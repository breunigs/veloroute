defmodule Data.Article.Static.Radroute15 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-15"
  def display_id(), do: "15"
  def title(), do: "Radroute 15"
  def color(), do: RouteColors.blue1()

  def summary(),
    do:
      "Radroute 15 verläuft in Nord-Süd-Richtung und verbindet die Christuskirche mit den Landungsbrücken."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "12",
        direction: :forward,
        from: "Christuskirche",
        to: "Landungsbrücken",
        parent_ref: __MODULE__,
        text: "von der Christuskirche (U2) zu den Landungsbrücken",
        historic: %{
          "9b837d0415f314347a4e1fafedb0260d" => ~d[2025-02]
        },
        videos: [
          {"2025-02-16-mitte/GX018055", "00:00:37.060", :end, vf: "curves=lighter"},
          {"2025-02-16-mitte/GX018056", :start, :end, vf: "curves=lighter"},
          {"2025-02-16-mitte/GX018057", :start, :end, vf: "curves=lighter"},
          {"2025-02-16-mitte/GX018058", :start, :end, vf: "curves=lighter"},
          {"2025-02-16-mitte/GX018059", :start, :end, vf: "curves=lighter"},
          {"2025-02-16-mitte/GX018060", "00:00:00.434", :end, vf: "curves=lighter"},
          {"2025-02-16-mitte/GX018061", :start, "00:00:01.134", vf: "curves=lighter"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "12",
        direction: :backward,
        from: "Landungsbrücken",
        to: "Christuskirche",
        parent_ref: __MODULE__,
        text: "von den Landungsbrücken zur Christuskirche (U2)",
        historic: %{
          "d82acc4829cd016e8195a096902f367e" => ~d[2025-02]
        },
        videos: [
          {"2025-02-16-mitte/GX018061", "00:00:01.134", :end},
          {"2025-02-16-mitte/GX018062", :start, :end},
          {"2025-02-16-mitte/GX018063", :start, :end},
          {"2025-02-16-mitte/GX018064", :start, "00:01:07.287"},
          {"2025-02-16-mitte/GX018065", "00:00:00.100", :end},
          {"2025-02-16-mitte/GX018066", "00:00:00.133", "00:00:05.720"}
        ]
      }
    ]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-15</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon>br-eimsbuettel-isebek</.icon><.icon>radroute-2</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.960475,53.566068,9.969487,53.571955" lon={9.96293} lat={53.569671} dir="forward" ref={@ref}>Christuskirche</.v></td>
      </tr>
      <tr>
        <td><.icon>br-eimsbuettel-sued</.icon><.icon>FR9</.icon><.icon>radroute-14</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.959747,53.559727,9.975521,53.569178" lon={9.965549} lat={53.566207} dir="forward" ref={@ref}>Sternschanze</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-7</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.959208,53.552878,9.972443,53.561157" lon={9.963631} lat={53.557795} dir="forward" ref={@ref}>Neuer Pferdemarkt</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-1</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.957316,53.544812,9.97791,53.557947" lon={9.967495} lat={53.551675} dir="forward" ref={@ref}>St. Pauli</.v></td>
      </tr>
      <tr>
        <td><.icon>FR8</.icon><.icon>1GR</.icon><.icon>radroute-4</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.964795,53.543317,9.975056,53.548143" lon={9.969326} lat={53.54625} dir="forward" ref={@ref}>Landungsbrücken</.v></td>
      </tr>
    </table>

    <p>Die kurze Radroute 15 verbindet <.v bounds="9.960475,53.566068,9.969487,53.571955" lon={9.96293} lat={53.569671} dir="forward" ref={@ref}>Christuskirche</.v> mit den <.v bounds="9.964795,53.543317,9.975056,53.548143" lon={9.969326} lat={53.54625} dir="forward" ref={@ref}>Landungsbrücken</.v>. Sie schließt nahtlos an die <.a name="radroute-2">Radroute 2</.a> im Norden bzw. die <.a name="radroute-4">Radroute 4</.a> im Süden an.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert. Sie ist auch ohne weitere Hilfsmittel auffindbar, da man im Wesentlichen geradeaus den Straßen folgt. Ausnahme ist nur die Führung um den <.v bounds="9.967731,53.548696,9.973247,53.55258" lon={9.969042} lat={53.550932} dir="forward" ref="radroute-15">U-Bahnhof St. Pauli</.v>.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Asphalt und Betonplatten halten sich in etwa die Waage.</p>

    <h4>Meinung</h4>
    <p>Die Strecke ist eine wichtige Querverbindung, die 2025 ins Radnetz aufgenommen wurde. Leider ist die Route nur zur Hälfte saniert, und dann häufig mit minderwertigen Radwegen. Bei aller Kritik muss man zugestehen, dass man trotzdem gut durchkommt. Da die Radwege stellenweise breiter und übersichtlich ausfallen, ist auch das gefahrlose Überholen von Langsameren möglich.</p>

    <p>Negativbeispiele sind die häufig zugeparkten <.ref>Schutzstreifen</.ref> in der <.v bounds="9.962356,53.565156,9.967844,53.569174" lon={9.964599} lat={53.567699} dir="forward" ref={@ref}>Weidenallee</.v> oder der nur 1m schmale <.ref>Hochbordradweg</.ref> in der <.v bounds="9.963353,53.550307,9.971181,53.555551" lon={9.96569} lat={53.553013} dir="forward" ref={@ref}>Budapester Straße</.v>. Zum Vergleich: Dem Autoverkehr gönnt man rund 12,5m für die gleiche Fahrtrichtung, wobei die Hälfte zum Parken genutzt wird. Es wäre also möglich gewesen, den Straßenraum fairer aufzuteilen.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
