defmodule Data.Article.Blog.BahnquerungHafenbahn do
  use Article.Default

  def created_at(), do: ~D[2021-12-18]
  def title(), do: "Bahnquerung Hafenbahn (Veloroute 10)"

  def type(), do: :intent
  def tags(), do: ["10"]

  def start(), do: ~d[2024]

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
      {"Hinweis des Bezirkamts Harburg auf Twitter",
       "https://twitter.com/BAHarburg/status/1471861350779523073"}
    ]
  end

  def summary(),
    do:
      "Hafenbahn-Querung als Lückenschluss für die Veloroute 10 ist in Arbeit. Ziel: 2024 fertig werden."

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Hafenbahn kann nur an wenigen Stellen gequert werden. Befahrbar sind davon die Unterführungen zur <.m bounds="9.980128,53.463321,9.983372,53.464776" lon={9.981858} lat={53.464174} dir="forward" ref="10">Neuen Straße</.m> und an der <.m bounds="9.960181,53.471026,9.963274,53.473107">Moorburger Straße</.m>. Zu Fuß steht auch noch eine Treppenanlage an der <.m bounds="9.978346,53.464612,9.979791,53.465319">Seehafenbrücke</.m> zur Verfügung. Keine der genannten Möglichkeiten ist für den Radverkehr ausgelegt.</p>

    <h4>Vorhaben</h4>
    <p>Bereits seit einigen Jahren war angedacht eine weitere Bahnquerung zu schaffen. Dem Radverkehr könnte so eine direkte Verbindung zwischen <.m bounds="9.979222,53.464637,9.982427,53.46752">Blohmstraße</.m> und <.m bounds="9.96703,53.467732,9.974075,53.470129" lon={9.967971} lat={53.469766} dir="backward" ref="10">Bostelbeker Hauptdeich</.m> angeboten werden.</p>

    <p>Laut Bezirksamt Harburg wird bereits geplant und man hofft bis 2024 fertig gebaut zu haben. Bedingt durch die Bahnstrecke ist die Planung aufwendiger als sonst üblich.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
