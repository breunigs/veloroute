defmodule Data.Article.Blog.Wagnerstrasse do
  use Article.Default

  def start(), do: ~d[2024-08-01]
  def stop(), do: ~d[2024-12-31]
  def title(), do: "Wagnerstraße (Eilenau bis Wandsbeker Chausse, Veloroute 13, Bezirksroute W1)"

  def summary(),
    do:
      "2,0m breite Radfahrstreifen. Ein kurzes Stück wird Hochbordradweg gegen Kurvenschneiden durch KFZ."

  def type(), do: :planned

  def tags(), do: ["13", "br-wandsbek-w1"]

  def links(_assigns) do
    [
      {"Pläne und Erläuterungen", "Mai 2023",
       "https://www.hamburg.de/wandsbek/bezirkliche-radverkehrsmassnahmen/17096396/wagnerstrasse/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Stellenweise sind <.ref>Hochbordradwege</.ref> oder <.ref>Radfahrstreifen</.ref> vorhanden. Sie sind nicht durchgängig und verlaufen häufig im <.ref>Dooring</.ref>-Bereich.</p>

    <h4>Planung</h4>
    <p>Es sind 2,0m breite <.ref>Radfahrstreifen</.ref> vorgesehen. An den Bushaltestellen wird dieser jeweils unterbrochen, wobei auch bei Gegenverkehr an einem haltenden Bus vorbeigefahren werden kann.</p>

    <p>An den Kreuzungen ist meist nur <.ref>indirektes Linksabbiegen</.ref> vorgesehen. Teilweise kann vorher auf die Fahrbahn gewechselt werden um <.ref>direkt</.ref> Links abzubiegen.</p>

    <p>An der <.v bounds="10.039372,53.56778,10.045758,53.570937" lon={10.042116} lat={53.569338} dir="backward" ref="13">Verschwenkung bei der Blumenau</.v> soll in Fahrtrichtung Norden ein Stück Hochbordradweg gebaut werden, damit KFZ die Kurve nicht schneiden. Die Einmündung selbst wird kleiner; die vorhandene Mittelinsel wird mit dem Fußweg verbunden und dort Bänke aufgestellt.</p>

    <p>Das Gehwegparken entfällt. Teilweise bleiben Parkbuchten rechts des Radfahrstreifens, die mit 50cm Sicherheitsabstand zum Radverkehr gebaut werden.</p>

    <h4>Meinung</h4>
    <p>Besser als vorher. Es ist wenig ersichtlich, warum der Schutz vorm KFZ Verkehr nur an einer Stelle gebaut werden soll – die Kurve an der <.v bounds="10.043194,53.566911,10.046493,53.569114" lon={10.04424} lat={53.567916} dir="forward" ref="13">Ritterstraße</.v> ist auch nicht viel weiter. Das Planungsbüro sollte <.ref>Kopenhagener Radwege</.ref> als Alternative untersuchen und die Bushaltestellen wie an der <.v bounds="9.991559,53.581655,9.999255,53.585285" lon={9.995531} lat={53.583769} dir="backward" ref="br-eimsbuettel-isebek">Streekbrücke</.v> gestalten.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
