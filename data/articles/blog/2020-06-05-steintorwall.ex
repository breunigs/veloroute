defmodule Data.Article.Blog.Steintorwall do
  use Article.Default

  def created_at(), do: ~D[2020-06-05]
  def updated_at(), do: ~D[2020-06-05]
  def title(), do: "Steintorwall (Veloroute 9, Richtung HBF)"

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
    <p>Der Radweg am <.m bounds="10.005257,53.550123,10.006538,53.55286">Steintorwall</.m> ist in beide Richtungen deutlich zu schmal und wird häufig von Leuten zu Fuß mitbenutzt, die selbst wiederrum kaum Platz haben. Bis zum großen Wurf mit der Erweiterung des Hauptbahnhofs soll zumindest auf der Bahnhofsseite Abhilfe geschaffen werden. Die KFZ-Parkplätze entfallen ersatzlos um einen knapp 2m breiten Radfahrstreifen einzurichten. Der ehemalige Radweg wird dem Fußweg zugeschlagen, der damit auf knapp 4m Breite kommt – je nach Laternen und Flaggenmasten.</p> <p>Bei der <.m bounds="10.005921,53.549976,10.007424,53.550507">Querung der Altmannbrücke</.m> werden die Absenkungen des Bordsteines ebenfalls angepasst, sodass man künftig leichter geradeausfahren kann. Da der der Radweg auf dem <.m bounds="10.005734,53.548269,10.006596,53.550233">Klosterwall</.m> jedoch nicht verlegt wird, bleibt es hier etwas kurvig.</p> <p>Umgesetzt werden soll diese Verbesserung bereits ab Juni 2020.</p> <p><.a href="https://www.hamburg.de/mitte/strassenbau-und-verkehr/13920660/">Infoseite der Stadt</.a> (Pläne als Download am Ende der Seite)</p>
    """
  end
end
