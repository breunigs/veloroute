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
      {"Projektseite des LSBG", "https://lsbg.hamburg.de/eppendorfer-weg"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Im Eppendorfer Weg gibt es keine eigenen Wege für den Radverkehr, er fährt im <.ref>Mischverkehr</.ref>. Die vielen illegal abgestellen KFZ beschränken die Sicht, und behindern auch das Vorankommen. Die Geschwindigkeitsbeschränkung liegt bei 50 km/h.</p>

    <h4>Vorhaben</h4>
    <p>Der LSBG möchte die Bevölkerung mit in Planung einbeziehen und lädt daher zu mehreren Beteiligungsveranstaltungen. Fertig geplant sein soll bis 2025; wann gebaut wird ist noch offen.</p>

    <h5>Nächste Veranstaltung</h5>
    <p>Öffentliche Auftakt- und Informationsveranstaltung am 14. September 2022 um 18:00 Uhr (Einlass 17:30 Uhr) in der <.m bounds="9.972168,53.586001,9.978639,53.588894">Grund- und Stadtteilschule Eppendorf (Löwenstraße 58)</.m>.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
