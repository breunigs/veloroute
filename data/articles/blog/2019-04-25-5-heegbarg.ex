defmodule Data.Article.Blog.Heegbarg do
  use Article.Default

  def name(), do: "#{created_at()}-5-heegbarg"
  def created_at(), do: ~D[2019-04-25]

  def title(), do: "Heegbarg (Veloroute 5)"

  def start(), do: ~d[2020-07-20]
  def stop(), do: ~d[2021-03-19]

  def type(), do: :finished
  def construction_site_id_hh(), do: [10026]
  def tags(), do: ["5"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Im markierten Stück des <.m bounds="10.092327,53.65545,10.095067,53.657082">Heegbarg</.m> gibt es noch unbenutzbare Radwege im Altbestand. Sie sind viel zu schmal, uneben, ohne Sicherheitsabstände und an <.m bounds="10.092658,53.657919,10.09814,53.661183">der Kreuzung mit der Alsterredder</.m> nichtmal durchgängig. Auf der Fahrbahn fährt es sich dagegen sehr angenehm, was aber gerade Radneulingen schwer fallen dürfte.</p> <p>Im ersten Entwurf ist vorgesehen die alten Radwege vollständig zu entfernen. Vom <.m bounds="10.091799,53.656285,10.097281,53.659549">Saseler Damm bis zur Alsterredder</.m> wird ein ca. 1,7m breiter Schutzstreifen (gestrichelete Linie) angelegt. In diesem Abschnitt bleibt es beim Tempo 50.</p> <p>Im <.m bounds="10.093563,53.659097,10.099045,53.662361">nördlichen Teil</.m> sollen Radfahrende im Mischverkehr mit den Autos fahren, also so wie im weiteren Verlauf. Die ehemaligen Flächen des Radweges werden begrünt oder dem Fußweg zugeschlagen. Die bereits eingerichtete Tempo-30-Zone bleibt bestehen.</p> <p>Es wird ebenfalls noch überlegt ob die Tempo-30-Zone etwas erweitert werden kann, sodass die Stop-Schilder an <.m bounds="10.092658,53.657919,10.09814,53.661183">der Kreuzung mit der Alsterredder</.m> entfallen könnten. Zum <.m bounds="10.092184,53.655564,10.094924,53.657196">Saseler Damm (Ring 3)</.m> wird auf die dort bestehenden Radwege übergeleitet, d.h. diese Kreuzung ist nicht Bestandteil dieser Planung.</p> <p>Auf dem Heegbarg herrscht wenig Verkehr, sodass die vorgesehenen Maßnahmen ausreichend erscheinen. Die Qualität für Radfahrende verbessern sie definitiv.</p> <p><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1010194">Erläuterung und Lagepläne</.a><br> <.a href="https://www.hamburg.de/wandsbek/strassenbaustellen/14292176/heegbarg/">Infoseite der Stadt zur Baustelle</.a></p>
    """
  end
end
