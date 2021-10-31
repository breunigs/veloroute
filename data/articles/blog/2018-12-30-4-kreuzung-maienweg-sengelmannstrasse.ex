defmodule Data.Article.Blog.KreuzungMaienwegSengelmannstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-4-kreuzung-maienweg-sengelmannstrasse"
  def created_at(), do: ~D[2018-12-30]
  def updated(), do: ~D[2020-06-16]
  def title(), do: "Kreuzung Maienweg/Sengelmannstraße (Veloroute 4)"

  def start(), do: ~d[2019Q3]

  def type(), do: :finished

  def tags(), do: [4]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand 2020:</strong> Der Umbau ist abgeschlossen.</p><p>In diesem Bauvorhaben wird lediglich die Kreuzung angefasst – die Fahrradwege in allen Knotenarmen werden separat umgestaltet. Entsprechend wenig tut sich: die Ableitung von den alten Hochbordradwegen auf Radfahrstreifen erfolgt früher und es werden Aufstelltaschen für indirektes Linksabbiegen eingerichtet. So kommt man künftig deutlich geradliniger durch die Kreuzung. Besonders früh erfolgt die Ableitung wenn man entlang der <.m bounds="10.011174,53.605971,10.027486,53.623538">Sengelmannstraße</.m> Richtung Flughafen fährt: bereits auf der Höhe der <.m bounds="10.00057,53.611994,10.017088,53.615842">Brabandstraße</.m> verwandelt sich der Radweg in einen Radfahrstreifen, wobei kurz danach die Rechtsabbiegerspur anschließt. Diese verläuft danach rechts von der Radverkehr-Geradeausspur. Ziel ist das Radfahrende besser wahrgenommen werden und die KFZ die Radfahrspur kreuzen, statt umgekehrt wie bisher.</p> <p>Die Planung entspricht dem Hamburger Kreuzungsstandard bei radfreundlichen Kreuzungen. Mit 1,80m entlang der Veloroute sind die Radwege ausreichend, aber nicht besonders großzügig bemessen. Insgesamt eine willkommene Verbesserung, die sich aber nur lohnt wenn die umliegenden Radwege auch entsprechend angepasst werden. Umgesetzt werden soll ab Sommer 2019.</p> <p><.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1007551">Erläuterungsbericht und Lagepläne</.a> (unter Anlagen)</p>
    """
  end
end
