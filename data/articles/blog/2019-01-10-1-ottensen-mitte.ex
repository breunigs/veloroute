defmodule Data.Article.Blog.OttensenMitte do
  use Article.Default

  def name(), do: "#{created_at()}-1-ottensen-mitte"
  def created_at(), do: ~D[2019-01-10]

  def title(), do: "Ottensen Mitte (Veloroute 1)"

  def start(), do: ~d[2020-01-06]
  def stop(), do: ~d[2022-03-31]

  def type(), do: :construction
  def construction_site_id_hh(), do: [5055]
  def tags(), do: ["1", "1a", "a8", "a9"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Betrifft: <.m bounds="9.93016,53.550201,9.9331,53.550488">Klausstraße</.m>, <.m bounds="9.922398,53.550169,9.93016,53.550922">Eulenstraße</.m>, <.m bounds="9.922346,53.549191,9.927456,53.550674">Keplerstraße</.m>, <.m bounds="9.922471,53.548094,9.930591,53.549658">Arnoldstraße</.m>, <.m bounds="9.930591,53.549658,9.93466,53.550306">Lobuschstraße</.m></p> <p><strong>Hinweis:</strong> Die Planungen des zweiten Entwurfs unterscheiden sich erheblich von der ersten Version. Die Beschreibung wurde entsprechend angepasst.</p> <p>Aufgrund der schmalen Straßenquerschnitte teilt sich die Veloroute hier in Nord (stadtauswärts) und Süd (stadteinwärts) auf. Die Führung in diesen Abschnitten ist heikel, da die Radfahrstreifen viel zu schmal sind und auf der <.m bounds="9.922398,53.550169,9.93016,53.550922">Eulenstraße</.m> teilweise auch ganz fehlen und man sich entweder über Kopfsteinpflaster oder den Fußweg quälen soll.</p> <p>In den zweiten Entwürfen ist der Fahrradweg durchgängig auf der Straße geplant. Stadteinwärts wird dies durch einen ca. zwei Meter breiten Radfahrstreifen erreicht. Lediglich an Bushaltestellen wird dieser unterbrochen, wobei die Fahrbahn auch hier noch breit genug ist um langsam an einem haltenden Bus vorbeifahren zu können. KFZ müssen dagegen hinter dem Bus warten.</p> <p>Die Nordseite, also stadtauswärts, ist nicht ganz so komfortabel: In der <.m bounds="9.93016,53.550201,9.9331,53.550488">Klausstraße</.m> und in der <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.550504, lon: 9.92906, zoom: 18}))}>Eulenstraße bis zur Bushaltestelle „Bahrenfelder Straße“</.m> gibt's nur einen Schutzstreifen (gestrichelte Linie, kurzes Halten für KFZ erlaubt) von rund 1,50m Breite. Dies ergibt sich hauptsächlich aufgrund des Platzmangels, wobei man die Parkplätze in der <.m bounds="9.93016,53.550201,9.9331,53.550488">Klausstraße</.m> v.a. behalten wollte, damit bei Wohnungsumzügen und Kleinbaustellen leicht Platz zur Verfügung gestellt werden kann, ohne die Radinfrastruktur in Anspruch nehmen zu müssen. Nach der o.g. Bushaltestelle gibt's dann aber wie im Süden zwei Meter breite, durchgängige Radfahrstreifen bis zur <.m bounds="9.911728,53.550674,9.922398,53.551268">Bleickenallee</.m>.</p> <p>Die Kreuzungen erhalten allerlei Detailverbesserungen: Vorgezogene Aufstellflächen um besser von Autos gesehen zu werden. An manchen Einmündungen weiten diese sich auf die gesamte Breite der Fahrrichtung auf, sodass man sich bei Rot vor den Autos aufstellen kann, um von dort dann bequem links abbiegen zu können. Sind Einbahnstraßen für den Radverkehr in beide Richtungen freigeben wird dies künftig deutlich durch Markierungen oder Verkehrsinseln hervorgehoben. Auch werden die Sichtbeziehungen optimiert, indem man Falschparker durch Einengungen oder Fahrradbügel vom Kreuzungsbereich fernhält.</p> <p>Die <.m bounds="9.927197,53.546386,9.929493,53.551728">Rothestraße</.m> wird zwischen den beiden Radroutenteilen Einbahnstraße in Südrichtung. Dadurch kann einer <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.5502638, lon: 9.9272301, zoom: 19}))}>der Arme im Norden</.m> entfallen, der zum Gehweg mit vielen Anlehnbügeln zum Anschließen von Fahrrädern umgewidmet wird. Auch können KFZ in der <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.5507989, lon: 9.9255727, zoom: 19}))}>Großen Brunnenstraße die Eulenstraße</.m> künftig nicht mehr queren, sondern müssen in sie einbiegen. In allen Fällen ist der Radverkehr nicht von diesen Einschränkungen betroffen.</p> <p>Bereits der erste Entwurf stellte eine Verbesserung zum Bestand dar. Der zweite Entwurf legt nochmal ein bisschen was oben drauf. Ganz weg sind die Schutzstreifen zwar immer noch nicht, aber der Gesamteindruck des vorliegenden Plan ist definitiv positiv. Angedacht ist eine Umsetzung im Sommer 2019.</p> <ul>
    <li><.a href="https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1008235">Erläuterung und Lagepläne Nordseite</.a> (unter Anlagen, 2. Entwurf)</li>
    <li><.a href="https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1008237">Erläuterung und Lagepläne Südseite</.a> (unter Anlagen, 2. Entwurf)</li>
    </ul>
    """
  end
end
