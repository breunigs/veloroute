defmodule Data.Article.Static.LexikonDirketesUndIndirektesAbbiegen do
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
        renderer: 2,
        group: "indirektes Abbiegen",
        direction: :forward,
        from: "Bebelallee",
        to: "Rathenaustraße",
        parent_ref: __MODULE__,
        text: "indirekt aus der Bebelalle in die Rathenaustraße abbiegen",
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

  def text(assigns) do
    ~H"""
    <p>Es gibt oft zwei Möglichkeiten mit dem Fahrrad links abzubiegen.</p>

    <p>Beim <b>direkten Abbiegen</b> ordnet man sich auf der Linksabbiegerspur ein und kommt in einem Zug in die gewünschte Straße. Dazu muss man jedoch die KFZ-Geradeausspuren queren. In der Grafik ist das der dunkelrote Pfad.</p>

    <p>Beim <b>indirekten Abbiegen</b> fährt man zunächst geradeaus in die Kreuzung und wartet in einer Aufstelltasche. Ist die Straße frei bzw. die Ampel grün quert man nun die Straße und ist auch am Ziel. In der Grafik ist das der hellgrüne Pfad.</p>

    <.roaddiagram src="abbiegen" alt="Eine Straßenansicht von oben (Vogelperspektive) die schematisch zeigt wie sich direktes und indirektes Linksabbiegen unterscheiden."/>

    <p>Damit das Prinzip gut erkennbar ist, ist die Kreuzung in der Grafik kompakt gehalten. In <.v bounds="10.062198,53.578157,10.067061,53.579749" lon={10.063735} lat={53.57841} dir="forward" ref="6">der Praxis sind sie deutlich weitläufiger</.v>, weil sich der Autoverkehr sonst im Weg stünde.</p>

    <h4>Videobeispiele</h4>
    <p>Es gibt alle möglichen Kreuzungs-Varianten:</p>
    <ul>
      <li><.v bounds="10.096749,53.537778,10.12086,53.54550" lon={10.1092239} lat={53.5417533} dir="forward" ref="14">nur direktes Abbiegen</.v></li>
      <li><.v bounds="9.866879,53.585889,9.8773,53.58922" lon={9.8738435} lat={53.5873562} dir="forward" ref="14">nur indirektes Abbiegen</.v></li>
      <li>beides (<.v bounds="9.992882,53.60424,9.999811,53.606458" lon={9.9972532} lat={53.6046497} dir="forward" ref="4">direkt</.v> bzw. indirekt über die <.v bounds="9.996751,53.604899,9.999158,53.606016" lon={9.9972532} lat={53.6046497} dir="forward" ref={name()
    }>Wilhelm-Metzger-Straße</.v>)</li>
    </ul>

    <p>Die Aufstelltaschen können dabei im Kreuzungsbereich <.v bounds="9.975387,53.553634,9.983536,53.557482" lon={9.97973} lat={53.55578} dir="forward" ref="2">links</.v> oder <.v lon={10.00076} lat={53.55560} dir="forward" bounds="9.997479,53.554666,10.003883,53.556719" ref="6">rechts</.v> des Radfahrstreifens sein, manchmal auch <.v bounds="9.961292,53.556184,9.966407,53.557824" lon={9.964527} lat={53.556826} dir="forward" ref={name()}>direkt nach der Ampel</.v>.</p>

    <p>Eine weitere Variante des Linksabbiegens ist der <.ref>ARAS</.ref></p>
    """
  end
end
