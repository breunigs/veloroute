defmodule Data.Article.Blog.Veloroute2Bewertung do
  use Article.Default

  def name(), do: "#{created_at()}-veloroute-2-bewertung"
  def created_at(), do: ~D[2018-08-31]

  def title(), do: "Bewertung der Veloroute 2 Mitte 2018"

  def type(), do: nil

  def tags(), do: ["2"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Insgesamt lässt sich die Veloroute 2 schon gut befahren. Allerdings gibt es immer noch viel unebene Stellen („Kopfsteinpflaster“) in <.m bounds="9.9501,53.572483,9.9501,53.572483">Eimsbüttel</.m> und <.m bounds="9.959432,53.546088,10.003147,53.628563">St. Pauli</.m>. Fraglich erscheint aktuell auch die Führung über den <.m bounds="9.933571,53.57787,9.941513,53.584227">Langenfelder Damm</.m>. Stadteinwärts muss man hier zweimal links abbiegen und das für einen gar nicht so tollen Radweg. Der (alten) Beschilderung zu folgen, ergibt hier mehr Sinn. Unbefriedigend ist auch die Querung der Kieler Straße am <.m bounds="9.912814,53.601324,9.916411,53.603383">Sola-Bona-Park</.m>: Der offensichtliche Weg stadteinwärts ist nämlich nicht freigegeben und das seit Jahren mit dem Wissen der Behörden. Da kann man nur den Kopf schütteln.</p>
    <p>Bei allem Gemecker muss man aber auch zugeben, das es gute Stellen gibt, etwa die Führung <.m bounds="9.950246,53.57212,9.958901,53.574425">Tornquiststraße</.m> und <.m bounds="9.93988,53.574425,9.950246,53.579571">Sillemstraße</.m>. Durch die Sackgassen für den KFZ Verkehr kommt man vergleichsweise bequem durch <.m bounds="9.9501,53.572483,9.9501,53.572483">Eimsbüttel</.m>. Diese Route endet bereits am <.m bounds="9.898859,53.602294,9.907157,53.605908">Furtweg</.m>, aber da die Veloroute 14 direkt anschließt kommt man auch brauchbar zum <.m bounds="9.901288,53.60995,9.901451,53.610344">Eidelstedt Zentrum</.m>.</p>
    <p>Lange Rede, kurzer Sinn: Die Route ist alltagstauglich, wenn auch mit leichten Abstrichen.</p>
    <p><.a href="https://www.abendblatt.de/hamburg/article215335259/Durch-Eimsbuettel-nach-Eidelstedt-ein-Weg-mit-Hindernissen.html">Zeitungsartikel/Review vom 15.09.2018</.a></p>
    """
  end
end
