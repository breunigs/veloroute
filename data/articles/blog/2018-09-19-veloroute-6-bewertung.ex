defmodule Data.Article.Blog.Veloroute6Bewertung do
  use Article.Default

  def name(), do: "#{created_at()}-veloroute-6-bewertung"
  def created_at(), do: ~D[2018-09-19]

  def title(), do: "Bewertung der Veloroute 6 Herbst 2018"

  def type(), do: nil

  def tags(), do: ["6"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Bis zur <.m bounds="10.016725,53.565928,10.024875,53.56631">Hartwicusstraße</.m> teilt sich die Veloroute 6 den Weg mit der 5er. Entsprechend haben auch beide anfangs die gleichen Probleme: Die Radwege sind unterdimensioniert und es gibt häufig Konflikte mit Zufußgehenden (<.m bounds="9.994589,53.551657,10.000915,53.555833">Ballindamm</.m>, Radweg durch den <.m bounds="10.006016,53.574758,10.034857,53.631485">Alsterpark</.m>). Stadtauswärts hat man <.m bounds="10.002229,53.556733,10.015697,53.56271">An der Alster</.m> eine rote Welle und die Führung am <.m bounds="10.01509,53.562342,10.01777,53.568488">Schwanenwik</.m> ist verwirrend.</p>
    <p>Danach wird es besser: Die Kreuzung in und aus der <.m bounds="10.016725,53.565928,10.024875,53.56631">Hartwicusstraße</.m> ist gelungen. Im Anschluss gibt es meist getrennte Führungen oder Fahrradstraßen. Die Kreuzungen lassen jeweils aber zu wünschen übrig: die zu querenden Straßen haben eine hohe KFZ Dichte, sodass Lücken selten sind. Selbst mit einer Querungshilfe wie an der <.m bounds="10.048536,53.571766,10.05121,53.57924">Friedrichsberger Straße</.m> muss man zweimal anhalten um weiterzukommen. Das ist sehr unkomfortabel und schmälert den positiven Eindruck der Fahrradstraßen.</p>
    <p>All dies ist aber nichts im Vergleich zur Kreuzung direkt nach <.m bounds="10.056713,53.574284,10.062119,53.577908">S-Friedrichsberg</.m>. Die Radverkehrsführung endet und startet im Nichts, die Fahrbahnampeln die man laut StVo beachten <em>muss</em> kann man nicht sehen und zu schmal sind die Wege sowieso. Weiter im <.m bounds="10.064856,53.579146,10.075162,53.589051">Eulenkamp</.m> trifft man auf alten Bestand: man hat die Wahl zwischen Kopfsteinpflaster auf der Straße und ebenso holprigen wie schmalen Radwegen daneben.</p>
    <p>Danach muss man in den Mischverkehr bei 50 km/h und wird häufig knapp überholt. Warum man hier die Radführung auf <.m bounds="10.076077,53.592006,10.092553,53.595499">Pillauer Straße</.m> und <.m bounds="9.784121,53.588757,10.097669,53.650262">Tilsiter Straße</.m> aufgeteilt hat, statt eine Straße für den KFZ und die andere für den Radverkehr vorzusehen wird mir nicht klar. Wirklich angenehm ist so wie jetzt keine der Richtungen. Nach der <.m bounds="10.092553,53.595499,10.118539,53.600648">Eckerkoppel</.m> bekommt man wieder eigene Radwege, die aber mittlerweile sehr uneben geworden sind.</p>
    <p>Zum Ende der Route hin wird man vom <.m bounds="10.109514,53.591743,10.147123,53.634562">Berner Heerweg</.m> durch Seitenstraßen umgeleitet, damit der Autoverkehr möglichst nicht durch Radfahrende behindert wird. Entsprechend unklar verläuft die Route im Zickzack, teils durch unsichtbare Hinterhöfe (<.m bounds="10.115823,53.616185,10.121817,53.622506">An der Berner Au</.m>) und kaum benutzbare Waldwege (nach dem <.m bounds="10.138631,53.636259,10.142843,53.637846">Andreasweg</.m>). Sonst ist der Belag meist gut, was aber nicht über die mangelhafte Führung hinwegtröstet.</p>
    <p>Aktuell ist Veloroute 6 eher nicht zu empfehlen. Die einzig gute Stelle sind die Fahrradstraßen in <.m bounds="10.043251,53.579885,10.043251,53.579885">Barmbek-Süd</.m>, die aber zu häufig durch große Kreuzungen unterbrochen werden um angenehm voran zu kommen. Die anderen Streckenteile sind kaum ausgebaut, sodass man auch jede beliebige andere Strecke fahren kann.</p>
    <p><.a target="_blank" href="https://www.abendblatt.de/hamburg/article215455347/An-der-Alster-brauchen-Radfahrer-starke-Nerven.html" rel="nofollow">Zeitungsartikel/Review vom 01.10.2018 [€]</.a></p>
    """
  end
end
