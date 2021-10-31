defmodule Data.Article.Blog.PlannedReichsbahnstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-planned-reichsbahnstrasse"
  def created_at(), do: ~D[2018-09-29]

  def title(), do: "Reichsbahnstraße (Veloroute 2)"

  def type(), do: :finished

  def tags(), do: [2]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand Mitte 2019: Diese Baumaßnahme wurde bereits umgesetzt.</strong></p> <p>Die Führung an der Kreuzung ist aktuell etwas verwirrend, weil die Führung nur für den Fußverkehr gebaut wurde. Als Radfahrende muss man ein bisschen Slalom fahren um der Veloroute zu folgen. Um dies zu verbessern wird die Führung etwas begradigt und auch der Vorbeifahrstreifen aus der <.m bounds="9.904599,53.596102,9.913389,53.60295">Reichsbahnstraße</.m> etwas breiter. Leider lässt sich den Plänen nicht entnehmen ob endlich der Fahrradweg auf der Westseite der <.m bounds="9.902682,53.562987,9.945408,53.716858">Kieler Straße</.m> wie suggeriert in der Gegenrichtung freigegeben wird. Aktuell muss man stadteinwärts noch wie die KFZ auf der Fahrbahn links in den <.m bounds="9.912505,53.599612,9.922192,53.603146">Olloweg</.m> abbiegen  – oder schieben – wenn man sich an die StVo halten möchte.</p>
    <p>Im Zuge der Maßnahme wird auch das Tempo-30-Limit auf der <.m bounds="9.904599,53.596102,9.913389,53.60295">Reichsbahnstraße</.m> erweitert, das dann schon ab Höhe <.m bounds="9.909173,53.597759,9.909741,53.602184">Bollweg</.m> stadtauswärts gilt.</p>
    <p><.a href="https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1004043">vorläufiger Lageplan</.a> (unter Anlagen)</p>
    """
  end
end
