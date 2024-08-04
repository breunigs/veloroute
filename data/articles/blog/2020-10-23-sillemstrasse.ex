defmodule Data.Article.Blog.Sillemstrasse do
  use Article.Default

  def updated_at(), do: ~D[2023-12-02]
  def title(), do: "Sillemstraße (Radroute 2)"

  def summary(),
    do: "asphaltierte Fahrradstraße (Anlieger frei) mit Kreisel an der Methfesselstraße geplant"

  def start(), do: ~d[2024Q2]
  def stop(), do: ~d[2024Q3]

  def type(), do: :planned

  def tags(), do: ["2"]

  def links(_assigns) do
    [
      {"Erläuterungsbericht und Pläne des fertigen Entwurfs", "Dezember 2023",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1008865"},
      {"Erläuterungsbericht und Pläne des ersten Entwurfs", "Mai 2021",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1006604"},
      {"Infoseite der Stadt",
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/bezirksamt-eimsbuettel/themen/mobilitaet/sillemstrasse-60852"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der verkehrsarme Abschnitt ist größtenteils in Kopfsteinpflaster ausgeführt. Einmündungen und Kreuzungen sind durch die großen Kurvenradien auf hohe Abbiegegeschwindigkeiten optimiert, bieten jedoch nur geringe Sicht. Im gesamten Bereich werden Autos ungeordnet und teilweise verkehrsgefährdend abgestellt, was der Übersichtlichkeit schadet.</p>

    <h4>Planung</h4>
    <p>Es soll eine asphaltierte Fahrradstraße (Anlieger frei) mit einer rund 4,0m bis 4,3m breiten Fahrgasse entstehen. Zuzüglich kommen nochmal rund 1,5m Sicherheitsabstand gegen <.ref>Dooring</.ref>. KFZ-Parken ist nur noch längst entlang der Straße vorgesehen, wodurch die Gehwege stellenweise breiter werden. Je nach Platz werden auch Fahrradanschließbügel ergänzt. </p>

    <p>Die meisten einmündenden Nebenstraßen sollen zu Gehwegüberfahrten werden, sodass die Radroute Vorfahrt genießen würde. Die Kurvenradien wären ebenfalls kleiner als heute. An der <.v bounds="9.942321,53.577448,9.946122,53.579493" lon={9.943909} lat={53.578391} dir="forward" ref="2">Methfesselstraße</.v> ist ein kleiner Kreisverkehr geplant. Hier sollen auch Parkbänke aufgestellt werden.</p>

    <p>Auf <.v bounds="9.94224,53.578607,9.944477,53.57954" lon={9.9430542} lat={53.578862} dir="forward" ref={@ref}>Höhe des Spielplatz</.v> ist eine Querungsmöglichkeit für den Fußverkehr geplant.</p>

    <h4>Meinung</h4>
    <p>An der Planung ist wenig zu kritisieren. Rad- und KFZ-Verkehr halten sich auch schon heute auf der Sillemstraße in etwa die Waage, was sich durch die attraktivere Gestaltung zugunsten des Radverkehrs ändern dürfte. An der stärker befahrenen Methfesselstraße stellt der Kreisel eine gute Querung für alle Fahrtrichtungen her.</p>

    <h4>Quellen</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
