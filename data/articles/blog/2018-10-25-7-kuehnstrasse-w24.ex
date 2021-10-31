defmodule Data.Article.Blog.KuehnstrasseW24 do
  use Article.Default

  def name(), do: "#{created_at()}-7-kuehnstrasse-w24"
  def created_at(), do: ~D[2018-10-25]

  def title(), do: "Kuehnstraße (zw. Jenfelder Straße und Jenfelder Allee, Veloroute 7)"

  def start(), do: ~d[2020-03-23]
  def stop(), do: ~d[2021-04-01]

  def type(), do: :finished

  def tags(), do: [7, "w24"]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>In der vorliegenden Planung werden die unbenutzbaren Radwege durch ordentliche Radfahrstreifen ersetzt – durchgängig mit mehr als 2,0m Breite, meist 2,15m. Zusätzlich wird die Abflussrinne zwischen KFZ und Radspur angebracht, was eine zusätzliche optische Trennung bewirkt. Die Markierungen werden als „Rüttelstreifen“ ausgeführt, sodass KFZ doppelt daran erinnert werden, das sie ihre Spur verlassen.</p> <p>An den Bushaltestellen ist genug Platz um auch bei Gegenverkehr am Bus vorbeifahren zu können. Auf indirektes Linksabbiegen wird meist verzichtet, immerhin wird direktes Linksabbiegen aber ordentlich markiert. Ausnahme bildet hier die Kreuzung mit der <.m bounds="10.105412,53.573928,10.135253,53.580793">Jenfelder Straße</.m>.</p> <p>Auf Höhe des <.m bounds="10.117274,53.577695,10.124257,53.580997">Albert-Schweitzer-Ring</.m> wird am Zuweg des <.m bounds="10.122854,53.575248,10.127732,53.577864">Jenfelder Moorpark</.m>s eine neue StadtRAD Station eingerichtet. Die Kreuzung mit der <.m bounds="10.124568,53.571022,10.128716,53.586101">Jenfelder Allee</.m> wird in einer weiteren Maßnahme umgebaut.</p> <p>Was will man mehr? Sähe die Planung überall so aus, wäre der gewünschte Radverkehrsanteil binnen weniger Jahre erreicht.</p> <p><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1009152">Erläuterungsbericht zur Umgestaltung mit vorläufigem Lageplan</.a> (unter Anlagen)<br><.a href="https://www.hamburg.de/wandsbek/strassenbaustellen/14296850/">Infoseite der Stadt zur Baustelle</.a></p>
    """
  end
end
