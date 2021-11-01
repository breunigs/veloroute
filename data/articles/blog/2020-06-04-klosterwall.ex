defmodule Data.Article.Blog.Klosterwall do
  use Article.Default

  def name(), do: "#{created_at()}-klosterwall"
  def created_at(), do: ~D[2020-06-04]
  def updated(), do: ~D[2020-06-04]
  def title(), do: "Klosterwall (Veloroute 9)"

  def start(), do: ~d[2020-07-15]
  def stop(), do: ~d[2021-02-28]

  def type(), do: :finished
  def construction_site_id_hh(), do: [9332]
  def tags(), do: ["9"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Im Zuge anderer kleiner Verbesserungen soll der Radweg Richtung Hauptbahnhof am Klosterwall neu gepflastert werden. Ein wirklicher Umbau wird erst mit dem Umbau des Deichtorplatzes oder der Erweiterung des Hauptbahnhofs erfolgen. Sowohl Rad- als auch Fußwege bleiben unter den heute verpflichtenden Mindestbreiten.</p> <p><.a href="https://www.hamburg.de/mitte/strassenbau-und-verkehr/13920660">Infoseite der Stadt</.a> (Pläne als Download am Ende der Seite)</p>
    """
  end
end
