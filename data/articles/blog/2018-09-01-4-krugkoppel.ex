defmodule Data.Article.Blog.Krugkoppel do
  use Article.Default

  def name(), do: "#{created_at()}-4-krugkoppel"
  def created_at(), do: ~D[2018-09-01]
  def updated(), do: ~D[2020-05-31]
  def title(), do: "Krugkoppel (Veloroute 4)"

  def start(), do: ~d[2018Q4]
  def stop(), do: ~d[2019Q3]

  def type(), do: :finished

  def tags(), do: [4]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand 2020:</strong> Der Umbau der Brücke ist abgeschlossen und die Radfahrstreifen lassen sich durchgehend befahren. Das Linksabbiegen in den Leinpfad ist jetzt leichter, erfordert aber immer noch Übung wenn man trotz Schulterblick und Gegenverkehrs zügig abbiegen möchte.</p>
    <p>Die Radwege sollen beidseitig durch 2,25m breite Fahrradstreifen ersetzt werden. Die aktuell beampelte Kreuzung am Harvestehuder Weg wird durch einen kleinen Kreisel ersetzt. Besonders: Aus Süden kommend soll ein Bypass den Radverkehr am Kreisel vorbeischleusen.</p> <p>Auf der anderen Seite, also der Einmündung am Leinpfad, wird es nur eine Querungshilfe für Linksabbieger Richtung Norden geben. Auch Richtung Innenstadt muss der Radverkehr aus dem Leinpfad dem Verkehr auf der Fernsicht Vorfahrt gewähren – da man jedoch direkt auf den Radfahrstreifen fahren kann, sollte dies beim Folgen der Veloroute 4 kein Problem darstellen. Weitere Infos:</p> <ul>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/9681956/6c5dcc79dc60a326c3408aff4f67e183/data/alster-fahrradachsen-krugkoppel-bis-fernsicht-abgestimmte-planung-plan.pdf">vorläufiger Lageplan</.a>
    </li>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/9681702/7b5274de08bdb5d0a490e6153eaebf2a/data/alster-fahrradachsen-krugkoppel-bis-fernsicht-abgestimmte-planung-bericht.pdf">Erläuterungsbericht zur Umgestaltung</.a>
    </li>
    </ul>
    """
  end
end
