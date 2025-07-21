defmodule Data.Article.Blog.Grelckstrasse do
  use Article.Default

  def created_at(), do: ~D[2021-09-07]

  def title(), do: "Grelckstraße (Veloroute 3)"

  def start(), do: ~d[2021Q4]
  def stop(), do: ~d[2022Q3]
  # commented out because this is only for the experiments, not
  # reconstruction
  # def construction_site_id_hh(), do: [21488]

  def type(), do: :finished

  def tags(), do: ["radroute-3", "3"]

  def links(_assigns) do
    [
      {
        "Infoseite der Stadt",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/bezirksamt-eimsbuettel/themen/mobilitaet/grelckstrasse-60976"
      }
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Die Grelckstraße ist zum größten Teil verkehrsberuhigt und wird auch benutzt um den Wochenmarkt zu veranstalten. Alle Verkehrsarten teilen sich dabei die Fläche, wobei der Fußverkehr stellenweise auch eigene Gehwege hat.</p>
    <h4>Verkehrsversuch</h4> <p>Der Bezirk will zwei verschiedene Neuregelungen des Verkehrs ausprobieren. Eine Idee sieht vor die Straße als Einbahnstraße einzurichten, die weiterhin alle Verkehrsarten zulässt. Die andere Idee ist eine Fußgängerzone, mit Ausnahmen für Liefer- und Radverkehr. Die Details und genauen Zeiträume liegen noch nicht fest. </p>
    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
