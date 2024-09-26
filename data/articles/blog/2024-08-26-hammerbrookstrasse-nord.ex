defmodule Data.Article.Blog.HammerbrookstrasseNord do
  use Article.Default

  def title(), do: "Hammerbrookstraße – Nord (Radroute 8, Freizeitroute 4)"

  def summary(),
    do:
      "Beidseitig 2,0m breite Protected-Bike-Lanes. Anbindung an Radroute 8 wird klarer. Freizeitroute 4 dank Querungshilfe leichter befahrbar."

  def start(), do: ~d[2024-09-30]
  def stop(), do: ~d[2025-03]

  def type(), do: :planned
  def tags(), do: ["8", "FR4"]

  @attrib [
    {"SBI beratende Ingenieure für BAU-VERKEHR-VERMESSUNGS GmbH", "https://www.sbi.de/"},
    {"Bezirksamt Hamburg-Mitte, Fachamt Management des öffentlichen Raumes",
     "https://www.hamburg.de/politik-und-verwaltung/bezirke/mitte/bezirksamt/bezirksamtsstruktur/dezernat-wirtschaft-bauen-umwelt-66718"}
  ]
  def map_image do
    [
      Data.MapImage.new(__MODULE__, @attrib, 1, {
        %{lat: 53.553182950, lon: 10.019320047},
        %{lat: 53.551761273, lon: 10.020431072},
        %{lat: 53.551433634, lon: 10.019242982},
        %{lat: 53.552855311, lon: 10.018131957}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 2, {
        %{lat: 53.551715428, lon: 10.020020880},
        %{lat: 53.550535751, lon: 10.020939698},
        %{lat: 53.550415971, lon: 10.020504046},
        %{lat: 53.551595649, lon: 10.019585229}
      })
    ]
  end

  def links(_assigns) do
    [
      # {"Ausschreibung Umbau", ~d[2024-08],
      #  "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/api/external/deeplink/subproject/aa0e89c9-e8f6-465d-98b0-2017b4fc8757"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Richtung Norden ist ein 1,0m breiter <.ref>Hochbordradweg</.ref> vorhanden. Richtung Süden muss auf einem geteilten Fuß- und Radweg gefahren werden. Die Fahrt entlang der <.a name="freizeitroute-4">Freizeitroute 4</.a> ist wegen fehlender Querungsmöglichkeit schwierig. Die Anbindung an die <.a name="8">Radroute 8</.a> erfolgt über eine einseitige Radfurt, die in beide Richtungen befahren wird.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Es sind beidseitig 2,0m breite <.ref>Protected-Bike-Lanes</.ref> vorgesehen. Wegen Einfahrten und KFZ-Parkplätzen bleibt ein längeres Stück auf <.m bounds="10.018894,53.551601,10.021182,53.553052">Höhe des Einkaufszentrums</.m> ohne Trennelemente.</p>

    <p>Entlang der Freizeitroute entsteht eine <.ref>Querungshilfe</.ref>, über die der Radverkehr auf dem Hochbord geführt wird. Über die Querungshilfe ist auch eine Fahrt in <.v bounds="10.017785,53.549396,10.022571,53.553519" lon={10.020141} lat={53.551482} dir="backward" ref="FR4">Richtung Innenstadt</.v> möglich.</p>

    <p>Die Anbindung an die Radroute 8 erfolgt künftig über beidseitige Fahrradfurten. Die Fahrt ist jeweils entlang der normalen Fahrtrichtung gestattet. Alle Furten im Kreuzungsbereich werden rot eingefärbt.</p>

    <h4>Meinung</h4>
    <p>Die <.v bounds="10.016267,53.5504,10.021296,53.552382" lon={10.018227} lat={53.550775} dir="forward" ref="FR4">Brecht-Schule</.v> endlich an erreichbare Radwege anzuschließen war längst überfällig. Schön zu sehen, dass man die Radwege auch gleich in einem zukunftssicheren Standard baut. Auch die Anbindung an die Radroute 8 ist jetzt klarer, die Kreuzung bleibt aber unangenehm und hässlich.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
