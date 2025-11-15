defmodule Data.Article.Static.LexikonFahrradFrei do
  use Article.Static

  def name(), do: "lexikon/fahrrad-frei"
  def title(), do: "Lexikon · „Fahrrad frei“ auf Fußwegen"

  def summary(),
    do: "„Fahrrad frei“ auf Fußwegen erlaubt dort das Fahren mit Schrittgeschwindigkeit"

  def tags(),
    do: [
      "lexikon",
      "fahrrad frei"
    ]

  def tracks(), do: Data.Article.Static.Radroute18.tracks()
  def point_of_interest(), do: %{lon: 9.897746, lat: 53.605287, zoom: 16}

  def text(assigns) do
    ~H"""
    <.roaddiagram src="fahrrad_frei" width={100} alt="Verkehrsschild 239 (Fußweg) mit Zusatzzeichen 1022-10 (Fahrrad frei)" class="right"/>

    <p>Radfahren ist auf Fußwegen tabu – das gebietet alleine der Anstand. Leider gibt es immer noch zuhauf Stellen wo Hamburg den <.v bounds="9.895516,53.603142,9.900616,53.60667" lon={9.897746} lat={53.605287} dir="forward" ref="radroute-18">Radverkehr auf Fußwege leitet</.v> und diese mit „Fahrrad frei“ beschildert. Gefahren werden darf hier maximal in Schrittgeschwindigkeit und Klingeln darf man auch nicht.</p>
    <p>Es ist ersichtlich das dies eine inakzeptable Radverkehrsführung ist. Leider wird sie auch heute noch geplant, wenn man zur Bevorteilung des KFZ-Verkehrs keine ordentliche Lösung bauen möchte. „Geübte“ sollen dann auf der Fahrbahn mit den KFZ fahren, „Unsichere“ auf dem Fußweg. In der Fachsprache bezeichnet man diese Variante euphemistisch auch als „Service-Lösung“.</p>
    """
  end
end
