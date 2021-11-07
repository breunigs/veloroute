defmodule Data.Article.Blog.KreuzungGrandwegGrelckstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-3-kreuzung-grandweg-grelckstrasse"
  def created_at(), do: ~D[2019-06-22]

  def title(), do: "Kreuzung Grandweg / Grelckstraße (Veloroute 3)"

  def start(), do: ~d[2022]

  def type(), do: :intent

  def tags(), do: ["3"]

  def links(_assigns) do
    [
      {"Sitzungsprotokoll mit Präsentation",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi//to020.asp?TOLFDNR=1015900"},
      {"Erläuterungsbericht",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1007021"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Folgt man der Veloroute 3 entlang des Grandwegs bzw. der Grelckstraße muss man die breite Julius-Vossler- bzw. Vogt-Wells-Straße queren. Dazu wird man jeweils auf schmale und unkomfortable Hochbordradwege geleitet. Die Kurven sind eng und man kommt sich leicht mit Zufußgehenden in die Quere. Da man die Fußampeln mitbenutzt, sind die Grünzeiten auch entsprechend knapp. Kurzum: die Kreuzung muss dringend verbessert werden.</p> <p>Dazu wurden im April 2019 erste Ansätze vorgestellt: Entlang der Veloroute wird der Radverkehr im Kreuzungsbereich auf 1,5m breiten <.ref>Schutzstreifen</.ref> (gestrichelte Linie) geführt. Im Vergleich zu heute ist die Führung geradlinig. Um direktes Linksabbiegen zu erleichtern wird jeweils eine Aufstellfläche für Fahrräder vor den KFZ aufgemalt. Indirektes Linksabbiegen ist laut aktuellem Stand nicht vorgesehen.</p> <p>Für die Markttage, an denen der <.a href="/#18/53.599618/9.958609">Behrmannsplatz</.a> blockiert ist, soll eine Umleitung über den <.a href="/#17/53.600272/9.952061">Oddernskamp</.a> ausgeschildert werden. Angedacht ist die Kreuzung (ab) 2020 umzubauen.</p> <p>Die angedachte Lösung sieht auf den ersten Blick okay aus. Die Schutzstreifen könnten deutlich breiter ausfallen, wenn man die jeweils zwei KFZ-Abbiegespuren (links bzw. rechts/geradeaus) zusammenfassen würde. Vermutlich scheut man sich davor aber, weil dann die Hauptstraße länger rot hätte, bzw. die Nebenstraßen weniger KFZ-Durchsatz. Außerdem sollte ungeübten Radfahrenden indirektes Linksabbiegen ermöglicht werden – gerade wenn bereits Grün ist dies deutlich leichter als sich in den fließenden Verkehr einzuordnen.</p>
    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
