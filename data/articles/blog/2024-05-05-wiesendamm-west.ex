defmodule Data.Article.Blog.WiesendammWest do
  use Article.Default

  def title(), do: "Wiesendamm – Barmbeker Straße bis Saarlandstraße (Bezirksroute N6)"

  def summary(),
    do:
      "(fast) durchgängige Radfahrstreifen. Wegen Baumerhalt Breite von 1,85m bis 2,50m. Mehr Abstellbügel und Parkbänke."

  def type(), do: :planned
  def start(), do: ~d[2025Q1]
  def stop(), do: ~d[2026Q3]

  def tags(), do: ["br-nord-n6"]

  @attrib {"Bezirksamt Hamburg-Nord",
           "https://www.hamburg.de/politik-und-verwaltung/bezirke/hamburg-nord/wirtschaft-bauen-umwelt-70292"}
  def map_image do
    [
      Data.MapImage.new(__MODULE__, @attrib, 1, {
        %{lat: 53.590231812, lon: 10.013486649},
        %{lat: 53.590209656, lon: 10.016596032},
        %{lat: 53.589774648, lon: 10.016587428},
        %{lat: 53.589796784, lon: 10.013478155}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 2, {
        %{lat: 53.590165223, lon: 10.016559285},
        %{lat: 53.589547864, lon: 10.020195654},
        %{lat: 53.589176426, lon: 10.020016928},
        %{lat: 53.589793404, lon: 10.016380081}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 3, {
        %{lat: 53.589543046, lon: 10.020112394},
        %{lat: 53.589153812, lon: 10.023406821},
        %{lat: 53.588751751, lon: 10.023271412},
        %{lat: 53.589141120, lon: 10.019977291}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 4, {
        %{lat: 53.589130105, lon: 10.023323267},
        %{lat: 53.588719790, lon: 10.026817274},
        %{lat: 53.588397194, lon: 10.026709304},
        %{lat: 53.588807186, lon: 10.023215298}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 5, {
        %{lat: 53.588734244, lon: 10.026765032},
        %{lat: 53.588316515, lon: 10.030275234},
        %{lat: 53.587970029, lon: 10.030157774},
        %{lat: 53.588388090, lon: 10.026648529}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 6, {
        %{lat: 53.588332256, lon: 10.030220423},
        %{lat: 53.588163386, lon: 10.032225333},
        %{lat: 53.587818511, lon: 10.032142970},
        %{lat: 53.587987578, lon: 10.030137700}
      })
    ]
  end

  def links(_assigns) do
    [
      {"1. Entwurf, Lageplan und Erläuterung", "Mai 2024",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1014007"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p><.v bounds="10.011874,53.584906,10.047674,53.591509" lon={10.014014} lat={53.589934} dir="forward" ref="br-nord-n6">Richtung Bahnhof Barmbek</.v> gibt es anfangs keine eigenen Radwege – es wird im <.ref>Mischverkehr</.ref> geradelt. <.v bounds="10.011527,53.587427,10.026449,53.5915" lon={10.018371} lat={53.589547} dir="forward" ref="br-nord-n6">Etwas später</.v> beginnt ein <.ref>Hochbordradweg</.ref> ohne erkennbare Aufleitung, der auch teilweise in der <.ref>Dooring-Zone</.ref> verläuft. Nach der <.v bounds="10.017782,53.587138,10.032368,53.591234" lon={10.020781} lat={53.589243} dir="forward" ref="br-nord-n6">Brücke über den Goldbekkanal</.v> beginnt dann ein rund 1,5m breiter <.ref>Radfahrstreifen</.ref>. Kurz vor der <.v bounds="10.028178,53.586153,10.038572,53.590294" lon={10.031333} lat={53.587957} dir="forward" ref="br-nord-n6" highlight="Saarlandstraße">Kreuzung mit der Saarlandstraße</.v> kann wahlweise im Mischverkehr oder auf einem Hochbordradweg weitergefahren werden.</p>

    <p><.v bounds="10.010602,53.586818,10.03583,53.591603" lon={10.032761} lat={53.588126} dir="backward" ref="br-nord-n6">Richtung Bahnhof Borgweg</.v> gibt es einen rund 1,0m breiten Hochbordradweg in der Dooring-Zone. Ab <.v bounds="10.011317,53.5883,10.021055,53.591582" lon={10.019416} lat={53.589539} dir="backward" ref="br-nord-n6">Wiesenstieg</.v> wird dieser auf einen 1,5m breiten Radfahrstreifen überführt, der <.v bounds="10.011317,53.5883,10.021055,53.591582" lon={10.019416} lat={53.589539} dir="backward" ref="br-nord-n6">kurz darauf</.v> wieder endet. Bis zum Barmbeker Weg ist dann wieder Mischverkehr, da der alte Hochbordradweg weder erreichbar noch wegen der darauf parkenden Autos nutzbar ist.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Im gesamten Abschnitt werden Radfahrstreifen vorgesehen. Wegen Baumerhalt werden sie 1,85m bis 2,5m breit. Um Dooring-Unfällen vorzubeugen sind 50cm Sicherheitsabstand geplant.</p>

    <p>An Bushalten wird der Radweg unterbrochen, sodass man entweder im KFZ-Verkehr vorbeifahren oder hinter dem Bus warten muss. An Enden des Planungsgebiets werden gut sichtbare Überleitungen auf die vorhandenen Radwege gebaut.</p>

    <p>Hinzu kommen zahlreiche neue Radbügel, auch für Lastenräder, ggf. eine StadtRAD Station, und ein paar neue Sitzbänke und Bäume.</p>


    <h4>Meinung</h4>
    <p>Im Vergleich zu heute erhält der Radverkehr durchgängige und klare Wege. Die fehlende Trennung vom KFZ-Verkehr, vor allem von Falschparkern, ist schade. Sie ist aber gut begründet und der Kompromiss mit Radfahrstreifen akzeptabel.</p>

    <p>Die Querungsstellen für den Fußverkehr könnten jedoch mit Zebrastreifen aufgewertet werden. Das erleichtert auch das Erreichen der richtigen Straßenseite mit dem Fahrrad und hilft Geister- oder Gehwegradeln zu vermeiden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
