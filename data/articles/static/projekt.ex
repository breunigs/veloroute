defmodule Data.Article.Static.Projekt do
  use Article.Static

  def title(), do: "Projekt"

  def tags(), do: []

  def text(assigns) do
    assigns =
      assign(assigns, %{
        distance: Statistics.visible_video_distance_km(),
        duration: Statistics.visible_video_duration_h()
      })

    ~H"""
    <p>Ziel des Projekts ist es Neulingen gute Fahrradstrecken in Hamburg aufzuzeigen, damit alle dieses tolle Verkehrsmittel ausprobieren können – und vielleicht auch dabei bleiben. Die tiefergehenden Informationen sind für Interessierte und um inhaltlicher Diskussion eine Basis zu bieten.</p>

    <h4>Helfen</h4>
    <ul>
      <li>Melde (abgeschlossene) Umbauten</li>
      <li>Verbessere die <.a href="https://learnosm.org/de/beginner/">OpenStreetMap</.a></li>
    </ul>

    <h4>Hintergrund</h4>
    <p>Als das Projekt 2018 begann, musste man schon sehr genau suchen um die Velorouten zu finden. Mittlerweile stellt die Stadt die Velorouten auf <.a href="https://fahrrad.hamburg/de/service/velorouten/">fahrrad.hamburg</.a> deutlich besser dar, detaillierte Informationen muss man aber nach wie vor bei den einzelnen Behörden und Ämtern abgrasen. Auch aus persönlichem Interesse dokumentiere ich daher Bauvorhaben oder Baustellen, so sie bekannt gemacht werden.</p>

    <h4>Statistiken</h4>
    <p>Die momentan auf der Seite ansehbaren Videos dauern zusammen rund <%= @duration %> Stunden und decken ca. <%= @distance %> km Strecke ab. Die Statistik zählt pro Fahrtrichtung, d.h. ein 1 km langer Radweg, der in beide Richtungen befahren wurde, geht hier als 2 km ein. Wenn mehrere Routen sich einen Abschnitt teilen, wird dieser auch mehrfach gezählt, d.h. Überlappungen werden nicht herausgerechnet.</p>

    <h4>Kamera</h4>
    <p>Die Videoaufnahmen werden mit einer handelsüblichen am Lenker befestigten Action-Kamera gemacht. Die in den modernen Modellen eingebaute Bildstabilisierung mit Horizontausgleich ist ausreichend um die ruhige Kamerafahrt zu erreichen. Allerdings benötigt die Technik noch Tageslicht, weswegen die Aufnahmen in Tunnels so verwackelt sind.</p>

    <h4>Technik und Lizenzen</h4>
    <p>Die Seite selbst steht unter einer <.a href="https://github.com/breunigs/veloroute">freien Lizenz auf Github</.a>. Mein Ziel ist es die Technik weitgehend von den Daten zu trennen, damit sie auch für andere Projekte verwendet werden kann. Bei Fragen <.mailto>schreib mir</.mailto> oder erstelle ein Ticket auf Github.</p>
    <p>Die Videos werden von veloroute.hamburg bereitgestellt und sind <.a href="https://creativecommons.org/licenses/by-sa/3.0/deed.en">CC BY SA</.a> lizensiert. Ich hebe die Originale auf, die ich bei Bedarf gemeinfrei zur Verfügung stellen kann.</p>
    <p>Die Kartendaten stammen aus der <.a href="https://www.openstreetmap.org">OpenStreetMap</.a> (ODbL, frei), werden jedoch über den kommerziellen Anbieter <.a href="https://www.mapbox.com">Mapbox</.a> dargestellt, d.h. die Darstellung an sich ist nicht mehr frei. Die auf der Seite angezeigten Velorouten werden getrennt speziell für die Seite verwaltet und stehen wahlweise unter der ISC, ODbL oder CC-SA zur Verfügung.</p>



    """
  end
end
