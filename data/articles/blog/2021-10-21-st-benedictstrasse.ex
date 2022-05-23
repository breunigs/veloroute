defmodule Data.Article.Blog.StBenedictstrasse do
  use Article.Default

  def created_at(), do: ~D[2021-10-21]
  def title(), do: "St. Benedictstraße (Klosterstern bis Streekbrücke)"

  def summary(),
    do:
      "St. Benedictstraße erhält Schutzstreifen, Kreuzung mit der Heilwigstraße wird ein Kreisel."

  def start(), do: ~d[2021-11-01]
  def stop(), do: ~d[2022-08-17]
  def type(), do: :construction
  def construction_site_id_hh(), do: [20833, 20546]
  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 1,
        group: "track",
        from: "",
        to: "",
        direction: :forward,
        parent_ref: __MODULE__,
        text: "St. Benedictstraße Fahrtrichtung Osten",
        videos: [
          {"2021-06-19-veloroute6/GX011843", "00:00:12.379", "00:00:26.727"}
        ]
      },
      %Video.Track{
        renderer: 1,
        group: "track",
        from: "",
        to: "",
        direction: :forward,
        parent_ref: __MODULE__,
        text: "St. Benedictstraße Fahrtrichtung Westen",
        videos: [
          {"2021-04-04-freizeitroute-12-speedup-5x/GX011173", "00:01:14.141", "00:01:31.425"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Erläuterungsbericht",
       "https://lsbg.hamburg.de/contentblob/13867882/c88943a8627b3f07b6763579a735460d/data/st-benedictstrasse-abgestimmte-planung-bericht.pdf"},
      {"Lagepläne",
       "https://lsbg.hamburg.de/contentblob/13867884/bb792c4b88c1f11f71dc4ec449e58f95/data/st-benedictstrasse-abgestimmte-planung-plan.pdf"},
      {"Baustelleninfo", "Mai 2022",
       "https://lsbg.hamburg.de/contentblob/16149566/391f8e4dd71251622369e293136f523a/data/st-benedictstrasse-%E2%80%93-umbaumassnahmen-bauhphase-3-stand-05-22.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Im <.m bounds="9.988819,53.581511,9.993987,53.583465" lon="9.989747" lat="53.58205" dir="forward">westlichen Teil</.m> gibt es keine eigenen Radwege und man muss im <.ref>Mischverkehr</.ref> mit den Autos mitschwimmen. Ab der <.m bounds="9.993217,53.582736,9.995991,53.584201" lon="9.993882" lat="53.583199" dir="forward">Kreuzung mit der Heilwigstraße</.m> sind noch schmale <.ref>Hochbordradwege</.ref> vorhanden, die jedoch schlecht erreichbar sind und beim Umbau des Leinpfads auch gar nicht mehr angeschlossen wurden.</p>

    <h4>Planung</h4>
    <p>Es sollen meist <.ref>Schutzstreifen</.ref> mit rund 1,65m Breite aufgemalt werden. An den <.m bounds="9.993217,53.582736,9.995991,53.584201" lon="9.993882" lat="53.583199" dir="forward">Bushaltestellen</.m> ist in Fahrtrichtung Alster eine Vorbeifahrt an einem wartenden Bus möglich, wenn man in den KFZ-Verkehr ausweicht. In Richtung Westen wird der Radweg bogenförmig hinter der Wartefläche für Fahrgäste vorbeigeführt. Auf der <.m bounds="9.994388,53.583099,9.996719,53.584326" lon="9.995358" lat="53.583644" dir="forward">Streekbrücke</.m> und der <.m bounds="9.993502,53.582141,9.994504,53.58318">Heilwigstraße Richtung Süden</.m> sind kurze Abschnitte mit Radfahrstreifen geplant. Diese enden auf Höhe der nahen Straßeneinmündungen.</p>

    <p>Die <.m bounds="9.993017,53.58278,9.994599,53.583662" lon="9.993428" lat="53.583124" dir="forward">Kreuzung mit der Heilwigstraße</.m> wird zu einem kleinen Kreisverkehr umgebaut. Die Schutzstreifen enden jeweils vorher, sodass sich Rad- und KFZ-Verkehr bereits vor dem Kreisel sortieren müssen.</p>

    <h4>Meinung</h4>
    <p>In der Verkehrszählung vom Sommer 2018 stellte der Radverkehr bereits rund 24% des Verkehrsaufkommens entlang der St. Benedictstraße. Mit den Schutzstreifen wählt man damit eine Führungsform die Situation verbessert, aber auch keine Reserven bietet um den weiter steigenden Radverkehrsanteil aufzunehmen.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
