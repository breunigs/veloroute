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
      "indirektes"
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
      }
    ]

  def text(assigns) do
    ~H"""
    <p>Es gibt oft zwei Möglichkeiten mit dem Fahrrad links abzubiegen.</p>

    <p>Beim <b>direkten Abbiegen</b> ordnet man sich auf der Linksabbiegerspur ein und kommt in einem Zug in die gewünschte Straße. Dazu muss man jedoch die KFZ-Geradeausspuren queren. In der Grafik ist das der dunkelrote Pfad.</p>

    <p>Beim <b>indirekten Abbiegen</b> fährt man zunächst geradeaus in die Kreuzung und wartet in einer Aufstelltasche. Ist die Straße frei bzw. die Ampel grün quert man nun die Straße und ist auch am Ziel. In der Grafik ist das der hellgründe Pfad.</p>

    <.roaddiagram src="abbiegen" alt="Eine Straßenansicht von oben (Vogelperspektive) die schematisch zeigt wie sich direktes und indirektes Linksabbiegen unterscheiden."/>

    <p>Damit das Prinzip gut erkennbar ist, ist die Kreuzung in der Grafik kompakt gehalten. In der Praxis sind sie deutlich weitläufiger, weil sich der Autoverkehr sonst im Weg stünde.</p>

    <h4>Videobeispiele</h4>
    <p>Es gibt alle möglichen Kreuzungs-Varianten:</p>
    <ul>
      <li><.m bounds="10.096749,53.537778,10.12086,53.54550" lon="10.1092239" lat="53.5417533" dir="forward" ref="14">nur direktes Abbiegen</.m></li>
      <li><.m bounds="9.866879,53.585889,9.8773,53.58922" lon="9.8738435" lat="53.5873562" dir="backward" ref="14">nur indirektes Abbiegen</.m></li>
      <li>beides (<.m bounds="9.992882,53.60424,9.999811,53.606458" lon="9.9972532" lat="53.6046497" dir="forward" ref="4">direkt</.m> bzw. indirekt über die <.m bounds="9.996751,53.604899,9.999158,53.606016" lon="9.9972532" lat="53.6046497" dir="forward" ref={name()
    }>Wilhelm-Metzger-Straße</.m>)</li>
    </ul>

    <p>Die Aufstelltaschen können dabei im Kreuzungsbereich <.m bounds="9.975387,53.553634,9.983536,53.557482" lon="9.97973" lat="53.55578" dir="forward" ref="2">links</.m> oder <.m lon="10.00076" lat="53.55560" dir="forward" bounds="9.997479,53.554666,10.003883,53.556719" ref="6">rechts</.m> des Radfahrstreifens sein, manchmal auch <.m bounds="9.961292,53.556184,9.966407,53.557824">direkt nach der Ampel</.m>.</p>

    <p>Eine weitere Variante des Linksabiegens ist der <.ref>ARAS</.ref></p>
    """
  end
end
