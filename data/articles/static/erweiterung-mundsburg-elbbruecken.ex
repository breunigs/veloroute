defmodule Data.Article.Static.ErweiterungMundsburgElbbruecken do
  use Article.Static

  def id(), do: "erweiterung-mundsburg-elbbruecken"
  def route_group(), do: :alltag
  def color(), do: "#888888"

  def title(), do: "Velorouten Erweiterung: Mundsburg ↔ Elbbrücken"

  def summary(),
    do: "Veloroutennetz soll um eine Verbindung von Mundsburg und Elbbrücken erweitert werden"

  def tags(), do: [id()]

  def links(_assigns) do
    [
      {"Pressemitteilung BVM",
       "https://www.hamburg.de/bvm/medien/15646102/2021-11-29-bvm-radverkehr/"},
      {"Bündnis für den Fuß- und Radverkehr",
       "https://www.skyfish.com/p/fhh/2001119/52474395/download/media"}
    ]
  end

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "veloroute",
        direction: :forward,
        from: "Mundsburg",
        to: "Elbbrücken",
        parent_ref: __MODULE__,
        text: "Fahrtrichtung Süden/Elbbrücken",
        historic: %{
          "fbf7198e7917f1120ffccd9fde5d8d18" => ~d[2023-07],
          "be17ae4d8ea24a156b6655109e5a47c7" => ~d[2022-01]
        },
        videos: [
          {"2023-07-09-vr11-und-erwrtng/GX010085", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010086", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010087", :start, "00:00:01.935"},
          {"2023-07-09-vr11-und-erwrtng/GX010087", "00:00:06.940", :end},
          {"2023-07-09-vr11-und-erwrtng/GX010088", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010089", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010090", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010091", :start, "00:00:43.368"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "veloroute",
        direction: :backward,
        from: "Elbbrücken",
        to: "Mundsburg",
        parent_ref: __MODULE__,
        text: "Fahrtrichtung Norden/Mundsburg",
        historic: %{
          "d056b86212fe1a696cdd7224e55a0e0a" => ~d[2023-07],
          "5b15cf42b0142b8cba7829d168ca37df" => ~d[2022-01]
        },
        videos: [
          {"2023-07-09-vr11-und-erwrtng/GX010077", "00:00:27.522", :end},
          {"2023-07-09-vr11-und-erwrtng/GX010078", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010079", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010080", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010081", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010082", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010083", :start, :end},
          {"2023-07-09-vr11-und-erwrtng/GX010084", :start, :end}
        ]
      }
    ]

  def text(assigns) do
    ~H"""
    <h4>Vorhaben</h4>
    <p>Die <.abbr>BVM</.abbr> möchte das Veloroutennetz erweitern, um die fehlende Anbindung mancher Stadtteile zu verbessern. Der Verlauf der Nord/Süd Verbindung vom <.v bounds="10.023539,53.566807,10.032159,53.571333" lon={10.026585} lat={53.56936} dir="forward" ref={@ref}>U-Bahnhof Mundsburg</.v> zu den <.v bounds="10.022407,53.528823,10.034761,53.538651" lon={10.030073} lat={53.537408} dir="forward" ref={@ref}>Elbbrücken</.v> wurde bereits konkretisiert:</p>
    <ul>
      <li><.v bounds="10.023511,53.564108,10.027097,53.568722" lon={10.025824} lat={53.567966} dir="forward" ref={@ref}>Schürbeker Straße</.v></li>
      <li><.v bounds="10.023431,53.563584,10.025206,53.566265" lon={10.024717} lat={53.56605} dir="forward" ref={@ref}>Kuhmühle</.v></li>
      <li><.v bounds="10.023405,53.556417,10.027275,53.564685" lon={10.024117} lat={53.563596} dir="forward" ref={@ref}>Mühlendamm</.v></li>
      <li><.v bounds="10.024524,53.551213,10.028068,53.557838" lon={10.026512} lat={53.556015} dir="forward" ref={@ref}>Bürgerweide</.v></li>
      <li><.v bounds="10.02397,53.540309,10.034974,53.552383" lon={10.026095} lat={53.550829} dir="forward" ref={@ref}>Heidenkampsweg</.v></li>
      <li><.v bounds="10.024761,53.531406,10.035654,53.542411" lon={10.032604} lat={53.540696} dir="forward" ref={@ref}>Billhorner Brückenstraße</.v></li>
    </ul>

    <h4>Aktueller Zustand</h4>
    <p>Die neue Veloroute ist bereits heute befahrbar und besteht aus <.ref>Hochbordradwegen</.ref> und einem kürzeren Abschnitt mit <.ref>Radfahrstreifen</.ref>. Die Wege sind meist 1,50m-1,60m breit, was den Mindestbreiten zum jeweiligen Bauzeitpunkt entspricht. Für Alltagsrouten strebt man künftig 2,50m Breite an, Bordsteine und andere Trennelemente nicht eingerechnet.</p>

    <p>Die Führung ist entlang einer 4 bis 8-spurigen KFZ-Hauptstraße, was sich im hohen Lärmpegel bemerkbar macht.</p>

    <h4>Anschlüsse</h4>
    <p>Der neue Abschnitt bietet direkten Anschluss zu folgenden Routen:</p>
    <ul>
      <li><.icon name="5"> Alltagsroute</.icon></li>
      <li><.icon name="7"> Alltagsroute</.icon></li>
      <li><.icon name="9"> Alltagsroute</.icon></li>
      <li><.icon name="10"> Alltagsroute</.icon></li>
      <li><.icon name="FR5"> Freizeitroute</.icon></li>
      <li><.icon name="FR6"> Freizeitroute</.icon></li>
      <li><.icon name="FR11"> 2. Grüner Ring</.icon></li>
    </ul>
    <p>Die folgenden Routen verlaufen entweder über oder unter der neuen Route. Um die Höhenunterschiede auszugleichen ist daher ein kleiner Umweg notwendig:</p>
    <ul>
      <li><.icon name="6"> Alltagsroute</.icon></li>
      <li><.icon name="8"> Alltagsroute</.icon></li>
      <li><.icon name="FR3"> Freizeitroute</.icon></li>
      <li><.icon name="FR4"> Freizeitroute</.icon></li>
    </ul>

    <h4>Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
