defmodule Data.Article.Blog.Bernadottestrasse1 do
  use Article.Default

  def title(),
    do: "Bernadottestraße – Hohenzollernring bis Arnoldstraße"

  def summary(),
    do:
      "Der vorhandene Radfahrstreifen Richtung Altona wird auf 1,95m verbreitert. Der Hochbordradweg Richtung Klein Flottbek entfällt ersatzlos."

  def type(), do: :planned
  def start(), do: ~d[2027Q3]

  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "bernadottestrasse",
        direction: :forward,
        from: "Arnoldstraße",
        to: "Parkstraße",
        parent_ref: __MODULE__,
        text: "Bernadottestraße Richtung Klein Flottbek",
        end_action: :reverse,
        historic: %{
          "efa020002fdd84a7df75a324a20ee68b" => ~d[2022-03]
        },
        videos: [
          {"2021-08-04-fr13-fr14/GX012503", "00:01:06.033", :end},
          {"2021-08-04-fr13-fr14/GX012504", :start, :end},
          {"2021-08-04-fr13-fr14/GX012505", :start, "00:00:23.857"},
          {"2022-03-12-elmshorn-via-elbe/GX013267", "00:00:30.530", :end},
          {"2022-03-12-elmshorn-via-elbe/GX013268", :start, "00:00:26.393"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "bernadottestrasse",
        direction: :backward,
        from: "Parkstraße",
        to: "Max-Brauer-Allee",
        parent_ref: __MODULE__,
        text: "Bernadottestraße Richtung Max-Brauer-Allee",
        historic: %{
          "237431c711cd9e7427de4db1a31d968a" => ~d[2022-07]
        },
        videos: [
          {"2022-07-09-waldhuus/GX014306", "00:01:33.360", :end},
          {"2022-07-09-waldhuus/GX014307", :start, :end},
          {"2022-05-15-13im-14gg/GX013959", :start, :end},
          {"2022-05-15-13im-14gg/GX013960", :start, :end},
          {"2022-05-15-13im-14gg/GX013961", :start, "00:00:03.437"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Erläuterungen und Lageplan, fertiger Entwurf", "April 2024",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1015149"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In <.v bounds="9.917498,53.54781,9.923384,53.548998" lon={9.917865} lat={53.548355} dir="backward" ref={@ref}>Richtung Altona</.v> gibt es einen ca. 1,60m breiten <.ref>Radfahrstreifen</.ref>, der teilweise in der <.ref>Dooring-Zone</.ref> verläuft. In <.v bounds="9.917498,53.54781,9.923384,53.548998" lon={9.922027} lat={53.5483} dir="forward" ref={@ref}>Richtung Klein Flottbek</.v> gibt es einen rund 1,0m breiten <.ref>Hochbordradweg</.ref>.</p>

    <h4>Planung</h4>
    <p>Die Fahrbahn soll neu asphaltiert werden. Der Radfahrstreifen wird dabei auf 1,95m verbreitert. An der Kreuzung mit der Fischers Allee wird eine <.ref name="ARAS">Aufstellfläche vorm KFZ-Verkehr aufgemalt</.ref>. KFZ-Parken auf dieser Seite wird verboten, sodass die <.ref>Dooring-Zone</.ref> entfällt.</p>

    <p>Der Hochbordradweg entfällt ohne Ersatz – künftig muss im <.ref>Mischverkehr</.ref> gefahren werden. Der alte Radweg wird zur Verbreiterung des Gehwegs benutzt. Vor der <.v bounds="9.915938,53.547528,9.920723,53.549664" lon={9.918138} lat={53.548531} dir="forward" ref={@ref}>Kreuzung mit dem Hohenzollernring</.v> gibt es einen kurzen Radfahrstreifen. Linksabbiegen bleibt <.ref name="abbiegen">direkt und indirekt</.ref> möglich.</p>

    <p>Die Bushaltestellen werden barrierefrei ausgebaut. Es werden fünf neue Bäume gepflanzt. Der <.v bounds="9.921492,53.547454,9.923905,53.54881" lon={9.92287} lat={53.548356} dir="forward" ref={@ref} highlight="Arnoldstraße">Platz an der Arnoldstraße</.v> wird neu gestaltet und hauptsächlich zum Verweilen hergerichtet.</p>

    <h4>Meinung</h4>
    <p>Die Planung kann sich sehen lassen. Da der Hochbordradweg nur in diesem Teilstück vorhanden war, ist sein Entfallen nicht tragisch.</p>

    <p>Leider bleibt <.v bounds="9.92049,53.547272,9.924359,53.549472" lon={9.921637} lat={53.548224} dir="backward" ref={@ref} highlight="Fischers Allee">die Ampel an der Fischers Allee</.v> mit Begründung auf das hohe KFZ-Aufkommen und die daraus resultierenden Gefahren. Man hätte sich stattdessen lieber fragen sollen, warum hier überhaupt so viel KFZ-Schleichverkehr stattfindet und wie man diesen aus dem Wohngebiet heraushält.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
