defmodule Data.Article.Blog.Veringstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-11-veringstrasse"
  def created_at(), do: ~D[2019-01-10]
  def updated(), do: ~D[2020-06-13]
  def title(), do: "Veringstraße (Veloroute 11)"

  def start(), do: ~d[2021Q3]

  def type(), do: :planned

  def tags(), do: [11]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die <.m bounds="9.985349,53.504201,9.987691,53.518581">Veringstraße</.m> stellt sich geordnet und kerzengerade dar – wer keine Probleme hat im Mischverkehr mit den Autos zu fahren kommt hier gut voran. Alle anderen haben bisweilen schlechte Karten. Die Stadt hat ihre Pläne zur Verbesserung mittlerweile konkretisiert und plant die Straße zu einer Tempo-30-Zone umzubauen. Damit das auch für alle ersichtlich ist, soll die Straße durch einige Verschwenkungen und Mittelinseln beruhigt werden. Im <.m bounds="9.962411,53.501443,10.010086,53.512367" lon="9.9861375" lat="53.5066273" dir="backward">Bereich des LOOP</.m> und beim Übergang zum „Einkaufsbereich“ soll ebenes Pflaster statt Teer auf die besondere Situation hinweisen.</p> <p>Eine Ausnahme bleibt die <.m bounds="9.976921,53.508841,9.992783,53.512476" lon="9.9867182" lat="53.5103147" dir="backward">Kreuzung mit der Neuhöfer Straße</.m>, die weiterhin mit 50km/h befahren werden darf. Die Ampel bleibt erhalten, soll aber automatisch Rad- und KFZ-Verkehr erkennen und entsprechend schalten.</p> <p>Der Radverkehr wird weiterhin im Mischverkehr geführt, aber immerhin ist die Höchstgeschwindigkeit niedriger. Ich bin gespannt ob das ausreicht um allen Radfahrenden die Fahrbahn schmackhaft zu machen.</p> <p>Die genaue Planung soll im Juni 2020 abgeschlossen werden, sodass voraussichtlich ab Sommer 2021 umgebaut werden kann.</p> <p><.a href="https://www.hamburg.de/mitte/strassenbau-und-verkehr/11703714/veloroute-veringstrasse/">Infoseite der Stadt</.a></p>
    """
  end
end
