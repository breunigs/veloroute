defmodule Data.Article.Blog.Holstenplatz do
  use Article.Default

  def name(), do: "#{created_at()}-13-holstenplatz"
  def created_at(), do: ~D[2018-08-29]
  def updated_at(), do: ~D[2021-08-05]
  def title(), do: "Kreuzungen um den Holstenplatz (Veloroute 13)"

  def type(), do: :construction

  def start(), do: ~d[2023-03-13]
  def stop(), do: ~d[2024-04-30]
  # def construction_site_id_hh(), do: [309_763, 410_165]

  def tags(), do: ["13"]

  def links(_assigns) do
    [
      {"Pressemitteilung zur früheren Fertigstellung", "März 2024",
       "https://www.hamburg.de/bvm/medien/18435512/2024-03-27-bvm-holstenplatz/"},
      {"Pressemitteilung zum Umbau", "Februar 2023",
       "https://www.hamburg.de/bvm/medien/16960882/2023-03-03-bvm-holstenplatz/"},
      {"Baustelleninfo", "Februar 2023",
       "https://lsbg.hamburg.de/resource/blob/784464/ab9a0637dc157568f9e79fbca79988ed/holstenplatz-holstenstrasse-alsenstrasse-anliegerinformation-februar-2023-data.pdf"},
      {"Ausschreibung Umbau",
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/api/external/deeplink/subproject/39f6c0a7-8734-4174-ad41-3baef66b9823"},
      {"Baustellenkoordination", "September 2022",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1013155"},
      {"Lageplan",
       "https://lsbg.hamburg.de/resource/blob/784372/b3755b2ded7039014fa8c35f76b52492/veloroute-13-holstenplatz-abgestimmte-planung-nachtrag-plan-data.pdf"},
      {"Erläuterungsbericht zu den Änderungen 2021",
       "https://lsbg.hamburg.de/resource/blob/784370/09dfa146b275aa54e6aefccb247d0a7e/veloroute-13-holstenplatz-abgestimmte-planung-nachtrag-bericht-data.pdf"},
      {"Erläuterungsbericht zu den Originalplänen von 2018",
       "https://lsbg.hamburg.de/resource/blob/784374/351f121be968278ac7227f8f9cf4ddc4/veloroute-13-holstenplatz-abgestimmte-planung-bericht-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Um den Holstenplatz wird der Radverkehr auf <.ref>Hochbordradwegen</.ref> geführt. Diese sind dabei teilweise recht schmal und verlaufen durch den Haltestellenbereich der Busse. Konflikte durch Ein-/Aussteigen bzw. auf dem Radweg Wartenden sind entsprechend häufig. An der Kreuzung mit der Stresemannstraße fehlen dem Radverkehr selbst Aufstellflächen, sodass hier die Querrichtung oder der Fußweg blockiert wird.</p>

    <h4>Planung</h4>
    <p>Die bereits 2018 abgeschlossene Planung wurde nochmals überarbeitet. Im Wesentlichen bleibt das Konzept gleich, wobei sich aber Detailverbesserungen ergeben. Im Nachfolgenden wird der neuere Plan beschrieben</p>

    <p>Entlang der Veloroute 13 im Uhrzeigersinn gibt es zunächst einen <.ref>Radfahrstreifen in Mittellage</.ref>. Geradlinig wird man über eine rot eingefärbte Furt über die Holstenstraße geführt, macht dann einen Schlenker nach rechts um auf der Busspur weiterzufahren. Diese ist breit genug um auch wartende Busse zu überholen. Unter der Brücke hört die Busspur auf und die Weiterfahrt erfolgt über einen <.ref>Radfahrstreifen</.ref> der durchgehend in die Alstenstraße führt.</p>

    <p>In der entgegengesetzten Fahrtrichtung gibt es wieder einen Radfahrstreifen in Mittellage, der aber deutlich länger ist. Unter der Brücke teilt man sich die Spur mit den Bussen, wobei man sich hier je nach Fahrtrichtung einordnen muss – es gibt eine eigene Linksabbieger-Spur für den Radverkehr. Die Kreuzung quert man wieder geradlinig um in der Haubachstraße im <.ref>Mischverkehr</.ref> weiterzufahren.</p>

    <p>Bis auf die genannte Ausnahme kann nur indirekt links abgebogen werden. Die Radfahrstreifen sind meist 2,0m breit, teils schmaler, teils breiter. Anders als 2018 noch geplant werden die Bushaltestellen in der Stresemannstraße nicht in dieser Maßnahme umgebaut.</p>

    <h4>Meinung</h4>
    <p>Im Vergleich zum Bestand verbesserte die alte Planung die Situation, wobei die neue nochmal etwas oben drauf legt. Die Führung entlang der Veloroute 13 im Uhrzeigersinn ist jetzt deutlich klarer und die Breiten sind jetzt alltagstauglicher als die 1,60m Mindestmaße. Leider hält man weiterhin an den unangenehmen Radfahrstreifen in Mittellage fest und versucht dann eine Erklärung zu finden, warum diese trotzdem die bessere Wahl waren. Man sollte hier konsequent KFZ-Abbiegemöglichkeiten abschaffen, wenn sich deswegen keine ordentliche Radverkehrsführung realisieren lässt.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
