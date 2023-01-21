defmodule Data.Article.Blog.LuruperHauptstrasse do
  use Article.Default

  def created_at(), do: ~D[2022-02-16]

  def title(), do: "Luruper Hauptstraße"
  def summary(), do: "Stadt bittet um Beteiligung zur Gestaltung der Luruper Hauptstraße"

  def type(), do: :intent
  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 2,
        group: "Luruper Hauptstraße",
        direction: :forward,
        from: "",
        to: "",
        parent_ref: __MODULE__,
        text: "Luruper Hauptstraße Richtung Schenefeld",
        videos: [
          {"2022-01-16-wedel/GX013142", :start, :end},
          {"2022-01-16-wedel/GX013143", :start, "00:01:04.798"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Infoseite der Stadt", "https://www.hamburg.de/bvm/mobilwandel2035/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Die Stadt bittet um Beteiligung zur zukünftigen Gestaltung der Luruper Hauptstraße. Das Projekt firmiert unter dem Titel „Mobilwandel 2035“ und wird vom Bundesministerium für Umwelt, Naturschutz und nukleare Sicherheit mitgetragen. Ziel sei die Luruper Hauptstraße fit für den Klimawandel zu machen und ihre Aufenthaltsqualität zu erhöhen. Mögliche Lösungen könnten dann auch auf ähnliche Straßen übertragen werden.</p>

    <p>Die Stadt hatte dazu eine Seite eingerichtet, auf der schriftliche Beiträge bis 31.03.2022 eingereicht werden konnten.</p>

    <.structured_links ref={@ref}/>
    """
  end
end
