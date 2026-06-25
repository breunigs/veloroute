defmodule Data.Article.Blog.AlsterdorferStrasse do
  use Article.Default

  def title(), do: "Alsterdorfer Straße – östlich der Carl-Cohn-Straße"

  def summary(),
    do:
      "Durchgängige Schutzstreifen mit 1,5m Breite. Kreisel an der Heubergredder. Tempo 50 bleibt."

  def type(), do: :planned
  def tags(), do: []

  def map_image do
    {name(),
     [
       {"Sweco GmbH", "https://www.sweco-gmbh.de/kontakt/kontakt-verkehr-und-infrastruktur/"},
       {"Bezirksamt Hamburg-Nord, Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/hamburg-nord/wirtschaft-bauen-umwelt-70292"}
     ]}
  end

  def links(_assigns) do
    [
      {"Erläuterungsbericht (1. Entwurf)", ~d[2026-06],
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1016819"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Radfahrende werden im <.ref>Mischverkehr</.ref> geführt. Im östlichen Abschnitt der Alsterdorfer Straße gibt es einen Radweg ohne <.ref>Benutzungspflicht</.ref>.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die <.m bounds="10.004581,53.606781,10.012718,53.60978">Alsterdorfer Straße</.m> bekommt beidseitig <.ref>Schutzstreifen</.ref> mit 1,5m Breite. Im <.m bounds="10.00722,53.607296,10.010999,53.609407">Heubergredder</.m> ordnet einheitliches Schrägparken die Seitenräume, sodass der westliche Gehweg auf 2,0 m verbreitert werden kann.</p>

    <p>Die Kreuzung <.m bounds="10.007833,53.607791,10.010267,53.608932">Alsterdorfer Straße/Heubergredder</.m> soll zu einem kleinen Kreisverkehr umgebaut werden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
