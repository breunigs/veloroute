defmodule Data.Article.Blog.FreiraumOttensen do
  use Article.Default

  def title(), do: "Ottensen Zentrum – „freiRaum Ottensen“"

  def summary(),
    do:
      "Die Verkehrsplanung zum autoarmen Zentrum Ottensens wurde abgeschlossen. Freiraumplanung („Gestaltung“) nach wie vor offen."

  def type(), do: :planned
  def start(), do: ~d[2025Q4]

  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "1",
        direction: :forward,
        from: "Altona Bahnhof",
        to: "Große Brunnenstraße",
        parent_ref: __MODULE__,
        text: "Ottenser Hauptstraße nach Westen",
        historic: %{
          "881946682ae0810dce0cb1de30e62633" => ~d[2024-10]
        },
        videos: [{"2024-10-19-ottensen/GX010045_stabilized", "00:00:13.480", :end}]
      },
      %Video.Track{
        renderer: 5,
        group: "1",
        direction: :backward,
        from: "Große Brunnenstraße",
        to: "Altona Bahnhof",
        parent_ref: __MODULE__,
        text: "Ottenser Hauptstraße nach Osten",
        historic: %{
          "0ac9a4d054482f8b3749659e9529093d" => ~d[2024-10]
        },
        videos: [{"2024-10-19-ottensen/GX010050_stabilized", "00:00:02.369", "00:01:05.198"}]
      },
      %Video.Track{
        renderer: 5,
        group: "2",
        direction: :backward,
        from: "Behringstraße",
        to: "Eulerstraße",
        parent_ref: __MODULE__,
        text: "Bahrenfelder Straße nach Süden",
        historic: %{
          "a543e02bffe9f6f12f06dd1d8e173d95" => ~d[2024-10]
        },
        videos: [
          {"2024-10-19-ottensen/GX010046_stabilized", "00:00:03.804", :end},
          {"2024-10-19-ottensen/GX010047_stabilized", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "2",
        direction: :forward,
        from: "Lobuschstraße",
        to: "Behringstraße",
        parent_ref: __MODULE__,
        text: "Bahrenfelder Straße nach Norden",
        historic: %{
          "3a937cfb5143817e7b9fa014b9ae72af" => ~d[2024-10]
        },
        videos: [{"2024-10-19-ottensen/GX010048_stabilized", :start, :end}]
      }
    ]

  @attrib [
    {"Bezirksamt Altona – Fachamt öffentlicher Raum",
     "https://www.hamburg.de/politik-und-verwaltung/bezirke/altona/bezirksamt/dezernat-wirtschaft-bauen-umwelt-50986"},
    {"MASUCH + OLBRISCH Ingenieurgesellschaft für das Bauwesen mbH",
     "https://moingenieure.de/kontakt/"}
  ]

  def map_image do
    [
      Data.MapImage.new(__MODULE__, @attrib, 1, {
        %{lat: 53.551882688, lon: 9.925597826},
        %{lat: 53.552467990, lon: 9.930663473},
        %{lat: 53.551839690, lon: 9.930869759},
        %{lat: 53.551254388, lon: 9.925804112}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 2, {
        %{lat: 53.552496877, lon: 9.929787173},
        %{lat: 53.553270676, lon: 9.930784773},
        %{lat: 53.552970166, lon: 9.931444827},
        %{lat: 53.552196367, lon: 9.930447227}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 3, {
        %{lat: 53.550523772, lon: 9.929112951},
        %{lat: 53.552459723, lon: 9.929286249},
        %{lat: 53.552418597, lon: 9.930563609},
        %{lat: 53.550482646, lon: 9.930390310}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 4, {
        %{lat: 53.553745216, lon: 9.929065170},
        %{lat: 53.552668337, lon: 9.930346803},
        %{lat: 53.552508125, lon: 9.929965604},
        %{lat: 53.553585003, lon: 9.928683971}
      })
    ]
  end

  def links(_assigns) do
    [
      {"fertiger Entwurf Verkehrsplanung – Bahrenfelder Straße", ~d[2024-10],
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1015748"},
      {"fertiger Entwurf Verkehrsplanung – Ottenser Hauptstraße", ~d[2024-10],
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1015750"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Gehwege sind überlastet. Zusätzlich werden sie durch Außengastronomie und andere Auslagen von Geschäften weiter eingeengt.</p>

    <p>Die <.ref>Fahrbahnen</.ref> sind mit schlecht befahrbarem Kopfsteinpflaster befestigt. Dennoch stellen Fahrräder rund ⅓ bis ⅔ des Fahrzeugverkehrs.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die Gehwege werden überall verbreitert.</p>

    <p>Die Fahrbahnen erhalten abgeflachte Pflastersteine (<.v bounds="9.924876,53.549201,9.933219,53.555331" lon={9.929349} lat={53.552003} dir="forward" ref={@ref}>Ottenser Hauptstraße</.v>) oder werden wahrscheinlich asphaltiert (<.v bounds="9.924876,53.549201,9.933219,53.555331" lon={9.929349} lat={53.553188} dir="forward" ref={@ref}>Bahrenfelder Straße</.v>, <.v bounds="9.924876,53.549201,9.933219,53.555331" lon={9.930115} lat={53.552374} dir="forward" ref={@ref}>Große Rainstraße</.v>). Die <.v bounds="9.92937,53.551638,9.931247,53.552722" lon={9.929996} lat={53.552087} dir="forward" ref={@ref} highlight="Ottenser Hauptstraße,Bahrenfelder Straße,Große Rainstraße">Kreuzung dieser Straßen</.v> bleibt ungefähr wie heute.</p>

    <p>Die Zufahrt von KFZ wird eingeschränkt und durch Automatik-Poller sichergestellt. Für Lieferverkehr, Taxen und zum Erreichen privater Parkplätze bleiben Ausnahmen.</p>

    <h4>Meinung</h4>
    <p>Idealerweise wäre der ganze Bereich eine reine Fußgängerzone. Auch für den Radverkehr wäre es besser, wenn er auf einer angenehmen Route das Gebiet umfahren könnte.</p>

    <p>Das ist knifflig: in Nord/Süd Richtung lässt sich das Problem ortsnah nur auf die <.v bounds="9.925273,53.550601,9.931322,53.554228" lon={9.92759} lat={53.551855} dir="forward" ref={@ref}>Nöltingstraße / Rothestraße</.v> verschieben, aber nicht lösen. Die Anbindung des <.m bounds="9.929071,53.551463,9.937941,53.556709" highlight="Lessingtunnel">Lessingtunnels</.m> ohne <.v bounds="9.92736,53.551032,9.934513,53.555526" lon={9.930167} lat={53.552329} dir="forward" ref={@ref}>Große Rainstraße</.v> wäre ein Zick-Zack-Kurs.</p>

    <p>Bezirksamt und Planungsbüro haben langen Atem bewiesen und diesen Kompromiss ausgearbeitet. Er macht es unterm Strich für alle besser und niemanden perfekt. Ausnahme: der motorisierte Bequemlichkeitsverkehr muss künftig draußen bleiben. Gut so.</p>

    <h4>Verkehrsplanung vs Freiraumplanung</h4>
    <p>Die vorliegende <em>Verkehrs</em>planung beschreibt die Aufteilung des Straßenraums aus technischer Sicht. Erst mit der noch fehlenden <.a href="https://de.wikipedia.org/wiki/Freiraumplanung">Freiraumplanung</.a> kommt die Gestaltung des Straßenraums. Entsprechend sind Sitzbänke, Anschließbügel, Fahrbahnbeläge, Bepflanzung und viele weitere Details noch nicht ausgearbeitet.</p>

    <h4>Links</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
