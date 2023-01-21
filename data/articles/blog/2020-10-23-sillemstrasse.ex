defmodule Data.Article.Blog.Sillemstrasse do
  use Article.Default

  def created_at(), do: ~D[2020-10-23]
  def updated_at(), do: ~D[2021-05-19]
  def title(), do: "Sillemstraße (Veloroute 2)"

  def start(), do: ~d[2023]

  def type(), do: :planned

  def tags(), do: ["2"]

  def links(_assigns) do
    [
      {"Erläuterungsbericht und Pläne des ersten Entwurfs",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1006604"},
      {"Infoseite der Stadt", "https://www.hamburg.de/eimsbuettel/sillemstrasse/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Der verkehrsarme Abschnitt ist größtenteils in Kopfsteinpflaster ausgeführt. Einmündungen und Kreuzungen sind durch die großen Kurvenradien auf hohe Abbiegegeschwindigkeiten optimiert, bieten jedoch nur geringe Sicht. Im gesamten Bereich werden Autos ungeordnet und teilweise verkehrsgefährdend abgestellt, was der Übersichtlichkeit schadet.</p>
    <h4>Planung</h4> <p>Der erste Entwurf sieht vor den Abschnitt zu einer asphaltierten Fahrradstraße mit 4,50m Breite auszubauen. Die einmündenden Nebenstraßen sollen zu Gehwegüberfahrten werden, sodass die Veloroute Vorfahrt genießen würde. Die  Kurvenradien wären ebenfalls kleiner als heute.</p>
    <p>KFZ-Parken ist nur noch längs der Straße auf beiden Seiten vorgesehen, wobei rund 50cm Sicherheitsabstand gegen <.ref>Dooring</.ref> eingeplant sind. In diesem Bereich werden je nach Platzangebot auch Fahrrad-Anlehnbügel untergebracht, wobei einige davon explizit für Lastenräder gedacht sind. Diese Umgestaltung erlaubt stellenweise breitere Gehwege.</p>
    <p>Auf <.v bounds="9.94224,53.578607,9.944477,53.57954" lon={9.9430542} lat={53.578862} dir="forward" ref={@ref}>Höhe des Spielplatz</.v> ist eine Querungsmöglichkeit für den Fußverkehr geplant. An der <.v bounds="9.941502,53.577908,9.946022,53.578942" lon={9.943905} lat={53.5783244} dir="forward" ref={@ref}>Methfesselstraße</.v> sollen zwei Parkbänke aufgestellt werden.</p>
    <h4>Meinung</h4> <p>Der erste Entwurf ist erstaunlich fahrradfreundlich – es bleibt abzuwarten ob diese so genehmigt werden kann. Rechtlich darf eine Fahrradstraße nur eingerichtet werden, wenn der Radverkehr den Autoverkehr überwiegt oder das zumindest bald zu erwarten ist. Dies war bei der letzten Verkehrszählung 2017 noch nicht der Fall (110 Fährräder, 800 Autos). Es ist aber eine weitere Zählung geplant.</p>
    <h4>Quellen</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
