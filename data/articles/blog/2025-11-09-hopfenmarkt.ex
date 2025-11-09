defmodule Data.Article.Blog.Hopfenmarkt do
  use Article.Default

  def title(), do: "Hopfenmarkt / Holzbrücke (Mahnmal St. Nikolai)"

  def summary(),
    do:
      "Platz soll etwas mehr zum Verweilen einladen. Direktere Fahrtbeziehungen für den Radverkehr und breiterer Radwege."

  def type(), do: :planned

  def tracks(), do: Data.Article.Blog.WillyBrandtStrasse.tracks()

  def tags(), do: []

  def map_image do
    {name(),
     [
       {"LEHNE Ingenieurgesellschaft mbH für Bauen und Umwelt",
        "https://www.lehne-ing.de/kontakt"}
     ]}
  end

  def links(_assigns) do
    [
      {"fertiger Entwurf, Erläuterungen und Lageplan", ~d[2025-11],
       "https://sitzungsdienst-hamburg-mitte.hamburg.de/bi/vo020.asp?VOLFDNR=1019403"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Platz orientierte sich vor allem an den Wünschen des Autoverkehrs. Mehr als die Hälfte wurde ausschließlich zum KFZ-Parken verwendet, die <.a href="https://de.wikipedia.org/wiki/Cremonbr%C3%BCcke">Cremonbrücke</.a> zur Querung der <.v bounds="9.987194,53.546725,9.991796,53.54824" lon={9.987885} lat={53.547329} dir="forward" ref={@ref}>Willy-Brandt-Straße</.v> beanspruchte ebenfalls viel Fläche. Der Gesamteindruck war der eines Durchgangsorts („schnell weg“).</p>

    <p>Fahrradfahren war in alle Richtungen erlaubt. Die Fahrt nach Süden zur <.v bounds="9.987123,53.546312,9.991725,53.547827" lon={9.98852} lat={53.547242} dir="forward" ref={@ref}>Holzbrücke</.v> erforderte einen Umweg, da die einzige ebenerdige Furt ungünstig lag.</p>

    <p>2021 wurde die Cremonbrücke abgerissen und stattdessen eine provisorische Ampel auf der Ostseite der Kreuzung aufgestellt. Wegen eines Hausbaus auf der Südseite und dem Museumsbau auf der Nordseite ist der Platz zur Zeit vor allem eine Baustelle.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der Platz wird durch schmalere Nebenstraßen etwas vergrößert. KFZ-Parken entfällt größtenteils und es werden weitere Bäume gepflanzt. Die Gehwege auf der Südseite werden ebenfalls vergrößert und mit Pollern gegen Wildparker geschützt. Weitere Bäume sind hier nicht geplant.</p>

    <p>Fahrradfahren bleibt in alle Richtungen möglich. Die provisorische Ampel auf der Ostseite rückt näher in Richtung der Kreuzung. Wo die Radwege angepasst werden, erhalten sie 2,0m bis 2,5m Breite.</p>

    <p>Linksabbiegen ist immer <.ref>indirekt</.ref> möglich. Von der <.v bounds="9.987123,53.546312,9.991725,53.547827" lon={9.98852} lat={53.547242} dir="forward" ref={@ref}>Holzbrücke</.v> bzw. dem <.v bounds="9.987123,53.546312,9.991725,53.547827" lon={9.988968} lat={53.547445} dir="backward" ref={@ref} highlight="Kleiner Burstah">Kleinen Burstah</.v> geht auch es auch <.ref>direkt</.ref>. Vom Kleinen Burstah soll Geradeausfahren auf der Fahrbahn erlaubt werden, was eine geradlinige Fahrt ermöglicht.</p>

    <h4>Meinung</h4>
    <p>Das Planungsbüro schreibt: „Aufenthaltsqualitäten lassen sich im Umfeld der Willy-Brandt-Straße […] nur bedingt verbessern.“ Diesen Hinweis sollte sich die Stadt zu Herzen nehmen und die hässliche Autoschneise gesundschrumpfen.</p>

    <p>Aus Fahrradsicht gibt es an der Planung sonst nichts zu bemängeln. Angenehm wird die Willy-Brand-Straße trotzdem nicht.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
