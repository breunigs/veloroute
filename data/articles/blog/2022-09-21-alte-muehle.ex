defmodule Data.Article.Blog.AlteMuehle do
  use Article.Default

  def title(), do: "Alte Mühle (Alltagsroute 5)"

  def summary(), do: "Wegen Denkmalschutz keine Verbesserung für den Radverkehr möglich."

  def type(), do: :intent

  def tags(), do: ["5", "W08"]

  def links(_assigns) do
    [
      {"Präsentation Umbauvarianten", "September 2022",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1017287"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Alte Mühle liegt in einer Talsohle. Die Fahrbahn ist mit sehr unebenem Kopfsteinpflaster befestigt. Eine Schranke gegen den KFZ-Durchgangsverkehr zwingt zum Ausweichen auf den Gehweg. Durch den Restaurantbetrieb mit Terasse auf der anderen Straßenseite ist zudem reger Querungsverkehr zu Fuß.</p>

    <h4>Varianten</h4>
    <p>Es wurden mehrere Möglichkeiten untersucht, um die Situation vor Ort zu verbessern. Dabei konnte keine eindeutig gute Variante gefunden werden, sodass die bisherigen Erkenntnisse zunächst dem Regionalausschuss Alstertal vorgestellt werden sollen. Dabei wird die Frage aufgeworfen, ob der unten beschrieben Kompromissvorschlag überhaupt umgesetzt werden soll – hohe Kosten bei eher geringen Verbesserungen.</p>

    <h4>Kompromissvorschlag</h4>
    <p>Statt der bisherigen Schranke sind Umlaufsperren vorgesehen – also zwei versetzte Halbschranken, die in einer S-förmigen Kurve mit dem Fahrrad durchfahren werden können. Die genaue Aufstellung wäre noch offen.</p>

    <p>Beim Kopfsteinpflaster soll lediglich der Fußweg verbreitert werden. Wegen des Denkmalschutz schlägt man eine ungewöhnliche Variante vor: der heute in Grand befestigte Teil bliebe wie bisher. Allerdings entfernt man den Bordstein und ersetzt ein Teil des vorhandenen Straßenpflasters mit einer geschliffenen, flacheren Variante. Dieser „Kombi-Fußweg“ wäre dann 1,80m breit und ließe Personen mit Kinderwagen oder Rollstuhl leichter aneinander vorbeikommen.</p>

    <p>Zusätzlich sollen die Schlaglöcher bzw. Senken ausgebessert werden, wobei das vorhandene, unebene Kopfpflaster wiederverwendet wird.</p>

    <h4>Meinung</h4>
    <p>Die Präsentation merkt selbst an, dass der Kompromiss nur dem Denkmalschutz Rechnung trägt. Die Verbesserungen für Radverkehr und Barrierefreiheit fallen jedoch gering aus. Auch bietet diese Variante keine Lösung gegen Gehwegradeln, wofür aktuell extra Bügelsperren aufgestellt wurden.</p>

    <p>Lange Rede kurzer Sinn, solange man so stark am Denkmalschutz festhält, ist die Führung über die Alte Mühle für eine Veloroute untragbar. Es gibt allerdings kaum ortsnahe Alternativen – lediglich ein Ausbau des <.m bounds="10.096321,53.66682,10.105343,53.671775" lon="10.098759" lat="53.668655" dir="forward" ref="FR1">Alsterwanderwegs (FR1)</.m> wäre denkbar, mit Anschluss via <.m bounds="10.095654,53.665424,10.123492,53.685249">Kielbarg</.m>. Dies dürfte im Alsterumfeld aber mindestens genauso problematisch werden. Damit blieben noch weiträumige Alternativen, etwa via der <.m bounds="10.087685,53.656891,10.135324,53.684612">Bergstedter Chaussee</.m> bis <.m bounds="10.087685,53.656891,10.135324,53.684612">Rodenbeker Straße</.m>.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
