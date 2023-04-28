defmodule Data.Article.Blog.TilsiterStrasseEckerkoppelW16 do
  use Article.Default

  def name(), do: "#{created_at()}-6-tilsiter-strasse-eckerkoppel-w16"
  def created_at(), do: ~D[2019-10-24]
  def updated_at(), do: ~D[2023-04-28]

  def summary(), do: "Fahrradstraße als zweijähriger Verkehrsversuch vorgeschlagen"

  def title(), do: "Eckerkoppel (Veloroute 6)"

  def type(), do: :intent

  # def start(), do: ~d[2023Q3]
  # def stop(), do: ~d[2024Q2]

  def tags(), do: ["6", "w16.1", "w16.3", "w16.4", "w16", "FR11"]

  def links(_assigns) do
    [
      {"Erläuterung rechtlicher Hürden / Verkehrsversuch", "April 2023",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1018659"},
      {"veraltete Lagepläne und Erläuterungsbericht", "Siehe auch Abwägungsvermerk",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1011013"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radverkehr teilt sich mit KFZ die Straße im <.ref>Mischverkehr</.ref>. Erlaubt sind meist 50 km/h, um die <.v bounds="10.099576,53.595674,10.104851,53.5993" lon={10.101412} lat={53.597368} dir="forward" ref="6">Walter-Heitmann-Straße</.v> 30 km/h.</p>

    <h4>Vorhaben</h4>
    <p>Wegen rechtlicher Hürden soll eine Fahrradstraße als Verkehrsversuch eingerichtet werden. Dieser würde durch Markierungen und kleinere Umbauten umgesetzt und soll zwei Jahre dauern. Im Anschluss werden die Auswirkungen bewertet.</p>

    <h4>Meinung</h4>
    <p>Die Gesetzeslage ist absurd: Ampeln sind nur wegen KFZ nötig und bürden dem Rad- und Fußverkehr Wartezeiten und Umwege auf – völlig in Ordnung. Sobald es andersrum wäre – auf gar keinen Fall. Immerhin besteht mit dem Ansatz „Verkehrsversuch“ die Chance, dass sich tatsächlich etwas tut.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
