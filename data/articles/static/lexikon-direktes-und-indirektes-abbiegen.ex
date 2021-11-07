defmodule Data.Article.Static.LexikonDirketesUndIndirektesAbbiegen do
  use Article.Static

  def name(), do: "lexikon/direktes-und-indirektes-abbiegen"
  def title(), do: "Lexikon · Direktes und Indirektes Abbiegen"

  def summary(),
    do:
      "Direktes Abbiegen: über Linksabbiegerspur, wie Autos. Indirektes Abbiegen: 2x gerade aus, wie zu Fuß."

  def tags(),
    do: [
      "lexikon",
      "abbiegen",
      "direkten-abbiegen",
      "direktes-und-indirektes-abbiegen",
      "direktes",
      "direkt",
      "indirekt",
      "indirekt-linksabbiegen",
      "indirekte-linksabbiegen",
      "indirektem-linksabbiegen",
      "indirektes",
      "indirektes-linksabbiegen"
    ]

  def text(assigns) do
    ~H"""
    <p>Es gibt oft zwei Möglichkeiten mit dem Fahrrad links abzubiegen. Beim <b>direkten Abbiegen</b> ordnet man sich auf der Linksabbiegerspur ein und kommt in einem Zug in die gewünschte Straße. Dazu muss man jedoch die KFZ-Geradeausspuren queren. Beim <b>indirekten Abbiegen</b> fährt man zunächst geradeaus in die Kreuzung und wartet in einer Aufstelltasche. Ist die Straße frei bzw. die Ampel grün quert man nun die Straße und ist auch am Ziel.</p>
    <p>Es gibt alle möglichen Kreuzungs-Varianten:</p>
    <ul>
      <li><.m bounds="10.096749,53.537778,10.12086,53.54550" lon="10.1092239" lat="53.5417533" dir="forward" ref="14">nur direktes Abbiegen</.m></li>
      <li><.m bounds="9.866879,53.585889,9.8773,53.58922" lon="9.8738435" lat="53.5873562" dir="backward" ref="14">nur indirektes Abbiegen</.m></li>
      <li>beides (<.m bounds="9.992882,53.60424,9.999811,53.606458" lon="9.9972532" lat="53.6046497" dir="forward" ref="4">direkt</.m> bzw. indirekt über die <.m bounds="9.996751,53.604899,9.999158,53.606016">Wilhelm-Metzger-Straße</.m>)</li>
    </ul>
    <p>Die Aufstelltaschen können dabei im Kreuzungsbereich <.m bounds="9.975387,53.553634,9.983536,53.557482" lon="9.97973" lat="53.55578" dir="forward" ref="2">links</.m> oder <.m lon="10.00076" lat="53.55560" dir="forward" bounds="9.997479,53.554666,10.003883,53.556719" ref="6">rechts</.m> des Radfahrstreifens sein, manchmal auch <.m bounds="9.961292,53.556184,9.966407,53.557824">direkt nach der Ampel</.m>.</p>
    """
  end
end
