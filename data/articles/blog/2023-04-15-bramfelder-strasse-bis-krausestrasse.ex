defmodule Data.Article.Blog.BramfelderStrasseBisKrausestrasse do
  use Article.Default

  def title(),
    do:
      "Bramfelder Straße (Barmbeker Markt bis Krausestraße, Freizeitroute 2, Bezirksroute HH-Nord N3)"

  def summary(),
    do:
      "Enge Radfahrstreifen statt enger Hochbordradwege. Queren bleibt unersichtlich und umständlich. Planung von 2017."

  def type(), do: :planned

  def tags(), do: ["FR2", "br-nord-n3"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Bramfelder Straße",
        direction: :forward,
        from: "Barmbeker Markt",
        to: "Bramfelder Chaussee",
        parent_ref: __MODULE__,
        text: "Bramfelder Straße (stadtauswärts)",
        videos: [
          {"2023-04-06-br-wandsbek/GX015467", "00:00:21.655", :end},
          {"2023-04-06-br-wandsbek/GX015468", :start, :end},
          {"2023-04-06-br-wandsbek/GX015469", :start, :end},
          {"2023-04-06-br-wandsbek/GX015470", :start, "00:00:13.947"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Bramfelder Straße",
        direction: :backward,
        from: "Bramfelder Chaussee",
        to: "Barmbeker Markt",
        parent_ref: __MODULE__,
        text: "Bramfelder Straße (stadteinwärts)",
        videos: [
          {"2023-04-06-br-wandsbek/GX015524", "00:00:53.987", :end},
          {"2023-04-06-br-wandsbek/GX015525", :start, :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"1. Entwurf, Bericht", "2017",
       "https://lsbg.hamburg.de/resource/blob/784128/024067401f3824e092d94d0648507419/bramfelder-strasse-barmbeker-markt-bis-krausestrasse-abstimmungsunterlage-bericht-data.pdf"},
      {"1. Entwurf, Lagepläne", "2017",
       "https://lsbg.hamburg.de/resource/blob/784130/af45de84b3de80635cee6ada721052c8/bramfelder-strasse-barmbeker-markt-bis-krausestrasse-abstimmungsunterlage-plan-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Entlang der Bramfelder Straße wird der Radverkehr auf <.ref>Hochbordradwegen</.ref> mit unterschiedlichen Breiten geführt. Sie sind stellenweise als Zweirichtungsradweg (Höhe <.v bounds="10.046257,53.583639,10.051199,53.585953" lon={10.048335} lat={53.585058} dir="backward" ref={@ref}>Steilshooper Straße</.v> und Höhe <.v bounds="10.041951,53.581009,10.047447,53.583765" lon={10.044359} lat={53.582366} dir="backward" ref={@ref}>Maurienstraße</.v>) geführt um die Erreichbarkeit aller Straßen zu ermöglichen.</p>

    <p>Für die <.v bounds="10.04528,53.582986,10.050248,53.584759" lon={10.046814} lat={53.583933} dir="forward" ref="FR2">Fahrtbeziehung entlang der Freizeitroute 2</.v> besteht keine komfortable Verbindung.</p>

    <h4>Planung</h4>
    <p>Wo möglich, sollen 1,85m breite <.ref>Radfahrstreifen</.ref> eingerichtet werden. Da die <.v bounds="10.04601,53.583849,10.054969,53.587361" lon={10.050118} lat={53.585876} dir="backward" ref={@ref}>S-Bahn-Brücke</.v> und <.v bounds="10.045026,53.582479,10.049729,53.584789" lon={10.046865} lat={53.58386} dir="backward" ref={@ref}>Bramfelder Brücke</.v> es nicht anders zulassen, bleiben hier teilweise Hochbordradwege. Sie sollen 1,62m breit werden. Auch alle Zweirichtungsradwege bleiben Hochbordradwege; mit 2,5m Breite.</p>

    <p>Die Fahrtbeziehungen werden nicht geändert, d.h. es gibt keine neuen oder geänderten Querungsmöglichkeiten.</p>

    <h4>Meinung</h4>
    <p>Der in die Jahre gekommene Entwurf von 2017 verschlechtert die Situation für den Radverkehr. Schmale, ungeschützte Radfahrstreifen neben bis zu sieben KFZ-Spuren sind wahnwitzig. Zudem bleiben die völlig unersichtlichen und umständlichen Querungsmöglichkeiten, die nur mit bester Ortskenntnis zu meistern sind. Die Einmündungen erlauben hohes KFZ-Abbiegetempo und geben keinen Reaktionsspielraum – Unfälle sind vorprogrammiert.</p>

    <p>Kurzum, die Planung muss neu gemacht werden. Da es nur der 1. Entwurf ist, und sich die Radverkehr-Standards seit 2017 stark verbessert haben, stehen die Chancen dafür gut.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
