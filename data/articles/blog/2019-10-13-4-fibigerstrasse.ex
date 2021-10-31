defmodule Data.Article.Blog.Fibigerstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-4-fibigerstrasse"
  def created_at(), do: ~D[2019-10-13]

  def title(), do: "Fibingerstraße (Veloroute 4)"

  def start(), do: ~d[2020-10-12]
  def stop(), do: ~d[2021-10-24]

  def type(), do: :construction
  def construction_site_id_hh(), do: [12316]
  def tags(), do: [4]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Im südlichen Teil der Fibingerstraße sind stellenweise noch die alten Hochbordradwege zu erkennen, die aber durch zu nah parkende KFZ unbenutzbar sind. Dies passiert legal, da die Rad- und Fußwege als Parkplätze ausgewiesen wurden.</p> <p>Der Umbau sieht vor diese unbenutzbaren Wege abzuschaffen und entweder den Gehwegen zuzuschlagen bzw. sie zu echten Parkplätzen auszubauen. Der Radverkehr soll wie bisher im Mischverkehr mit den KFZ auf der Fahrbahn fahren. Zusätzlich werden noch einige Anschließbügel für Fahrräder aufgestellt. Die Nasen zur Verkehrsberuhigung bleiben vorhanden und verengen die Fahrbahn stellenweise auf 3,50m. Auch werden Fahrradstellplätze in Form von Anlehnbügeln ergänzt. Da das P+R ab Ende 2019 wieder öffnen soll, sollte der Parkraumbedarf in dem Wohngebiet stark fallen, was auf wenige Falschparker hoffen lässt. </p> <p>Das die alten Radwege komplett entfernt werden ist zu begrüßen, weil es Klarheit schafft. Insgesamt profitiert der Radverkehr von der Maßnahme direkt wenig, höchstens indirekt weil KFZ-Fahrende nicht mehr erzogen werden halb auf Geh- und Radwegen zu parken.</p> <p>Angedacht ist der Umbau für 2020.</p> <p><.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1008781">Erläuterung und Pläne zum finalen Entwurf</.a></p>
    """
  end
end
