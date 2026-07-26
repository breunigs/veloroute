defmodule Data.Article.Blog.GeffckenUndHeilwigstrasse do
  use Article.Default

  def title(), do: "Geffcken- und Heilwigstraße (Bezirksroute Nord N2)"

  def summary(),
    do:
      "Heilwigstraße soll Tempo-30-Zone werden; Radwegreste werden entfernt. Geffckenstraße erhält neue Querungsmöglichkeiten, Verkehrsführung bleibt aber sonst so wie heute."

  def type(), do: :planned

  def tags(), do: ["br-nord-n2", "br-eimsbuettel-niendorf"]

  def point_of_interest(), do: %{lon: 9.994029, lat: 53.584677, zoom: 16}

  def map_image do
    {name(),
     [
       {"Bezirksamt Nord, Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/hamburg-nord/fachamt-management-des-oeffentlichen-raums-70286"},
       {"Sweco GmbH", "https://www.sweco-gmbh.de/kontakt/kontakt-verkehr-und-infrastruktur/"}
     ]}
  end

  def links(_assigns) do
    [
      {"1. Entwurf: Lagepläne und Erläuterung", ~d[2026-07],
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1016847"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Auf der <.v bounds="9.99145,53.582275,9.998182,53.587016" lon={9.993943} lat={53.584494} dir="forward" ref={BrEimsbuettelRotherbaum}>Heilwigbrücke</.v> beginnt bzw. endet der <.ref>Hochbordradweg</.ref> im Kurvenbereich zur <.v bounds="9.990543,53.583979,9.996362,53.58927" lon={9.99336} lat={53.585969} dir="forward" ref={BrNordN2}>Geffckenstraße</.v>. Ab dort fährt man im <.ref>Mischverkehr</.ref> bei Tempo 50. Weil <.v bounds="9.992854,53.584116,9.995125,53.58589" lon={9.993939} lat={53.585016} dir="forward" ref={BrNordN2}>kurz nach der Einmündung der Heilwigstraße</.v> KFZ parken, muss man sich aus der Kurve heraus direkt einordnen, was etwas Erfahrung benötigt.</p>

    <p>In der <.v bounds="9.990599,53.585294,9.99882,53.592583" lon={9.994813} lat={53.586072} dir="forward" ref={BrEimsbuettelRotherbaum}>Heilwigstraße</.v> fährt man ebenfalls im Mischverkehr. Stellenweise sind dort noch alte Radwegreste vorhanden, die man wegen fehlender Aufleitung nicht praktisch erreichen kann.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Beide Straßen sollen vor allem für den Fußverkehr verbessert werden. Dazu werden mehr Querungsstellen geschaffen und Parkbänke aufgestellt.</p>

    <p>Die alten Radwegreste werden den Gehwegen zugeschlagen. In der <.v bounds="9.990599,53.585294,9.99882,53.592583" lon={9.994813} lat={53.586072} dir="forward" ref={BrEimsbuettelRotherbaum}>Heilwigstraße</.v> wird Tempo 30 angeordnet. Auch werden einige Radanlehnbügel aufgestellt.</p>

    <p>Die Heilwigstraße wird als Gehwegüberfahrt angeschlossen. Von der Brücke kommend wird der Radweg etwas verlängert, sodass man sich auch erst nach der Kurve in den Mischverkehr einordnen muss.</p>

    <h4>Meinung</h4>
    <p>Die Heilwigstraße wird durch den Umbau zur Tempo-30 Zone den KFZ-Schleichverkehr besser heraushalten. Weil der Störfaktor Auto wegfällt, könnte die Straße eine attraktive Strecke für den Rad- und Fußverkehr werden. Ggf. muss die Stadt nachsteuern, sollte es weiterhin Schleichverkehr geben.</p>

    <p>Damit die Feuerwehr noch gut durchkommt, wird die Geffckenstraße keine Tempo-30-Zone mit Einengungen. Das ist nachvollziehbar. Trotz üppigem Platz richtet man aber keine <.ref>Radfahrstreifen</.ref> ein, sondern schafft lieber KFZ-Parkplätze. Das ist eine Frechheit, da die privaten KFZ auch alle auf den Privatgrundstücken vor den Häusern parken könnten.</p>

    <p>Außerdem zeigen die Niederlande klar, dass der Radverkehr schneller Platz macht als der behäbige Autoverkehr. Aus reiner Autoliebe bremst man die Feuerwehr aus und schafft eine unattraktive Radverbindung. So entsteht keine brauchbare Bezirksroute.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
