defmodule Data.Article.Static.LexikonDirektesUndIndirektesAbbiegen do
  use Article.Static

  def name(), do: "lexikon/direktes-und-indirektes-abbiegen"
  def id(), do: name()

  def title(), do: "Lexikon · Direktes und Indirektes Abbiegen"

  def summary(),
    do:
      "Direktes Abbiegen: über Linksabbiegerspur, wie Autos. Indirektes Abbiegen: 2x gerade aus, wie zu Fuß."

  def tags(),
    do: [
      "lexikon",
      "abbiegen",
      "direkt",
      "direktem-und-indirekten-linksabbiegen",
      "direktem",
      "direkten-abbiegen",
      "direktes-linksabbiegen",
      "direktes-und-indirektes-abbiegen",
      "direktes",
      "indirekt-linksabbiegen",
      "indirekt",
      "indirekte-linksabbiegen",
      "indirektem-linksabbiegen",
      "indirektem",
      "indirekten-linksabbiegen",
      "indirektes-linksabbiegen",
      "indirektes",
      "direkt-links-abbiegen",
      "indirekten-abbiegen",
      "direkt-linksabbiegen",
      "direkt-links-abgebogen"
    ]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "in1",
        direction: :forward,
        from: "Holstenstraße",
        to: "Haubachstraße",
        parent_ref: __MODULE__,
        text: "indirektes Linksabbiegen am Holstenplatz",
        videos: [
          {"2024-07-05-indir-links/GX010008", "00:03:05.185", "00:03:38.885"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "in2",
        direction: :backward,
        from: "Holstenstraße",
        to: "Holstenplatz",
        parent_ref: __MODULE__,
        text: "indirektes Linksabbiegen am Holstenplatz",
        videos: [
          {"2024-07-05-indir-links/GX010011", "00:00:40.908", "00:00:51.285"},
          {"2024-07-05-indir-links/GX010011", "00:01:16.443", :end},
          {"2024-07-05-indir-links/GX010012", :start, "00:00:16.850"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "dir",
        direction: :forward,
        from: "Holstenstraße",
        to: "Haubachstraße",
        parent_ref: __MODULE__,
        text: "direktes Linksabbiegen am Holstenplatz",
        videos: [
          {"2024-07-06-louise/GX010017_stabilized", "00:00:20.404", "00:00:56.189"}
        ]
      },
      %Video.Track{
        renderer: 2,
        group: "indirektes Abbiegen",
        direction: :forward,
        from: "Bebelallee",
        to: "Rathenaustraße",
        parent_ref: __MODULE__,
        text: "indirekt aus der Bebelallee in die Rathenaustraße abbiegen",
        videos: [
          {"2022-01-29-rickling/GX013202", "00:00:10.511", :end},
          {"2022-01-29-rickling/GX013204", :start, :end},
          {"2022-01-29-rickling/GX013205", :start, "00:00:02.836"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "indirektes Abbiegen, vor Kreuzung",
        direction: :forward,
        from: "Neuer Pferdemarkt",
        to: "Zum Grünen Jäger",
        parent_ref: __MODULE__,
        text: "indirekt Abbiegen, Aufstellfläche vor Kreuzung",
        videos: [
          {"2023-04-06-br-wandsbek/GX015542", "00:00:25.626", :end},
          {"2023-04-06-br-wandsbek/GX015543", :start, :end},
          {"2023-04-06-br-wandsbek/GX015544", :start, "00:00:02.803"}
        ]
      }
    ]

  def point_of_interest(), do: %{lon: 9.947984, lat: 53.560759, zoom: 17}

  def text(assigns) do
    ~H"""
    <p>Es gibt oft zwei Möglichkeiten mit dem Fahrrad links abzubiegen.</p>

    <p>Beim <b>direkten Abbiegen</b> ordnet man sich auf der Linksabbiegerspur ein und kommt in einem Zug in die gewünschte Straße. Dazu muss man jedoch die KFZ-Geradeausspuren queren. In der Grafik ist das der dunkelrote Pfad.</p>

    <p>Beim <b>indirekten Abbiegen</b> fährt man zunächst geradeaus in die Kreuzung und wartet in einer Aufstelltasche. Ist die Straße frei bzw. die Ampel grün quert man nun die Straße und ist auch am Ziel. In der Grafik ist das der hellgrüne Pfad.</p>

    <.roaddiagram src="abbiegen" alt="Eine Straßenansicht von oben (Vogelperspektive) die schematisch zeigt wie sich direktes und indirektes Linksabbiegen unterscheiden."/>

    <p>Damit das Prinzip gut erkennbar ist, ist die Kreuzung in der Grafik kompakt gehalten. In <.v bounds="9.945422,53.55876,9.950073,53.562692" lon={9.948781} lat={53.559803} dir="forward" ref={@ref}>der Praxis sind sie deutlich weitläufiger</.v>, weil sich der Autoverkehr sonst im Weg stünde.</p>

    <h4>Videobeispiel – Indirektes Linksabbiegen</h4>
    <p><.v bounds="9.945579,53.560091,9.94893,53.562355" lon={9.947833} lat={53.56091} dir="forward" ref={@ref}group="in1"><strong>Videobeispiel zum indirekten Linksabbiegen</strong></.v> am Holstenplatz ohne Zeitraffer. Von dieser Aufstelltasche sieht man nur noch die <.v bounds="9.945579,53.560091,9.94893,53.562355" lon={9.94721} lat={53.561306}dir="forward" ref={@ref} group="in1">Fuß-Ampel auf der anderen Straßenseite</.v>. Man darf also weiterfahren sobald alle Spuren frei sind (2x Rad, 4x KFZ und 1x Fuß). Wenn man eine Kreuzung nicht kennt oder viel los ist, kann die Fuß-Ampel natürlich als Hilfe beachtet werden.</p>

    <p>Die <.v bounds="9.945579,53.560091,9.94893,53.562355" lon={9.946627} lat={53.561549} dir="backward" ref={@ref} group="in2"><strong>andere Fahrtrichtung</strong></.v> funktioniert ähnlich. Hier muss die <.v bounds="9.945579,53.560091,9.94893,53.562355" lon={9.946965} lat={53.561276} dir="backward" ref={@ref}  group="in2">Fahrradampel auf der kleinen Verkehrsinsel</.v> beachtet werden. Das Video ist ohne Zeitraffer, aber die Wartezeiten wurden herausgeschnitten. Als Sonderlösung für den Holstenplatz folgt dann noch <.v bounds="9.945579,53.560091,9.94893,53.562355" lon={9.947308} lat={53.56125} dir="backward" ref={@ref}  group="in2">eine zweite Fahrradampel</.v>. Sie ist jedoch auf die erste abgestimmt, sodass man an ihr nicht nochmal halten muss.</p>

    <h4>Videobeispiel – Direktes Linksabbiegen</h4>
    <p><.v bounds="9.945422,53.55876,9.950073,53.562692" lon={9.948781} lat={53.559803} dir="forward" ref={@ref} group="dir"><strong>Videobeispiel zum direkten Linksabbiegen</strong></.v>, wieder am Holstenplatz. Um sich sicher auf der Linksabbiegerspur einordnen zu können, beginnt der Abbiegevorgang früher als beim indirekten Abbiegen. Da man nicht mehr auf dem Radweg unterwegs ist, sind jetzt die gleichen Ampeln zu beachten wie mit dem Auto. Sobald man in der <.v bounds="9.945422,53.55876,9.950073,53.562692" lon={9.947522} lat={53.561025} dir="forward" ref={@ref} group="dir">Kreuzungsmitte</.v> ist, müssen nur noch die zu querenden Spuren frei sein (2x KFZ, 1x Rad und 1x Fuß), dann kann man die Fahrt fortsetzen.</p>

    <p>In die <.v bounds="9.945579,53.560091,9.94893,53.562355" lon={9.946627} lat={53.561549} dir="backward" ref={@ref} group="in2">andere Fahrtrichtung</.v> ist direktes Linksabbiegen nicht möglich. Der Autoverkehr soll bereits an der <.m bounds="9.943608,53.560325,9.948669,53.564055">Stresemannstraße</.m> abbiegen, daher gibt es hier keine Aufstellfläche und keine passende Ampelschaltung. Die vorgeschriebene Fahrtrichtung <img src="/images/zeichen209-30.svg" style="vertical-align: middle; scale: 75%; margin: -1rem -0.2rem;" alt="↑ (Zeichen 209-30, vorgeschriebene Fahrtrichtung geradeaus)"/> auf der <em>linken</em> Spur gilt auch mit dem Fahrrad.</p>

    <h4>Videobeispiel – weitere Kreuzungsdesigns</h4>
    <p>Je nach Kreuzung unterscheiden sich die Möglichkeiten zum Abbiegen und wo die Aufstelltasche untergebracht ist. Videos im Zeitraffer:</p>
    <ul>
      <li><.v bounds="10.096749,53.537778,10.12086,53.54550" lon={10.1092239} lat={53.5417533} dir="forward" ref="14">nur direktes Abbiegen</.v></li>
      <li><.v bounds="9.866879,53.585889,9.8773,53.58922" lon={9.8738435} lat={53.5873562} dir="backward" ref="14">nur indirektes Abbiegen</.v></li>
      <li>beides (<.v bounds="9.992882,53.60424,9.999811,53.606458" lon={9.9972532} lat={53.6046497} dir="forward" ref="4">direkt</.v> bzw. indirekt über die <.v bounds="9.996751,53.604899,9.999158,53.606016" lon={9.9972532} lat={53.6046497} dir="forward" ref={name()
    }>Wilhelm-Metzger-Straße</.v>)</li>
    </ul>

    <p>Die Aufstelltaschen können dabei im Kreuzungsbereich <.v bounds="9.975387,53.553634,9.983536,53.557482" lon={9.97973} lat={53.55578} dir="forward" ref="2">links</.v> oder <.v lon={10.00076} lat={53.55560} dir="forward" bounds="9.997479,53.554666,10.003883,53.556719" ref="6">rechts</.v> des Radfahrstreifens sein, manchmal auch <.v bounds="9.961292,53.556184,9.966407,53.557824" lon={9.964527} lat={53.556826} dir="forward" ref={name()}>direkt nach der Ampel</.v>.</p>

    <p>Eine weitere Variante des Linksabbiegens ist der <.ref>ARAS</.ref>.</p>
    """
  end
end
