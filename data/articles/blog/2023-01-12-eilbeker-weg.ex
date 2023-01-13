defmodule Data.Article.Blog.EilbekerWeg do
  use Article.Default

  def title(),
    do: "Eilbeker Weg (Höhe S-Bahn Brücke)"

  def summary(),
    do: "Radfahrstreifen wird verlängert"

  def start(), do: ~d[2023Q2]
  def stop(), do: ~d[2023Q2]

  def type(), do: :planned
  def tags(), do: []

  def links(_assigns) do
    [
      {"Lageplan und Erläuterungen", "Januar 2023",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1017992"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der <.ref>Radfahrstreifen</.ref> endet an der Börnestraße. Der Radverkehr wird auf den Fußweg geleitet („<.ref>Fahrrad frei</.ref>“).</p>

    <h4>Planung</h4>
    <p>Der Radfahrstreifen wird verlängert und erhält eine neue Aufleitung auf den <.ref>Hochbordradweg</.ref> kurz vor der Kreuzung.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
