defmodule Data.Article.Blog.Rehrstieg do
  use Article.Default
  def updated_at(), do: ~D[2023-02-09]
  def title(), do: "Rehrstieg (Alltagsroute 10)"

  def summary(),
    do: "Rehrstieg/Striepenweg soll zu einem Kreisverkehr umgebaut werden"

  def type(), do: :construction
  def tags(), do: ["10", "H10.3"]

  def start(), do: ~d[2024-02-26]
  def stop(), do: ~d[2024-09-27]
  def construction_site_id_hh(), do: [693_006, 693_017]

  def links(_assigns) do
    [
      {"Pressemitteilung Umbaustart", "Februar 2024",
       "https://www.hamburg.de/harburg/pressemeldungen/18234646/umbau-kreuzung-rehrstieg-striepenweg/"},
      {"Ausschreibung Umbau", "Oktober 2023",
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/api/external/deeplink/subproject/9699324e-a65c-46f9-85e5-78765245425a"},
      {"Lagepläne und Erläuterungsbericht",
       "https://fragdenstaat.de/anfrage/umbau-rehrstieg-striepenweg/#nachricht-771287"},
      {"Möglicher Bauzeitraum", "September 2022",
       "https://sitzungsdienst-harburg.hamburg.de/bi/vo020.asp?VOLFDNR=1009916"},
      {"BVM zum Rehrstieg", "August 2022",
       "https://sitzungsdienst-harburg.hamburg.de/bi/vo020.asp?VOLFDNR=1009879"},
      {"Beschreibung Umbau", "März 2022",
       "https://sitzungsdienst-harburg.hamburg.de/bi/vo020.asp?VOLFDNR=1009431#allrisBV"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der nach dem Gleisstieg angedeutete Zweirichtungsradweg endet nach wenigen Metern und es muss abgestiegen und geschoben werden. Wer bei der Fahrt Richtung Striepenweg nicht umsteigen möchte, muss einen Umweg unter der Bahnlinie in Kauf nehmen. An der Einmündung des Striepenweg gibt es eine Ampel mit langen Schaltzeiten.</p>

    <h4>Planung</h4>
    <p>Die Einmündung soll zu einem Kreisverkehr umgebaut werden. Der 4,0m breite Zweirichtungsradweg vom Gleisstieg wird bis zum Kreisel verlängert und dort gleichberechtigt angeschlossen. Zum Bauerhalt dort nur mit 3,0m Breite und einem leichten Schlenker.</p>

    <p>Im Striepenweg soll im <.ref>Mischverkehr</.ref> gefahren werden. Die alten <.ref>Hochbordradwege</.ref> bleiben erhalten und können optional benutzt werden.</p>

    <h4>Meinung</h4>
    <p>Auch wenn der Schlenker etwas umständlich anmutet, ist die Lösung gut geworden. Statt vormals ewiger Wartezeiten an der Ampel kann man nun viel häufiger ohne Anhalten vorankommen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
