defmodule Data.Article.Blog.Veloroute4Aenderungen do
  use Article.Default

  def created_at(), do: ~D[2019-09-14]

  def title(), do: "Verbesserungen Veloroute 4 von Mitte 2018 bis Mitte 2019"

  def type(), do: nil

  def tags(), do: ["4"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die <.a href="/4">Veloroute 4</.a> war 2018 schon gut befahrbar, hat aber an einigen Stellen noch Potenzial für mehr. Zur Zeit wird etwa die <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.579818, lon: 9.998244, zoom: 17})} ref="4">Krugkoppelbrücke</.m> umgebaut und man erkennt schon die künftigen Radfahrstreifen (<.a href="/article/2018-09-01-4-krugkoppel">Details</.a>). Ebenso wird zur Zeit an der <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.593627, lon: 9.99478, zoom: 17})} ref="4">Hudtwalckerstraße</.m> die Radführung verbessert (<.a href="/article/2019-02-01-4-knoten-hudtwalckerstrasse">Details</.a>), auch wenn man hier auf den Fotos noch nicht so viel erkennt. Bei der Kreuzung <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.617005, lon: 10.01556, zoom: 17})} ref="4">Maienweg / Sengelmannstraße</.m> ist die Situation ähnlich (<.a href="/article/2018-12-30-4-kreuzung-maienweg-sengelmannstrasse">Details</.a>).</p>
    <p>An <strong>abgeschlossenen Baumaßnahmen</strong> ist mir nur der <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.578439, lon: 9.997195, zoom: 17})} ref="4">Kreisel am Harvestehuder Weg</.m> aufgefallen. Der ist mit Rechtsabbieger-Bypass für Fahrräder entlang der Veloroute dafür aber vorzüglich. Auch in der Gegenrichtung rollt es sich besser durch den Kreisel als mit der Ampel zuvor.</p>
    <p>Für 2019 sind noch <.a href="/bau">einige weitere Baustellen vorgesehen</.a>, die die Strecke weiter verbessern sollen. Leider haben sich einige Maßnahmen auch verschoben, wie etwa an der <.a href="/article/2018-08-29-4-14-u-langenhorn-markt">Kreuzung am Langenhorner Markt</.a>. Wenn ich etwas vergessen habe, <.mailto>schreib mir</.mailto> bitte.</p>
    """
  end
end
