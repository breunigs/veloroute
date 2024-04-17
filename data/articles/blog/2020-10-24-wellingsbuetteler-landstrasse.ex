defmodule Data.Article.Blog.WellingsbuettelerLandstrasse do
  use Article.Default

  def created_at(), do: ~D[2020-10-24]
  def updated_at(), do: ~D[2023-09-27]
  def title(), do: "Wellingsbütteler Landstraße"

  def summary(),
    do:
      "Zweirichtungsradweg bis von Fuhlsbüttler Straße bis zur Stübeheide, sonst keine eigenen Radwege. Stübeheide soll als Ausweichroute zur Fahrradstraße aufgewertet werden."

  def type(), do: :planned

  def tags(), do: ["br-nord-n8"]
  def start(), do: ~d[2024Q3]
  def stop(), do: ~d[2027Q4]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Wellingsbütteler Landstraße",
        direction: :forward,
        from: "Fuhlsbüttler Straße",
        to: "Rolfinckstraße",
        parent_ref: __MODULE__,
        text: "Wellingsbütteler Landstraße",
        videos: [
          {"2023-06-24-14im-13gg/GX016011", :start, :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Informationsseite der Stadt", "https://lsbg.hamburg.de/strassenzug-wellingsbuettel"},
      {"Erläuterungsbericht (4. Entwurf/fertige Planung)", "September 2023",
       "https://lsbg.hamburg.de/resource/blob/783748/b26121b66aba18998129ae9554a2938f/wellingsbuetteler-landstrasse-fuhlsbuettler-strasse-bis-borstels-ende-abgestimmte-planung-bericht-data.pdf"},
      {"Lagepläne (4. Entwurf/fertige Planung)", "September 2023",
       "https://lsbg.hamburg.de/resource/blob/783750/0b9e5cc1d423fb0b9adde53368a644c9/wellingsbuetteler-landstrasse-fuhlsbuettler-strasse-bis-borstels-ende-abgestimmte-planung-plan-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""

    <h4>Alter Zustand</h4>
    <p>In der <.m bounds="10.031161,53.625658,10.057393,53.636639">Wellingsbütteler Landstraße</.m> selbst gibt es im Stadtteil <.m bounds="10.033141,53.628026,10.049216,53.6317">Klein Borstel</.m> keine eigenen Radwege. Es stehen die Optionen offen auf der Fahrbahn mit den KFZ zu fahren oder auf den Fußwegen (<.ref>Fahrrad frei</.ref>). Die Höchstgeschwindigkeit beträgt 50 km/h.</p>

    <h4>Planung</h4>
    <p>Die Wellingsbütteler Landstraße soll komplett saniert werden – Kanäle, Versorgungsleitungen und Straßenbelag gemeinsam. Es ist vorgesehen dem Radverkehr zwischen <.m bounds="10.027247,53.625691,10.039097,53.630037">Fuhlsbüttler Straße und Stübeheide</.m> auf der Nordseite <.ref>Hochbordradweg</.ref> für beide Richtungen mit rund 3,0m Breite anzubieten. An diesen schließt auch der geplante <.a name="rsw-bad-bramstedt">Radschnellweg („Radroute Plus“) nach Bad Bramstedt</.a> an.</p>

    <p>Die Einmündung in die <.v bounds="10.035123,53.627871,10.042561,53.632043" lon={10.036734} lat={53.62955} dir="forward" ref={@ref}>Stübeheide</.v> wird so gestaltet, dass der Radverkehr diese leichter als Alternative verwenden kann. Ab der Stübeheide bleibt es wie heute bei <.ref>Mischverkehr</.ref> mit Tempo 50.</p>

    <p>Der <.m bounds="10.028903,53.625167,10.033771,53.626293" highlight="Fuhlsbüttler Straße">Kreuzungsbereich mit der Fuhlsbüttler Straße</.m> ist nicht Teil der Planungen. Der Radwegstummel in Richtung Osten entfällt und wird stattdessen auf den nördlichen Radweg geleitet.</p>

    <p>Zum <.ref>indirekten Linksabbiegen</.ref> in die <.v bounds="10.032508,53.628025,10.048541,53.635474" lon={10.035888} lat={53.629} dir="forward" ref={@ref}>Kleine Horst</.v>, die <.v bounds="10.035123,53.627871,10.042561,53.632043" lon={10.036734} lat={53.62955} dir="forward" ref={@ref}>Stübeheide</.v> und den <.v bounds="10.046086,53.632725,10.055236,53.636627" lon={10.05127} lat={53.634758} dir="forward" ref={@ref}>Kornweg</.v> wird eine Aufstellfläche vorgesehen. Am <.v bounds="10.044768,53.632281,10.048094,53.634065" lon={10.04587} lat={53.63309} dir="forward" ref={@ref}>Schluchtweg</.v>, <.v bounds="10.047067,53.632645,10.054372,53.636521" lon={10.050378} lat={53.634543} dir="forward" ref={@ref} highlight="Grüner Winkel">Grünen Winkel</.v> und an <.v bounds="10.05471,53.635025,10.060444,53.637945" lon={10.057191} lat={53.636569} dir="forward" ref={@ref}>Borstels Ende</.v> ist nur <.ref>direktes Linksabbiegen</.ref> möglich.</p>

    <p>Anschließmöglichkeiten für Fahrräder werden im gesamten Baugebiet aufgestellt. Höhe <.v bounds="10.03854,53.630412,10.044065,53.633146" lon={10.041759} lat={53.631772} dir="forward" ref={@ref}>Hausnummer 136</.v> wird eine Mittelinsel gebaut um das Queren der Straße zu ermöglichen. Stellenweise werden die Gehwege breiter.</p>

    <h4>Meinung</h4>
    <p>Die Planung holt noch mit das Beste aus einer schwierigen Situation. Eine KFZ-Einbahnstraße ist unrealistisch, weil die Strecke auch für Verbesserungen im Nahverkehr („Hamburg-Takt“) eingeplant sind. Die Hälfte der Bäume zu fällen ist auch wenig attraktiv.</p>

    <p>Man fällt also nur die Bäume auf einem Teilstück, kann dadurch aber einen Radweg bis zu einer weniger befahrenen Straße anbieten. Diese ist offensichtlich als Alternativstrecke für diejenigen gedacht, die sich im Mischverkehr nicht wohlfühlen. Heute nur Tempo-30-Zone soll sie in Zukunft zu einer Fahrradstraße aufgewertet werden.</p>

    <h4>Quellen</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
