defmodule Data.Article.Static.LexikonQuerungshilfe do
  use Article.Static

  def name(), do: "lexikon/querungshilfe"
  def title(), do: "Lexikon · Querungshilfe"

  def summary(),
    do:
      "Querungshilfen erleichtern das Queren einer Straße oder den Wechsel der Straßenseite. Beispiele sind Zebrastreifen oder Verkehrsinseln in Straßenmitte."

  def tags(), do: ~w(lexikon querungshilfe sprunginsel mittelinsel zebrastreifen straßeneinengung)

  def links(_assigns) do
    [
      {"ADFC „Verkehrsrecht für Radfahrende“",
       "https://www.adfc.de/artikel/verkehrsrecht-fuer-radfahrende/"},
      {"Broschüre des LSBG zu Begriffen der Verkehrsplanung",
       "https://lsbg.hamburg.de/resource/blob/17516/83583926bd56cf60859cb1bc25fae2fe/broschuere-verkehrsplanung-kurze-begriffserlaeuterungen-3-auflage-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Mit <em>Querungshilfen</em> meint man alle Einrichtungen, die das Queren einer Straße bzw. das Wechseln der Straßenseite erleichtern. Beispiele sind Zebrastreifen oder Verkehrsinseln in der Straßenmitte (auch: Mittelinsel oder Sprunginsel).</p>

    <p>Nicht gemeint sind Ampeln an Kreuzungen, da diese insgesamt den Verkehr lenken und nicht nur das Queren erleichert. Eine Ampel als Querungshilfe nennt man <.ref>Bedarfsampel</.ref>.</p>

    <h4>Zebrastreifen</h4>
    <p>Wer zu Fuß <.v bounds="10.066995,53.580885,10.072788,53.583348" lon={10.06957} lat={53.581473} dir="forward" ref="6">einen Zebrastreifen</.v> quert, hat Vorrang. Das gilt auch, wenn man sein Fahrrad über den Zebrastreifen schiebt. Rad- und Autoverkehr müssen entsprechend warten.</p>

    <p>Sofern Gehwegradeln erlaubt ist (etwa wegen „<.ref>Fahrrad frei</.ref>“ oder <.a href="https://www.landesrecht-hamburg.de/bsha/document/jlr-GrAnlVHAV3P1/part/X#:~:text=Rad%20fahren%20geschieht%20auf%20eigene%20Gefahr%3B%20dabei%20ist%20auf%20die%20Belange%20der%20anderen%20dort%20Erholung%20Suchenden%20R%C3%BCcksicht%20zu%20nehmen.">in Grünanlagen</.a>), darf man auch über den Zebrastreifen fahren. Man hat dann allerdings keinen Vorrang mehr. Durch gegenseitige Verständigung und Vorausschauen kann man oft fahrend queren. Dennoch sollte man achtsam und langsam sein.</p>

    <p>An <.v bounds="10.15681,53.644291,10.161496,53.648419" lon={10.158004} lat={53.645749} dir="forward" ref="6">vielen Kreisverkehren</.v> verläuft eine Radfurt neben einem Zebrastreifen über die Seitenarme. Der Zebrastreifen ist für den Radverkehr daher gar nicht relevant, sondern andere Regeln:</p>
    <ul>
      <li>Beim Einfahren regelt ein <.a href="https://dejure.org/gesetze/StVO/8.html#Abs1a:S1">„Vorfahrt gewähren“ Schild die Situation</.a> eindeutig. Der Radverkehr im Kreisel hat Vorfahrt.</li>
      <li>Beim Ausfahren gilt „<.a href="https://dejure.org/gesetze/StVO/9.html#Abs3:S1">wer abbiegt, muss warten</.a>“. Das ist auch Abbiegen aus dem Kreisel so.</li>
    </ul>

    <h4>Mittelinseln</h4>
    <p><.v bounds="10.072346,53.585299,10.075701,53.586884" lon={10.07383} lat={53.586069} dir="forward" ref="6">Mittelinseln oder Sprunginseln</.v> befinden sich meistens in der Straßenmitte, zwischen den Fahrspuren. Wenn die Mittelinsel sonst keine Schilder oder Markierungen hat, hat der Verkehr auf der <.ref>Fahrbahn</.ref> Vorfahrt.</p>

    <p>Man muss so aber nur auf eine Fahrtrichtung achten – also hauptsächlich nur in eine Richtung schauen – und kann die Straße in zwei Abschnitten überqueren. Das erhöht die Chance eine Lücke zu finden, sodass man weniger lang warten muss. Man nennt dies auch „Queren in zwei Zügen“.</p>

    <p>Die Abbildung zeigt eine Mittelinsel rein für den Fußverkehr. Es spricht aber nichts dagegen, sie zu vergrößern um auch dem Radverkehr ihre Nutzung zu ermöglichen.</p>

    <.roaddiagram src="mittelinsel" alt="Vogelperspektive auf eine Mittelinsel als Querungshilfe für den Fußverkehr"/>

    <h4>Einengungen / Gehwegnasen</h4>
    <p><.v bounds="9.85947,53.556683,9.864797,53.558608" lon={9.860814} lat={53.557531} dir="backward" ref="1">Gehwegnasen oder Gehwegvorstreckungen</.v> werden meist in Wohnstraßen gebaut, damit die am Straßenrand parkenden KFZ keine undurchsichtige Wand bilden. Durch die freie Sicht auf die Fahrbahn kann leicht ohne stehen zu bleiben gequert werden.</p>

    <.roaddiagram src="gehwegnase" alt="Vogelperspektive auf eine Gehwegnase ohne Einengung der Fahrbahn"/>

    <p>Man kann diese Gehwegnasen noch mit einer zusätzlichen <.v bounds="9.934363,53.587524,9.937582,53.589386" lon={9.93569} lat={53.58859} dir="backward" ref="2">Einengung der Fahrbahn</.v> kombinieren. Durch die notwendige Absprache wer die Engstelle zuerst passiert, wird das Fahrtempo in der Regel weiter gesenkt. Das erleichtert auch das Queren.</p>

    <h4>Weiterführende Links</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
