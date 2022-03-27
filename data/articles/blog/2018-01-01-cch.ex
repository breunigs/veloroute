defmodule Data.Article.Blog.Cch do
  use Article.Default

  def created_at(), do: ~D[2018-01-01]

  def title(), do: "CCH / Tiergartenstraße (Freizeitrouten 9 und 10)"

  def start(), do: ~d[2017]
  def stop(), do: ~d[2022]

  def type(), do: :finished

  def tags(), do: ["FR9", "FR10"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 1,
        group: "detour",
        direction: :forward,
        from: "",
        to: "",
        parent_ref: __MODULE__,
        text: "Umleitung Tiergartenstraße",
        videos: [
          {"2021-08-01-freizeit9-anfang/GX012481", "00:00:03.070", :end}
        ]
      },
      %Video.Track{
        renderer: 1,
        group: "detour",
        direction: :backward,
        from: "",
        to: "",
        parent_ref: __MODULE__,
        text: "Umleitung Tiergartenstraße",
        videos: [
          {"2021-08-01-freizeit9-anfang/GX012472", "00:00:15.949", :end},
          {"2021-08-01-freizeit9-anfang/GX012473", :start, :end},
          {"2021-08-01-freizeit9-anfang/GX012474", :start, :end},
          {"2021-08-01-freizeit9-anfang/GX012475", :start, :end},
          {"2021-08-01-freizeit9-anfang/GX012476", :start, :end}
        ]
      }
    ]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Baustelle</h4>
    <p>Im Rahmen des Umbau des CCHs wurde auch die Tiergartenstraße vollgesperrt. Für die Freizeitrouten bietet es sich an Planten un Blomen auf der anderen Seite zu umfahren.</p>

    <h4>Quelle</h4>
    <p><.a href="https://de.wikipedia.org/wiki/Congress_Center_Hamburg">Wikipedia</.a></p>
    """
  end
end
