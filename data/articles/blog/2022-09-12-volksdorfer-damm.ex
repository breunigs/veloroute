defmodule Data.Article.Blog.VolksdorferDamm do
  use Article.Default
  def created_at(), do: ~D[2022-09-12]
  def title(), do: "Volksdorfer Damm (Rögenweg bis Volksdorfer Grenzweg)"

  def summary(),
    do:
      "Stellenweise einseitiger Schutzstreifen mit 1,5m Breite. Gehwegradeln soll an Stellen ohne Schutzstreifen bleiben."

  def type(), do: :planned
  def tags(), do: []

  def start(), do: ~d[2024]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "article",
        direction: :forward,
        from: "Volksdorf",
        to: "Bergstedt",
        parent_ref: __MODULE__,
        text: "Volksdorfer Damm nach Bergstedt",
        videos: [
          {"2022-09-11-landstr-volksd-duvens/GX014763", "00:00:37.070", :end},
          {"2022-09-11-landstr-volksd-duvens/GX014764", :start, :end},
          {"2022-09-11-landstr-volksd-duvens/GX014765", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "article",
        direction: :backward,
        from: "Bergstedt",
        to: "Volksdorf",
        parent_ref: __MODULE__,
        text: "Volksdorfer Damm nach Volksdorf",
        videos: [
          {"2022-09-11-landstr-volksd-duvens/GX014761", "00:01:50.978", :end},
          {"2022-09-11-landstr-volksd-duvens/GX014762", :start, :end},
          {"2022-09-11-landstr-volksd-duvens/GX014763", :start, "00:00:14.011"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Unterlagen 1. Entwurf", "2020",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1017174"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Im markierten Bereich gibt es keine eigenen Radwege. Man kann entweder im <.ref>Mischverkehr</.ref> fahren, oder auf einem der Gehwege. Diese sind für beidseitig mittels <.ref>Fahrrad frei</.ref> für den (langsamen) Radverkehr freigegeben. Oft ist die Fahrt in beide Richtungen erlaubt.</p>

    <h4>Planung</h4>
    <p>Es ist meist vorgesehen die <.ref>Fahrbahn</.ref> etwas zu verbreitern um einseitig 1,5m breite <.ref>Schutzstreifen</.ref> aufzumalen. Auf der jeweils anderen Seite steht Mischverkehr ohne Schutzstreifen bzw. der Gehweg mit Fahrrad frei zur Verfügung. Die Gehwege sollen wo möglich verbreitert werden. Die nachfolgende Beschreibung folgt einer Fahrt in Richtung Bergstedt.</p>

    <p>Vom <.m bounds="10.155666,53.656414,10.160258,53.6611" lon={10.159768} lat={53.656732} dir="forward">Rögenweg</.m> bis vor die <.m bounds="10.155666,53.656414,10.160258,53.6611" lon={10.156093} lat={53.660939} dir="forward">Bushaltestelle Frankring</.m> soll der Schutzstreifen auf der Ostseite verlaufen. Über die Gehwegüberfahrt der Nebenfahrbahn kann auf den Fußweg gewechselt werden.</p>

    <p>Der Schutzstreifen verläuft nun auf der Westseite. Auch hier sind die Randsteine abgesenkt um einen Wechsel auf den Gehweg zu erlauben. Der westliche Schutzstreifen setzt sich bis zur Einmündung <.m bounds="10.148117,53.662394,10.152173,53.664332" lon={10.149507} lat={53.663367} dir="forward">Streekweg</.m> fort. Linksabbiegen in den Streekweg selbst ist nur von der Fahrbahn aus möglich. Auch das Queren zu Fuß wird nicht gestattet.</p>

    <p>Ab dem <.m bounds="10.146985,53.663101,10.149563,53.668224" lon={10.149087} lat={53.663505} dir="forward">Streekweg</.m> bis etwa <.m bounds="10.146985,53.663101,10.149563,53.668224" lon={10.147302} lat={53.667953} dir="forward">Höhe Hausnummer 137</.m> wird kein Schutzstreifen aufgemalt. Beide Seiten behalten die „Fahrrad frei“ Beschilderung.</p>

    <p>Danach beginnt wieder auf der Westseite der Schutzstreifen, welcher sich bis zur Kreuzung mit dem <.m bounds="10.144642,53.668474,10.145848,53.669323" lon={10.145376} lat={53.668972} dir="forward">Volksdorfer Grenzweg</.m> fortsetzt. Auf der Ost- bzw. Nordseite wird der Radverkehr etwa auf <.m bounds="10.145734,53.668508,10.14694,53.669356" lon={10.146472} lat={53.668821} dir="forward">Höhe Hausnummer 158</.m> auf die Fahrbahn geleitet, wo ebenfalls ein Schutzstreifen aufgemalt ist.</p>

    <p>Die Kreuzung mit dem <.m bounds="10.144642,53.668474,10.145848,53.669323" lon={10.145376} lat={53.668972} dir="forward">Volksdorfer Grenzweg</.m> wird zu einem Kreisverkehr umgebaut. Alle Knotenarme erhalten Zebrastreifen. Im Kreisel selbst fährt man im <.ref>Mischverkehr</.ref>.</p>

    <h4>Meinung</h4>
    <p>Die breiteren Gehwege sind nett, stellen aber keine ernsthafte Verbesserung für den Radverkehr dar. Die Kombination von Fahrbahnradeln (Mischverkehr) und „Fahrrad frei“ auf Gehwegen ist ein Feigenblatt um zeitgemäße Änderungen zu verhindern. Bei Schutzstreifen orientieren sich die Leute am Steuer oft an der Strichellinie und halten die 1,5m Überholabstand nicht ein. Eine sinnvollere Lösung wäre Tempo 30 mit entsprechender Verkehrsberuhigung, damit gar nicht schneller gefahren werden <em>kann</em>.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
