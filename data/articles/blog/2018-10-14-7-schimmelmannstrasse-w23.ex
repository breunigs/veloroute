defmodule Data.Article.Blog.SchimmelmannstrasseW23 do
  use Article.Default

  def name(), do: "#{created_at()}-7-schimmelmannstrasse-w23"
  def created_at(), do: ~D[2018-10-14]

  def title(), do: "Schimmelmannstraße (Veloroute 7)"

  def start(), do: ~d[2020-03-23]
  def stop(), do: ~d[2021-03]

  def type(), do: :finished

  def tags(), do: [7, "w23"]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die Baumaßnahme betrifft die <.m bounds="10.090807,53.569778,10.226157,53.676902">Schimmelmannstraße</.m> nur zwischen der bereits umgebauten Kreuzung mit dem <.m bounds="10.102211,53.565495,10.107497,53.579989">Holstenhofweg</.m> und bis vor der Kreuzung mit der <.m bounds="10.105412,53.573928,10.135253,53.580793">Jenfelder Straße</.m>. Letztere wird in einer anderen Baumaßnahme verbessert. Die Umbauarbeiten für die Schimmelmannstraße sollen im Frühjahr 2019 beginnen.</p> <p>Die momentan vorhandenen schmalen und unebenen Radwege sollen künftig durch 2,25m breite Radfahrstreifen ersetzt werden. In den Kreuzungsbereichen fallen diese teilweise schmaler aus und messen vom <.m bounds="10.102211,53.565495,10.107497,53.579989">Holstenhofweg</.m> stadtauswärts nur 1,80m oder an der Kreuzung mit der <.m bounds="10.105412,53.573928,10.135253,53.580793">Jenfelder Straße</.m> in beiden Richtungen etwa 2,0m.</p> <p>Stadteinwärts wird die ungünstige und verwirrende Abbiegesituation am <.m bounds="10.102211,53.565495,10.107497,53.579989">Holstenhofweg</.m> erheblich verbessert: wer gerade aus der Veloroute folgen möchte, kann jetzt einfach auf seiner Spur bleiben und muss nicht mehr über den KFZ-Rechtsabbieger kreuzen. Rechtsabbiegende Radfahrende fädlen sich einfach vom Radfahrstreifen mit in den Rechtsabbiegerspur mit ein.</p> <p><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1008585">Erläuterungsbericht zur Umgestaltung mit vorläufigem Lageplan</.a> (unter Anlagen)<br><.a href="https://www.hamburg.de/wandsbek/strassenbaustellen/14296892/schimmelmannstrasse/">Infoseite der Stadt zur Baustelle</.a></p>
    """
  end
end
