defmodule Data.Article.Blog.QuerungOberbaumbrucke do
  use Article.Default

  def name(), do: "#{created_at()}-9-querung-oberbaumbrucke"
  def created_at(), do: ~D[2018-07-02]
  def updated(), do: ~D[2020-06-04]
  def title(), do: "Querung Oberbaumbrücke (Veloroute 9 stadtauswärts)"

  def start(), do: ~d[2020-06]

  def type(), do: :finished

  def tags(), do: ["9"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Um der Veloroute 9 stadtauswärts zu folgen muss hier die  vierspurige <.m bounds="10.002446,53.545509,10.005807,53.547652">Oberbaumbrücke</.m> gequert werden. Bei 50km/h und viel KFZ-Verkehr ist dies aber nicht ganz einfach.</p> <p>Das hat auch die Stadt erkannt und will demnächst eine Verkehrsinsel in der Straßenmitte aufstellen. Der dafür notwendige Platz wird durch die Verringerung der KFZ-Spuren auf eine pro Fahrtrichtung gewonnen. Dies soll zunächst als „Verkehrsversuch“ stattfinden, die Verkehrsinsel ist also zunächst nur provisorisch.</p> <p>Wer stattdessen geradeaus weiter, also Richtung HafenCity möchte bekommt eine winzige Ableitung vom Hochbordradweg auf die Fahrbahn. Unzureichend, aber besser als bisher. Eine größere Umplanung wird mit Verweis auf die Hauptbahnhoferweiterung und den Umbau des Deichtorplatzes aufgeschoben.</p> <p><.a href="https://www.hamburg.de/mitte/strassenbau-und-verkehr/13920660/">Infoseite der Stadt</.a> (Pläne als Download am Ende der Seite)</p>
    """
  end
end
