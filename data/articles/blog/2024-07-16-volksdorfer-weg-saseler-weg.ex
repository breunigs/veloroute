defmodule Data.Article.Blog.VolksdorferWegSaselerWeg do
  use Article.Default

  def title(),
    do:
      "Volksdorfer Weg und Saseler Weg – Hochholdsweg bis Farmsener Landstraße (Bezirksroute W6)"

  def summary(),
    do:
      "Zahlreiche Fahrbahneinengungen auf eine Fahrspur sollen die Einhaltung des 30 km/h Tempolimits fördern."

  def type(), do: :planned

  def tags(), do: ["br-wandsbek-w6"]

  def map_image do
    {name(), [{"BRW Ingenieurpartnerschaft mbB", "https://brw-ip.de/"}]}
  end

  def links(_assigns) do
    [
      {"1. Entwurf", ~d[2024-07],
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1021175"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es sind durchgängig zwei Fahrspuren auf der <.ref>Fahrbahn</.ref> vorhanden. Da es keine Radwege gibt, muss der Radverkehr im <.ref>Mischverkehr</.ref> fahren. Der Abschnitt ist größtenteils auf Tempo 30 limitiert, was mit dem Auto jedoch oft ignoriert wird.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die Fahrbahn soll an zahlreichen stellen auf eine Fahrspur eingeengt werden (im Volksdorfer Weg ca. bei den Hausnummern <.v bounds="10.13114,53.645956,10.133546,53.647343" lon={10.131799} lat={53.646316} dir="forward" ref={BrWandsbekW6}>201</.v>, <.v bounds="10.13114,53.645956,10.133546,53.647343" lon={10.132708} lat={53.646478} dir="forward" ref={BrWandsbekW6}>205</.v>, <.v bounds="10.133056,53.646379,10.135584,53.647474" lon={10.134066} lat={53.646724} dir="forward" ref={BrWandsbekW6}>219</.v>, <.v bounds="10.13507,53.646517,10.137991,53.648426" lon={10.136275} lat={53.647304} dir="forward" ref={BrWandsbekW6}>229</.v>, <.v bounds="10.13507,53.646517,10.137991,53.648426" lon={10.137042} lat={53.647547} dir="forward" ref={BrWandsbekW6}>231</.v>, im Saseler Weg bei Hausnummern <.v bounds="10.142667,53.648078,10.145495,53.649014" lon={10.143764} lat={53.6485} dir="forward" ref={BrWandsbekW6}>53</.v>, <.v bounds="10.145603,53.648285,10.148044,53.649523" lon={10.14619} lat={53.648774} dir="forward" ref={BrWandsbekW6}>49</.v>, <.v bounds="10.147942,53.648857,10.150404,53.649748" lon={10.14916} lat={53.649231} dir="forward" ref={BrWandsbekW6}>37</.v>, <.v bounds="10.151628,53.648302,10.154037,53.649417" lon={10.152394} lat={53.649028} dir="forward" ref={BrWandsbekW6}>20</.v>, und <.v bounds="10.155165,53.648155,10.157568,53.649195" lon={10.155911} lat={53.648604} dir="forward" ref={BrWandsbekW6}>6</.v>). An einem <.v bounds="10.136355,53.646835,10.140732,53.648946" lon={10.137985} lat={53.647779} dir="forward" ref={BrWandsbekW6}>querenden Waldweg</.v> sollen beidseitige Gehwegnasen als <.ref>Querungshilfe</.ref> installiert werden.</p>

    <h4>Meinung</h4>
    <p>Weniger Rasen hilft der Verkehrssicherheit. Leider sind Einengungen ein zweischneidiges Schwert, weil dem Radverkehr oft die Vorfahrt genommen wird oder er knapp vor der Verkehrsinsel überholt und dann abgedrängt wird.</p>

    <p>Besser wären Blitzersäulen. Auch eine Einbahnstraßen-Regelung zusammen mit dem parallel verlaufenden <.a ref={Waldweg}>Waldweg</.a> wäre denkbar. Dann bliebe genug Platz für getrennte Radwege.</p>

    <h4>Links</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
