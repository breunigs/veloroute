defmodule Data.Article.Blog.HamburgsRadampeln do
  use Article.Default

  def title(), do: "Radampeln in Hamburg sind zu klein und zu kompliziert"

  def summary(),
    do:
      "Die oft überraschend platzierten Ampeln verlangen höchste Aufmerksamkeit oder Ortskenntnis um nicht aus Versehen bei Rot zu fahren. Außerdem sind sie winzig und kaum erkennbar."

  def type(), do: nil
  def tags(), do: []

  def point_of_interest(), do: %{lon: 10.0016195, lat: 53.5672755, zoom: 13}

  def tracks(), do: []

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Meinung</h4>
    <p>Hamburgs Fahrradampeln sind zu klein und schlecht ablesbar, vor allem die winzigen Richtungspfeile. Zudem muss man die Ampeln oft suchen und dann überlegen, ob sie überhaupt zu beachten sind. Beispiele:</p>

    <h5>Wo ist die Ampel? – <.v bounds="10.021274,53.568172,10.042885,53.578806" lon={10.027305} lat={53.570494} dir="backward" ref="radroute-12">Hamburger Meile Richtung Stadtpark</.v></h5>
    <ol>
      <li><.v bounds="10.027079,53.570124,10.03098,53.572701" lon={10.028316} lat={53.571084} dir="backward" ref="radroute-12">Humboldtstraße</.v>: rechts des Radwegs, an der Haltelinie</li>
      <li><.v bounds="10.030859,53.573137,10.03516,53.575296" lon={10.032688} lat={53.573635} dir="backward" ref="radroute-12" highlight="Heitmannstraße">Heitmannstraße #1</.v>: links der Gegenspur, in Kreuzungsmitte, wegen Treppenaufgang spät sichtbar</li>
      <li><.v bounds="10.030859,53.573137,10.03516,53.575296" lon={10.03303} lat={53.573861} dir="backward" ref="radroute-12" highlight="Heitmannstraße">Heitmannstraße #2</.v>: links der Gegenspur, hinter der Kreuzung, wegen Betonpfeiler zu spät sichtbar</li>
      <li><.v bounds="10.029934,53.572618,10.040805,53.577972" lon={10.034448} lat={53.574747} dir="backward" ref="radroute-12" highlight="Adolph-Schönfelder-Straße">Adolph-Schönfelder-Straße #1</.v>: links des Radwegs, in Kreuzungsmitte</li>
      <li><.v bounds="10.029934,53.572618,10.040805,53.577972" lon={10.035011} lat={53.575016} dir="backward" ref="radroute-12" highlight="Adolph-Schönfelder-Straße">Adolph-Schönfelder-Straße #2</.v>: rechts des Radwegs, an der Haltelinie</li>
    </ol>

    <h5>Welche Ampel gilt? – <.v bounds="9.973225,53.558751,9.998376,53.567796" lon={9.977897} lat={53.564211} dir="forward" ref="radroute-2">Verbindungsbahn in Richtung Dammtor</.v></h5>
    <ol>
      <li><.v bounds="9.974725,53.562661,9.980928,53.566214" lon={9.976873} lat={53.564233} dir="forward" ref="radroute-2">Rentzelstraße/Messeplatz</.v>: Kombi-Fuß-Rad-Ampel</li>
      <li><.v bounds="9.979152,53.561889,9.986006,53.567266" lon={9.981711} lat={53.564098} dir="forward" ref="radroute-2">Bundesstraße</.v>: Radampel</li>
      <li><.v bounds="9.981726,53.563101,9.987812,53.56573" lon={9.983838} lat={53.564046} dir="forward" ref="radroute-2">Grindelallee</.v>: keine!</li>
      <li><.v bounds="9.987833,53.561211,9.990533,53.563183" lon={9.988204} lat={53.562118} dir="forward" ref="radroute-2">vor der Uni:</.v>: linke Radampel (rechte für's Linksabbiegen)</li>
      <li><.v bounds="9.986824,53.559418,9.993487,53.564013" lon={9.989271} lat={53.561518} dir="forward" ref="radroute-2">Rothenbaumchaussee</.v>: allgemeine Fahrbahnampel</li>
      <li><.v bounds="9.986824,53.559418,9.993487,53.564013" lon={9.989917} lat={53.561065} dir="forward" ref="radroute-2">Dammtorbahnhof #1</.v>: allgemeine Fahrbahnampel</li>
      <li><.v bounds="9.986824,53.559418,9.993487,53.564013" lon={9.990185} lat={53.560786} dir="forward" ref="radroute-2">Dammtorbahnhof #2</.v>: Radampel</li>
      <li><.v bounds="9.986824,53.559418,9.993487,53.564013" lon={9.990277} lat={53.560674} dir="forward" ref="radroute-2">Dammtordamm</.v>: linke Radampel (rechte für's Rechtsabbiegen)</li>
    </ol>

    <h4>Vorschläge – kurzfristig</h4>
    <h5>Radampeln ergänzen</h5>
    <p>Bei Radwegen an der Fahrbahn sollten allgemeine Fahrbahnampeln durch eine Radampel ergänzt werden, etwa wie am <.v bounds="9.987792,53.55926,9.99345,53.562798" lon={9.990506} lat={53.560118} dir="backward" ref="radroute-3">Dammtordamm</.v>. Dann muss man weniger suchen bzw. überlegen.</p>

    <img src="/images/ampelhd.webp" width="1169" height="1515" alt="Die kleinen Radampeln haben vier Felder: oben ein blau/weiß leuchtendes Fahrradsymbol. Rot+Gelb Felder leuchten vollständig bis auf den schwarzen Pfeil. Das Grün-Feld ist schwarz mit leuchtendem grünen Pfeil. Zusätzlich gibt es eine große Radampel die weiter oben angebracht ist, und einen leuchtenden Pfeil+Fahrradsymbol hat." style="max-width:300px; height: auto; float: right;margin-left: 0.5rem;shape-outside:url(/images/ampelhd.webp);shape-margin: 0.5rem;"/>
    <h5>Besser ablesbare Ampeln</h5>
    <p>Die abgebildete Ampel aus Heidelberg erkennt man auch von weitem – selbst bei blendender Sonne oder beschlagener Brille. Zusätzlich bleibt die große Ampel oben links auch dann lesbar, wenn Wartende die kleinen Ampeln verdecken.</p>

    <h4>Forderungen – langfristig</h4>
    <h5>Weniger Ampeln</h5>
    <p>Kreisverkehre, Tempo 20, Zebrastreifen oder andere <.ref>Querungshilfen</.ref> können Ampeln überflüssig machen. Das verbessert das Vorankommen für alle.</p>

    <p><.ref name="modalfilter">Durchfahrtssperren</.ref> halten KFZ-Bequemlichkeitsverkehr fern – denn nur mit Autoverkehr braucht man Ampeln. Das ist auch gegen die „Umweg“-Jammerer durchzusetzen. Große Autotrassen kann man auch nur alle paar 100m sicher queren und muss dann oft warten. Wenn Fuß und Rad diese Umwege schaffen, dann jemand im Auto erst recht.</p>

    <h5>Standardisierte Ampeln</h5>
    <p>Hamburg braucht klare Regeln für Radampeln, damit man sie schnell findet und versteht. Standardkreuzungen sollten überall gleich gelöst werden. Entlang eines Straßenzugs sollten die Lösungen ebenfalls gleich bleiben. Idealerweise hält man den Pfosten/Masten-Wald dabei in Grenzen und die Gehwege frei.</p>

    <p>Die Sichtweiten müssen zu den Geschwindigkeiten passen. Mit einem E-Antrieb erreicht jeder <span style="white-space: nowrap;">25 km/h</span>, bei Rückenwind auch häufig mehr. Kombi-Fuß-Rad-Ampeln verbieten sich damit von selbst.</p>
    """
  end
end
