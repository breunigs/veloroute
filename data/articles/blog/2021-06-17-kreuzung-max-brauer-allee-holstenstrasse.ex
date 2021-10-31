defmodule Data.Article.Blog.KreuzungMaxBrauerAlleeHolstenstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-kreuzung-max-brauer-allee-holstenstrasse"
  def created_at(), do: ~D[2021-06-17]
  def updated(), do: ~D[2021-07-24]
  def title(), do: "Kreuzung Max-Brauer-Allee / Holstenstraße"

  def start(), do: ~d[2021-07-25]
  def stop(), do: ~d[2022-06-11]

  def type(), do: :construction
  def construction_site_id_hh(), do: [14983]
  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        group: "article",
        direction: :forward,
        from: "",
        to: "",
        parent_ref: __MODULE__,
        text: "Max-Brauer-Allee, Sternschanze → Altona",
        videos: [
          {"2021-04-04-freizeitroute-12-speedup-5x/GX011181", "00:00:16.000", "00:00:25.000"}
        ]
      }
    ]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Es stehen für alle Richtungen <ref>Hochbordradwege</ref> zur Verfügung. Die Breite und Ebenheit ist unterschiedlich, entlang der Holstenstraße meist jedoch schlechter. Hier wird der Radverkehr auch durch den Einstiegsbereich der Bushaltestellen geführt. Im gesamten Abschnitt darf alternativ auch die Fahrbahn genutzt werden.</p>
    <h4>Planung</h4> <p>Neu geplant sind mindestens 1,85m breite <ref>Radfahrstreifen</ref> für alle Richtungen. Linksabbiegen geht nur <ref>indirekt</ref>, da zum direkten Abbiegen mehrere KFZ-Spuren gleichzeitig gekreuzt werden müssten.</p> <p>Die Radspuren werden alle rot eingefärbt und verlaufen mit einer Ausnahme am Fahrbahnrand. In Fahrtrichtung Innenstadt entlang der Holstenstraße beginnt <.m bounds="9.947343,53.559335,9.949996,53.559942">kurz nach dem Zweiseweg</.m> ein zwei Meter breiter <ref>Radfahrstreifen in Mittellage</ref>. Rund 100m lang wird der Radverkehr so an die Kreuzung herangeführt.</p>
    <p>An den Bushaltestellen ist auch bei wartenden Bussen eine Vorbeifahrt möglich. An der <.m bounds="9.94688,53.558396,9.949528,53.559491">nordwestlichen Ecke</.m> soll eine StadtRAD Station hinzukommen.</p>
    <h4>Meinung</h4> <p>Die 2018 abgeschlossene Planung war für den Radverkehr katastrophal. Nur Mindestmaße von 1,60m gepaart mit ewig langer Führung zwischen zwei KFZ-Spuren, was selbst für Geübte unangenehm ist. Durch Engagement von Anjes Tjarks und seiner Belegschaft wurde die Planung nochmals überarbeitet und für den Radverkehr stark verbessert. Den Radfahrstreifen in Mittellage gibt's jetzt nur noch an einer Stelle, und dort auch deutlich breiter als zuvor. Den zusätzlichen Platz für die Radfahrstreifen nahm man meist von KFZ-Parkplätzen, manchmal leider auch von den Fußwegen.</p> <p>Insgesamt ist die Umgestaltung bezogen auf den Radverkehr solide. Im Vergleich zu den je 6 KFZ-Spuren pro Kreuzungsarm bleiben sie jedoch mikrig. Dies dürfte analog auch für die Aufenthaltsqualität an der Kreuzung gelten – war schlecht, bleibt schlecht, aber immerhin kommt man bald besser wieder von der Kreuzung weg. </p>
    <h4>Quelle</h4> <ul>
    <li><.a href="https://lsbg.hamburg.de/stadtstrassen/5828548/max-brauer-allee/">Infoseite der Stadt</.a> (Pläne finden sich um Fließtext hinter „hier“ Links)</li>
    <li><.a href="https://lsbg.hamburg.de/contentblob/15174848/d7a7efa724941b75e17de3168a69f2c7/data/max-brauer-allee-1-bauabschnitt-juni-20.pdf">Baustelleninfo Juli 2021</.a></li>
    <li><.a href="https://lsbg.hamburg.de/contentblob/15012542/311c6aa17781fe377bb2282069b713a9/data/max-brauer-allee-bericht-schlussverschickung-nachtrag.pdf">überarbeiteter Lageplan (2021)</.a></li>
    <li><.a href="https://twitter.com/anjes_tjarks/status/1418675570943139843">Senator Anjes Tjarks zu Planänderungen</.a> (Twitter)</li>
    </ul>
    """
  end
end
