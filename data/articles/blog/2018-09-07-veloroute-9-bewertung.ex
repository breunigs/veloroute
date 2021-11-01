defmodule Data.Article.Blog.Veloroute9Bewertung do
  use Article.Default

  def name(), do: "#{created_at()}-veloroute-9-bewertung"
  def created_at(), do: ~D[2018-09-07]

  def title(), do: "Bewertung der Veloroute 9 Herbst 2018"

  def type(), do: nil

  def tags(), do: ["9"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Veloroute 9 führt wie die Veloroute 8 nach <.m bounds="10.205741,53.489657,10.207563,53.490361">Bergedorf</.m>. Allerdings verläuft sie deutlich südlicher und bindet entsprechend <.m bounds="10.086782,53.527507,10.086782,53.527507">Billbrook</.m>, <.m bounds="10.134611,53.499188,10.134611,53.499188">Billwerder</.m> und <.m bounds="10.163049,53.48306,10.163049,53.48306">Neuallermöhe</.m> ins Radnetz ein. Die Route ist bereits gut ausgebaut, führt allerdings auch ein großes Stück durch ländlichere Bereich Hamburgs. Die Straßen sind dort zwar weitgehend autofrei und gut asphaltiert, aber leider nicht beleuchtet.</p>

    <p>Es gibt nur wenige Stellen, an denen definitiv noch nachgebessert werden sollte: die Unterführung an der Autobahn in <.m bounds="10.036005,53.534658,10.044283,53.538429">Rothenburgsort</.m> etwa ist sehr schmal. Im Industriegebiet an der <.m bounds="10.077047,53.518416,10.098365,53.529992">Bredowstraße</.m> ist zwar genug Platz, aber man fährt hier trotzdem im Mischverkehr mit entsprechendem Schwerlastanteil. Auch ist die Führung in der Innenstadt und in Bergedorf eher durchwachsen, jedoch sticht keine Stelle als besonders schlecht heraussticht.</p>

    <p>Zusammengefasst ist die Veloroute 9 bereits heute überdurchschnittlich gut ausgebaut und sehr angenehm zu fahren. Es gibt zwar einige ausbaufähige Stellen, aber diese fallen nicht so stark ins Gewicht, das sich die Wertung ändern würde.</p>

    <p>Von Bergedorf aus bietet sie sich tagsüber als Alternative zur Veloroute 8 an – am besten ausprobieren welche Route einem eher zusagt.</p>

    <p><.a target="_blank" href="https://www.abendblatt.de/hamburg/article215536099/Im-Hamburger-Osten-brauchen-Radler-starke-Nerven.html" rel="nofollow">Zeitungsartikel/Review vom 11.10.2018</.a></p>
    """
  end
end
