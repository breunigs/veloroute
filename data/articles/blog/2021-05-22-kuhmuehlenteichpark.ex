defmodule Data.Article.Blog.Kuhmuehlenteichpark do
  use Article.Default

  def created_at(), do: ~D[2021-05-22]

  def title(), do: "Kuhmühlenteichpark (Veloroute 6)"

  def start(), do: ~d[2025-01]
  def stop(), do: ~d[2025-09]

  def type(), do: :planned

  def tags(), do: ["6", "N16"]

  def links(_assigns) do
    [
      {"2. Entwurf, Erläuterungen und Lageplan", "März 2024",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1013864"},
      {"1. Entwurf, Erläuterungen und Lageplan", "Juni 2021",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1010709"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radverkehr wird zwischen der <.v bounds="10.020132,53.565604,10.024992,53.566952" lon={10.0220022} lat={53.5660667} dir="forward" ref={@ref}>Hartwicusstraße</.v> und dem <.v bounds="10.025646,53.566341,10.030505,53.567689" lon={10.0274425} lat={53.5670232} dir="forward" ref={@ref}>Immenhof</.v> durch einen Park geleitet. Die Auffahrten sind als Ortsfremder leicht zu übersehen. Die wechselnden Oberflächen sind in die Jahre gekommen und daher uneben.</p>

    <p>Die Führung ist teils gemeinsam mit dem Fußverkehr, teils getrennt. Da die schmalen Wege von beiden Verkehrsarten stark genutzt werden, ist die Trennung in der Praxis selten gegeben.</p>

    <h4>Planung</h4>
    <p>Die Veloroute soll in ihrer heutigen Führung <.v bounds="10.02191,53.565489,10.028873,53.567082" lon={10.0264374} lat={53.5666511} dir="backward" ref={@ref}>durch den Park</.v> ausgebaut werden. Prinzipiell ist ein asphaltierter, 3,0m breiter Zweirichtungsradweg vorgesehen. Der Fußweg daneben soll weiterhin in Grand befestigt werden. <.v bounds="10.021304,53.565242,10.028268,53.566836" lon={10.0247564} lat={53.565926} dir="backward" ref={@ref}>Unter der Kuhmühlenbrücke</.v> wird der Radweg auf 2,0m verengt – dies entspricht der Radwegbreite im <.v bounds="10.049971,53.574303,10.058596,53.576277" lon={10.0549479} lat={53.5751804} dir="backward" ref={@ref}>Friedrichsberger Park</.v>.</p>

    <p>Die Aufführung in die <.v bounds="10.021304,53.565242,10.028268,53.566836" lon={10.0237762} lat={53.566034} dir="backward" ref={@ref}>Hartwicusstraße</.v> wird gepflastert, sodass die Veloroute Richtung Innenstadt immer Vorfahrt gewähren muss.</p>

    <p>Die Auffahrt zum <.v bounds="10.024066,53.566253,10.029806,53.567567" lon={10.0267086} lat={53.5668131} dir="forward" ref={@ref}>Immenhof</.v> wird ähnlich gestaltet. Hier ist die Veloroute dann in beide Richtungen vorfahrtspflichtig gegenüber dem Verkehr auf dem Immenhof.</p>

    <h4>Meinung</h4>
    <p>Besser als heute? Ja. Gut? Nein, dazu bleiben die Wege zu häufig unter den Mindestmaßen für Radwege. Selbst diese wären für eine Veloroute unangemessen – schließlich sollen diese das Rückgrat für den Radverkehr werden.</p>

    <p>Die fehlende Vorfahrt entlang der Veloroute ist aufgrund des geringen Verkehrs an den Auffahrten sicher zu verschmerzen. Leider wurde nicht untersucht ob die verlorenen Grünflächen im Park durch eine Verschmälerung von  Hartwicusstraße und Immenhof mit KFZ-Einbahnregelung ausgeglichen werden kann.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
