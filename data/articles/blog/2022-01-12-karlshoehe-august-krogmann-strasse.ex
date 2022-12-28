defmodule Data.Article.Blog.KarlshoeheAugustKrogmannStrasse do
  use Article.Default

  def created_at(), do: ~D[2022-01-12]
  def title(), do: "Karlshöhe / August-Krogmann-Straße"

  def start(), do: ~d[2022]
  def stop(), do: ~d[2023]

  def type(), do: :planned

  def summary(),
    do:
      "Zwecks Baumerhalt sind für den Rad- und Fußverkehr nur teilweise akzeptable Wege vorgesehen."

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "KarlshoeheAugustKrogmannStrasse",
        direction: :backward,
        from: "Berner Heerweg",
        to: "Saseler Chaussee",
        parent_ref: __MODULE__,
        text: "August-Krogmann-Straße → Karlshöhe",
        videos: [
          {"2022-12-27-neumarkt-krogmann/GX015074", "00:00:14.481", :end},
          {"2022-12-27-neumarkt-krogmann/GX015075", :start, :end},
          {"2022-12-27-neumarkt-krogmann/GX015076", :start, "00:00:05.172"},
          {"2022-12-27-neumarkt-krogmann/GX015076", "00:00:36.837", "00:00:53.220"},
          {"2022-12-27-neumarkt-krogmann/GX015077", "00:00:00.334", :end},
          {"2022-12-27-neumarkt-krogmann/GX015078", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "KarlshoeheAugustKrogmannStrasse",
        direction: :forward,
        from: "Saseler Chaussee",
        to: "Berner Heerweg",
        parent_ref: __MODULE__,
        text: "Karlshöhe → August-Krogmann-Straße",
        videos: [
          {"2022-12-27-neumarkt-krogmann/GX015071", :start, :end},
          {"2022-12-27-neumarkt-krogmann/GX015072", :start, "00:01:10.037"}
        ]
      }
    ]

  def tags(), do: []

  def links(_assigns) do
    [
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
    <.structured_links/>
    """
  end
end
