defmodule Data.Article.Blog.WellingsbuettlerWeg do
  use Article.Default

  def title(), do: "Wellingsbüttler Weg"

  def start(), do: ~d[2026Q2]

  def summary(),
    do:
      "Verwirrende Radwegreste werden entfernt. Nach dem Umbau stehen zwei klare und durchgängige Varianten bereit: Gehweg im Schritttempo oder auf der Fahrbahn mit den KFZ."

  def type(), do: :planned

  def tags(), do: []

  def links(_assigns) do
    [
      {"1. Entwurf – Erläuterungen", ~d[2024-07],
       "https://lsbg.hamburg.de/resource/blob/939366/2d1b0f6bc9fcf1776c9bec1b3c811b7f/wellingsbuettler-weg-abstimmungsunterlage-bericht-data.pdf"},
      {"1. Entwurf – Plan", ~d[2024-07],
       "https://lsbg.hamburg.de/resource/blob/939378/e691ef3319df7de05162ae299b89b143/wellingsbuettler-weg-abstimmungsunterlage-plan-data.pdf"}
    ]
  end

  def tracks, do: Data.Article.Blog.WellingsbuettelerLandstrasse.tracks()

  @attrib {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
  def map_image do
    [
      Data.MapImage.new(__MODULE__, @attrib, 1, {
        %{lat: 53.637209903, lon: 10.056883017},
        %{lat: 53.638981158, lon: 10.063592020},
        %{lat: 53.638229477, lon: 10.064158253},
        %{lat: 53.636458222, lon: 10.057449250}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 2, {
        %{lat: 53.639069357, lon: 10.063326908},
        %{lat: 53.642098123, lon: 10.074861452},
        %{lat: 53.641680622, lon: 10.075174159},
        %{lat: 53.638651856, lon: 10.063639614}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 3, {
        %{lat: 53.642026660, lon: 10.074740100},
        %{lat: 53.642952325, lon: 10.078256158},
        %{lat: 53.640975007, lon: 10.079738680},
        %{lat: 53.640049342, lon: 10.076222622}
      })
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es gibt keine erkennbare, durchgängige Führung für den Radverkehr. Stellenweise sind Reste von <.ref>Hochbordradwegen</.ref> vorhanden, Gehwege mit <.ref>Fahrrad frei</.ref> ausgeschildert oder die Fahrt zusammen mit KFZ im <.ref>Mischverkehr</.ref> vorgesehen. Die Fahrt im Mischverkehr ist auf gesamter Länge erlaubt.</p>

    <p>Nutzbare Überleitungen der verschiedenen Varianten fehlen. Die Gehwege sind teils wie Radwege gestaltet und umgekehrt. Zusätzlich wurde illegal KFZ-Parken auf den Gehwegen beschildert, was die Unklarheit verstärkt.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der Radverkehr hat die Wahl weiter mit den KFZ auf der Fahrbahn im Mischverkehr zu fahren, oder im Schritttempo auf den freigegebenen Gehwegen. Eine einheitliche Gestaltung der Gehwege beugt Unklarheiten vor – Radwegreste werden komplett entfernt.</p>

    <p>Bushaltestellen erhalten einen ebenerdigen Einstieg und teilweise Fahrradparken. KFZ-Parkplätze werden als Parkbuchten gebaut. Einmündende Straßen werden mittels Gehwegüberfahrt angeschlossen.</p>

    <h4>Meinung</h4>
    <p>Wegen der Straßenbreiten war absehbar, dass es nicht auf gesamter Strecke für einen eigenen Radweg reicht. Immerhin sind die Wahlmöglichkeiten „Gehweg mit Schritttempo“ oder „Fahrbahn mit KFZ“ klar erkennbar und durchgängig. Das ist besser als Stückwerk.</p>

    <p>Da <.v bounds="10.035922,53.627915,10.06323,53.638454" lon={10.038281} lat={53.629592} dir="forward" ref="br-nord-n8">Stübeheide</.v>, <.v bounds="10.055512,53.632214,10.077868,53.642074" lon={10.060241} lat={53.634634} dir="forward" ref="br-wandsbek-w6">Sanderskoppel</.v> und <.v bounds="10.065491,53.634027,10.087778,53.644692" lon={10.070111} lat={53.637057} dir="forward" ref="br-wandsbek-w6">Barkenkoppel</.v> zu Fahrradstraßen aufgewertet werden sollen, besteht langfristig auch im Berufsverkehr eine Möglichkeit im Normaltempo am KFZ-Stau vorbeizukommen.</p>

    <p>Die geplanten KFZ-Parkplätze sollten jedoch (teilweise) durch Lieferzonen bzw. weitere Baumstandorte ersetzt werden. Auf den Privatgrundstücken ist genug Platz zum Abstellen von privaten Fahrzeugen.</p>

    <h4>Links</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
