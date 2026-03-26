defmodule Data.Article.Blog.BarnerstrasseBehringstrasse do
  use Article.Default

  def title(), do: "Barnerstraße und Behringstraße (Radroute 7)"

  def summary(),
    do:
      "Straßen sollen durchgängige Radwege erhalten. Teils als Radfahrstreifen, teils als Schutzstreifen. Breiten von 1,5m bis 1,9m."

  def type(), do: :intent
  def tags(), do: ["radroute-7"]

  # def start(), do: ~d[2026Q2]
  # def stop(), do: ~d[2026Q3]

  def map_image do
    {name(),
     [
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
     ]}
  end

  def links(_assigns) do
    [
      {"Präsentation", ~d[2026-03],
       "https://fragdenstaat.de/anfrage/barnerstrasse-behringstrasse/#nachricht-1101999"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In der <.v bounds="9.925316,53.554175,9.934475,53.557977" lon={9.932282} lat={53.557291} dir="backward" ref={Radroute7}>Barnerstraße</.v> gibt keine eigenen Radwege. Geradelt wird im <.ref>Mischverkehr</.ref> bei Tempo 50. Im Gefälle beim <.v bounds="9.931819,53.554424,9.936297,53.557957" lon={9.933673} lat={53.556412} dir="backward" ref={Radroute7}>Lessingtunnel</.v> wird der Radverkehr häufig bedrängt.</p>

    <p>In der <.m bounds="9.919119,53.552898,9.927329,53.556445">Behringstraße</.m> sind teilweise <.ref>Hochbordradwege</.ref> vorhanden. Sie verlaufen direkt in der <.ref>Dooring-Zone</.ref>.</p>

    <p>An allen größeren Kreuzungen kommt es regelmäßig zu Unfällen.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Es ist vorgesehen im ganzen Abschnitt durchgängige Radwege anzubieten. Man plant <.ref>Radfahrstreifen</.ref> und <.ref>Schutzstreifen</.ref> unterschiedlicher Breiten. Die engste Stelle wird 1,5m die breiteste rund 1,9m. Um  die <.ref>Dooring</.ref>-Gefahr zu verringern, wird an KFZ-Parkplätzen ein 75cm breiter Trennstreifen ergänzt.</p>

    <p>An den Kreuzungen bleiben die Radwege rechts der KFZ-Spuren. Ausnahme: <.v bounds="9.927496,53.555264,9.931197,53.557377" lon={9.929027} lat={53.556396} dir="backward" ref={Radroute7}>vor der Fabrik</.v> und zum <.v bounds="9.932476,53.554745,9.936672,53.55761" lon={9.933742} lat={53.556048} dir="backward" ref={Radroute7}>Lessingtunnel</.v> hin sind jeweils <.ref>Radfahrstreifen in Mittellage</.ref> geplant.</p>

    <h4>Meinung</h4>
    <p>Wo nichts ist, kann es ja nur besser werden. Mit dem Vorentwurf wird eine solide Basis geschaffen, umwerfend ist er aber nicht. Teils ist das der Örtlichkeit geschuldet, teils weil die Stadt privaten Autobesitz weiter bezuschussen möchte.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
