defmodule Data.Article.Blog.Rehrstieg do
  use Article.Default
  def created_at(), do: ~D[2022-09-08]
  def title(), do: "Rehrstieg (Alltagsroute 10)"

  def summary(),
    do:
      "Rehrstieg könnte vom Januar bis August 2023 umgebaut werden – Pläne liegen noch nicht vor"

  def type(), do: :intent
  def tags(), do: ["10", "H10.3"]

  def start(), do: ~d[2023-01]
  def stop(), do: ~d[2023-08]

  def links(_assigns) do
    [
      {"Möglicher Bauzeitraum", "September 2022",
       "https://sitzungsdienst-harburg.hamburg.de/bi/vo020.asp?VOLFDNR=1009916"},
      {"BVM zum Rehrstieg", "August 2022",
       "https://sitzungsdienst-harburg.hamburg.de/bi/vo020.asp?VOLFDNR=1009879"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der nach dem Gleisstieg angedeutete Zweirichtungsradweg endet nach wenigen Metern und es muss abgestiegen und geschoben werden. Wer bei der Fahrt Richtung Striepenweg nicht umsteigen möchte, muss einen Umweg unter der Bahnlinie in Kauf nehmen.</p>

    <h4>Baustellenkoordinierung</h4>
    <p>Für den Rehrsteg ist ein Baufenster von Januar bis August 2023 eingeplant worden. Genaueres wurde dazu noch nicht veröffentlicht. Die <.abbr>BVM</.abbr> sagte aber, dass bereits an den Umleitungen für die Bauzeit gearbeitet werde. Das spricht dafür, dass die grundlegende Planung weit fortgeschritten ist.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
