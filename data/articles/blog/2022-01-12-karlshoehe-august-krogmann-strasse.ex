defmodule Data.Article.Blog.KarlshoeheAugustKrogmannStrasse do
  use Article.Default

  def created_at(), do: ~D[2022-01-12]
  def title(), do: "Karlshöhe / August-Krogmann-Straße"

  def start(), do: ~d[2023-07-23]
  def stop(), do: ~d[2025-07-18]
  def construction_site_id_hh(), do: [425_147]

  def type(), do: :construction

  def summary(),
    do:
      "Zwecks Baumerhalt sind für den Rad- und Fußverkehr nur teilweise akzeptable Wege vorgesehen."

  def tracks(), do: []

  def tags(), do: ["br-wandsbek-w8"]

  def links(_assigns) do
    [
      {"Baustelleninfo", "Dezember 2023",
       "https://lsbg.hamburg.de/resource/blob/685972/85c45037d88696003957d1c9909f1bbd/farmsener-weg-karlshoehe-anliegerinformation-dezember-2023-data.pdf"},
      {"Baustelleninfo", "Oktober 2023",
       "https://lsbg.hamburg.de/resource/blob/690806/f679262b3f6b81224cb3b3746cd4a09e/farmsener-weg-karlshoehe-anliegerinformation-september-2023-data.pdf"},
      {"Baustelleninfo", "August 2023",
       "https://lsbg.hamburg.de/resource/blob/685972/00e7825af9e257cc37145706cc9742ed/farmsener-weg-karlshoehe-anliegerinformation-august-2023-data.pdf"},
      {"Detailänderungen Lagepläne", "Juli 2023",
       "https://lsbg.hamburg.de/resource/blob/683520/f37632a41f69ec0b164b9d9c4bad5976/farmsener-weg-von-saseler-chaussee-bis-carsten-reimers-ring-angepasste-ausfuehrungsplanung--data.pdf"},
      {"Projektseite des LBSG",
       "https://lsbg.hamburg.de/farmsener-weg-bis-august-krogmann-strasse"},
      {"Erläuterungsbericht und Lagepläne",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1015845"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Planung</h4>
    <p>Die Planung sieht vor die Radwege nach Möglichkeit zu verbessern. Die Bäume sollten aus Umweltschutzgründen möglichst erhalten bleiben. Auch die zwei KFZ-Spuren, die der Busverkehr mitnutzt, werden kaum verändert. Für den Radverkehr ergeben sich damit unterschiedliche Führungen und Breiten. Es bleibt weiter erlaubt die <.ref>Fahrbahn</.ref> statt der eigenen Radwege zu verwenden. Im Detail:</p>

    <ul>
    <li><.m bounds="10.094822,53.638541,10.09666,53.639494">Saseler Chaussee bis Volksdorfer Weg</.m>: <.ref>Radfahrstreifen</.ref> mit 2,0m Breite. Richtung Süden reicht dieser bis zum <.m bounds="10.094203,53.636886,10.097747,53.639131">Eckloßberg</.m>, in der Gegenrichtung fängt er erst kurz vorm Volksdorfer Weg an. In diesen kann nur <.ref>indirekt</.ref> links abgebogen werden.</li>
    <li><.m bounds="10.095686,53.632277,10.10547,53.639047">Volksdorfer Weg bis Grootmoor</.m>: abgesehen vom Stück Radfahrstreifen bis <.m bounds="10.094203,53.636886,10.097747,53.639131">Eckloßberg</.m> wird der Radverkehr in diesem Teil auf <.ref>Hochbordradwegen</.ref> geführt. Diese verlaufen mal vor, mal hinter den Baumreihen. Die breiteren (2,0m) und schmaleren (1,25m-1,50m) Abschnitte halten sich in etwa die Waage. Über Einfahrten oder abgesenkte Bordsteine können die Seitenstraßen erreicht werden.</li>
    <li><.m bounds="10.104695,53.630917,10.106975,53.632878">Grootmoor bis Carsten-Reimers-Ring</.m>: Richtung Norden ist ein 2,0m breiter Radfahrstreifen vorgesehen. Richtung Süden ein 1,30m Hochbordradweg.</li>
    <li><.m bounds="10.106181,53.627114,10.10897,53.631249">Carsten-Reimers-Ring bis Thomas-Mann-Straße</.m>: hauptsächlich 1,25m breite Hochbordradwege. An kurzen Abschnitten geringfügig breiter.</li>
    <li><.m bounds="10.108514,53.621771,10.112188,53.627227">Thomas-Mann-Straße bis kurz nach Malvenstieg</.m>: Radfahrstreifen von 2,0m Breite. An der Kreuzung mit dem <.m bounds="10.109837,53.622748,10.113308,53.624831">Pezolddamm</.m> kann sowohl direkt als auch indirekt Links angebogen werden. An den Bushalten muss sich der Radverkehr entweder in die KFZ-Spur einordnen oder hinter dem Bus warten.</li>
    <li><.m bounds="10.111582,53.616182,10.113933,53.622304">Malvenstieg bis Neusurenland</.m>: Richtung Süden wird der 2,0m breite Radfahrstreifen fortgeführt. An Bushaltestellen muss gewartet oder auf die KFZ-Spur ausgewichen werden. In Richtung Norden werden Rad, Fuß und die Zufahrten der Häuser gemeinsam über eine asphaltierte Nebenstrecke abgewickelt.</li>
    <li><.m bounds="10.113224,53.611613,10.115995,53.616401">Neusurenland bis Marie-Bautz-Weg</.m>: Bis zum Surenland sind die Radfahrstreifen nur 1,60m breit, danach aber wieder 2,0m. Wie bisher auch muss an Bushaltestellen gewartet oder ausgewichen werden.</li>
    <li><.m bounds="10.115283,53.608226,10.116888,53.611829">Marie-Bautz-Weg bis Mahlhaus</.m>: Richtung Süden ist ein 1,60m breiter Radfahrstreifen vorgesehen. Richtung Norden ist ein 1,70m breiter <.ref>Schutzstreifen</.ref> vorgesehen, welcher von breiten Fahrzeugen (Bus, LKW) mitbenutzt werden darf. Dies war notwendig weil der Platz nicht für eine KFZ-Spur in voller Breite ausreicht.</li>
    </ul>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
