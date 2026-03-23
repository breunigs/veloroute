defmodule Data.Article.Blog.AlsteruferSuedende do
  use Article.Default

  def title(), do: "Alsterufer – südliches Ende (Radrouten 2 und 4, Alsterradweg)"

  def summary(),
    do:
      "Die Einmündung Alsterufer/Kennedybrücke/Alsterglacis wird sicherer, grüner und übersichtlicher. Der Komfort für den Radverkehr steigt."

  def type(), do: :planned
  def start(), do: ~d[2027-07]
  def stop(), do: ~d[2028-03]

  def tags(), do: ["FR1", "radroute-4", "radroute-2"]

  def map_image do
    {name(),
     [
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
     ]}
  end

  def links(_assigns) do
    [
      {"Präsentation", ~d[2026-03],
       "https://fragdenstaat.de/anfrage/massnahme-lueckenschluss-alsterufer/#nachricht-1101441"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Das südliche Ende der Straße Alsterufer viele Problemstellen:</p>
    <ul>
      <li>Zweirichtungsradweg von/zur <.v bounds="9.99272,53.557121,9.998752,53.559473" lon={9.996942} lat={53.558107} dir="backward" ref={Radroute2}>Kennedybrücke</.v> ist zu eng</li>
      <li>Gefahrenstelle: <.v bounds="9.99306,53.558074,9.99637,53.559329" lon={9.994959} lat={53.55866} dir="backward" ref={Radroute2}>freier KFZ-Rechtsabbieger</.v></li>
      <li>Fahrt von der Warburgstraße zum Alsterufer ist extrem umständlich – oder verboten</li>
      <li>schlechte Sicht <.v bounds="9.994561,53.558568,9.996664,53.559929" lon={9.995806} lat={53.559406} dir="forward" ref={Radroute4}>beim Radweg zur Grünfläche</.v></li>
      <li>komplexe und missverständliche Ampel</li>
      <li>wenig Grün und geringe Aufenthaltsqualität</li>
    </ul>

    <p>Der LSBG nennt in seiner Präsentation weitere Unzulänglichkeiten.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der <.v bounds="9.99272,53.557121,9.998752,53.559473" lon={9.996942} lat={53.558107} dir="backward" ref={Radroute2}>Zweirichtungsradweg von der Kennedybrücke</.v> wird auf 2,5m je Richtung verbreitert und bis zur <.v bounds="9.99272,53.557121,9.998752,53.559473" lon={9.994256} lat={53.558818} dir="backward" ref={Radroute2}>Warburgstraße</.v> verlängert.</p>

    <p>In <.v bounds="9.993317,53.558148,9.99652,53.559709" lon={9.994432} lat={53.558687} dir="backward" ref={Radroute4}>Richtung Alsterufer</.v> wird die ehemalige Rechtsabbiegespur zum Zweirichtungsradweg umgebaut. Vom <.v bounds="9.993317,53.558148,9.99652,53.559709" lon={9.995221} lat={53.5591} dir="forward" ref={Radroute4}>Alsterufer kommend</.v> sind großzügige Aufstellbereiche und Einfädelungsspuren vorgesehen, die das Linksabbiegen erleichtern.</p>

    <p>Der <.v bounds="9.994356,53.558168,9.997939,53.559683" lon={9.995952} lat={53.558651} dir="forward" ref={Freizeitroute1}>Radweg in der Grünfläche</.v> entfällt zugunsten breiterer Gehwege.</p>

    <p>Die <.v bounds="9.993166,53.557976,9.997671,53.560641" lon={9.99606} lat={53.55984} dir="forward" ref={Radroute4} highlight="Radroute">Fahrradstraße Alsterufer</.v> rückt näher an die Kreuzung heran. Die Trennung von Rad- und KFZ-Verkehr beginnt früher.</p>

    <p>An der Warburgstraße wird eine StadtRAD Station gebaut. Selten genutzte KFZ-Fahrtbeziehungen entfallen. Grünflächen werden vergrößert oder neu angelegt. Zudem werden neue Bäume gepflanzt.</p>

    <h4>Meinung</h4>
    <p>Bisher wirkt der Abschnitt wie eine pausierte Baustelle. Mit der Umplanung wird es nicht nur hübscher, sondern vor allem sicherer. Die Sicht besser, die Ampel einfacher und die Verkehrsarten werden klarer getrennt.</p>

    <p>Kritikpunkte gibt es höchstens im Detail. Dazu ist die Präsentation aber nicht tiefgängig genug.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
