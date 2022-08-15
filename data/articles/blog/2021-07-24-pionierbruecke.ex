defmodule Data.Article.Blog.Pionierbruecke do
  use Article.Default

  def created_at(), do: ~D[2021-07-24]

  def title(), do: "Pionierbrücke (Freizeitroute 4)"

  def start(), do: ~d[2022-10]
  def stop(), do: ~d[2023-02]

  def type(), do: :construction

  def tags(), do: ["FR4"]

  def links(_assigns) do
    [
      {"Zeitungsartikel zum Baufortschritt", "März 2022",
       "https://www.abendblatt.de/region/stormarn/reinbek/article234723011/Neue-Pionierbruecke-ist-da-und-bleibt-weiter-gesperrt.html"},
      {"Baustelleninfo", "Juni 2021",
       "https://web.archive.org/web/20210725075646/https://lsbg.hamburg.de/contentblob/15272918/9b50693c9218d8495bca494d8dbe9f5b/data/pionierbruecke-06-2021-bis-12-2021.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand August 2022</h4>
    <p>Der Brückenteil auf Hamburger Seite wurde erneuert. Auf Reinbeker Seite steht noch die alte, unbefahrbare Holzkonstruktion, die durch Bauzäune abgesperrt ist. Diese soll erst später ersetzt werden.</p>

    <h4>Alter Zustand</h4>
    <p>Die Pionierbrücke ist eine in die Jahre gekommene Holzbrücke. Sie schließt an die Freizeitroute 4 an und ermöglicht eine Weiterfahrt in Schleswig-Holstein.</p>

    <h4>Planung</h4>
    <p>Die Brücke soll durch einen Neubau ersetzt werden.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
