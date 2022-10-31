defmodule Data.Article.Blog.Reeperbahn do
  use Article.Default

  def title(), do: "Versuchsradweg Reeperbahn"

  def summary(),
    do: "Verkehrsversuch: eine Fahrspur pro Richtung für Bus- und Radverkehr reserviert"

  def type(), do: :planned

  def tags(), do: []

  def start(), do: ~d[2022Q4]
  def stop(), do: ~d[2022Q4]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Reeperbahn",
        direction: :backward,
        from: "Millerntorplatz",
        to: "Königstraße",
        parent_ref: __MODULE__,
        text: "Reeperbahn (→ Königstraße)",
        videos: [
          # TODO: missing piece at the start
          {"2021-07-04-veloroute11/GX012148", "00:00:01.468", :end},
          {"2021-07-04-veloroute11/GX012149", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Reeperbahn",
        direction: :forward,
        from: "Königstraße",
        to: "Millerntorplatz",
        parent_ref: __MODULE__,
        text: "Reeperbahn (→ Millerntorplatz)",
        videos: [
          {"2022-07-31-neumuenst2/GX014360", "00:00:07.140", "00:00:32.693"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Pressemitteilung", "Oktober 2022",
       "https://www.hamburg.de/bvm/medien/16586554/2022-10-17-bvm-radverkehr/"},
      {"Lageplan – Richtung Millerntor", "Oktober 2022",
       "https://lsbg.hamburg.de/contentblob/16586856/d6de5326e1b7d32afda63a02e3a92b7d/data/reeperbahn-verkehrsversuch-radfahrstreifen-abgestimmte-planung-plan.pdf"},
      {"Erläuterungsbericht – Richtung Millerntor", "Oktober 2022",
       "https://lsbg.hamburg.de/contentblob/16586854/d2291601fd5bb19dc742539bfbd24f6a/data/reeperbahn-verkehrsversuch-radfahrstreifen-abgestimmte-planung-bericht.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In der Reeperbahn gibt es meist keine eigenen Radwege, es muss im <.ref>Mischverkehr</.ref> bei Tempo 50 gefahren werden. Nur an den Enden der Straße sind kurze Stücke <.ref>Radfahrstreifen</.ref> (Richtung <.m bounds="9.953246,53.548897,9.957952,53.551295" lon={9.956457} lat={53.549823} dir="backward">Königstraße</.m>) bzw. <.ref>Hochbordradwege</.ref> (Richtung <.m bounds="9.966632,53.549256,9.972321,53.551787" lon={9.967142} lat={53.549884} dir="forward">Millerntorplatz</.m>) vorhanden.</p>

    <h4>Planung</h4>
    <p>Je Fahrtrichtung soll jeweils eine der zwei Fahrspuren für den Rad- und Busverkehr reserviert werden. Zunächst soll dies nur in Richtung Millerntorplatz passieren, wofür bereits Pläne vorliegen.</p>

    <p>Wo <.m bounds="9.955653,53.549445,9.957007,53.550023" lon={9.956277} lat={53.549653} dir="forward">heute der Radfahrstreifen endet</.m>, wird der Radverkehr zunächst durch den Parkplatz geschickt. An <.m bounds="9.957206,53.549312,9.95856,53.54989" lon={9.957936} lat={53.549571} dir="forward">dessen Ende</.m> schließt der Radfahrstreifen an, der hier auch für HVV-Busse freigegeben ist. Der Bushalt <.m bounds="9.960708,53.549131,9.962062,53.549709" lon={9.961133} lat={53.549403} dir="forward">Davidstraße</.m> verbleibt rechts des Radweges. Ab Höhe <.m bounds="9.964452,53.549013,9.967907,53.550282" lon={9.964694} lat={53.549669} dir="forward">Taubenstraße</.m> ist der Radfahrstreifen auch für Reisebusse freigegeben.</p>

    <h4>Meinung</h4>
    <p>Endlich. Da nur Farbe aufgetragen wird, entscheidet die Regeltreue der Leute im Auto, ob das Radeln auf der Reeperbahn angenehmer wird. Da es nur ein Verkehrsversuch ist, sollte die Auswertung abgewartet werden. Denkbar sind alle möglichen Varianten – sowohl bessere als auch schlechtere für den Radverkehr.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
