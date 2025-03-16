defmodule Data.Article.Static.HalstenbekR1 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "halstenbek-r1"
  def display_id(), do: "1"
  def title(), do: "Halstenbek Veloroute 1"
  def color(), do: RouteColors.rsw()

  def summary(),
    do:
      "Die Veloroute 1 entspricht dem Radschnellweg Elmshorn. Sie verläuft südwestlich der Bahngleise in Nordwest-Südost-Richtung."

  def tags(), do: [id()]

  def tracks(), do: Data.Article.Static.RSWElmshorn.tracks()

  def links(_assigns) do
    [
      {"Velorouten Vorschläge ADFC", ~d[2025-02],
       "https://www.adfc-halstenbek.de/2025/02/11/velorouten-fuer-halstenbek/"},
      {"Verkehrsentwicklungsplan Halstenbek", ~d[2021-10],
       "https://www.halstenbek.de/Redaktion/user_upload/D_211027_Projektbericht_VEP.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Halstenbeks „Veloroute 1“ entspricht genau der Vorzugsvariante des <.a name="rsw-elmshorn">Radschnellweg Elmshorn</.a>. Sie verläuft südlich der Gleise und verbindet Pinneberg im Nordwesten mit Lurup im Südosten.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Wege teilen sich in zwei Klassen auf: asphaltiert und befahrbar, auch wenn die Oberflächen teils Schlaglöcher aufweisen. Auch die viele Kreuzungen sind nicht optimal. In <.v bounds="9.811174,53.632117,9.837435,53.6471" lon={9.822499} lat={53.638803} dir="forward" ref={@ref}>Richtung Pinneberg</.v> fehlt jedoch ein ordentlicher Weg. Der sehr schmale Trampelpfad ist für den Alltag keine Option. Es empfiehlt sich stattdessen den <.v bounds="9.811174,53.632117,9.837435,53.6471" lon={9.830412} lat={53.639331} dir="forward" ref="halstenbek-r2">Thesdorfer Weg</.v> zu benutzen.</p>

    <h4>Meinung</h4>
    <p>Ausgebaut wäre es eine super Verbindung. Bisher unterscheidet sich die Fahrt entlang der Veloroute jedoch kaum von irgendwelchen anderen Wohnstraßen.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
