defmodule Data.Article.Blog.Stuebeheide do
  use Article.Default

  def title(), do: "Stübeheide (Bezirksroute Nord N8)"

  def summary(),
    do:
      "Stübeheide soll größtenteils zur Fahrradstraße umgebaut werden. KFZ Verkehr bleibt weiterhin erlaubt. Tornberg bis Borstels Ende bleibt Tempo-30-Zone."

  def type(), do: :planned
  def start(), do: ~d[2027Q4]
  # def stop(), do: ~d[2026-10]

  def tags(), do: ["N8", "br-nord-n8"]

  def links(_assigns) do
    [
      {"erster Entwurf – Karten und Erläuterung", ~d[2026-03],
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1016390"}
    ]
  end

  def map_image do
    {name(),
     [
       {"BPR beratende Ingenieure mbB", "https://bpr-ingenieurbuero.de/hamburg/#kontakt"},
       {"Bezirksamt Nord, Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/hamburg-nord/fachamt-management-des-oeffentlichen-raums-70286"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Straße ist Teil einer Tempo-30-Zone. Meist radelt man im <.ref>Mischverkehr</.ref>. Die teilweise vorhandenen <.ref>Hochbordradweg</.ref> sind nur selten benutzbar.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Von der <.v bounds="10.034196,53.628284,10.041304,53.632277" lon={10.036978} lat={53.629545} dir="forward" ref={BrNordN8}>Wellingsbütteler Landstraße</.v> bis zum <.v bounds="10.052042,53.631982,10.058276,53.635366" lon={10.054493} lat={53.633324} dir="forward" ref={BrNordN8}>Tornberg</.v> soll eine Fahrradstraße eingerichtet werden. Sie wird meist 4,25m bis 4,75m breit. KFZ-Parken wird in geordnete Parkbuchten verlegt. Der <.v bounds="10.045625,53.630759,10.048201,53.632532" lon={10.046769} lat={53.631616} dir="forward" highlight="Schluchtweg" ref={BrNordN8}>Kreisel mit dem Schluchtweg</.v> wird nicht umgebaut.</p>

    <p>Vom <.v bounds="10.052042,53.631982,10.058276,53.635366" lon={10.054493} lat={53.633324} dir="forward" ref={BrNordN8}>Tornberg</.v> bis <.v bounds="10.055711,53.632778,10.060285,53.635245" lon={10.057797} lat={53.633948} dir="forward" ref={BrNordN8}>Borstels Ende</.v> bleibt die Tempo-30 Zone. Der Abschnitt wird neu asphaltiert, erhält leicht breitere Gehwege und eine <.ref>Querungshilfe</.ref> bei der Kirche.</p>

    <h4>Meinung</h4>
    <p>Hauptgewinn ist die durchgängig gleich breite Fahrbahn, weil der Slalom um die unübersichtlich abgestellten KFZ entfällt.</p>

    <p>Dass man die Fahrradstraße nicht bis zum Ende durchzieht ist schade, aber verschmerzbar.</p>

    <p>Spannend bleibt die Weiterführung: eine Anbindung an die <.v bounds="10.05569,53.632287,10.063166,53.636272" lon={10.058093} lat={53.634403} dir="forward" ref={BrNordN8}>Sanderskoppel</.v> sei aus „technischen Gründen“ nicht möglich. Daher wird der <.m bounds="10.054784,53.631537,10.064873,53.635436">Siriusweg</.m> als Alternative geprüft.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
