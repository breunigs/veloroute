defmodule Data.Article.Blog.SaselerStrasse do
  use Article.Default

  def title(), do: "Saseler Straße"

  def summary(),
    do:
      "Bushaltestelle Alaskaweg wird erneuert und am Schierenberg eine Neue gebaut. Dort 2,0m breite Radfahrstreifen. Sonst werden die alten Radwege nur neu gepflastert."

  def type(), do: :construction

  def tags(), do: []

  def start(), do: ~d[2026-04-07]
  def stop(), do: ~d[2027-03-31]
  def construction_site_id_hh(), do: [2_821_155]

  def map_image do
    {name(),
     [
       {"Bezirksamt Wandsbek, Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/wandsbek/ihr-bezirksamt/aufgaben-und-struktur/dezernat-wirtschaft-bauen-umwelt-75138"}
     ]}
  end

  def links(_assigns) do
    [
      {"Erläuterungen und Karten, fertiger Entwurf", ~d[2025-11],
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1024150"},
      {"Blogpost Lokalpolitiker", ~d[2025-11],
       "https://www.buschhueter.de/baustart-2026-neue-radwege-und-bushaltestellen-fuer-die-saseler-strasse/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es gibt beidseitig nicht durchgängige <.ref>Hochbordradwege</.ref> von 0,75m bis 1,20m Breite. Die Oberflächen wechseln häufig und sind uneben. Bewuchs schränkt die Radwege weiter ein.</p>

    <p>An der vorhandenen <.m bounds="10.149185,53.627843,10.152041,53.628896">Bushaltestelle Alaskaweg</.m> führen die Radwege direkt durch den Ein- und Ausstiegsbereich der Fahrgäste.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Am <.m bounds="10.156805,53.625876,10.160096,53.627387">Schierenberg</.m> wird eine weitere Bushaltestelle gebaut.</p>

    <p>Jeweils vor den Bushaltestellen werden die Hochbordradwege auf 2,0m breite <.ref>Radfahrstreifen</.ref> geleitet. An haltenden Bussen kann vorbeigefahren werden, wenn man sich in den sonstigen Kraftverkehr einordnet. Alternativ kann hinter dem Bus gewartet werden.</p>

    <p>Nach den Haltestellen gibt es auch wieder eine Aufleitung auf die vorhandenen Radwege. Wer mag, kann auch auf der Fahrbahn weiterradeln, was durch einen kurzen <.ref>Schutzstreifen</.ref> angedeutet wird.</p>

    <p>Die Auf- bzw. Ableitungen sind teilweise weiter von den Bushaltestellen entfernt.</p>

    <p>Außerhalb der Bushalte sollen die Radwege ab etwa <.m bounds="10.146408,53.627083,10.153506,53.630416">Berner Stieg</.m> bis zur <.m bounds="10.16324,53.621342,10.168367,53.624057">Meiendorfer Straße</.m> neu gepflastert werden. Teilweise werden sie verlegt um geradliniger über Einmündungen fahren zu können.</p>

    <h4>Meinung</h4>
    <p>Die Bushaltestellen entsprechen dem Hamburger Standard – hier gibt es wenig zu meckern.</p>

    <p>Dazwischen keine zeitgemäßen Geh- Radwege anzulegen ist dagegen frech. Die Begründung „kein Geld“ wirkt vorgeschoben – „kein politischer Wille“ trifft es eher.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
