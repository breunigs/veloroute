defmodule Data.Article.Blog.StPauliHafenstrasse do
  use Article.Default

  def title(), do: "St. Pauli Hafenstraße (Freizeitroute 8)"

  def summary(),
    do:
      "Teils breite Radfahrstreifen, teils kleinere Verbesserungen, teils gar keine Änderungen. Das Radnetz bleibt lückenhaft."

  def type(), do: :planned
  def start(), do: ~d[2026-09]
  def stop(), do: ~d[2027-03]

  def tags(), do: ["radroute-concept-a", "FR8"]

  def map_image do
    {name(),
     [
       {"BPR Ingenieure GmbH & Co. KG", "https://bpr-ingenieurbuero.de/kontakt/"},
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
     ]}
  end

  def links(_assigns) do
    [
      {"Lageplan und Erläuterungen", ~d[2025-04],
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1016564"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In <.v bounds="9.953959,53.54508,9.963915,53.546868" lon={9.954337} lat={53.545511} dir="forward" ref={RadrouteConceptA}>Richtung Innenstadt</.v> gibt es keinen Radweg. Man muss entweder auf dem Gehweg (mit <.ref>Fahrrad frei</.ref>) weiterradeln oder unerwartet an der Einmündung <.v bounds="9.951898,53.544326,9.95864,53.547517" lon={9.953562} lat={53.545691} dir="forward" ref={RadrouteConceptA}>Große Elbstraße</.v> auf die <.ref>Fahrbahn</.ref> wechseln.</p>

    <p>In <.v bounds="9.961579,53.544263,9.971814,53.547271" lon={9.968186} lat={53.546168} dir="backward" ref={RadrouteConceptA}>Richtung Altona</.v> gibt es einen rund 1,0m breiten <.ref>Hochbordradweg</.ref>. Dieser ist zwischen den Gaststätten <.v bounds="9.955667,53.545042,9.959604,53.547215" lon={9.958625} lat={53.546199} dir="backward" ref={RadrouteConceptA}>ÜberQuell</.v> und <.v bounds="9.954599,53.544528,9.959535,53.547005" lon={9.956061} lat={53.545872} dir="backward" ref={RadrouteConceptA}>Fischerhaus</.v> stellenweise unterbrochen. Da auf Höhe der <.v bounds="9.962207,53.545522,9.966144,53.547695" lon={9.965542} lat={53.546448} dir="backward" ref={RadrouteConceptA}>Davidstraße</.v> ein Gehweg fehlt, wird der Radweg dort häufig von Fußgängern mitbenutzt.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die Planung vermeidet bewusst einen Vollumbau und beschränkt sich auf Änderungen, die sich leicht und kostengünstig umsetzen lassen.</p>

    <p>In <b>Richtung Innenstadt</b> fängt ca. ab <.v bounds="9.962117,53.545631,9.967526,53.547312" lon={9.962914} lat={53.546404} dir="forward" ref={RadrouteConceptA} highlight="Davidstreppe">Höhe der Davidstreppe</.v> ein <.ref>Radfahrstreifen</.ref> an. Er wird 1,75m bis 2,60m breit. Nach der Einmündung der <.v bounds="9.963803,53.545513,9.969028,53.547122" lon={9.966276} lat={53.546254} dir="forward" ref={RadrouteConceptA}>Davidstraße</.v> wird man auf einen 1,75m breiten Hochbordradweg geleitet, der später in den schon <.v bounds="9.967485,53.545488,9.969636,53.546578" lon={9.968081} lat={53.546056} dir="forward" ref={RadrouteConceptA}>vorhandenen Radfahrstreifen</.v> übergeht.</p>

    <p>In <b>Richtung Altona</b> wechselt die Führung häufig:</p>
    <ol>
      <li><.v bounds="9.965914,53.545729,9.969616,53.546784" lon={9.968276} lat={53.546152} dir="backward" ref={RadrouteConceptA}>Bergauf</.v>: asphaltierter Gehweg (1,4m) und Radweg (1,5m); durch Noppenplatten getrennt. Auf Fahrbahnseite kommen noch 0,6m Sicherheitsabstand hinzu.</li>
      <li><.v bounds="9.964511,53.545879,9.967284,53.546814" lon={9.966541} lat={53.546338} dir="backward" ref={RadrouteConceptA} highlight="Davidstraße">Vor Einmündung Davidstraße</.v>: gemeinsamer Geh- und Radweg</li>
      <li><.v bounds="9.964511,53.545879,9.967284,53.546814" lon={9.965541} lat={53.546444} dir="backward" ref={RadrouteConceptA} highlight="Davidstraße">Nach Einmündung Davidstraße</.v>: Gehweg mit Fahrrad frei. Es ist etwas mehr Breite als bisher vorgesehen.</li>
      <li><.v bounds="9.96122,53.545963,9.964933,53.546852" lon={9.964} lat={53.546513} dir="backward" ref={RadrouteConceptA}>Bergab</.v>: Baustelle von Hamburg Wasser. Währenddessen Radeln im <.ref>Mischverkehr</.ref> mit den KFZ.</li>
      <li><.v bounds="9.960108,53.54589,9.963324,53.546777" lon={9.962485} lat={53.546471} dir="backward" ref={RadrouteConceptA}>Bushalt Hafenstraße</.v>: Beginn eines 2,95m breiten Radfahrstreifens. Rechts von ihm befinden sich KFZ-Parkplätze und Lieferzonen.</li>
      <li><.v bounds="9.954216,53.545206,9.957175,53.546173" lon={9.955276} lat={53.545721} dir="backward" ref={RadrouteConceptA}>nach Ampelfurt (ca. Hausnummer 37)</.v>: Überleitung auf vorhandenen Hochbordradweg</li>
    </ol>

    <h4>Meinung</h4>
    <p>Aushängeschild der Planung ist der breite Radfahrstreifen in Richtung Altona. Auch der Radfahrstreifen ab <.v bounds="9.962117,53.545631,9.967526,53.547312" lon={9.962914} lat={53.546404} dir="forward" ref={RadrouteConceptA}>Davidstreppe</.v> in Richtung Innenstadt kann sich sehen lassen. Dass ein kurzes Stück als Hochbordradweg ausgeführt wird ist zwar nicht ideal, aber verschmerzbar.</p>

    <p>Problematisch sehe ich die KFZ-Parkplätze rechts des Radfahrstreifen – im Steindamm funktioniert das schlecht, aber vielleicht klappt es in St. Pauli besser. Auch die Baustelle ist schwierig, dafür zum Glück kein Dauerzustand. Wat mutt, dat mutt.</p>

    <p>Schade ist, dass stadteinwärts auf der Hochwasserschutzanlage keine Lösung gefunden wurde. Wenn nur einfache Eingriffe erlaubt sind, ist das wegen dem Fischmarkt auch schwierig.</p>

    <p>Hauptkritikpunkt ist die unausgereifte Lösung rund um die Davidstraße. Die Wege werden zwar etwas breiter, aber nicht genug, um Fuß- und Radverkehr ordentlich zu trennen. Dabei sehe ich selbst ohne große Umbauten noch Potential:</p>
    <ul>
      <li>Den Schilderwald lichten: Das „Fahrrad frei“ findet am Ampelmast Platz. Das Halteverbot für KFZ ergibt sich bereits aus der durchgezogenen Linie – wer das nicht weiß, lernt es durch Abschleppen.</li>
      <li>Den südlichen Radfahrstreifen leicht verschmälern.</li>
      <li>Die Davidstraße als Gehwegüberfahrt mit weniger Abbiegemöglichkeiten gestalten; als Einbahnstraße oder gleich ganz sperren.</li>
    </ul>

    <p>Bitte nicht falsch verstehen: Die Maßnahme verbessert die Situation – aber leider nur <em>ein wenig</em>. </p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
