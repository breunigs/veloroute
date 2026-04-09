defmodule Data.Article.Blog.Bundesstrasse do
  use Article.Default

  def title(), do: "Bundesstraße (Verbindungsbahn bis Rentzelstraße)"

  def summary(), do: "Bundesstraße soll zur Fahrradstraße umgebaut werden."

  def type(), do: :planned
  def start(), do: ~d[2026Q3]

  def tags(), do: ["Bezirksroute B", "Eimsbüttel"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "Bundesstraße",
        direction: :forward,
        from: "An der Verbindungsbahn",
        to: "Eimsbütteler Brücke",
        parent_ref: __MODULE__,
        text: "Bundesstraße Richtung Eimsbüttel",
        historic: %{
          "09582019222d914380cd3078bf48bc27" => ~d[2026-02],
          "2ea2188564c085aa74bdf83d40a7da57" => ~d[2022-05]
        },
        videos: [
          {"2026-02-15-eims/GX018767", "00:00:01.101", "00:00:35.041"},
          {"2026-02-15-eims/GX018768", :start, "00:00:37.526"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "Bundesstraße",
        direction: :backward,
        from: "Eimsbütteler Brücke",
        to: "Grindelallee",
        parent_ref: __MODULE__,
        text: "Bundesstraße Richtung Dammtor",
        historic: %{
          "594fc686c6ee9f337226d35eb4a77cce" => ~d[2026-02],
          "add77092e4a4f95b8816f17167574b43" => ~d[2022-05]
        },
        videos: [
          {"2026-02-15-eims/GX018765", "00:02:08.067", "00:02:48.922"},
          {"2026-02-15-eims/GX018766", :start, :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Zeitungsartikel zu möglichem Bautermin", ~d[2025-12],
       "https://www.abendblatt.de/hamburg/eimsbuettel/article410655652/eimsbuettel-2026-tanzclub-unter-der-a7-neue-radrouten-diese-projekte-sind-geplant-2.html#:~:text=Baustart%20soll%20im%20Sommer%2FHerbst%202026%20sein%2E"},
      {"Geplanter Bautermine", "November 2023",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/to020.asp?TOLFDNR=1030471"},
      {"Unterlagen des 1. Entwurfs",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1007009"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Im Planungsgebiet gibt es beidseitig schmale <.ref>Hochbordradwege</.ref>, die durch angekettete Fahrräder teils noch enger werden. Sie müssen nicht benutzt werden.</p>
    <h4>Planung</h4> <p>Die Straße soll zu einer Fahrradstraße umgebaut werden. Die Fahrbahn soll künftig dann nur noch 5,50m breit sein, wobei am <.m bounds="9.979352,53.564563,9.981155,53.565757">Durchschnitt</.m> die Fahrbahn auf 4,0m verengt werden soll. Die Gehwegüberfahrten bleiben weiterhin erhalten.</p>
    <p>An der <.m bounds="9.981335,53.563922,9.983163,53.564482">Verbindungsbahn</.m> sollen KFZ künftig nicht mehr einbiegen dürfen, die Straße wird aber nicht zu einer Einbahnstraße. Eine komplette Durchfahrtssperre für KFZ wurde von Feuerwehr und Rettungsdiensten abgelehnt.</p>
    <p>Die alten Hochbordradwege werden den Fußwegen zugeschlagen und die KFZ-Parkplätze neu sortiert. Es sollen zahlreiche neue Radanlehnbügel aufgestellt werden; von heute 44 auf künftig 121.</p>
    <p>Ob die Fahrradstraße eingerichtet werden darf ist noch offen, da eine Verkehrszählung abgewartet wird. Nur wenn dort der Radverkehrsanteil hoch genug ausfällt, sind Fahrradstraßen gesetzlich möglich. Sollte dies nicht machbar sein, würde der Abschnitt in einem ähnlichen Stil zu einer Tempo-30-Zone umgebaut.</p>
    <p>Der Bezirk plant zu diesem Entwurf noch eine Online-Umfrage einzurichten.</p>
    <h4>Meinung</h4> <p>Es ist schade das man die KFZ-Sackgasse so schnell verworfen hat, statt die Möglichkeiten genauer auszuloten. Mit Automatikpollern oder mit Blaulicht über den Radweg entstünden für die Rettungskräfte auch keine Umwege.</p>
    <p>Die halbseitige Sperrung wird den KFZ-Verkehr und dessen Lärm vermutlich trotzdem etwas verringern. Das muss sie aber auch, wenn der Radverkehr auf der Fahrbahn fahren soll.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>

    """
  end
end
