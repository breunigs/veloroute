defmodule Data.Article.Blog.WellingsbuettlerWeg do
  use Article.Default

  def title(), do: "Wellingsbüttler Weg (Bezirksroute W8)"
  def updated_at(), do: ~D[2025-12-19]

  def start(), do: ~d[2026Q2]

  def summary(),
    do:
      "Verwirrende Radwegreste werden entfernt. Nach dem Umbau stehen zwei klare und durchgängige Varianten bereit: Gehweg im Schritttempo oder auf der Fahrbahn mit den KFZ."

  def type(), do: :planned

  def tags(), do: ["br-wandsbek-w8"]

  def links(_assigns) do
    [
      {"fertiger Entwurf – Erläuterungen", ~d[2025-12],
       "https://lsbg.hamburg.de/resource/blob/1129448/844f426bb685f027e17dfe98820b52ab/wellingsbuettler-weg-abgestimmte-planung-bericht-data.pdf"},
      {"fertiger Entwurf – Karte", ~d[2025-12],
       "https://lsbg.hamburg.de/resource/blob/1129450/ef9b5b2344c2ab172d7af01bd9e4f24b/wellingsbuettler-weg-abgestimmte-planung-plan-data.pdf"},
      {"Baustelleninfo", ~d[2025-07],
       "https://lsbg.hamburg.de/resource/blob/1081442/7807413c98de673a969d8b6dd1a3e7b4/wellingsbuettler-weg-anliegerinformation-juli-2025-data.pdf"},
      {"Baustelleninfo", ~d[2025-02],
       "https://lsbg.hamburg.de/resource/blob/1023080/141a6e5497d1109e883844037a2f3f86/wellingsbuettler-weg-anliegerinformation-februar-2025-data.pdf"},
      # {"Baustelleninfo", ~d[2024-07],
      #  "https://lsbg.hamburg.de/resource/blob/931050/e96198ba0f5bd5b6b2c68c4af1036a01/wellingsbuetteler-landstrasse-anliegerinformation-juli-2024-data.pdf"},
      {"1. Entwurf – Erläuterungen", ~d[2024-07],
       "https://lsbg.hamburg.de/resource/blob/939366/2d1b0f6bc9fcf1776c9bec1b3c811b7f/wellingsbuettler-weg-abstimmungsunterlage-bericht-data.pdf"},
      {"1. Entwurf – Karte", ~d[2024-07],
       "https://lsbg.hamburg.de/resource/blob/939378/e691ef3319df7de05162ae299b89b143/wellingsbuettler-weg-abstimmungsunterlage-plan-data.pdf"}
    ]
  end

  def tracks, do: Data.Article.Blog.WellingsbuettelerLandstrasse.tracks()

  def map_image do
    {name(), [{"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es gibt keine erkennbare, durchgängige Führung für den Radverkehr. Stellenweise sind Reste von <.ref>Hochbordradwegen</.ref> vorhanden, Gehwege mit <.ref>Fahrrad frei</.ref> ausgeschildert oder die Fahrt zusammen mit KFZ im <.ref>Mischverkehr</.ref> vorgesehen. Die Fahrt im Mischverkehr ist auf gesamter Länge erlaubt.</p>

    <p>Nutzbare Überleitungen der verschiedenen Varianten fehlen. Die Gehwege sind teils wie Radwege gestaltet und umgekehrt. Zusätzlich wurde illegal KFZ-Parken auf den Gehwegen beschildert, was die Unklarheit verstärkt.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der Radverkehr hat die Wahl weiter mit den KFZ auf der Fahrbahn im Mischverkehr zu fahren, oder im Schritttempo auf den freigegebenen Gehwegen. Eine einheitliche Gestaltung der Gehwege beugt Unklarheiten vor – Radwegreste werden komplett entfernt.</p>

    <p>Zwischen <.v bounds="10.075193,53.641514,10.079528,53.643801" lon={10.076543} lat={53.642314} dir="forward" ref={@ref}>Friedrich-Kirsten-Straße</.v> und <.v bounds="10.07736,53.639643,10.082645,53.643621" lon={10.079357} lat={53.641006} dir="forward" ref={@ref}>Barkenkoppel</.v> entsteht beidseitig ein jeweils rund 1,85m breiter <.ref>Kopenhagener Radweg</.ref>. Dieser soll Teil der <.a ref={BrWandsbekW8}>Bezirksroute Wandsbek 8</.a> werden.</p>

    <p>Bushaltestellen erhalten einen ebenerdigen Einstieg und teilweise Fahrradparken. KFZ-Parkplätze werden als Parkbuchten gebaut. Einmündende Straßen werden mittels Gehwegüberfahrt angeschlossen.</p>

    <h4>Meinung</h4>
    <p>Wegen der Straßenbreiten war absehbar, dass es nicht auf gesamter Strecke für einen eigenen Radweg reicht. Immerhin sind die Wahlmöglichkeiten „Gehweg mit Schritttempo“ oder „Fahrbahn mit KFZ“ klar erkennbar und durchgängig. Das ist besser als Stückwerk.</p>

    <p>Auf der Bezirksroute dem Radverkehr eigene Wege zu geben ist löblich. Leider ist die Lösung zu Lasten des Gehwegs, der dort sehr schmal wird.</p>

    <p>Da <.v bounds="10.035922,53.627915,10.06323,53.638454" lon={10.038281} lat={53.629592} dir="forward" ref={BrNordN8}>Stübeheide</.v>, <.v bounds="10.055512,53.632214,10.077868,53.642074" lon={10.060241} lat={53.634634} dir="forward" ref={BrWandsbekW6}>Sanderskoppel</.v> und <.v bounds="10.065491,53.634027,10.087778,53.644692" lon={10.070111} lat={53.637057} dir="forward" ref={BrWandsbekW6}>Barkenkoppel</.v> zu Fahrradstraßen aufgewertet werden sollen, besteht langfristig auch im Berufsverkehr eine Möglichkeit im Normaltempo am KFZ-Stau vorbeizukommen.</p>

    <p>Die geplanten KFZ-Parkplätze sollten jedoch (teilweise) durch Lieferzonen bzw. weitere Baumstandorte ersetzt werden. Auf den Privatgrundstücken ist genug Platz zum Abstellen von privaten Fahrzeugen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
