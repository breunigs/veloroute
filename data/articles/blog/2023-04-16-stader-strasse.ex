defmodule Data.Article.Blog.StaderStrasse do
  use Article.Default

  def title(), do: "Stader Straße (Moorburger Bogen bis Moorburger Straße, 2. Grüner Ring)"

  def summary(),
    do:
      "Abwechselnd Hochbordradwege und Radfahrstreifen. Häufig Mindestmaße neben hohem LKW-Verkehr. 2. Grüner Ring besser erreichbar. Planung von 2017."

  def type(), do: :planned

  def tags(), do: ["FR11"]

  def tracks(), do: []

  def links(_assigns) do
    [
      {"1. Entwurf, Bericht", "2017",
       "https://lsbg.hamburg.de/resource/blob/634640/a512719139047dca86c68e9d82d47743/stader-strasse-moorburger-bogen-bis-moorburger-strasse-abstimmungsunterlage-bericht-data.pdf"},
      {"1. Entwurf, Lagepläne", "2017",
       "https://lsbg.hamburg.de/resource/blob/634642/5e0194f37e36f89f8d010add40a9c23b/stader-strasse-moorburger-bogen-bis-moorburger-strasse-abstimmungsunterlage-plaene-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Entlang der Stader Straße wird der Radverkehr auf schmalen <.ref>Hochbordradwegen</.ref> geführt. <.v bounds="9.936771,53.469671,9.941836,53.472885" lon={9.939149} lat={53.470946} dir="backward" ref="FR11">Höhe des 2. Grünen Ring</.v> als Zweirichtungsradweg, damit das Waldstück erreicht werden kann.</p>

    <h4>Planung</h4>
    <p>Entlang der Stader Straße wechseln sich Hochbordradwege und Radfahrstreifen ab. Letztere kommen immer dann zum Einsatz wenn Bushaltestellen, Kreuzungen oder Ampel-Querungen vorhanden sind. Häufig sind Mindestmaße von 1,60m Breite vorgesehen. Am Waldweg zum 2. Grünen Ring soll eine direkte Querungsmöglichkeit geschaffen werden. Im <.v bounds="9.936321,53.470421,9.943616,53.476657" lon={9.937645} lat={53.474154} dir="backward" ref="FR11">Moorburger Bogen</.v> soll der Radverkehr im <.ref>Mischverkehr</.ref> fahren.</p>

    <p>Entlang der Stader Straße ist Linksabbiegen nur <.ref>indirekt</.ref> vorgesehen. Am Moorburger Bogen sind <.ref>Radfahrstreifen in Mittellage</.ref> vorgesehen. Das Abbiegen aus den Nebenstraßen erfolgt im Mischverkehr.</p>

    <h4>Meinung</h4>
    <p>Die Planung ist schrecklich. Sie selbst beschreibt die Hochbordradwege als „Erholungsstrecken“ von den Radfahrstreifen mit geringem Abstand zum hohen LKW-Aufkommen. Wegen den LKW wird direktes Linksabbiegen auch verboten, aber trotzdem Radfahrstreifen in Mittellage angelegt.</p>

    <p>Es ist klar, dass auf einem Autobahnzubringer mit geringem Radverkehr keine Premiumradwege zu erwarten sind. Mit vollem Wissen aber Stress- und Gefahrensituationen schaffen geht trotzdem nicht. Selbst durchgehend gemeinsame Rad- und Fußwege (VZ 240) wären eine bessere Lösung. Wird diese alte Planung von 2017 so umgesetzt, dürfte (illegal) auf dem Gehweg radeln sowieso zum Standard werden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end

# 2. grüner ring

# <!-- ===========================================
# LSBG:
# ===========================================

# Stader Straße (Moorburger Bogen bis  Moorburger Straße): Abstimmungsunterlage - Bericht

# all links:
# (Planungen)
# ===========================================

# Continue?

# ===========================================
# LSBG:
# ===========================================

# Stader Straße (Moorburger Bogen bis  Moorburger Straße):  Abstimmungsunterlage - Pläne

# all links:
# (Planungen)
# ===========================================
#  -->
