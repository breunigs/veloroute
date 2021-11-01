defmodule Data.Article.Blog.Pionierbruecke do
  use Article.Default

  def name(), do: "#{created_at()}-pionierbruecke"
  def created_at(), do: ~D[2021-07-24]

  def title(), do: "Pionierbrücke (Freizeitroute 4)"

  def start(), do: ~d[2021-06]
  def stop(), do: ~d[2021-12]

  def type(), do: :construction

  def tags(), do: ["FR4"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Die Pionierbrücke ist eine in die Jahre gekommene Holzbrücke. Sie schließt an die Freizeitroute 4 an und ermöglicht eine Weiterfahrt in Schleswig-Holstein.</p>
    <h4>Planung</h4> <p>Die Brücke soll durch einen Neubau ersetzt werden.</p>
    <h4>Quelle</h4> <p><.a href="https://lsbg.hamburg.de/contentblob/15272918/9b50693c9218d8495bca494d8dbe9f5b/data/pionierbruecke-06-2021-bis-12-2021.pdf">Baustelleninfo Juni 2021</.a></p>
    """
  end
end
