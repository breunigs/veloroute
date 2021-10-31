defmodule Data.Article.Blog.Schlueterstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-3-schlueterstrasse"
  def created_at(), do: ~D[2018-10-13]

  def title(), do: "Schlüterstraße (Veloroute 3)"

  def start(), do: ~d[2020-06-15]
  def stop(), do: ~d[2021-10-31]

  def type(), do: :construction
  def construction_site_id_hh(), do: [8623]
  def tags(), do: [3]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die <.m bounds="9.985805,53.564028,9.98786,53.571384">Schlüterstraße</.m> soll auf ihrer gesamten Länge zu einer Fahrradstraße umgewidmet werden – mit Ausnahme des bereits jetzt existiernden Stücks Zufußgehendezone im Bereich der Uni. Insbesondere schließt die Planung das kurze Stück zwischen <.m bounds="9.984625,53.570123,9.988511,53.570325">Hartungstraße</.m> und <.m bounds="9.985401,53.571186,9.986163,53.572603">Hallerplatz</.m> mit ein, obwohl die Veloroute hier bereits vorher abknickt. Auch die <.m bounds="9.984625,53.570123,9.988511,53.570325">Hartungstraße</.m> wird im Bereich der Veloroute (und nur dort) zu einer Fahrradstraße und gleichzeitig auch asphaliert.</p>

    <p>Den Fahrradstraßen wird an vielen Stellen Vorfahrt gewährt, indem man den Gehweg fortführt. Die KFZ und Radfahrende die den Gehweg queren müssen entsprechend warten. Das ist etwa so an der <.m bounds="9.984606,53.567664,9.992784,53.56821">Binderstraße</.m>, der <.m bounds="9.98658,53.566187,9.995914,53.566774">Johnsallee</.m> und dem Ostteil der <.m bounds="9.984625,53.570123,9.988511,53.570325">Hartungstraße</.m> so geplant. An der <.m bounds="9.985703,53.563735,9.993431,53.564192">Moorweidenstraße</.m> endet die Fahrradstraße und es gilt wieder Rechts-vor-Links. Ebenso an der <.m bounds="9.984335,53.569425,9.986319,53.569708">Bieberstraße</.m>.</p>

    <p>Die Führung bleibt im Wesentlichen so wie jetzt, allerdings werden die Parkstände besser angeordnet, sodass die Strecke aufgeräumter wirkt. Außerdem kommen 100 neue Fahrradstellplätze hinzu.</p> <p>Der Umbau ist ab Frühjahr 2020 geplant.</p> <ul>
    <li><.a href="https://www.hamburg.de/eimsbuettel/schlueterstrasse/">Infoseite der Stadt zur Schlüterstraße</.a></li>
    <li>Detaillierte Lagepläne, stadteinwärts: <.a href="https://www.hamburg.de/contentblob/11629636/62fc4ca330cd1f5ddae1071e1ba5e3f4/data/karte1-schlueterstrasse.pdf">Teil 1</.a>, <.a href="https://www.hamburg.de/contentblob/11629638/93d40af55f48014a892dd97311c6925f/data/karte2-schlueterstrasse.pdf">Teil 2</.a>, <.a href="https://www.hamburg.de/contentblob/11629644/426453acd67a3be976f0a4e3864eadde/data/karte3-schlueterstrasse.pdf">Teil 3</.a></li>
    </ul>
    """
  end
end
