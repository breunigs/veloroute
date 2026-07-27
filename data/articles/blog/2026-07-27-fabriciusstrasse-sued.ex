defmodule Data.Article.Blog.FabriciusstrasseSued do
  use Article.Default

  def title(),
    do: "Fabriciusstraße – Hellbrookkamp bis Heinrich-Helbing-Straße (Bezirksroute Wandsbek W3)"

  def summary(),
    do:
      "Bezirksamt überlegt die Radfahrstreifen aus dem nördlichen Abschnitt bis zur Heinrich-Helbing-Straße zu verlängern."

  def type(), do: :intent

  def tags(), do: ["br-wandsbek-w3"]

  def links(_assigns) do
    [
      {"grober Vorentwurf", ~d[2026-07],
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1025728"}
    ]
  end

  def map_image do
    {name(),
     [
       {"Bezirksamt Wandsbek, Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/wandsbek/ihr-bezirksamt/aufgaben-und-struktur/dezernat-wirtschaft-bauen-umwelt-75138"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Aktueller Zustand</h4>
    <p>Im Abschnitt findet der Radverkehr auf 1,5m breiten <.ref>Hochbordradwegen</.ref> statt. Wer mag, darf auch auf der <.ref>Fahrbahn</.ref> radeln.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die <.v bounds="10.058342,53.594326,10.063479,53.599551" lon={10.060901} lat={53.598194} dir="backward" ref={BrWandsbekW3}>im Norden</.v> anschließenden <.ref>Radfahrstreifen</.ref> sollen von bzw. bis zur <.v bounds="10.056472,53.593572,10.061174,53.596793" lon={10.058905} lat={53.595027} dir="backward" ref={BrWandsbekW3}>Heinrich-Helbing-Straße</.v> verlängert werden. Im Vorentwurf werden sie 2,0m breit.</p>

    <p>Einige KFZ-Parkplätze würden stattdessen mit neuen Bäumen bepflanzt werden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
