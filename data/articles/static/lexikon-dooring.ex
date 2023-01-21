defmodule Data.Article.Static.LexikonDooring do
  use Article.Static

  def name(), do: "lexikon/dooring"
  def title(), do: "Lexikon · Dooring"

  def summary(),
    do: "Dooring: Unfallgefahr die von unachtsam geöffneten Autotüren ausgeht"

  def tracks(), do: Data.Article.Static.Alltagsroute13.tracks()
  def point_of_interest(), do: %{lon: 10.045152, lat: 53.566255, zoom: 16}

  def tags(),
    do: [
      "lexikon",
      "dooring",
      "dooring-gefahr",
      "dooring-zone"
    ]

  def text(assigns) do
    ~H"""
    <p>Als Dooring bezeichnet unachtsam geöffnete Autotüren die den Rad- oder Fußverkehr gefährden.</p>

    <h4>Auf dem Fahrrad</h4>
    <p>Zur Eigensicherheit sollte mit dem Fahrrad 1,50m Sicherheitsabstand zu parkenden Fahrzeugen gehalten werden.</p>

    <p>Die geöffneten Autotüren in der Grafik stehen 80cm heraus. Gemessen von Reifen zu Reifen radelt der Dunkelrote bei 75cm und damit in der „Dooring-Zone“. Der Hellgrüne hält 1,5m Abstand und ist damit sicher unterwegs. Man sieht das dennoch ausreichend Platz für Gegenverkehr auf der 4,5m breiten <.ref>Fahrbahn</.ref> (= Asphalt) bleibt.</p>

    <.roaddiagram src="dooring" alt="Eine Straßenansicht von oben (Vogelperspektive) die Sicherheitsabstände zu parkenden Autos mit geöffneter Tür darstellt."/>

    <h4>Im Auto</h4>
    <p>Beim Aussteigen die innenliegende Hand zum Öffnen der Tür verwenden. Dadurch dreht man sich automatisch um und hat einen besseren Blick auf das Straßengeschehen. Ist man z.B. selbst gefahren, sollte man also die rechte Hand zum Öffnen der Tür verwenden. Man nennt dies auch den <.a href="https://de.wikipedia.org/wiki/Dutch_Reach">holländischen Griff</.a>.</p>

    <h4>Im Planungsbüro</h4>
    <p>Die sicherste Lösung ist es neben Radwegen keine Autoparkplätze anzulegen. So wird die Gefahr bereits bei der Planung ausgeschlossen, statt sich auf einen fehlerfreien Alltag zu verlassen.</p>

    <p>Ist dies nicht möglich, muss ausreichend Sicherheitsabstand eingeplant werden. Dieser muss groß genug sein, sodass auch bei schlecht eingeparkten Autos keine Gefahr entsteht. Das ist in Hamburg leider häufig nicht der Fall, wie etwa in der <.v bounds="10.033395,53.564595,10.052846,53.577745" lon={10.038327} lat={53.572288} dir="forward" ref="13">Wagnerstraße</.v>.</p>
    """
  end
end
