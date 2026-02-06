defmodule Data.Article.Blog.Krausestrasse2 do
  use Article.Default

  def title(), do: "Krausestraße (Hausnr. 27 bis 61 – Bezirksrouten N4 und N5)"

  def summary(),
    do:
      "Nach Süden 1,6m breiter Radfahrstreifen. Nach Norden nur vor der Schule, sonst nur 1,3m breiter Schutzstreifen."

  def type(), do: :planned
  def start(), do: ~d[2026-09]
  def stop(), do: ~d[2026-10]

  def tags(), do: ["N4", "N5"]

  def tracks(), do: Data.Article.Blog.Krausestrasse.tracks()

  def links(_assigns) do
    [
      {"Bericht – fertiger Entwurf", ~d[2026-02],
       "https://lsbg.hamburg.de/resource/blob/1143472/005f7a118eee63a719c9a89fd863798b/krausestrasse-radverkehrsmassnahme-abgestimmte-planung-bericht-data.pdf"},
      {"Pläne – fertiger Entwurf", ~d[2026-02],
       "https://lsbg.hamburg.de/resource/blob/1143476/80aab3a0b8cfd4ed257b6c0eac60e559/krausestrasse-radverkehrsmassnahme-abgestimmte-planung-plan-data.pdf"},
      {"Projektseite des LSBG", "https://lsbg.hamburg.de/krausestrasse-bis-hammer-strasse"}
    ]
  end

  def map_image do
    {name(),
     [
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es gibt im Abschnitt zwischen Osterbekkanal und Lauenburger Straße keine eigenen Radwege.</p>

    <p>Für vorige Planungen und Zwischenlösungen siehe <.a ref={Data.Article.Blog.Krausestrasse}>alter Artikel</.a>.</p>


    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Ohne großen Umbau sollen Radwege aufgemalt werden.</p>

    <p>In <.v bounds="10.053745,53.580621,10.05854,53.584434" lon={10.054787} lat={53.583163} dir="forward" ref={Krausestrasse}>Richtung Süden</.v> ist meist ein 1,6m breiter <.ref>Radfahrstreifen</.ref> vorgesehen. Nur am Anfang bis <.v bounds="10.054966,53.581767,10.057095,53.583134" lon={10.055272} lat={53.582761} dir="forward" ref={Krausestrasse}>Alter Teichweg</.v> wird es ein 1,6m breiter <.ref>Schutzstreifen</.ref>.</p>

    <p>In <.v bounds="10.054996,53.578075,10.059765,53.581494" lon={10.058008} lat={53.57889} dir="backward" ref={Krausestrasse}>Richtung Norden</.v> ist es ein rund 1,3m breiter Schutzstreifen. Nur zwischen <.v bounds="10.054088,53.579463,10.058858,53.582882" lon={10.057462} lat={53.579891} dir="backward" ref={Krausestrasse}>Dehnhaide</.v> und der <.v bounds="10.054088,53.579463,10.058858,53.582882" lon={10.056682} lat={53.581273} dir="backward" ref={Krausestrasse}>Emil-Krause-Schule</.v> wird es ein 1,6m breiter Radfahrstreifen.</p>

    <p>Die Furt über die Kreuzungen ist geradlinig. Es ist <.ref>indirektes Linksabbiegen</.ref> vorgesehen.</p>

    <h4>Meinung</h4>
    <p>Größter Vorteil an der Planung ist, dass man an den Kreuzungen nicht mehr hinter den Autos warten muss.</p>

    <p>Die Radwege sind jedoch zu schmal. Da sich unwissende Autofahrer an den Linien orientieren, werden die gefährlich knappen Überholvorgänge zunehmen.</p>

    <p>Es ist ersichtlich, dass die Straße nicht breit genug ist für zwei KFZ-Spuren. Die Stadt sollte lieber über ein weiträumiges Konzept für KFZ-Einbahnstraßen nachdenken, statt auf Alibi-Radwege zu setzen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
