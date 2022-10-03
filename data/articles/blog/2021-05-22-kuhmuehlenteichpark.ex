defmodule Data.Article.Blog.Kuhmuehlenteichpark do
  use Article.Default

  def created_at(), do: ~D[2021-05-22]

  def title(), do: "Kuhmühlenteichpark (Veloroute 6)"

  def start(), do: ~d[2022Q2]

  def type(), do: :planned

  def tags(), do: ["6"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Der Radverkehr wird zwischen der <.m bounds="10.020132,53.565604,10.024992,53.566952" lon={10.0220022} lat={53.5660667} dir="forward">Hartwicusstraße</.m> und dem <.m bounds="10.025646,53.566341,10.030505,53.567689" lon={10.0274425} lat={53.5670232} dir="forward">Immenhof</.m> durch einen Park geleitet. Die Auffahrten sind als Ortsfremder leicht zu übersehen. Die wechselnden Oberflächen sind in die Jahre gekommen und daher uneben.</p>
    <p>Die Führung ist teils gemeinsam mit dem Fußverkehr, teils getrennt. Da die schmalen Wege von beiden Verkehrsarten stark genutzt werden, ist die Trennung in der Praxis selten gegeben.</p>
    <h4>Planung</h4> <p>Die Veloroute soll nach dem ersten Entwurf in ihrer heutigen Führung <.m bounds="10.02191,53.565489,10.028873,53.567082" lon={10.0264374} lat={53.5666511} dir="backward">durch den Park</.m> ausgebaut werden. Prinzipiell ist ein asphaltierter, 3,0m breiter Zweirichtungsradweg vorgesehen. Der Fußweg daneben soll weiterhin in Grand befestigt werden. <.m bounds="10.021304,53.565242,10.028268,53.566836" lon={10.0247564} lat={53.565926} dir="backward">Unter der Kuhmühlenbrücke</.m> wird der Radweg auf 2,0m verengt – dies entspricht der Radwegbreite im <.m bounds="10.049971,53.574303,10.058596,53.576277" lon={10.0549479} lat={53.5751804} dir="backward">Friedrichsberger Park</.m>.</p>
    <p>Die Aufführung in die <.m bounds="10.021304,53.565242,10.028268,53.566836" lon={10.0237762} lat={53.566034} dir="backward">Hartwicusstraße</.m> wird nach Fahrtrichtungen getrennt und je 1,5m breit. Diese werden gepflastert, sodass die Veloroute Richtung Innenstadt immer Vorfahrt gewähren muss. Die Trennung wurde gemacht um die Bäume erhalten zu können.</p>
    <p>Zum <.m bounds="10.024066,53.566253,10.029806,53.567567" lon={10.0267086} lat={53.5668131} dir="forward">Immenhof</.m> werden die Fahrtrichtungen über eine gemeinsame, gepflasterte Auffahrt geführt. Hier ist die Veloroute dann in beide Richtungen vorfahrtspflichtig gegenüber dem Verkehr auf dem Immenhof.</p>
    <p>Der Radweg in Richtung <.m bounds="10.024592,53.565922,10.026196,53.566613">Schürbeker Straße</.m> entfällt ersatzlos.</p>
    <h4>Meinung</h4> <p>Besser als heute? Ja. Gut? Nein, dazu bleiben die Wege zu häufig unter den Mindestmaßen für Radwege. Selbst diese wären für eine Veloroute unangemessen – schließlich sollen diese das Rückgrat für den Radverkehr werden.</p>
    <p>Die fehlende Vorfahrt entlang der Veloroute ist aufgrund des geringen Verkehrs an den Auffahrten sicher zu verschmerzen. Diese war zwar angedacht, wurde aber vermutlich aufgrund von Denkmal- und Baumschutz aufgegeben. Leider wurde nicht untersucht ob die verlorenen Grünflächen im Park durch eine Verschmälerung von  Hartwicusstraße und Immenhof mit KFZ-Einbahnregelung ausgeglichen werden kann.</p>
    <p>Für die Fahrtrichtung von der Hartwicusstraße in die Schürbeker Straße bleibt künftig nur noch das ungesicherte Queren einer vierspurigen KFZ-Straße. Es ist anzunehmen, dass dies stattdessen zu Gehweg- oder Geisterradeln führen wird.</p>
    <h4>Quelle</h4> <p><.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1010709">Erläuterungsbericht und Lageplan des ersten Entwurfs</.a></p>
    """
  end
end
