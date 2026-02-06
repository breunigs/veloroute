defmodule Data.Article.Blog.Schottmuellerstrasse do
  use Article.Default

  def title(), do: "Schottmüllerstraße"

  def summary(),
    do:
      "2,25m breite Radfahrstreifen sollen nahtlos an die Planung „Eppendorfer Markplatz“ anschließen. Sie enden kurz vor bzw. nach der Kümmellstraße."

  def type(), do: :planned

  def start(), do: ~d[2026-10]
  def stop(), do: ~d[2026-12]

  def tags(), do: []

  def tracks(), do: Data.Article.Blog.Lenhartzstrasse.tracks()

  def map_image do
    {name(),
     [
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
     ]}
  end

  def links(_assigns) do
    [
      {"fertiger Entwurf, Erläuterungen", ~d[2025-12],
       "https://lsbg.hamburg.de/resource/blob/1127206/44cb4ee1abc5847427884618b7d93722/schottmuellerstrasse-abgestimmte-planung-bericht-data.pdf"},
      {"fertiger Entwurf, Karte", ~d[2025-12],
       "https://lsbg.hamburg.de/resource/blob/1127208/0327e84b3d63db36a9877d75019fd38d/schottmuellerstrasse-abgestimmte-planung-plan-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es beidseitig 1,0m breite <.ref>Hochbordradwege</.ref> vorhanden. Eine deutliche Abgrenzung zum Gehweg fehlt.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der jeweils rechte Fahrstreifen soll zu einem <.ref>Radfahrstreifen</.ref> werden. Die Verschwenkung vom bzw. alten Radweg erfolgt ca. <.v bounds="9.982124,53.589334,9.987712,53.592842" lon={9.984735} lat={53.590856} dir="forward" ref={@ref}>Höhe Hausnummer 16</.v>. Durch Sicherheitsabstände und Markierungen verbleibt eine nutzbare Breite von 2,25m.</p>

    <p>In Richtung Südwesten wird eine neue Bushaltestelle <.v bounds="9.982124,53.589334,9.987712,53.592842" lon={9.984643} lat={53.591129} dir="backward" ref={@ref}>kurz vor der Aufleitung</.v> gebaut. Wer nicht hinter einem haltenden Bus warten möchte, muss sich in den KFZ-Verkehr einordnen um vorbeizufahren.</p>

    <p>Der alte Radweg wird zum Gehweg bzw. Grünfläche. Stellenweise kommen Fahrradbügel hinzu.</p>

    <p>Gebaut werden soll zeitgleich und abgestimmt mit dem Umbau des <.a ref={EppendorferMarktplatz}>Eppendorfer Marktplatz</.a>.</p>

    <h4>Meinung</h4>
    <p>An der Ad-Hoc-Maßnahme selbst gibt es wenig auszusetzen. Mittelfristig muss die Stadt die Kreuzung <.v bounds="9.980786,53.588493,9.986934,53.591626" lon={9.984285} lat={53.590859} dir="backward" ref={@ref}>Lenhartzstraße / Schottmüllerstraße / Tarpenbekstraße / Breitenfelder Straße</.v> neu planen, damit ein durchgehendes Fahrradnetz entsteht.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
