defmodule Data.Article.Blog.EppendorferWeg do
  use Article.Default

  def title(), do: "Eppendorfer Weg (Alltagsroute 13)"

  def summary(),
    do:
      "Zunächst Beteiligung der Interessensgruppen und Bevölkerung. Planung soll bis Ende 2025 fertig werden."

  def type(), do: :intent
  def tags(), do: ["13"]

  def links(_assigns) do
    [
      {"Projektseite des LSBG", "https://lsbg.hamburg.de/eppendorfer-weg"},
      {"Vorabmaßnahmen – Bericht", "Juli 2024",
       "https://lsbg.hamburg.de/resource/blob/947214/2cd6313a383b002143c69b8773cadde0/eppendorfer-weg-veloroute-13-ad-hoc-massnahmen-abgestimmte-planung-bericht-data.pdf"},
      {"Vorabmaßnahmen – Plan", "Juli 2024",
       "https://lsbg.hamburg.de/resource/blob/947216/9784cce4c249a20421cce6a8835357da/eppendorfer-weg-veloroute-13-ad-hoc-massnahmen-abgestimmte-planung-plan-data.pdf"},
      {"Ausschreibung der Planung", "April 2023",
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/api/external/deeplink/subproject/1e884099-76ab-4ab9-9de7-2db73ee5a061"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Im Eppendorfer Weg gibt es keine eigenen Wege für den Radverkehr, er fährt im <.ref>Mischverkehr</.ref>. Die vielen illegal abgestellten KFZ beschränken die Sicht, und behindern auch das Vorankommen. Die Geschwindigkeitsbeschränkung liegt bei 50 km/h.</p>

    <h4>Vorhaben</h4>
    <p>Der LSBG möchte die Bevölkerung mit in Planung einbeziehen und lädt daher zu mehreren Beteiligungsveranstaltungen. Fertig geplant sein soll bis 2025; wann gebaut wird ist noch offen.</p>

    <h4>Vorabmaßnahme</h4>
    <p>In einer einfach umzusetzenden Maßnahme werden <.ref>Mittelinseln</.ref> gebaut. Dabei sollen auch Sitzbänke und Radanlehnbügel aufgestellt werden. Die Fahrradfurten bzw. <.ref name="lexikon/aras">Aufstellflächen vor den KFZ</.ref> sollen rot eingefärbt werden. Gebaut werden soll Ende 2024/Anfang 2025.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
