defmodule Data.Article.Blog.Veloroute11Bewertung do
  use Article.Default

  def created_at(), do: ~D[2018-08-24]

  def title(), do: "Bewertung der Veloroute 11 Mitte 2018"

  def type(), do: nil

  def tags(), do: ["11"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die Veloroute 11 kann ich jedem empfehlen einmal abzufahren, denn sie ist schon weitestgehend ausgebaut. Sie führt an vielen Sehenswürdigkeiten vorbei (<.m bounds="9.976247,53.545852,9.982115,53.549881">Michel</.m>, <.m bounds="9.965192,53.541151,9.96882,53.546609">Alter Elbtunnel</.m>, <.m bounds="9.994417,53.483988,10.006371,53.500453">Wilhelmsburger Inselpark</.m>, <.m bounds="9.993877,53.471446,9.99624,53.47758">Alte Harburger Elbbrücke</.m> und natürlich dem <.m bounds="9.960543,53.524102,9.987139,53.543535">Hafen</.m>) für die sich auch einzeln ein Abstecher lohnt. Der Wegteil in der Innenstadt und v.a. <.m bounds="9.980139,53.456222,9.991336,53.464978">Harburg</.m> benötigen aber definitiv noch Nachbesserungen, damit man auch dort so angenehm fahren kann wie auf dem Rest der Strecke. Wermutstropfen: Teile des <.m bounds="9.994417,53.483988,10.006371,53.500453">Wilhelmsburger Inselpark</.m> sind von 0:00 bis 5:00 geschlossen, sodass die Route hier unterbrochen ist. Noch hat mir die Parkleitung nicht geantwortet, aber ich vermute mit der Verlegung der Autobahn ändert sich die genaue Führung nochmal.</p>
    <p><.a href="https://www.abendblatt.de/hamburg/article215600845/Die-faszinierende-Fahrt-durch-den-Hafen-nach-Harburg.html">Zeitungsartikel/Review vom 15.10.2018</.a></p>
    """
  end
end
