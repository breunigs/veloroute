defmodule Data.Article.Blog.Stresemannallee do
  use Article.Default

  def name(), do: "#{created_at()}-3-stresemannallee"
  def created_at(), do: ~D[2018-10-13]

  def title(), do: "Stresemannallee (Veloroute 3)"

  def start(), do: ~d[2019-08-05]
  def stop(), do: ~d[2020-12-20]

  def type(), do: :finished

  def tags(), do: ["3"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die Stresemannallee soll ab dem 5. August 2019 umgebaut werden. Auf Höhe der <.m bounds="9.956442,53.582752,9.968593,53.586238">Troplowitzstraße</.m> wird der Zweirichtungsradweg zurückgebaut und durch je einen Schutzstreifen pro Fahrtrichtung ersetzt. Auf Höhe des <.m bounds="9.951925,53.590541,9.959034,53.592805">Lohkoppelweg</.m> reicht der Platz dafür nicht mehr aus und man wollte keine Parkplätze verlieren, sodass der Fahrräder hier im Mischverkehr mit den KFZ mitschwimmen müssen. Die Schutzstreifen werden mit 1,25m in absolutem Mindestmaß ausgeführt, sodass die KFZ die Überholabstände in der Regel wohl nicht einhalten werden.</p> <p>Die ursprüngliche Präsentation ist an mehreren Stellen veraltet: Der eingezeichnete Kreisel an der Einmündung beim <.m bounds="9.958202,53.585875,9.967731,53.599176">Grandweg</.m> wird nicht gebaut, es bleibt hier beim Rechts-vor-Links. Am <.m bounds="9.951925,53.590541,9.959034,53.592805">Lohkoppelweg</.m> wird es keine Verkehrsinsel zum „Schutz“ der Radfahrenden geben, die stattdessen im Reisverschlussprinzip in den Mischverkehr übergehen können.</p> <p>Zwischen <.m bounds="9.846771,53.580508,9.957629,53.632863">Eidelstedter Weg</.m> und <.m bounds="9.956442,53.582752,9.968593,53.586238">Troplowitzstraße</.m> bleibt der Zweirichtungsradweg vorerst erhalten. Dank eines Aufstellbereichs vor den KFZ kann man stadteinwärts aber brauchbar auf diesen wechseln. Vermutlich ist irgendwann Umgestaltung dieser Kreuzung geplant, sodass man diese erstmal so lässt. Leider gibt es bisher noch keine Anschlussplanung.</p> <ul>
    <li><.a href="https://www.hamburg.de/eimsbuettel/stresemannallee">Infoseite der Stadt zur Stresemannallee</.a></li>
    <li>
    Detaillierte Lagepläne, Richtung stadtauswärts:
    <ul>
      <li><.a href="https://www.hamburg.de/contentblob/9223530/3bdbed19c752ec9780590bd6acddce33/data/stresemannallee-abschnitt1.pdf">Abschnitt 1, Troplowitzstraße bis ca. Deepenstöcken</.a></li>
      <li><.a href="https://www.hamburg.de/contentblob/9223532/9a0355d58cd8def86a911ab7bd634b7a/data/stresemannallee-abschnitt2.pdf">Abschnitt 2, ca. Herlingsburg bis Glockenblumenweg</.a></li>
      <li><.a href="https://www.hamburg.de/contentblob/9223534/645c6b8c111e91fdfe3e8d6324b9e0fb/data/stresemannallee-abschnitt3.pdf">Abschnitt 3, Glockenblumenweg bis Veilchenweg</.a></li>
      <li><.a href="https://www.hamburg.de/contentblob/9223536/ab1d259583e77b52e843283e5e4f5760/data/stresemannallee-abschnitt4.pdf">Abschnitt 4, ca. Veilchenweg bis Lohkoppelweg</.a></li>
      <li><.a href="https://www.hamburg.de/contentblob/9223538/2c126896680dcede1d55146f58053e23/data/stresemannallee-abschnitt5.pdf">Abschnitt 5, ca. Lohkoppelweg bis Henning-Wulf-Weg</.a></li>
      <li><.a href="https://www.hamburg.de/contentblob/12775642/c580e219163522bf964a7245d860a1d6/data/stresemannallee-abschnitt6.pdf">Abschnitt 6, Henning-Wulf-Weg bis Grandweg</.a></li>
    </ul>
    </li>
    </ul>
    """
  end
end
