defmodule Data.Article.Blog.Rehrstieg do
  use Article.Default
  def created_at(), do: ~D[2022-09-08]
  def title(), do: "Rehrstieg (Alltagsroute 10)"

  def summary(),
    do:
      "Rehrstieg/Striepenweg soll vom Januar bis August 2023 zu einem Kreisverkehr umgebaut werden"

  def type(), do: :construction
  def tags(), do: ["10", "H10.3"]

  def start(), do: ~d[2023-01]
  def stop(), do: ~d[2023-08]

  def links(_assigns) do
    [
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

    <h4>Vorhaben</h4>
    <p>Die Einmündung soll zu einem Kreisverkehr umgebaut werden. Der Radverkehr soll dabei im <.ref>Mischverkehr</.ref> fahren.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
