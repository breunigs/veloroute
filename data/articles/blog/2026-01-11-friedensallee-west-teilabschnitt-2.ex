defmodule Data.Article.Blog.FriedensalleeWestTeilabschnitt2 do
  use Article.Default

  def title(), do: "Friedensallee – Abschnitt 2 Autobahn bis Hegarstraße (Radroute 7)"

  def summary(),
    do:
      "Beidseitig Radwege in verschiedenen Ausführungen von 1,62m bis 2,0m Breite. Radführung über Nebenfahrbahnen verhindern konsequente Trennung KFZ/Rad. Umbau nicht vor 2031."

  def type(), do: :planned

  def start(), do: ~d[2031]

  def tags(), do: ["radroute-7"]

  def map_image do
    {Data.Article.Blog.FriedensalleeWestTeilabschnitt1.name(),
     [
       {"Ingenieurbüro Münster GmbH", "https://ib-muenster.de/kontakt/"},
       {"Bezirksamt Altona – Fachamt öffentlicher Raum",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/altona/bezirksamt/dezernat-wirtschaft-bauen-umwelt-50986"}
     ]}
  end

  def links(_assigns) do
    [
      {"fertiger Entwurf, Erläuterungen und Karte", ~d[2026-01],
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1017549"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es gibt beidseitig <.ref>Hochbordradwege</.ref> mit 1,0m bis 1,60m Breite. Die Wege verlaufen teils in der <.ref>Dooring-Zone</.ref> und sind kurvig und uneben.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Ab der <.v bounds="9.899089,53.563259,9.905321,53.565997" lon={9.901261} lat={53.56475} dir="forward" ref={Radroute7}>Von-Sauer-Straße</.v> sollen beidseitig rund 1,85m bis 2,0m breite Radwege angelegt werden. Diese werden teils <.ref>Radfahrstreifen</.ref> und teils <.ref>Hochbordradwege</.ref>. Ein kurzes Stück wird <.ref>Protected-Bike-Lane</.ref>. Die Radfahrstreifen werden an den Bushaltestellen jeweils unterbrochen. Wer an einem wartenden Bus vorbeifahren möchte, muss sich dort in den sonstigen Verkehr einordnen.</p>

    <p>Ab <.v bounds="9.903036,53.561705,9.907307,53.564158" lon={9.903964} lat={53.563165} dir="forward" ref={Radroute7}>Mendelssohnstraße</.v> verengen sich die Radwege auf 1,62m. In Fahrtrichtung Autobahn wird der Radverkehr auch häufig über Nebenfahrbahnen geführt, die zum Erreichen von KFZ-Parkplätzen dienen.</p>

    <p><.v bounds="9.905078,53.560328,9.908755,53.562261" lon={9.906749} lat={53.561311} dir="forward" ref={Radroute7}>Zur S-Bahrenfeld</.v> hin schließen wieder 1,85m breite Radfahrstreifen an. Siehe <.a ref={FriedensalleeWestTeilabschnitt1}>Planungsabschnitt 1</.a> für die dort angedachten Änderungen.</p>

    <h4>Meinung</h4>
    <p>Das man wegen den vielen alten Bäumen nicht überall die 2,0m Standardbreite erreicht ist verschmerzbar. Die Radwege werden dennoch von „kaum benutzbar“ zu „gut befahrbar“ aufgewertet. Für Schnellere stehen auch auf den Radwegen regelmäßig Überholmöglichkeiten bereit.</p>

    <p>Die Nebenfahrbahnen dürften jedoch zugeparkt werden, sodass man sich zwischen beidseitiger <.ref>Dooring-Zone</.ref> durchschlängeln muss. Hier ist eine andere Lösung notwendig die Rad und KFZ konsequent trennt.</p>

    <p>Gebaut wird frühestens 2031. Grund: Parkplatzmoratorium verhindert Genehmigung. Der Senat sollte seine Blockadehaltung überdenken, denn der Verkehrssektor hinkt beim CO₂ Austoß eh schon hinterher.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
