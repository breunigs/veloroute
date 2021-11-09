defmodule Data.Article.Blog.LeeschenblickUndFabriciusstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-5-leeschenblick-und-fabriciusstrasse"
  def created_at(), do: ~D[2018-10-25]
  def updated_at(), do: ~D[2020-02-01]
  def title(), do: "Leeschenblick und Fabriciusstraße (Veloroute 5)"

  def start(), do: ~d[2020-04-06]
  def stop(), do: ~d[2021-06-30]

  def type(), do: :finished
  def construction_site_id_hh(), do: [6745]
  def tags(), do: ["5"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>
    <strong>Änderungen Februar 2020:</strong> Der <.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1011620">ADFC hatte sich beschwert</.a>, das im <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.615191, lon: 10.069934, zoom: 17.5})} ref="5">Leeschenblick</.m> eine unsichere Lösung für den Radverkehr gewählt wurde. Hintergrund für diese Lösung war, das sich die Stadt nicht in der Lage sah illegales Parken zu unterbinden. Stattdessen wird nun dem Vorschlag des ADFC gefolgt und rund 2,5m breite Radwege eingerichtet, die durch eine Doppellinie (und ggf. Poller, sollten weiterhin Falschparker auftreten) vom KFZ-Verkehr abgetrennt sind. Die Autospuren fallen deutlich schmaler aus als bisher. </p> <p><strong>Hinweis:</strong> Die Veloroute wird künftig durch die neue Straße <.m bounds="10.071774,53.614525,10.074022,53.615055">Am Dorfgraben</.m> geführt. Der Kreisel soll wie geplant umgesetzt werden, ebenso werden sich für den <.m bounds="10.068275,53.613476,10.072035,53.615433">Leeschenblick</.m> keine Planänderungen ergeben. Ob die Verbesserungen in der <.m bounds="10.059066,53.594004,10.080125,53.619639">Fabriciusstraße</.m> noch umgesetzt werden ist mir derzeit nicht bekannt. Für Details siehe bitte <.a href="/article/2018-10-25-5-am-dorfgraben">Neue Führung durch „Am Dorfgraben“</.a>.
    </p>
    <p>Im momentanen Ausbauzustand sind <.m bounds="10.059066,53.594004,10.080125,53.619639">Fabriciusstraße</.m> und <.m bounds="10.068275,53.613476,10.072035,53.615433">Leeschenblick</.m> ein gemischtes Erlebnis. Teilweise sind Radwege oder Radfahrstreifen vorhanden, aber diese liegen ungünstig oder sind nicht durchgehend und enden stellenweise ohne ordentliche Aufleitung auf die Straße. Die vergleichsweise geringe Verkehrsdichte erlaubt trotz dieser Schwachstellen eine angenehme Fahrt.
    </p>
    <p>In der vorliegenden Planung werden die Radfahrstreifen im <.m bounds="10.068275,53.613476,10.072035,53.615433">Leeschenblick</.m> durch Schutzstreifen ersetzt. Auch werden die aktuell illegalen Parkplätze in legale Stellplätze umgewandelt, an denen der Schutzstreifen links vorbeiführt. Das sollte das „Tunnelgefühl“ beheben, das man hier durch regelmäßig abgestelle LKW stadteinwärts hat.</p> <p>An der künftigen Kreuzung mit der <.m bounds="10.059066,53.594004,10.080125,53.619639">Fabriciusstraße</.m> und der neuen Straße <.m bounds="10.071774,53.614525,10.074022,53.615055">Am Dorfgraben</.m> wird ein Kreisverkehr gebaut der die bisherige Ampel an der Einmündung ersetzt.</p> <p>Bis zum <.m bounds="10.074015,53.616847,10.077479,53.618658">Bräsigweg</.m> bleibt es stadteinwärts beim Fahrradweg, der immerhin erneuert und teilweise verbreitert wird. Leider erreicht er nicht durchgängig die Mindestbreite und wird um die <.m bounds="10.070463,53.61657,10.072421,53.616599">Bramfelder Redder</.m> nur mit 1,75m ausgeführt. Vor dem Kreisel und der Bushaltestelle wird der Radverkehr gerade auf die Straße geleitet. In der Gegenrichtung gibt es einen 1,5m schmalen Schutzstreifen, außer einem kurzen Stück das für den Lieferverkehr anliegender Geschäfte vorgesehen wird.</p> <p>Ab dem <.m bounds="10.074015,53.616847,10.077479,53.618658">Bräsigweg</.m> wird der vorhandene Radweg stadteinwärts komplett zurückgebaut und stattdessen der Radverkehr ausschließlich im Mischverkehr geführt. Die zur Verkehrsberuhigung aufgestellten Kübel werden durch bauliche „Nasen“ ersetzt.</p> <p>Wegweisenden Charakter kann man der Planung nicht ausstellen. Der gepflasterte Radweg in der <.m bounds="10.059066,53.594004,10.080125,53.619639">Fabriciusstraße</.m> ist heute schon schlechter zu befahren als die deutlich älter wirkenden, aber asphalierten Radfahrstreifen im <.m bounds="10.068275,53.613476,10.072035,53.615433">Leeschenblick</.m>. In ein paar Jahren dürfte der neue Radweg ein ähnliches Schicksal erfahren. Der 1,5m breite Schutzstreifen stadtauswärts dürfte zwar seinen Zweck erfüllen, aber sicher keine Glücksgefühle auslösen und ggf. KFZ zu Überholmanövern ohne Spurwechseln animieren. Die wesentliche Verbesserung dürfte die Neuordnung der KFZ-Parkplätze sein, um die der Radverkehr jetzt halbwegs sicher geführt wird. Das diese Hilfestellung, wie sicher und legal geparkt werden kann, ausschließlich aus den Radverkehrsmitteln finanziert wird zeigt das es noch ein weiter Weg ist zum fahrradfreundlichen Hamburg.</p> <ul><li><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1008587">Erläuterungsbericht zur Umgestaltung mit Lageplänen</.a></li>
    <li><.a href="https://www.hamburg.de/wandsbek/strassenbaustellen/14292160/">Anliegerinfo zur Baustelle Fabriciusstraße</.a></li>
    </ul>
    """
  end
end
