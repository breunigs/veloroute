defmodule Data.Article.Blog.Sillemstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-sillemstrasse"
  def created_at(), do: ~D[2020-10-23]
  def updated(), do: ~D[2021-05-19]
  def title(), do: "Sillemstraße (Veloroute 2)"

  def start(), do: ~d[2022Q2]
  def stop(), do: ~d[2022Q3]

  def type(), do: :planned

  def tags(), do: ["2"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Beteiligungsverfahren</h4> <p>Der Bezirk ruft Interessierte auf sich in die Planung einzubringen. Vom 20. Mai bis 17. Juni 2021 können Wünsche, Bedenken usw. auf <.a href="https://beteiligung.hamburg/radverkehr-eimsbuettel/#/">einer Karte mit Kommentarfunktion</.a> eingebracht werden.</p>
    <h4>Alter Zustand</h4> <p>Der verkehrsarme Abschnitt ist größtenteils in Kopfsteinpflaster ausgeführt. Einmündungen und Kreuzungen sind durch die großen Kurvenradien auf hohe Abbiegegeschwindigkeiten optimiert, bieten jedoch nur geringe Sicht. Im gesamten Bereich werden Autos ungeordnet und teilweise verkehrsgefährdend abgestellt, was der Übersichtlichkeit schadet.</p>
    <h4>Planung</h4> <p>Der erste Entwurf sieht vor den Abschnitt zu einer asphaltierten Fahrradstraße mit 4,50m Breite auszubauen. Die einmündenden Nebenstraßen sollen zu Gehwegüberfahrten werden, sodass die Veloroute Vorfahrt genießen würde. Die  Kurvenradien wären ebenfalls kleiner als heute.</p>
    <p>KFZ-Parken ist nur noch längs der Straße auf beiden Seiten vorgesehen, wobei rund 50cm Sicherheitsabstand gegen <.ref>Dooring</.ref> eingeplant sind. In diesem Bereich werden je nach Platzangebot auch Fahrrad-Anlehnbügel untergebracht, wobei einige davon explizit für Lastenräder gedacht sind. Diese Umgestaltung erlaubt stellenweise breitere Gehwege.</p>
    <p>Auf <.m bounds="9.94224,53.578607,9.944477,53.57954" lon="9.9430542" lat="53.578862" dir="forward">Höhe des Spielplatz</.m> ist eine Querungsmöglichkeit für den Fußverkehr geplant. An der <.m bounds="9.941502,53.577908,9.946022,53.578942" lon="9.943905" lat="53.5783244" dir="forward">Methfesselstraße</.m> sollen zwei Parkbänke aufgestellt werden.</p>
    <h4>Meinung</h4> <p>Der erste Entwurf ist erstaunlich fahrradfreundlich – es bleibt abzuwarten ob diese so genehmigt werden kann. Rechtlich darf eine Fahrradstraße nur eingerichtet werden, wenn der Radverkehr den Autoverkehr überwiegt oder das zumindest bald zu erwarten ist. Dies war bei der letzten Verkehrszählung 2017 noch nicht der Fall (110 Fährräder, 800 Autos). Es ist aber eine weitere Zählung geplant.</p>
    <h4>Quellen</h4> <ul>
    <li><.a href="https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1006604">Erläuterungsbericht und Pläne des ersten Entwurfs</.a></li>
    <li><.a href="https://beteiligung.hamburg/radverkehr-eimsbuettel/#/">Beteiligungsverfahren</.a></li>
    </ul>
    """
  end
end
