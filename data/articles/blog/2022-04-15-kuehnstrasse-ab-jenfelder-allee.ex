defmodule Data.Article.Blog.KuehnstrasseAbJenfelderAllee do
  use Article.Default

  def created_at(), do: ~D[2022-04-15]

  def title(), do: "Kuehnstraße ab Jenfelder Allee (Alltagsroute 5)"

  def summary(),
    do: "Anvisierter Bauzeitraum: 2024 bis 2025. Noch keine Pläne bekannt."

  def type(), do: :intent
  def start(), do: ~d[2024]
  def stop(), do: ~d[2025]

  def tags(), do: ["5", "w25"]

  def links(_assigns) do
    [
      {"Möglicher Bautermin", "Stand 2022",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1016643"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In diesem Abschnitt der Kuehnstraße gibt es keine eigenen Radwege. Der Radverkehr teilt sich im <.ref>Mischverkehr</.ref> die Fahrbahn mit den KFZ. An der Kreuzung mit der <.m bounds="10.125769,53.581522,10.12832,53.583135" lon="10.127042" lat="53.582407" dir="forward" ref="7">Jenfelder Allee</.m> gibt es noch alte <.ref>Hochbordradwege</.ref>, die je nach Richtung schwer zu erreichen bzw. zu verlassen sind. Die Kreuzung mit der <.m bounds="10.131371,53.583898,10.135139,53.585823" lon="10.132449" lat="53.584436" dir="forward" ref="7">Wilsonstraße</.m> wurde vor einigen Jahren umgebaut und bietet Radwegstummel zum <.ref>indirekten Linksabbiegen</.ref>.</p>

    <h4>Vorhaben</h4>
    <p>Der Abschnitt wurde in die Baustellenplanung aufgenommen. Pläne sind noch nicht bekannt.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
