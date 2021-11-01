defmodule Data.Article.Blog.ULangenhornMarkt do
  use Article.Default

  def name(), do: "#{created_at()}-4-14-u-langenhorn-markt"
  def created_at(), do: ~D[2018-08-29]
  def updated(), do: ~D[2020-02-25]
  def title(), do: "Kreuzung am U-Bahnhof Langenhorner Markt (Veloroute 4 und 14)"

  def start(), do: ~d[2020-09]
  def stop(), do: ~d[2021Q4]

  def type(), do: :construction

  def tags(), do: ["4", "14"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die Kreuzung im aktuellen Zustand ist für den Rad- und Fußverkehr eine Zumutung. Die Wege sind in einem schlechten Zustand und viel zu schmal, um diese sicher befahren zu können. Zudem werden sie auch durch die stark frequentierten Bushaltestellen geführt, wo sich Zufußgehende und Radfahrende zwangsläufig in den Weg kommen. Zudem ist die Führung für Radfahrten Richtung Süden indirekt und die Ampeln nicht aufeinander abgestimmt. Kurzum: die Kreuzung ist vor allem für den Autoverkehr da.</p>
    <p>In der nun vorliegenden, abgeschlossenen Planung werden immerhin einige der Problemstellen verbessert.</p>

    <p>Entlang der <.a href="/14#18/53.649483/10.017327/Av3gVhW6qN1YFjKfiPniMg">Veloroute 14 Richtung Osten</.a>  werden Fuß- und Radweg getauscht, sodass man nun hinter der Bushaltestelle vorbeifahren kann. Es ist ein ähnlicher Aufbau wie an der <.a href="/8#18/53.555666/10.041479/6YtPXXgcqo3bFVkxz45XRA">Burgstraße</.a> vorgesehen, damit der Radweg frei bleibt. Der Ein-Richtungs-Radweg soll hier 2m breit werden. Im weiteren Verlauf verschmälert er sich auf 1,6m um an die <.a href="/article/2019-01-09-14-gehlengraben#18/53.649374/10.018047/IFmcVENOflTG6pYFfRWU-g">Planung Gehlengraben</.a> anzuschließen.</p>

    <p>Kommt man <.a href="/4#18/53.650003/10.017585/arneyR0HYBDdEcD5xxONhA">aus Richtung Norden</.a>  wird man künftig auf einem Radfahrstreifen links an der Bushaltestelle und den wartenden Bussen vorbeigeführt. Eine direkte Querung Richtung Süden wurde verworfen um weiterhin den Autoverkehr bevorzugen zu können. Stattdessen muss man einmal Slalom um den Ampelmast fahren um parallel zur Fußfurt die Straßenseite wechseln zu können. Diese Führung ist sehr unkomfortabel und es ist naheliegend, das bei Grün Radfahrende illegal über die Fußfurt abkürzen. Immerhin verspricht die Planung die Ampelschaltung leicht zu verbessern, sodass der Radverkehr „nahezu in einem Zug Richtung Süden fahren“ kann. Im Vergleich zu heute sind die Wege breiter und die Kurvenradien etwas besser, weil die Nord/Süd Querung mehr Richtung Kreuzung gerückt wird. Das verbessert auch die Weiterfahrt in den <.a href="/4#18/53.649233/10.017831/B8ymtE53Lz4SAvOfrQcNrA">Ohlmoorgraben</.a>.</p>
    <p>Die Radwege <.a href="/14#18/53.64981/10.018815/ybWj4mhG_5e6DjECM0EbVQ">ab Neukoppel im Gehlengraben</.a> und <.a href="/4#18/53.649901/10.017855/jWbW_aXt8njjglWNqA1GKQ">Tangstedter Landstraße Richtung Norden</.a> werden auf 2m verbreitert. Ungefähr ab Höhe des KFZ-Linksabbiegers Richtung Parkhaus geht dieser in einen Radfahrstreifen über. Befremdlich wirkt, das der Radverkehr hier an <.a href="/4#18/53.650608/10.017923/siVPxuMTmm5kSxwSnsbOJw">der KFZ-Ampel</.a> warten soll, wenn das Parkhaus grün hat. Mit Wegkonflikten zwischen Radfahrenden ist hier kaum zu rechnen, weswegen eine „Rad Dauergrün“ Ampel Sinn ergeben könnte.</p>
    <p>Der Umbau der Kreuzung wurde klar vom Auto aus gedacht und die Nord/Süd Querung bleibt unkomfortabel. Gut ist hingegen das entfädeln von Fuß und Rad an den Bushaltestellen, was künftig dann nur noch an den Warteflächen vor den Ampeln ein Problem werden könnte.</p>
    <p>Geplant ist ab September 2020 für ungefähr ein Jahr zu bauen. Beim ersten Entwurf war noch ein Baubeginn Anfang 2019 angedacht.</p>
    <p>
    <.a href="https://lsbg.hamburg.de/contentblob/13628332/217f8e1ec509c3c0c75ef499ae3b3df9/data/veloroute-14-gehlengraben-kreuzung-tangstedter-landstr-abgestimmte-planung-bericht.pdf">Erläuterungsbericht</.a><br/>
    <.a href="https://lsbg.hamburg.de/contentblob/11228162/1056b9cb4d11859c4f41a8974a01a204/data/veloroute-14-kreuzung-tangstedter-landstrasse-gehlengraben-abstimmungsunterlage-plan.pdf">Lageplan</.a>
    </p>
    """
  end
end
