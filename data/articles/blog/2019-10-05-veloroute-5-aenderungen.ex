defmodule Data.Article.Blog.Veloroute5Aenderungen do
  use Article.Default

  def created_at(), do: ~D[2019-10-05]

  def title(), do: "Verbesserungen Veloroute 5 von Mitte 2018 bis Mitte 2019"

  def type(), do: nil

  def tags(), do: ["5", "5N"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Auf der <.a href="/5">Veloroute 5</.a> (bzw. dem Abzweig 5N Richtung Flughafen) gab es zwei Änderungen, die die Qualität der Route merklich heben.</p> <p>Zuerst wurde die Führung stadtauswärts <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.558909, lon: 10.007895, zoom: 16})} ref="5">An der Alster</.m> geändert, sodass man nun auf der ampelfreien Nebenstraße fährt. Im Vergleich zum alten Radweg, der mittlerweile abgerissen wurde, ist diese Zwischenlösung eine deutliche Verbesserung – entfallen doch zwei in der Regel lange Rotphasen und sinnvoll Überholen ist jetzt auch drin. Idealerweise sollte die Straße noch als Fahrradstraße ausgewiesen werden, um ihre neue Rolle zu verdeutlichen.</p> <p>Die zweite große Neuerung ist die Fertigstellung des <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.60386, lon: 10.02964, zoom: 15})} ref="5">Radwegs am Pergolenviertel</.m> – vier Meter breit, asphaltiert, kaum Kreuzungen und fernab der lauten Autos. Zurecht hat dieses Teilstück im „Radschnellwegstandard“ viel Medienaufmerksamkeit erfahren. Einziger Wermutstropfen: nach rund 1,5km ist geht der Schnellweg in den Bestand über.</p> <p>Bei den kleineren Sachen ist mir der neue Asphalt im <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.668479, lon: 10.102697, zoom: 17})} ref="5">Mellingburgredder</.m> aufgefallen – der aber auch vorher schon gut befahrbar war. Wenn ich etwas übersehen habe, <.mailto>schreib mir</.mailto> bitte. Die Bilder sind ca. Juli 2019 entstanden.</p>
    """
  end
end
