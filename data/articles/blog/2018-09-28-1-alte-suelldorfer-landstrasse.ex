defmodule Data.Article.Blog.AlteSuelldorferLandstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-1-alte-suelldorfer-landstrasse"
  def created_at(), do: ~D[2018-09-28]

  def title(), do: "Alte Sülldorfer Landstraße (Veloroute 1)"

  def start(), do: ~d[2020Q2]

  def type(), do: :finished

  def tags(), do: ["1", "a5"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand Mitte 2020:</strong> Der Umbau fand noch nicht statt. Mir sind leider keine neuen Zeitpläne bekannt.</p> <p>Die <.m bounds="9.763089,53.579719,9.776531,53.581823">Alte Sülldorfer Landstraße</.m> ab dem <.m bounds="9.762458,53.579407,9.767208,53.580782">Rissener Busch</.m> wird zur Zeit in der Breite reduziert, um eine Verkehrsberuhigung zu erreichen. Die Radverkehrsführung bleibt unverändert im Mischverkehr. Lediglich die Schikanen mit schmalem Durchlass für Fahrräder werden in Zukunft auch von Radlern umfahren werden müssen. Bei dem sehr geringem Verkehrsaufkommen sollte dies aber wenig problematisch sein.</p> <p>Das Stück der alten Sülldorfer Landstraße Richtung <.m bounds="9.763089,53.581203,9.766407,53.609231">Klövensteenweg</.m> soll im Anschluss ebenso erneuer werden.</p> <p><.a href="https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1007689">Erläuterungsbericht zur Umgestaltung mit vorläufigem Lageplan</.a> (unter Anlagen)</p>
    """
  end
end
