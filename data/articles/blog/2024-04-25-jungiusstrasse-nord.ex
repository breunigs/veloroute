defmodule Data.Article.Blog.JungiusstrasseNord do
  use Article.Default

  def title(), do: "Jungiusstraße"

  def summary(),
    do:
      "2,25m breiter Radfahrstreifen Richtung Messe; 2,50m breiter Hochbordradweg Richtung Innenstadt. Kreuzung am Planten un Blomen wird umgestaltet; die am Gorch-Fock-Wall noch nicht."

  def type(), do: :construction
  def start(), do: ~d[2024-06-10]
  def stop(), do: ~d[2024-09-20]
  def construction_site_id_hh(), do: [836_450]

  def tags(), do: []

  def links(_assigns) do
    [
      {"Bauvergabe inkl. Lageplan und Beschreibung", "April 2024",
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/api/external/deeplink/subproject/bcb2052b-ea66-40a2-952f-993ae768e457"}
    ]
  end

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "x",
        direction: :forward,
        from: "Gorch-Fock-Wall",
        to: "Messeplatz",
        parent_ref: __MODULE__,
        text: "ab Jungiusstraße zur Messe",
        historic: %{
          "5a1c927632860e1802880f2d51d25860" => ~d[2021-08]
        },
        videos: [
          {"2021-08-01-freizeit9-anfang/GX012481", "00:00:13.113", "00:00:39.006"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "x",
        direction: :backward,
        from: "Messeplatz",
        to: "Gorch-Fock-Wall",
        parent_ref: __MODULE__,
        text: "ab St. Petersburger Straße zum Gorch-Fock-Wall",
        historic: %{
          "492cd0ba0211923385001fdd98988d92" => ~d[2021-08]
        },
        videos: [
          {"2021-08-01-freizeit9-anfang/GX012472", "00:00:19.820", :end},
          {"2021-08-01-freizeit9-anfang/GX012473", :start, :end},
          {"2021-08-01-freizeit9-anfang/GX012474", :start, :end}
        ]
      }
    ]

  def map_image do
    Data.MapImage.new(
      __MODULE__,
      {"SBI beratende Ingenieure für BAU-VERKEHR-VERMESSUNGS GmbH", "https://www.sbi.de/"},
      {
        %{lat: 53.560346062, lon: 9.982205888},
        %{lat: 53.557869760, lon: 9.984091870},
        %{lat: 53.557608613, lon: 9.983119732},
        %{lat: 53.560085108, lon: 9.981234560}
      }
    )
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In der <.v bounds="9.981022,53.558728,9.98421,53.560671" lon={9.983428} lat={53.558221} dir="forward" ref={@ref}>Jungiusstraße</.v> befinden sich beidseitig <.ref>Radfahrstreifen</.ref> mit rund 1,95m Breite. Sie wurden vor einigen Jahren provisorisch angelegt. An der <.v bounds="9.981022,53.558728,9.98421,53.560671" lon={9.982347} lat={53.559564} dir="forward" ref={@ref} highlight="Bei den Kirchhöfen">Einmündung Bei den Kirchhöfen</.v> ändert sich die Führung auf einen Zweirichtungsradweg auf Parkseite. In <.v bounds="9.981022,53.558728,9.98421,53.560671" lon={9.98193} lat={53.559915} dir="backward" ref={@ref} highlight="Bei den Kirchhöfen">Richtung Innenstadt</.v> ist deswegen zweimaliges Queren mit engen Kurven notwendig.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>In <.v bounds="9.980967,53.556859,9.985521,53.560384" lon={9.983561} lat={53.558031} dir="forward" ref={@ref}>Richtung Messe</.v> wird der Radfahrstreifen auf 2,25m verbreitert. Rechts von ihm befinden sich KFZ-Parkplätze.</p>

    <p>In <.v bounds="9.980967,53.556859,9.985521,53.560384" lon={9.982085} lat={53.559597} dir="backward" ref={@ref}>Richtung Innenstadt</.v> wird ein 2,50m breiter <.ref>Hochbordradweg</.ref> gepflastert. Dieser geht <.v bounds="9.981788,53.55691,9.986053,53.559443" lon={9.983229} lat={53.558229} dir="backward" ref={@ref}>auf der Brücke</.v> über die Parkanlagen in einen Radfahrstreifen über. Da die Kreuzung mit dem Gorch-Fock-Wall frühestens 2025 umgebaut werden soll, wird dort wieder eine Rampe auf den Altbestand angelegt.</p>

    <p>Die <.v bounds="9.981022,53.558728,9.98421,53.560671" lon={9.98193} lat={53.559915} dir="backward" ref={@ref} highlight="Bei den Kirchhöfen">Einmündung Bei den Kirchhöfen</.v> wird umgestaltet. Es wird mehr Platz für Gehwege bzw. die Bushaltestelle vorgesehen. Der Radverkehr erhält eigene Ampeln und kann Richtung Innenstadt künftig diagonal queren.</p>

    <h4>Meinung</h4>
    <p>Die Breiten der Radwege sind gut – viel mehr aber auch nicht. Der gerade mal 140m lange Hochbordradweg sollte stattdessen durchgehend asphaltiert werden. Dass das geht, zeigt die <.a name="2021-08-06-louise-schroeder-strasse">Umgestaltung Louise-Schroeder-Straße</.a>.</p>

    <p>Die <.v bounds="9.981022,53.558728,9.98421,53.560671" lon={9.98193} lat={53.559915} dir="backward" ref={@ref} highlight="Bei den Kirchhöfen">Einmündung Bei den Kirchhöfen</.v> wird zwar besser, behält aber auch den viel zu schmalen Zweirichtungsradweg in der <.v bounds="9.975204,53.559021,9.984221,53.563162" lon={9.978295} lat={53.561451} dir="backward" ref={@ref}>St. Petersburger Straße</.v> bei. Man hätte diese besser mit in die Planung aufgenommen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
