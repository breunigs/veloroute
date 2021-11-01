defmodule Data.Article.Blog.Pappelallee do
  use Article.Default

  def name(), do: "#{created_at()}-pappelallee"
  def created_at(), do: ~D[2020-06-26]

  def title(), do: "Pappelallee (Veloroute 7)"

  def start(), do: ~d[2021Q2]

  def type(), do: :planned

  def tags(), do: ["7"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>In der Pappelallee gibt es nur stadtauswärts einen Radweg, Richtung Innenstadt fährt man auf einer überbreiten KFZ-Spur neben oder mit den KFZ. Der Hochbordradweg hat ständig wechselnde Oberflächen, teils sehr unangenehmes Kopfsteinpflaster. Kurzum: besonders toll ist das Radfahren hier nicht.</p> <p>In der vorliegenden Planung wird die Straße zum einen grün – es wird eine Allee angelegt wie man es von vielen anderen Straßen in Hamburg kennt. Zwischen den neuen Bäumen verbleiben die KFZ-Parkplätze, aber es kommen auch neue Fahrrad-Anlehnbügel hinzu.</p> <p>Die Führung des Radverkehrs erfolgt auf Radfahrstreifen, die mit 1,85m nur mäßig breit sind. Dafür gibt es sie beidseitig. Die <.m bounds="10.057179,53.567816,10.061663,53.568854" lon="10.0599108" lat="53.5676212" dir="forward">Querungshilfe an der Menckesallee</.m> bleibt erhalten. Um den notwendigen Platz dafür zu gewinnen werden die Fußwege schmaler und der Radfahrstreifen wird zu einem deutlich engeren Schutzstreifen. Auch die KFZ-Spuren werden um je einen halben Meter schmäler.</p> <p>Kurios: <.m bounds="10.05856,53.568045,10.063044,53.569083" lon="10.0608063" lat="53.5682289" dir="forward">im Brückenbereich</.m> soll der Radfahrstreifen durch Leitborde abgesichert werden – also eine „Protected Bike Lane“ entstehen. Das sind wohlwollened gemessen rund 50m.</p> <p>Die Planung verbessert die Situation für den Radverkehr ungefragt, und auch die Begrünung ist sehr begrüßenswert. Fragwürdig ist jedoch die Entscheidung die Radfahrstreifen so schmal ausfallen zu lassen um weiterhin beidseitig KFZ-Parkplätze anbieten zu können. Dabei geht man davon aus das die ansässigen Firmen allesamt nicht ausgelastete Tiefgaragen haben und daher gar keine Flächen notwendig wären. Dies würde auch eine durchgehende Sicherung des Radfahrstreifens ermöglichen, wenn auch nur in eine Richtung.</p> <p>Angesetzt ist der Umbau für Frühjahr 2021.</p> <p><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1012155">Erläuterungsbereicht und Pläne</.a></p>
    """
  end
end
