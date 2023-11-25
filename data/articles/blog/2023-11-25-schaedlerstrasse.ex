defmodule Data.Article.Blog.Schaedlerstrasse do
  use Article.Default

  def title(), do: "Schädlerstraße"

  def summary(),
    do: "KFZ-Einbahnstraße erhält gegenläufigen Radfahrstreifen."

  def start(), do: ~d[2024Q3]
  def stop(), do: ~d[2024Q3]

  def type(), do: :planned

  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "schaedlerstrasse",
        direction: :forward,
        from: "Süden",
        to: "Norden",
        parent_ref: __MODULE__,
        text: "Schädlerstraße nach Norden",
        historic: %{
          "d9ae24203dfdd6660ec17bd8b2854ece" => ~d[2023-11]
        },
        videos: [
          {"2023-11-25-random/GX016692", "00:00:02.536", "00:00:13.213"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Erläuterung und Pläne 1. Entwurf", "November 2023",
       "https://www.hamburg.de/wandsbek/bezirkliche-radverkehrsmassnahmen/17423026/schaedlerstrasse/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Einbahnstraße ist auch für den Radverkehr nur nach Norden befahrbar. Dies ist wahlweise auf der <.ref>Fahrbahn</.ref> oder einem <.ref>Hochbordradweg</.ref> möglich.</p>

    <h4>Planung</h4>
    <p>Die linksseitige KFZ-Abstellfläche soll zu einem gegenläufigen <.ref>Radfahrstreifen</.ref> werden. Dazu wird an der <.m bounds="10.073893,53.573859,10.075866,53.575149">Rüterstraße</.m> eine Abbiegemöglichkeit geschaffen.</p>

    <p>Die Straße soll auf Tempo-30 reduziert werden. Die Schulbushaltestelle soll umgestaltet werden, sodass eine Vorbeifahrt auch bei wartendem Bus möglich ist, ohne den gegenläufigen Radfahrstreifen zu überfahren. Der alte Hochbordradweg soll in diesem Bereich entfernt werden.</p>

    <h4>Meinung</h4>
    <p>Das man mit dem Fahrrad zur Schule und auch wieder nach Hause kommt sollte eine Selbstverständlichkeit sein. Gut, dass der Bezirk die fehlende Radverbindung nachträglich einrichtet.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
