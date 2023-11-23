defmodule Data.Article.Blog.BernerHeerwegNeusurenlandBisBernerAllee do
  use Article.Default

  def title(), do: "Berner Heerweg (Neusurenland bis Berner Allee, Bezirksroute Wandsbek W1)"

  def summary(),
    do:
      "Neue Hochbordradwege links der Baumreihen sollen 2,5m breit werden; an Engstellen nur 2m. An Bushalten werden die Radwege durchgängig und verlaufen rechts des Einstiegsbereichs."

  def start(), do: ~d[2025]
  def stop(), do: ~d[2026]

  def type(), do: :planned

  def tags(), do: ["br-wandsbek-w1", "FR2"]

  def links(_assigns) do
    [
      {"Erläuterung und Pläne 1. Entwurf", "November 2023",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1019857"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es sind meist <.ref>Hochbordradwege</.ref> unterschiedlicher Breiten und Qualität vorhanden. An <.v bounds="10.137045,53.625688,10.142218,53.629525" lon={10.139463} lat={53.627424} dir="forward" ref="br-wandsbek-w1">Bushaltestellen</.v> oder <.v bounds="10.1315,53.623341,10.141654,53.6287" lon={10.137801} lat={53.626252} dir="backward" ref="br-wandsbek-w1">Bäumen</.v> hört der Radweg oft einfach auf. Am <.v bounds="10.13568,53.624716,10.143253,53.629587" lon={10.138478} lat={53.626502} dir="forward" ref="br-wandsbek-w1">U-Bahnhof Berne</.v> gibt es ein Stück <.ref>Radfahrstreifen</.ref>.</p>

    <p>Entlang der <.v bounds="10.137256,53.626235,10.142761,53.630225" lon={10.139723} lat={53.628117} dir="forward" ref="FR2">Freizeitroute 2 nach Norden</.v> gibt es eine Schiebestrecke, da Queren nicht möglich ist.</p>

    <h4>Planung</h4>
    <p>Die Hochbordradwege verlaufen künftig links der Baumreihen. Sie werden meist 2,5m breit. An Engstellen stehen rund 2,0m zur Verfügung. Der Platz wird durch die Verringerung auf zwei KFZ-Spuren gewonnen. Dadurch können auch die Fußwege und Grünflächen verbreitert werden. Diese bekommen 35 neue Bäume; 4 Alte werden gefällt.</p>

    <p>An den Einmündungen <.v bounds="10.133835,53.624594,10.141062,53.627993" lon={10.136265} lat={53.625653} dir="forward" ref="br-wandsbek-w1">Berner Koppel</.v> und <.v bounds="10.133835,53.624594,10.141062,53.627993" lon={10.136579} lat={53.625888} dir="backward" ref="br-wandsbek-w1" highlight="Zum Gutspark">Zum Gutspark (Süd)</.v> sowie allen privaten Einfahrten wird der Radweg durchgängig. Anderswo wird der Radweg auf Fahrbahnniveau abgesenkt.</p>

    <p>Linksabbiegen aus dem Berner Heerweg und den größeren Seitenstraßen erfolgt mittels Ampel. Aus kleineren Nebenstraßen muss ohne Hilfestellungen <.ref>direkt</.ref> abgebogen werden.</p>

    <p>An den Ampeln <.v bounds="10.122019,53.616845,10.130542,53.620731" lon={10.124728} lat={53.618144} dir="forward" ref="br-wandsbek-w1">Busbrookhöhe</.v> und <.v bounds="10.130891,53.622678,10.134663,53.625722" lon={10.132639} lat={53.623946} dir="forward" ref="br-wandsbek-w1">Bekassinenau</.v> soll abbiegender KFZ-Verkehr getrennt vom Radverkehr geschaltet werden. Dies beugt Abbiegeunfällen vor.</p>

    <p>An Bushaltestellen verlaufen die Radwege künftig immer rechts der Einstiegsbereiche.</p>

    <h4>Meinung</h4>
    <p>Die Führung und Breite der Radwege ist gut. Das Radverkehr und abbiegende KFZ eigene Ampelphasen bekommen verdient ebenfalls Lob – normalerweise wird diese Unfallgefahr in Hamburg ignoriert.</p>

    <p>Kritikwürdig ist dagegen, dass man auf den Radwegen wieder Pflastersteine verbaut, die nach wenigen Jahren uneben sind. Auch wurde die Freizeitroute 2 vergessen und die Schiebestrecke bleibt.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
