defmodule Data.Article.Static.LexikonARAS do
  use Article.Static

  def name(), do: "lexikon/aras"
  def title(), do: "Lexikon · Aufgeweiteter Radaufstellstreifen (ARAS)"

  def summary(),
    do:
      "Ein ARAS – aufgeweiteter Radaufstellstreifen – ist Aufstellfläche vor den KFZ zum Abbiegen an der Ampel"

  def tags(), do: ["lexikon", "aras"]

  def tracks(), do: Data.Article.Blog.Valentinskamp.tracks()
  def point_of_interest(), do: %{lon: 9.98375, lat: 53.555621, zoom: 16}

  def text(assigns) do
    ~H"""
    <p><.m bounds="9.983492,53.555314,9.985186,53.556223" lon="9.983262" lat="53.555614" dir="forward">Videobeispiel eines ARAS im Valentinskamp</.m> (wird im Video aber nicht zum Abbiegen genutzt)</p>

    <p>Mit einem ARAS ist eine Wartefläche an der Ampel gemeint, die sich vor der Haltelinie für KFZ befindet. So muss beim Linksabbiegen nicht in den Abgasen gewartet werden und man wird eher gesehen. Auch wird man nicht durch eine langsam anfahrende Autokolonne aufgehalten.</p>

    <p>Ein ARAS ist somit eine Mischung aus <.ref>direktem und indirekten Linksabbiegen</.ref>. Die Abkürzung steht für <strong>a</strong>ufgeweiteter <strong>R</strong>ad<strong>a</strong>ufstell<strong>s</strong>treifen.</p>

    <h4>Verhalten</h4>
    <p>Bei roter Ampel und wartenden KFZ kann man sich wie im Bild gezeigt verhalten und sich vor dem linksabbiegenden Auto aufstellen. Kniffliger wird es, wenn die Ampel umspringt, bevor man sich vor den KFZ einordnen konnte. Abhängig von der Situation kann man einfach langsamer fahren und nach den Autos abbiegen. Es besteht auch die Möglichkeit am rechten Straßenrand auf die nächste Ampelphase zu warten, um dann über den ARAS abzubiegen.</p>

    <p>Ist die Ampel grün, kann man den Radfahrstreifen rechtzeitig verlassen und direkt links Abbiegen. Kommt man allerdings hinter einem Auto zu stehen, darf man sich nicht zwischen den KFZ-Spuren nach vorne tasten. Aus Sicherheitsgründen empfiehlt es sich einfach zu warten wo man ist. Falls es die Situation erlaubt kann man den ARAS auch über den Radfahrstreifen erreichen. Letzteres dürfte an Ampeln mit nur einer KFZ-Spur praktisch immer der Fall sein.</p>

    <.roaddiagram src="aras" alt="Skizze eines ARAS an einer Einmündung, mit wartenden KFZ an Links- und Geradeausspur. Über den rechtsseitigen Radfahrstreifen ist eine Streckenführung für Linksabbiegen mit dem Fahrrad bei dieser Situation eingezeichnet."/>
    """
  end
end
