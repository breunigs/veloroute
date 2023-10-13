defmodule Data.Article.Blog.HufnerstrasseReesestrasse do
  use Article.Default

  def created_at(), do: ~D[2020-11-14]

  def title(), do: "Reese- und Hufnerstraße (Veloroute 5)"

  def start(), do: ~d[2022Q2]
  def stop(), do: ~d[2023-08-30]

  def type(), do: :finished

  def tags(), do: ["5"]

  def links(_assigns) do
    [
      {"Pressemitteilung zur Fertigstellung", "Oktober 2023",
       "https://www.hamburg.de/bvm/medien/17410972/2023-10-12-bvm-radverkehr/"},
      {"Erläuterungsbericht und Pläne (fertige Fassung)",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1011214"},
      {"Baustellenkoordination", "Juli 2022",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1011989"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In Fahrtrichtung Süden fährt man auf einem <.ref>Hochbordradweg</.ref>, der mit wechselnden Bodenbelägen und leichten Unebenheiten deutlich in die Jahre gekommen ist. Die Kreuzungen bzw. Einmündungen ermöglichen größtenteils eine geradlinige Fahrt entlang der Veloroute. Die Situation in Richtung Norden ist vergleichbar.</p>

    <h4>Planung</h4>
    <p>Vorgesehen ist die Altradwege zurückzubauen und durch 2,25m breite <.ref>Radfahrstreifen</.ref> zu ersetzen. Den Platz gewinnt indem man die vier KFZ-Spuren auf zwei reduziert. Die Flächen der alten Radwege werden den Fußwegen zugeschlagen.</p>

    <p>Alle weiteren Änderungen sind im Wesentlichen Details: leicht versetzte Ampeln und Querungsfurten, neue Bäume, Radanlehnbügel und Sitzbänke, angepasste KFZ-Parkplätze. Letztere werden mit rund 90cm Sicherheitsabstand zum Radfahrstreifen gebaut. In den Kreuzungen wird der Radverkehr stets rechts von den KFZ-Spuren geführt, die umstrittenen <.ref>Radfahrstreifen in Mittellage</.ref> kommen nicht zum Einsatz. Die Ampeln bleiben und ermöglichen dem Radfahrenden entweder <.ref name="abbiegen">direkt oder indirekt</.ref> abzubiegen.</p>

    <p>An den Ausbaugrenzen wird jeweils zum alten Radwegsbestand übergeleitet. Ausnahme ist das <.m bounds="10.040871,53.58162,10.043803,53.583089">Verbindungsstück der Hufnerstraße</.m> zum Barmbeker Markt: hier wird der alte Radweg entfernt und der Radverkehr künftig gemeinsam mit KFZ auf der <.ref>Fahrbahn</.ref> geführt. In der <.m bounds="10.039948,53.582617,10.041805,53.583548">Brucknerstraße</.m> werden wegen neuer KFZ-Parkplätze die Gehwege und Fahrbahn schmaler, auf letzterer ergibt sich eine Engstelle.</p>

    <h4>Meinung</h4>
    <p>Die Planung zeigt, wie verschwenderisch viel Platz zwei KFZ-Spuren verbrauchen. Mit Ausnahme der KFZ-Fahrspuren erhalten alle anderen Verkehrsarten mehr Platz, inklusive des „ruhenden Verkehrs“ in Form von Bänken, Parkplätzen und Anlehnbügeln. Zu kritisieren sind die fehlenden Ampeln für indirektes Abbiegen – zwar kann man so sofort Abbiegen wenn frei ist, was aber häufig schwer zu erkennen ist. In der Praxis orientieren sich viele an den Fußampeln, obwohl diese gar nicht für diese gelten. Dies sind aber alles Feinheiten, die grobe Planung ist vor allem eins: sehr gut.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
