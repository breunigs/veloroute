defmodule Data.Article.Static.LexikonFahrradFrei do
  use Article.Static

  def name(), do: "lexikon/fahrrad-frei"
  def title(), do: "Lexikon · „Fahrrad frei“ auf Fußwegen"

  def summary(),
    do: "„Fahrrad frei“ auf Fußwegen erlaubt dort das Fahren mit Schrittgeschwindigkeit"

  def tags(),
    do: [
      "lexikon",
      "fahrrad-frei"
    ]

  def tracks(), do: Data.Article.Static.Alltagsroute3.tracks()
  def point_of_interest(), do: %{lon: 9.986512, lat: 53.566867, zoom: 16}

  def text(assigns) do
    ~H"""
    <.roaddiagram src="fahrrad_frei" width="100" alt="Verkehrsschild 239 (Fußweg) mit Zusatzzeichen 1022-10 (Fahrrad frei)" style="float: right; padding: 0 0 1rem 1rem"/>

    <p>Radfahren ist auf Fußwegen tabu – das gebietet alleine der Anstand. Leider gibt es immer noch zuhauf Stellen wo Hamburg den <.m bounds="9.948485,53.544136,9.960335,53.546882" lon="9.95375" lat="53.54560" dir="backward" ref="12">Radverkehr auf Fußwege leitet</.m> und diese mit „Fahrrad frei“ beschildert. Gefahren werden darf hier maximal in Schrittgeschwindigkeit und Klingeln darf man auch nicht.</p>
    <p>Es ist ersichtlich das dies eine inakzeptable Radverkehrsführung ist. Leider wird sie auch heute noch geplant, wenn man zur Bevorteilung des KFZ-Verkehrs keine ordentliche Lösung bauen möchte. „Geübte“ sollen dann auf der Fahrbahn mit den KFZ fahren, „Unsichere“ auf dem Fußweg. In der Fachsprache bezeichnet man diese Variante euphemistisch auch als „Service-Lösung“.</p>
    """
  end
end
