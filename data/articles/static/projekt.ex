defmodule Data.Article.Static.Projekt do
  use Article.Static

  def title(), do: "Projekt"

  def tags(), do: []

  def text(assigns) do
    ~H"""
    <p>Ziel des Projekts ist es Neulingen gute Fahrradstrecken in Hamburg aufzuzeigen, damit alle dieses tolle Verkehrsmittel ausprobieren können – und vielleicht auch dabei bleiben. Die tiefergehenden Informationen sind für Interessierte und um inhaltlicher Diskussion eine Basis zu bieten.</p>

    <h4>Helfen</h4>
    <ul>
      <li>Melde (abgeschlossene) Umbauten</li>
      <li>Verbessere die <.a href="https://learnosm.org/de/beginner/">OpenStreetMap</.a></li>
    </ul>

    <h4>Hintergrund</h4>
    <p>Als das Projekt 2018 begann, musste man schon sehr genau suchen um die Velorouten zu finden. Mittlerweile stellt die Stadt die Velorouten auf <.a href="https://fahrrad.hamburg/de/service/velorouten/">fahrrad.hamburg</.a> deutlich besser dar, detaillierte Informationen muss man aber nach wie vor bei den einzelnen Behörden und Ämtern abgrasen. Auch aus persönlichem Interesse dokumentiere ich daher Bauvorhaben oder Baustellen, so sie bekannt gemacht werden.</p>

    <h4>Technik und Lizenzen</h4>
    <p>Die Seite selbst steht unter einer <.a href="https://github.com/breunigs/veloroute">freien Lizenz auf Github</.a>. Mein Ziel ist es die Technik weitgehend von den Daten zu trennen, damit sie auch für andere Projekte verwendet werden kann. Bei Fragen <.mailto>schreib mir</.mailto> oder erstelle ein Ticket auf Github.</p>
    <p>Die Videos werden von veloroute.hamburg bereitgestellt und sind <.a href="https://creativecommons.org/licenses/by-sa/3.0/deed.en">CC BY SA</.a> lizensiert. Ich hebe die Originale auf, die ich bei Bedarf gemeinfrei zur Verfügung stellen kann.</p>
    <p>Die Kartendaten stammen aus der <.a href="https://www.openstreetmap.org">OpenStreetMap</.a> (ODbL, frei), werden jedoch über den kommerziellen Anbieter <.a href="https://www.mapbox.com">Mapbox</.a> dargestellt, d.h. die Darstellung an sich ist nicht mehr frei. Die auf der Seite angezeigten Velorouten werden getrennt speziell für die Seite verwaltet und stehen wahlweise unter der ISC, ODbL oder CC-SA zur Verfügung.</p>
    """
  end
end
