defmodule Data.Article.Blog.Eckerkoppel do
  use Article.Default

  def title(), do: "Eckerkoppel – bis Friedrich-Ebert-Damm (Radroute 6)"

  def summary(), do: "Eckerkoppel soll Teil der Tempo-30-Zone werden."

  def type(), do: :intent

  def tags(), do: ["radroute-6"]

  def map_image do
    {name(),
     [
       {"Bezirksamt Wandsbek, Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/wandsbek/ihr-bezirksamt/aufgaben-und-struktur/dezernat-wirtschaft-bauen-umwelt-75138"}
     ]}
  end

  def links(_assigns) do
    [
      {"Vorentwurf, Präsentation", ~d[2026-06],
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1025500"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In der Eckerkoppel gibt es keine eigenen Radwege. Radverkehr teilt sich mit KFZ bei 50 km/h im <.ref>Mischverkehr</.ref> die <.ref>Fahrbahn</.ref>. Abgestellte KFZ machen die Straße teilweise einspurig.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die Eckerkoppel soll Tempo-30-Zone werden. Nach der Asphaltsanierung sollen dazu an verschiedenen Stellen Einengungen durch Verkehrsinseln entstehen. An der <.v bounds="10.106542,53.598517,10.108589,53.599518" lon={10.107051} lat={53.598909} dir="forward" ref={Radroute6} highlight="Tegelweg">Kreuzung mit dem Tegelweg</.v> ist ein Kreisverkehr geplant.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
