defmodule Data.Article.Blog.Kattunbleiche do
  use Article.Default

  def title(), do: "Kattunbleiche (Südseite)"

  def summary(),
    do:
      "Neu angelegter Radfahrstreifen soll den Radverkehr aufnehmen. Alter Hochbordradweg soll zu neuem Gehweg werden."

  def type(), do: :intent
  def start(), do: ~d[2025-11-03]
  def stop(), do: ~d[2026-03-31]
  def construction_site_id_hh(), do: [1_868_001]

  def tags(), do: []

  def map_image do
    {name(),
     [
       {"Bezirksamt Wandsbek, Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/wandsbek/ihr-bezirksamt/aufgaben-und-struktur/dezernat-wirtschaft-bauen-umwelt-75138"}
     ]}
  end

  def links(_assigns) do
    [
      {"Planungsskizze", ~d[2025-05],
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1022885"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Kurz vor der Einmündung <.m bounds="10.066755,53.574074,10.068235,53.575017">Hinterm Stern</.m> beginnt ein <.ref>Hochbordradweg</.ref>. Der Gehweg knickt ab und verläuft an den Häusern.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}>Vorhaben</.h4_planning>
    <p>Der Radweg soll in der Einmündung Hinterm Stern beginnen und als <.ref>Radfahrstreifen</.ref> an der <.m bounds="10.067615,53.574164,10.069236,53.575119">Litzowstraße</.m> in den vorhandenen Hochbordradweg übergehen. Der alte Radweg soll neu gepflastert und zum Gehweg umfunktioniert werden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
