defmodule Data.Article.Blog.ULangenhornMarkt do
  use Article.Default

  def name(), do: "#{created_at()}-4-14-u-langenhorn-markt"
  def created_at(), do: ~D[2018-08-29]
  def updated_at(), do: ~D[2020-02-25]
  def title(), do: "Kreuzung am U-Bahnhof Langenhorner Markt (Veloroute 4 und 14)"

  def start(), do: ~d[2020-09]
  def stop(), do: ~d[2021Q4]

  def type(), do: :finished

  def tags(), do: ["4", "14"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die Kreuzung im aktuellen Zustand ist für den Rad- und Fußverkehr eine Zumutung. Die Wege sind in einem schlechten Zustand und viel zu schmal, um diese sicher befahren zu können. Zudem werden sie auch durch die stark frequentierten Bushaltestellen geführt, wo sich Zufußgehende und Radfahrende zwangsläufig in den Weg kommen. Zudem ist die Führung für Radfahrten Richtung Süden indirekt und die Ampeln nicht aufeinander abgestimmt. Kurzum: die Kreuzung ist vor allem für den Autoverkehr da.</p>
    <p>In der nun vorliegenden, abgeschlossenen Planung werden immerhin einige der Problemstellen verbessert.</p>

    <p>Entlang der <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.649483, lon: 10.017327, zoom: 18})} ref="14">Veloroute 14 Richtung Osten</.m>  werden Fuß- und Radweg getauscht, sodass man nun hinter der Bushaltestelle vorbeifahren kann. Es ist ein ähnlicher Aufbau wie an der <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.555666, lon: 10.041479, zoom: 18})} ref="8">Burgstraße</.m> vorgesehen, damit der Radweg frei bleibt. Der Ein-Richtungs-Radweg soll hier 2m breit werden. Im weiteren Verlauf verschmälert er sich auf 1,6m um an die <.a href="/article/2019-01-09-14-gehlengraben#18/53.649374/10.018047/IFmcVENOflTG6pYFfRWU-g">Planung Gehlengraben</.a> anzuschließen.</p>

    <p>Kommt man <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.650003, lon: 10.017585, zoom: 18})} ref="4">aus Richtung Norden</.m>  wird man künftig auf einem Radfahrstreifen links an der Bushaltestelle und den wartenden Bussen vorbeigeführt. Eine direkte Querung Richtung Süden wurde verworfen um weiterhin den Autoverkehr bevorzugen zu können. Stattdessen muss man einmal Slalom um den Ampelmast fahren um parallel zur Fußfurt die Straßenseite wechseln zu können. Diese Führung ist sehr unkomfortabel und es ist naheliegend, das bei Grün Radfahrende illegal über die Fußfurt abkürzen. Immerhin verspricht die Planung die Ampelschaltung leicht zu verbessern, sodass der Radverkehr „nahezu in einem Zug Richtung Süden fahren“ kann. Im Vergleich zu heute sind die Wege breiter und die Kurvenradien etwas besser, weil die Nord/Süd Querung mehr Richtung Kreuzung gerückt wird. Das verbessert auch die Weiterfahrt in den <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.649233, lon: 10.017831, zoom: 18})} ref="4">Ohlmoorgraben</.m>.</p>
    <p>Die Radwege <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.64981, lon: 10.018815, zoom: 18})} ref="14">ab Neukoppel im Gehlengraben</.m> und <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.649901, lon: 10.017855, zoom: 18})} ref="4">Tangstedter Landstraße Richtung Norden</.m> werden auf 2m verbreitert. Ungefähr ab Höhe des KFZ-Linksabbiegers Richtung Parkhaus geht dieser in einen Radfahrstreifen über. Befremdlich wirkt, das der Radverkehr hier an <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.650608, lon: 10.017923, zoom: 18})} ref="4">der KFZ-Ampel</.m> warten soll, wenn das Parkhaus grün hat. Mit Wegkonflikten zwischen Radfahrenden ist hier kaum zu rechnen, weswegen eine „Rad Dauergrün“ Ampel Sinn ergeben könnte.</p>
    <p>Der Umbau der Kreuzung wurde klar vom Auto aus gedacht und die Nord/Süd Querung bleibt unkomfortabel. Gut ist hingegen das entfädeln von Fuß und Rad an den Bushaltestellen, was künftig dann nur noch an den Warteflächen vor den Ampeln ein Problem werden könnte.</p>
    <p>Geplant ist ab September 2020 für ungefähr ein Jahr zu bauen. Beim ersten Entwurf war noch ein Baubeginn Anfang 2019 angedacht.</p>
    <p>
    <.a href="https://lsbg.hamburg.de/contentblob/13628332/217f8e1ec509c3c0c75ef499ae3b3df9/data/veloroute-14-gehlengraben-kreuzung-tangstedter-landstr-abgestimmte-planung-bericht.pdf">Erläuterungsbericht</.a><br/>
    <.a href="https://lsbg.hamburg.de/contentblob/11228162/1056b9cb4d11859c4f41a8974a01a204/data/veloroute-14-kreuzung-tangstedter-landstrasse-gehlengraben-abstimmungsunterlage-plan.pdf">Lageplan</.a>
    </p>
    """
  end
end
