defmodule Data.Article.Blog.Reeperbahn do
  use Article.Default

  def title(), do: "Versuchsradweg Reeperbahn"
  def updated_at(), do: ~D[2023-10-14]

  def summary(),
    do: "Verkehrsversuch: eine Fahrspur pro Richtung für Bus- und Radverkehr reserviert"

  def type(), do: :finished

  def tags(), do: []

  def start(), do: ~d[2023-10-16]
  def stop(), do: ~d[2023-10-31]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Reeperbahn",
        direction: :backward,
        from: "Zeughausmarkt",
        to: "Königstraße",
        parent_ref: __MODULE__,
        text: "Reeperbahn (→ Königstraße)",
        historic: %{
          "787c27d9887187e8e6a1457399ff1096" => ~d[2024-01],
          "322392dfed058a65bca42323414afe0e" => ~d[2022-11]
        },
        videos: [
          {"2024-01-27-bergedorf/GX016753", "00:00:55.455", :end},
          {"2024-01-27-bergedorf/GX016754", :start, :end},
          {"2024-01-27-bergedorf/GX016755", :start, "00:00:58.125"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Reeperbahn",
        direction: :forward,
        from: "Königstraße",
        to: "Zeughausmarkt",
        parent_ref: __MODULE__,
        text: "Reeperbahn (→ Millerntorplatz)",
        historic: %{
          "b68370037794ba4112498cfba9cae052" => ~d[2024-01],
          "4b0adb7b8bc291cede31172f0941da1e" => ~d[2022-11]
        },
        videos: [
          {"2023-03-28-w1-w5-w8sud/GX015282", "00:00:15.415", "00:00:25.759"},
          {"2024-01-27-bergedorf/GX016736", "00:00:33.300", :end},
          {"2024-01-27-bergedorf/GX016737", :start, "00:00:37.538"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Lageplan – Richtung Altona", "Oktober 2023",
       "https://lsbg.hamburg.de/resource/blob/691758/b0d6b6c0b0554a783e2ab8fd1f0f6dc0/reeperbahn-stadtauswaerts-verkehrsversuch-abgestimmte-planung-plan-data.pdf"},
      {"Erläuterungsbericht – Richtung Altona", "Oktober 2023",
       "https://lsbg.hamburg.de/resource/blob/691746/0d51eba9cb9bd9ca83d037bd5cfe80a6/reeperbahn-stadtauswaerts-verkehrsversuch-abgestimmte-planung-bericht-data.pdf"},
      {"Pressemitteilung Verkehrsversuch → Altona", "Oktober 2023",
       "https://www.hamburg.de/bvm/medien/17403338/2023-10-09-bvm-radverkehr/"},
      {"Baustelleninfo", "November 2022",
       "https://web.archive.org/web/https://lsbg.hamburg.de/contentblob/16641330/b904de9aa993de272d3a75494a52dff2/data/reeperbahn-einrichtung-neuer-radfahrstreifen-11-2022.pdf"},
      {"Pressemitteilung", "Oktober 2022",
       "https://www.hamburg.de/bvm/medien/16586554/2022-10-17-bvm-radverkehr/"},
      {"Lageplan – Richtung Millerntor", "Oktober 2022",
       "https://lsbg.hamburg.de/resource/blob/634578/2997b79af16e28135491f597d09e6a23/reeperbahn-pop-up-bikelane-abgestimmte-planung-plan-data.pdf"},
      {"Erläuterungsbericht – Richtung Millerntor", "Oktober 2022",
       "https://lsbg.hamburg.de/resource/blob/634576/b863ae973a780608b8aba1bc0422f8c1/reeperbahn-pop-up-bikelane-abgestimmte-planung-bericht-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In der Reeperbahn gibt es meist keine eigenen Radwege, es muss im <.ref>Mischverkehr</.ref> bei Tempo 50 gefahren werden. Nur an den Enden der Straße sind kurze Stücke <.ref>Radfahrstreifen</.ref> (Richtung <.v bounds="9.953246,53.548897,9.957952,53.551295" lon={9.956457} lat={53.549823} dir="backward" ref={@ref}>Königstraße</.v>) bzw. <.ref>Hochbordradwege</.ref> (Richtung <.v bounds="9.966632,53.549256,9.972321,53.551787" lon={9.967142} lat={53.549884} dir="forward" ref={@ref}>Millerntorplatz</.v>) vorhanden.</p>

    <h4>Planung</h4>
    <p>Je Fahrtrichtung soll jeweils eine der zwei Fahrspuren für den Rad- und Busverkehr reserviert werden. Bisher ist dies nur in Richtung Millerntorplatz passiert, ab 16. Oktober 2023 soll das für die Gegenrichtung nachgeholt werden.</p>

    <h5>Richtung Königstraße</h5>
    <p>Der Radfahrstreifen beginnt dort, wo heute <.v bounds="9.965378,53.548552,9.970511,53.550922" lon={9.967939} lat={53.55017} dir="backward" ref={@ref}>der Hochbordradweg auf die Fahrbahn mündet</.v>. Mittels Sperrfläche und Warnbaken wird der Autoverkehr auf die linke Fahrspur gelenkt.</p>

    <p>Der neue Radfahrstreifen endet geradlinig auf den vorhandenen <.ref>Radfahrstreifen in Mittellage</.ref> an der <.v bounds="9.954208,53.548917,9.959512,53.550832" lon={9.957131} lat={53.549812} dir="backward" ref={@ref} highlight="Holstenstraße">Kreuzung mit der Holstenstraße</.v>.</p>

    <p>An Einmündungen und Kreuzungen wird der durchgängige Radfahrstreifen rot gefärbt.</p>

    <h5>Richtung Millterntorplatz</h5>
    <p>Wo <.v bounds="9.955653,53.549445,9.957007,53.550023" lon={9.956277} lat={53.549653} dir="forward" ref={@ref}>heute der Radfahrstreifen endet</.v>, wird der Radverkehr zunächst durch den Parkplatz geschickt. An <.v bounds="9.957206,53.549312,9.95856,53.54989" lon={9.957936} lat={53.549571} dir="forward" ref={@ref}>dessen Ende</.v> schließt der Radfahrstreifen an, der hier auch für HVV-Busse freigegeben ist. Der Bushalt <.v bounds="9.960708,53.549131,9.962062,53.549709" lon={9.961133} lat={53.549403} dir="forward" ref={@ref}>Davidstraße</.v> verbleibt rechts des Radweges. Ab Höhe <.v bounds="9.964452,53.549013,9.967907,53.550282" lon={9.964694} lat={53.549669} dir="forward" ref={@ref}>Taubenstraße</.v> ist der Radfahrstreifen auch für Reisebusse freigegeben.</p>

    <h4>Meinung</h4>
    <p>Endlich. Da nur Farbe aufgetragen wird, entscheidet die Regeltreue der Leute im Auto, ob das Radeln auf der Reeperbahn angenehmer wird. Da es nur ein Verkehrsversuch ist, sollte die Auswertung abgewartet werden. Denkbar sind alle möglichen Varianten – sowohl bessere als auch schlechtere für den Radverkehr.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
