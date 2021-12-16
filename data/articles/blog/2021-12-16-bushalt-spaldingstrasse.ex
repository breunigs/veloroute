defmodule Data.Article.Blog.BushaltSpaldingstrasse do
  use Article.Default

  def created_at(), do: ~D[2021-12-16]
  def title(), do: "Bushalt Spaldingstraße (Freizeitroute 6)"

  def type(), do: :planned
  def tags(), do: ["FR6"]

  def start(), do: ~d[2024]

  def links(_assigns) do
    [
      {"Erläuterungen zum 1. Entwurf",
       "https://via-bus.hamburg.de/contentblob/15694444/b898b9d559fd00970b6a08e013e7ce65/data/57-mb3-bushaltestellen-spaldingstrasse-erstverschickung.pdf"},
      {"Lageplan 1. Entwurf",
       "https://via-bus.hamburg.de/contentblob/15694450/bc240509cf25755ff6820b7214add613/data/metrobus-3-vereinfachter-lageplan-zur-erstverschickung-haltestellen-spaldingstrasse.pdf"}
    ]
  end

  def summary(),
    do: ""

  def text(assigns) do
    ~H"""
    <h4>Bestand</h4>
    <p>Stadteinwärts fahren die Busse über die <.m bounds="10.011032,53.546217,10.016158,53.548581" lon="10.013573" lat="53.547571" dir="backward" ref="FR6">Amsinckstraße</.m>, stadtauswärts über den <.m bounds="10.009768,53.545449,10.015112,53.54758" lon="10.010393" lat="53.547278" dir="forward" ref="FR6">Högerdamm</.m>. In beiden Straßen sind für den Radverkehr jeweils <.ref>Hochbordradwege</.ref> unterschiedlicher Breiten und Qualitäten vorhanden. In der <.m bounds="10.009638,53.547213,10.012462,53.54787">Nebenstrecke Amsickstraße</.m> die den Högerdamm mit der Amsinckstraße verbindet sind keine eigenen Radwege vorhanden.</p>

    <h4>Planung</h4>
    <p>Die Busse sollen in beide Richtungen in der Amsinckstraße halten. Dazu wird die Nebenstrecke angepasst um besser für Busse befahrbar zu sein. Vor der Jugendherberge an der Nebenstrecke werden Parkplätze für Reisebusse geschaffen.</p>

    <p>Für den Radverkehr ergeben sich nur leichte Änderungen. Jeweils vom <.m bounds="10.004381,53.547148,10.007058,53.548638">Deichtorplatz</.m> kommend:</p>
    <ul>
      <li>Die <.m bounds="10.009395,53.546848,10.011434,53.547756" lon="10.009691" lat="53.547483" dir="forward" ref="FR6">Ampel zum Queren des Högerdamm</.m> wird leicht versetzt damit nicht durch die Reisebus-Parkplätze gefahren werden muss. Die Nebenstrecke bleibt weiterhin eine Einbahnstraße ohne eigenen Radweg.</li>
      <li>Nach der <.m bounds="10.012044,53.547485,10.012934,53.547815">Woltmannstraße</.m> wird auf einen Hochbordradweg aufgeleitet. Dieser wird hier rund 1,60m breit und verläuft zwischen Fußweg und Wartebereich der Fahrgäste.</li>
      <li>Für die Fahrt in Richtung <.m bounds="10.012912,53.547381,10.016325,53.548713">Nordkanalstraße</.m> erhält der Radverkehr eine neue Furt, etwa ab <.m bounds="10.011443,53.547665,10.012096,53.547964">Höhe Hausnummer 20</.m>. Diese führt zunächst Richtung <.m bounds="10.011977,53.547751,10.013664,53.548365">Spaldingstraße</.m>, macht dann jedoch einen Knick und führt quer über den Fußweg zur Nordkanalstraße. Man folgt also nicht der Luftlinie der Nordkanalbrücke, sondern unterquert diese zweimal.</li>
      <li>siehe auch: <.a href="/article/2021-07-24-hoegerdamm">Umplanung Högerdamm</.a></li>
    </ul>
    <p>In der Gegenrichtung, also stadteinwärts entlang der Freizeitroute, gibt es nur eine Änderung: Vor der Nordkanalbrücke wird der Hochbordradweg zu einer <.ref>Protected-Bike-Lane</.ref>. Nach der Einmündung der <.m bounds="10.011977,53.547751,10.013664,53.548365">Spaldingstraße</.m> wird man aber wieder auf den alten Hochbordradweg geleitet. Der Radweg soll hier rund 2,0m breit werden, mit einer 1,80m Engstelle am Brückenpfeiler.</p>

    <h4>Meinung</h4>
    <p>Der Radweg durch die Bushaltestelle in der Amsinckstraße ist unglücklich. Andererseits ist die Strecke durch den Högerdamm nach dem Umbau für den Radverkehr viel attraktiver, sodass hier wenig Betrieb herrschen sollte. </p>

    <p>Durch die Umplanung wird für den Radverkehr erstmals die (legale) Fahrt vom Deichtorplatz Richtung Nordkanalstraße möglich – gut! Unverständlich ist jedoch, warum eine Querung in Gegenrichtung nicht möglich ist. Entweder muss das Rad durch die Bushaltestelle in der Straßenmitte geschoben werden, oder es ist ein riesiger Umweg über den <.m bounds="10.004381,53.547148,10.007058,53.548638">Deichtorplatz</.m> notwendig. Aus der Woltmannstraße müsste man entsprechend über <.m bounds="10.016148,53.545429,10.018756,53.5463">Am Mittelkanal</.m> fahren.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
