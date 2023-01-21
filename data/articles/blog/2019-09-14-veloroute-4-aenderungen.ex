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
    <p>Die <.a name="alltagsroute-4">Veloroute 4</.a> war 2018 schon gut befahrbar, hat aber an einigen Stellen noch Potenzial für mehr. Zur Zeit wird etwa die <.m bounds="9.995503,53.578186,10.000985,53.58145">Krugkoppelbrücke</.m> umgebaut und man erkennt schon die künftigen Radfahrstreifen (<.a name="2018-09-01-4-krugkoppel">Details</.a>). Ebenso wird zur Zeit an der <.m bounds="9.992039,53.591995,9.997521,53.595259">Hudtwalckerstraße</.m> die Radführung verbessert (<.a name="2019-02-01-4-knoten-hudtwalckerstrasse">Details</.a>), auch wenn man hier auf den Fotos noch nicht so viel erkennt. Bei der Kreuzung <.m bounds="10.012819,53.615373,10.018301,53.618637">Maienweg / Sengelmannstraße</.m> ist die Situation ähnlich (<.a name="2018-12-30-4-kreuzung-maienweg-sengelmannstrasse">Details</.a>).</p>
    <p>An <strong>abgeschlossenen Baumaßnahmen</strong> ist mir nur der <.m bounds="9.994454,53.576807,9.999936,53.580071">Kreisel am Harvestehuder Weg</.m> aufgefallen. Der ist mit Rechtsabbieger-Bypass für Fahrräder entlang der Veloroute dafür aber vorzüglich. Auch in der Gegenrichtung rollt es sich besser durch den Kreisel als mit der Ampel zuvor.</p>
    <p>Für 2019 sind noch <.a name="bau">einige weitere Baustellen vorgesehen</.a>, die die Strecke weiter verbessern sollen. Leider haben sich einige Maßnahmen auch verschoben, wie etwa an der <.a name="2018-08-29-4-14-u-langenhorn-markt">Kreuzung am Langenhorner Markt</.a>. Wenn ich etwas vergessen habe, <.mailto>schreib mir</.mailto> bitte.</p>
    """
  end
end
