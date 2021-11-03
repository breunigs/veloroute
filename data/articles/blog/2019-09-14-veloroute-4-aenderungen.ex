defmodule Data.Article.Blog.Veloroute4Aenderungen do
  use Article.Default

  def name(), do: "#{created_at()}-veloroute-4-aenderungen"
  def created_at(), do: ~D[2019-09-14]

  def title(), do: "Verbesserungen Veloroute 4 von Mitte 2018 bis Mitte 2019"

  def type(), do: nil

  def tags(), do: ["4"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die <.a href="/4">Veloroute 4</.a> war 2018 schon gut befahrbar, hat aber an einigen Stellen noch Potenzial für mehr. Zur Zeit wird etwa die <.a href="/4#17/53.579818/9.998244/4X4FwjwXDwDbBD092szytA">Krugkoppelbrücke</.a> umgebaut und man erkennt schon die künftigen Radfahrstreifen (<.a href="/article/2018-09-01-4-krugkoppel">Details</.a>). Ebenso wird zur Zeit an der <.a href="/4#17/53.593627/9.99478/OjnL-3BRMMHp9Bw31eSJ5g">Hudtwalckerstraße</.a> die Radführung verbessert (<.a href="/article/2019-02-01-4-knoten-hudtwalckerstrasse">Details</.a>), auch wenn man hier auf den Fotos noch nicht so viel erkennt. Bei der Kreuzung <.a href="/4#17/53.617005/10.01556/pY1lbTokMs77hN1BgBSKbQ">Maienweg / Sengelmannstraße</.a> ist die Situation ähnlich (<.a href="/article/2018-12-30-4-kreuzung-maienweg-sengelmannstrasse">Details</.a>).</p>
    <p>An <strong>abgeschlossenen Baumaßnahmen</strong> ist mir nur der <.a href="/4#17/53.578439/9.997195/26VFJzGLx2Vw8ySvOEC2GQ">Kreisel am Harvestehuder Weg</.a> aufgefallen. Der ist mit Rechtsabbieger-Bypass für Fahrräder entlang der Veloroute dafür aber vorzüglich. Auch in der Gegenrichtung rollt es sich besser durch den Kreisel als mit der Ampel zuvor.</p>
    <p>Für 2019 sind noch <.a href="/bau">einige weitere Baustellen vorgesehen</.a>, die die Strecke weiter verbessern sollen. Leider haben sich einige Maßnahmen auch verschoben, wie etwa an der <.a href="/article/2018-08-29-4-14-u-langenhorn-markt">Kreuzung am Langenhorner Markt</.a>. Wenn ich etwas vergessen habe, <.mailto>schreib mir</.mailto> bitte.</p>
    """
  end
end
