defmodule Data.Article.Blog.BramfelderStrasseAbKrausestrasse do
  use Article.Default

  def title(), do: "Bramfelder Straße (Krausestraße bis Fabriciusstraße, Bezirksroute W3)"

  def summary(),
    do:
      "2,0m breite Radfahrstreifen mit Engstellen und ohne Barriere zum KFZ-Verkehr. Planung von 2017."

  def type(), do: :planned

  def tags(), do: ["br-wandsbek-w3"]

  def tracks(), do: Data.Article.Blog.BramfelderStrasseBisKrausestrasse.tracks()

  def links(_assigns) do
    [
      {"1. Entwurf, Bericht", "2017",
       "https://lsbg.hamburg.de/resource/blob/784124/a328b22c60b2c62c3871a298ec9ed491/bramfelder-strasse-krausestrasse-bis-fabriciusstrasse-abstimmungsunterlage-bericht-data.pdf"},
      {"1. Entwurf, Lagepläne", "2017",
       "https://lsbg.hamburg.de/resource/blob/784126/993e49cd9f7402ed8d37b464d337b818/bramfelder-strasse-krausestrasse-bis-fabriciusstrasse-abstimmungsunterlage-plaene-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radverkehr wird meist auf schmalen <.ref>Hochbordradwegen</.ref> geführt. Die bereits erneuerte Kreuzung mit der <.v bounds="10.052074,53.589516,10.06069,53.593021" lon={10.055692} lat={53.591163} dir="forward" ref={@ref}>Habichtstraße</.v> setzt auf <.ref>Radfahrstreifen in Mittellage</.ref>. Auf einem <.v bounds="10.049359,53.587263,10.057445,53.592011" lon={10.05313} lat={53.588659} dir="forward" ref={@ref}>Teilstück</.v> fährt man auf einer Nebenfahrbahn.</p>

    <h4>Planung</h4>
    <p>Man setzt auf 2,0m breite <.ref>Radfahrstreifen</.ref>. An Engstellen reduziert sich das auf 1,6m. Vor der <.v bounds="10.055112,53.59166,10.059731,53.593791" lon={10.058093} lat={53.59312} dir="backward" ref={@ref}>Emil-Krause-Schule</.v> bleiben die Hochbordradwege zwecks Baumerhalt.</p>

    <p>KFZ-Parkplätze und Bushaltestellen befinden sich immer rechts der Radfahrstreifen, d.h. der Radweg wird regelmäßig überfahren/gequert.</p>

    <p>In der <.v bounds="10.05736,53.593117,10.062079,53.595253" lon={10.05894} lat={53.594583} dir="backward" ref="br-wandsbek-w3">Fabriciusstraße</.v> wird der Radverkehr in Richtung Bramfelder Straße in den <.ref>Mischverkehr</.ref> überführt. Zum Linksabbiegen wird ein langgezogener Radfahrstreifen in Mittellage aufgemalt. Anderswo ist <.ref>indirektes Linksabbiegen</.ref> vorgesehen.</p>

    <p>Damit KFZ-Parkplätze erhalten werden können, werden mehr Bäume gefällt als neu gepflanzt.</p>

    <h4>Meinung</h4>
    <p>Die Planung hat die richtige Tendenz. Mit 2,0m breiten Radfahrstreifen war sie 2017 ihrer Zeit voraus. Hauptproblem bleiben die Engstellen und fehlende Barriere zum KFZ-Verkehr. Es ist denkbar, dass diese durch <.ref>Kopenhagener Radwege</.ref> oder eine <.ref>Protected-Bike-Lane</.ref> geschaffen werden könnte. Dazu müssten aber die KFZ-Parkplätze von der Seite in die Straßenmitte wandern, was in Hamburg unüblich ist.</p>

    <p>Auch andere Kleinigkeiten wie die Verringerung der Bäume und Mischverkehr/Radfahrstreifen in Mittellage in der Fabriciusstraße scheinen mit einer Optimierung der Planung lösbar.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
