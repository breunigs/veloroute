defmodule Data.Article.Blog.Parkstrasse do
  use Article.Default

  def created_at(), do: ~D[2022-04-15]

  def title(), do: "Parkstraße (Alltagsroute 1 und 14)"
  def summary(), do: "Kanalsanierung erfordert Umleitung Richtung Innenstadt/Richtung Süden"

  def type(), do: :construction

  def tags(), do: ["1", "14"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Parkstraße",
        direction: :forward,
        from: "Waitzstraße",
        to: "Jungmannstraße",
        parent_ref: __MODULE__,
        text: "Umleitung Veloroute 14 Richtung Innenstadt",
        videos: [
          {"2022-05-15-13im-14gg/GX013956", "00:00:49.016", "00:01:20.280"},
          {"2022-05-15-13im-14gg/GX013956", "00:01:23.250", "00:01:34.761"}
        ]
      }
    ]

  def text(assigns) do
    ~H"""
    <h4>Baustelle</h4>
    <p>Die Baustelle ist eine Einbahnstraße Richtung Norden. Teilweise sind die Fußwege frei auf denen geschoben werden kann. In Richtung Innenstadt bzw. Süden ist eine Einbahnstraße eingerichtet.</p>
    """
  end
end
