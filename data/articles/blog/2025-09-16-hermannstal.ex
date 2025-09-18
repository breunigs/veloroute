defmodule Data.Article.Blog.Hermannstal do
  use Article.Default

  def title(), do: "Hermannstal – westlich der Manshardstraße (Radroute 1)"

  def summary(),
    do:
      "Nordseite gut (1,85 bis 2,5m breit), aber Pflaster stört. Südseite mit 1,6m engem Radweg zwischen den KFZ unnötig riskant. Besser als heute, aber noch Luft nach oben."

  def type(), do: :planned
  def tags(), do: ["radroute-1"]

  def start(), do: ~d[2026]
  def stop(), do: ~d[2027]

  def links(_assigns) do
    [
      {"erster Entwurf – Bericht und Karten", ~d[2025-09],
       "https://sitzungsdienst-hamburg-mitte.hamburg.de/bi/vo020.asp?VOLFDNR=1019290"}
    ]
  end

  def map_image do
    {name(),
     [
       {"Sweco GmbH", "https://www.sweco-gmbh.de/kontakt/kontakt-verkehr-und-infrastruktur/"},
       {"Bezirksamt Hamburg-Nord, Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/hamburg-nord/wirtschaft-bauen-umwelt-70292"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Auf beiden Seiten sind stellenweise enge <.ref>Hochbordradwege</.ref> vorhanden. Sie enden ohne Vorwarnung. Ein Wechsel auf die <.ref>Fahrbahn</.ref> ist an diesen Stellen nicht sicher möglich.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>In <.v bounds="10.084578,53.553401,10.090665,53.555302" lon={10.089105} lat={53.554501} dir="backward" ref="radroute-1">Richtung Innenstadt</.v> soll ein asphaltierter <.ref>Kopenhagener Radweg</.ref> mit rund 1,85m Breite entstehen. Auf <.v bounds="10.084578,53.553401,10.090665,53.555302" lon={10.088199} lat={53.554809} dir="backward" ref="radroute-1">Höhe des Parkhauses</.v> weitet sich der Radweg auf 2,0m auf und wird zu einem gepflasterten Hochbordradweg. Auf dieser Seite entfällt die Ampel für den Radverkehr. An der <.v bounds="10.081802,53.55411,10.085936,53.555883" lon={10.084548} lat={53.55493} dir="backward" ref="radroute-1" highlight="Rennbahnstraße">Kreuzung mit der Rennbahnstraße</.v> wird die Querungsfurt geradliniger.</p>

    <p>In <.v bounds="10.084004,53.554221,10.087181,53.555481" lon={10.084997} lat={53.55467} dir="forward" ref="radroute-1">Richtung Billstedt</.v> wird der vorhandene <.ref>Radfahrstreifen</.ref> an der Bushaltestelle weitergeführt. Er soll 1,60m breit werden und zwischen KFZ-Fahrbahn und KFZ-Parkplätzen liegen. Nach der <.v bounds="10.08682,53.553527,10.090865,53.55536" lon={10.087824} lat={53.5548} dir="forward" ref="radroute-1">Zufahrt zum Parkhaus</.v> wird auf einen 2,0m breiten Hochbordradweg geleitet.</p>

    <h4>Meinung</h4>
    <p>Da geht noch mehr.</p>

    <p>Die Nordseite ist schon ganz gut. Allerdings sollte sie durchgängig asphaltiert werden, statt zwischendrin auf minderwertiges Pflaster zu wechseln.</p>

    <p>Die Südseite ist problematisch: an der Bushaltestelle wird man zwischen KFZ links und Bussen rechts eingepfercht. Diese stressige Situation wird bis zur Einfahrt des Parkhauses verlängert. Zusätzlich bedeutet eine leichte Verschwenkung die Gefahr, von lenkfaulen Autofahrern bedrängt zu werden.</p>

    <p>Das Parkhaus ist an einem typischen Werktag gerade mal zur Hälfte gefüllt. Echter Bedarf an den geplanten Parkplätzen besteht also offensichtlich nicht. Die Grünfläche zu vergrößern und einen kinderfreundlichen Radweg anzulegen ist daher problemlos möglich.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
