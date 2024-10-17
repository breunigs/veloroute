defmodule Data.Article.Blog.NeueStrasse do
  use Article.Default

  def title(),
    do: "Neue Straße – Am Soldatenfriedhof bis Buxtehuder Straße (Radroute 10, Freizeitroute 6)"

  def start(), do: ~d[2024-10-28]
  def stop(), do: ~d[2025-03-28]
  def construction_site_id_hh(), do: [1_122_273]

  def summary(), do: "Abschnitt soll abgeflachtes Pflaster bekommen."

  def type(), do: :construction

  def tags(), do: ["10", "FR6"]

  def links(_assigns) do
    [
      {"hamburg.de/baustellen", ~d[2024-10],
       "https://bauweiser.hamburg.de/cockpit/steckbriefeweb"},
      {"Direktlink Baustellen Steckbrief", ~d[2024-10],
       "https://bauweiser.hamburg.de/api/steckbriefeweb/id/1122273"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Straße ist mit klassischem Kopfsteinpflaster befestigt. Entsprechend holprig ist die Fahrt.</p>

    <h4>Vorhaben</h4>
    <p>Laut Baustellenankündigung soll die <.ref>Fahrbahn</.ref> neu gepflastert werden. Dabei soll ein „glattes“ Pflaster eingebaut werden. Vermutlich ist abgeflachtes bzw. geschliffenes Pflaster gemeint, was z.B. auch auf dem <.v bounds="9.982951,53.465614,9.988446,53.467453" lon={9.985716} lat={53.466357} dir="forward" ref="FR6">Gehweg beim Kanalplatz</.v> verbaut wurde.</p>

    <p>Auch das Pflaster um die <.v bounds="9.979481,53.463228,9.981618,53.464361" lon={9.980392} lat={53.463744} dir="backward" ref="10">Lämmertwiete</.v> soll vereinheitlicht werden.</p>

    <h4>Links</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
