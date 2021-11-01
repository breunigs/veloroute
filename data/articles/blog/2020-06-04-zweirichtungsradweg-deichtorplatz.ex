defmodule Data.Article.Blog.ZweirichtungsradwegDeichtorplatz do
  use Article.Default

  def name(), do: "#{created_at()}-zweirichtungsradweg-deichtorplatz"
  def created_at(), do: ~D[2020-06-04]

  def title(), do: "Zweirichtungsradweg Deichtorplatz"

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
    <p>Um Radfahrenden aus der <.m bounds="10.006387,53.539979,10.032412,53.548094">Amsinckstraße</.m> ein legales Weiterfahren zu ermöglichen wird der Radweg auf der Süd- bzw. Westseite der Kreuzung zu einem Zweirichtungsradweg erweitert. Dieser erreicht immerhin 2,50m Breite, die durch geringere Sicherheitsabstände zu den KFZ-Spuren, entfernen von Gebüsch und teilweise auf Kosten des Fußweges gewonnen werden.</p> <p>Es handelt sich um eine vorübergehende Verbesserung, bis der Deichtorplatz komplett umgebaut werden kann, was auch mit der Erweiterung des Hauptbahnhof abgestimmt werden muss. Denn auch nach dieser Maßnahme bleibt Geradeausfahren mit dem Rad viel zu umständlich.</p> <p><.a href="https://www.hamburg.de/mitte/strassenbau-und-verkehr/13920660/">Infoseite der Stadt</.a> (Pläne als Download am Ende der Seite)</p>
    """
  end
end
