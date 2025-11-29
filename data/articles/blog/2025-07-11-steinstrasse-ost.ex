defmodule Data.Article.Blog.SteinstrasseOst do
  use Article.Default

  def title(), do: "Steinstraße (Kreuzung Steintorwall)"

  def summary(),
    do:
      "Nordseite bekommt 1,5m schmalen Radweg, die Südseite behält den rund 1,75m breiten Radfahrstreifen."

  def type(), do: :planned
  # def start(), do: ~d[2026Q1]
  # def stop(), do: ~d[2027Q1]

  def tags(), do: ["radroute-2", "radroute-concept-a", "1GR", "FR6", "FR5"]

  def tracks(), do: Data.Article.Blog.Steinstrasse.tracks()

  def links(_assigns) do
    [
      {"fertiger Entwurf – Bericht", ~d[2025-07],
       "https://lsbg.hamburg.de/resource/blob/1078454/b946415d4c5ca6c4e9816ccc9ec02f9d/steinstrasse-anschlussplanung-kreuzung-klosterwall-abgestimmte-planung-bericht-data.pdf"},
      {"fertiger Entwurf – Karte", ~d[2025-07],
       "https://lsbg.hamburg.de/resource/blob/1078462/e2e2ecbcf82906d4a00140a2c74bf13f/steinstrasse-anschlussplanung-kreuzung-klosterwall-abgestimmte-planung-plan-data.pdf"}
    ]
  end

  def map_image do
    {name(),
     [
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"},
       {"wfw nord consult Ingenieurgesellschaft mbH", "https://www.wfwnc.de/kontakt/kontakt/"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Auf der <.v bounds="10.004107,53.549435,10.007032,53.550621" lon={10.006005} lat={53.550287} dir="forward" ref={@ref}>Nordseite (Richtung Altstadt)</.v> ist ein rund 1,0m breiter <.ref>Hochbordradweg</.ref>. Auf der <.v bounds="10.004107,53.549435,10.007032,53.550621" lon={10.004914} lat={53.550025} dir="backward" ref={@ref}>Südseite (Richtung St. Georg)</.v> ist ein 1,75m breiter <.ref>Radfahrstreifen</.ref>. Linksabbiegen ist nur teilweise erlaubt und wenn dann nur <.ref>indirekt</.ref> vorgesehen.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die Planung behält den bisherigen Ansatz im Wesentlichen bei. Der Hochbordradweg auf der Nordseite wird auf 1,5m verbreitert und erreicht damit nicht die vorgeschriebenen Mindestbreiten. Der Radfahrstreifen auf der Südseite bleibt wie heute.</p>

    <p>Angepasst wird der Anschluss an die <.a ref={Steinstrasse}>umgeplante Steinstraße</.a>. Dadurch wird die Aufstelltasche zum Linksabbiegen in Richtung <.m bounds="10.004418,53.548889,10.006212,53.550555">Johanniswall</.m> nun links vom geradeaus fahrenden Radverkehr platziert.</p>

    <p>Das Linksabbiegen in <.m bounds="10.004412,53.549672,10.00573,53.551179">Lange Mühren</.m> ist weiterhin nicht vorgesehen.</p>

    <h4>Meinung</h4>
    <p>Das Planungsbüro müht sich sichtlich, die bisherigen Einschränkungen für den Radverkehr aufzuheben. Leider will man auch alle heutigen KFZ-Spuren erhalten, was eine ordentliche Lösung verhindert.</p>

    <p>Angesichts der wenigen verbleibenden privaten KFZ-Fahrten im Abschnitt ist mehr Gestaltungsfreude angebracht. Wenn man etwa die KFZ-Linksabbiegespur in den Johanniswall entfallen lässt, hätte man sofort mehr Möglichkeiten.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
