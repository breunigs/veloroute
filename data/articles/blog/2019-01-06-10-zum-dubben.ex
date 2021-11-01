defmodule Data.Article.Blog.ZumDubben do
  use Article.Default

  def name(), do: "#{created_at()}-10-zum-dubben"
  def created_at(), do: ~D[2019-01-06]

  def title(), do: "Zum Dubben (neue Führung, Veloroute 10)"

  def start(), do: ~d[2020-04-27]
  def stop(), do: ~d[2021-04-30]

  def type(), do: :finished
  def construction_site_id_hh(), do: [7739, 15349]
  def tags(), do: ["10", "H08"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>In dem ersten Entwurf ist vorgesehen die Straße <.m bounds="9.900759,53.473868,9.904519,53.473989">Zum Dubben</.m> beidseitig mit Radfahrstreifen in 2,25m Breite auszuführen. Die Gehwege und der einseitig vorhandene Hochbordradweg werden entsprechend angepasst bzw. entfernt.</p> <p>Mittelfristig soll die Straße <.m bounds="9.903049,53.472477,9.905084,53.473934">Dubben</.m> eine Fahrradstraße werden. Dazu muss aus rechtlichen Gründen aber offenbar erst der weitere Verlauf der neuen Führung über den <.m bounds="9.91545,53.471852,9.92091,53.472737">Heykenaubrook</.m> fertiggestellt werden. Dann soll auch nochmal die Einmündung vom <.m bounds="9.903049,53.472477,9.905084,53.473934">Dubben</.m> in <.m bounds="9.900759,53.473868,9.904519,53.473989">Zum Dubben</.m> angepasst werden. Als Laie erscheint mir das etwas übertrieben und ich finde bis auf die Beschilderung könnte das auch in einem Rutsch erledigt werden.</p> <p>Umgesetzt werden soll der erste Teil bis Mitte 2019, die Vorstellung des Entwurfs erfolgt Mitte Januar.</p> <p><.a href="https://sitzungsdienst-harburg.hamburg.de/bi/vo020.asp?VOLFDNR=1005980">Erläuterungsbericht zur Umgestaltung mit vorläufigem Lageplan</.a> (unter Anlagen)</p>
    """
  end
end
