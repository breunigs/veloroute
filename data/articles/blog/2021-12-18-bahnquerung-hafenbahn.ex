defmodule Data.Article.Blog.BahnquerungHafenbahn do
  use Article.Default

  def updated_at(), do: ~D[2024-10-23]
  def title(), do: "Bahnquerung Hafenbahn (Veloroute 10)"

  def type(), do: :intent
  def tags(), do: ["10", "H.04", "H.05"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "v10-geplant",
        direction: :forward,
        from: "Blohmstraße",
        to: "Bostelbeker Hauptdeich",
        parent_ref: __MODULE__,
        text: "von der Blohmstraße zum Bostelbeker Hauptdeich",
        videos: [
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013687", "00:00:51.018", "00:01:18.946"},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013685", "00:03:14.828", "00:03:32.312"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "v10-geplant",
        direction: :backward,
        from: "Bostelbeker Hauptdeich",
        to: "Blohmstraße",
        parent_ref: __MODULE__,
        text: "vom Bostelbeker Hauptdeich zur Blohmstraße",
        videos: [
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013685", "00:02:57.978", "00:03:14.061"},
          {"2022-05-01-velo11-u-velo10-ab-harburg/GX013687", "00:03:00.013", "00:03:27.941"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Baustellenübersicht Harburg", ~d[2024-10],
       "https://sitzungsdienst-harburg.hamburg.de/bi/vo020.asp?VOLFDNR=1012246"},
      # {"Baustellenplanung", "September 2023",
      #  "https://sitzungsdienst-harburg.hamburg.de/bi/vo020.asp?VOLFDNR=1011076"},
      {"Hinweis des Bezirkamts Harburg auf Twitter",
       "https://twitter.com/BAHarburg/status/1471861350779523073"}
    ]
  end

  def summary(),
    do:
      "Hafenbahn-Querung als Lückenschluss für Radroute 10 wohl nicht möglich. Studie soll alternative Wege finden."

  def text(assigns) do
    ~H"""
    <h4>Stand Oktober 2024</h4>
    <p>Es ist offenbar nicht möglich, hier eine Bahnquerung zu bauen. In der Baustellenübersicht des Bezirks Harburg heißt es:</p>

    <blockquote>
      Alternative Routenführung erforderlich; Planung muss völlig neu aufgesetzt werden, vergleichende Routenführung (Machbarkeitsstudie) steht am Anfang
    </blockquote>

    <p>Damit rückt der Lückenschluss in weite Ferne.</p>

    <h4>Alter Zustand</h4>
    <p>Die Hafenbahn kann nur an wenigen Stellen gequert werden. Befahrbar sind davon die Unterführungen zur <.v bounds="9.980128,53.463321,9.983372,53.464776" lon={9.981858} lat={53.464174} dir="forward" ref="10">Neuen Straße</.v> und an der <.m bounds="9.960181,53.471026,9.963274,53.473107">Moorburger Straße</.m>. Zu Fuß steht auch noch eine Treppenanlage an der <.m bounds="9.978346,53.464612,9.979791,53.465319">Seehafenbrücke</.m> zur Verfügung. Keine der genannten Möglichkeiten ist für den Radverkehr ausgelegt.</p>

    <h4>Ehemaliges Vorhaben</h4>
    <p>Bereits seit einigen Jahren war angedacht eine weitere Bahnquerung zu schaffen. Dem Radverkehr könnte so eine direkte Verbindung zwischen <.v lon={9.979817} lat={53.465206} dir="forward" ref="10" bounds="9.979222,53.464637,9.982427,53.46752">Blohmstraße</.v> und <.v bounds="9.96703,53.467732,9.974075,53.470129" lon={9.967971} lat={53.469766} dir="backward" ref="10">Bostelbeker Hauptdeich</.v> angeboten werden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
