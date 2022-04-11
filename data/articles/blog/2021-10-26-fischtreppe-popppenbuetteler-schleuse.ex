defmodule Data.Article.Blog.FischtreppePopppenbuettelerSchleuse do
  use Article.Default

  def name(), do: "#{created_at()}-fischtreppe-poppenbuetteler-schleuse"
  def created_at(), do: ~D[2021-10-26]
  def title(), do: "Poppenbütteler Schleuse (Freizeitroute 1)"

  def summary(),
    do:
      "Umleitung der Freizeitroute 1 an der Poppenbütteler Schleuse wegen Bau einer Fischtreppe."

  def start(), do: ~d[2021-10-25]
  def stop(), do: ~d[2021-12-31]
  def type(), do: :finished
  def tags(), do: ["FR1"]

  def links(_assigns) do
    [
      {"Pressemitteilung Wandsbek",
       "https://www.hamburg.de/wandsbek/pressemitteilungen/15525166/2021-10-26-fischdurchgaengigkeit-poppenbuetteler-schleuse/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Baustelle</h4>
    <p>An der Poppenbütteler Schleuse wird eine Fischtreppe gebaut, wobei die Brücke dort aus Sicherheitsgründen voll gesperrt wird. Die Freizeitroute wird daher über den Saseler Damm, entlang der <.a href="/alltagsroute-14">Alltagsroute 14</.a>, umgeleitet.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
