defmodule Data.Article.Static.Freizeitroute8 do
  use Article.Static

  def id(), do: "FR8"
  def route_group(), do: :freizeit
  def title(), do: "Elbuferradweg (FR8)"

  def color(), do: "#006106"
  def color_faded(), do: "#77ba7b"

  def summary(),
    do:
      "Freizeitroute 8 führt entlang des nördlichen Elbufers. In Övelgönne ist eine lange Schiebestrecke."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "Elbufer",
        direction: :forward,
        from: "Landungsbrücken",
        to: "Wedel",
        parent_ref: __MODULE__,
        text: "entang des Elbufers nach Wedel",
        historic: %{
          "62e9f25ffe6c00e278f8765ba1007212" => ~d[2024-03],
          "c3f8c3dd40473f54ae901a4c049bf0fb" => ~d[2022-08]
        },
        videos: [
          {"2024-03-17-fr14/GX016930", :start, :end},
          {"2024-03-17-fr14/GX016931", :start, :end},
          {"2024-03-17-fr14/GX016932", :start, "00:00:05.239"},
          {"2024-03-16-fr8-gr1uhr/GX016867", "00:00:11.678", "00:13:08.087"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "Elbufer",
        direction: :backward,
        from: "Wedel",
        to: "Landungsbrücken",
        parent_ref: __MODULE__,
        text: "entlang des Elbufers zu den Landungsbrücken",
        historic: %{
          "7b95a92e2a5d490099cbcb52fa097be1" => ~d[2024-03],
          "60e2159cf1eca918a4e19d9f098f84ef" => ~d[2021-08]
        },
        videos: [
          {"2024-03-16-fr8-gr1uhr/GX016867", "00:13:10.189", :end},
          {"2024-03-16-fr8-gr1uhr/GX026867", :seamless, :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294580/radtour-city-elbufer-wittenbergen/"},
      {"Komoot Routenplaner: entlang des Elbufers",
       "https://www.komoot.com/de-de/tour/227479550"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/9070354"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 8 – Elbuferradweg <.icon>FR8</.icon></h3>
    <span class="updated">Länge rund 16km (davon 1km Schiebestrecke)</span>

    <p>Die Tour beginnt an den <.v bounds="9.96592,53.545013,9.971934,53.54705" lon={9.969011} lat={53.546104} dir="forward" ref="FR8">Landungsbrücken</.v> und führt entlang der Elbe und ihren <.v bounds="9.781972,53.55639,9.804119,53.561605" lon={9.788352} lat={53.560075} dir="forward" ref="FR8">Stränden</.v> bis <.v bounds="9.696244,53.564169,9.738179,53.583198" lon={9.735015} lat={53.5655} dir="forward" ref="FR8">Wedel</.v>. Von dort kann entlang der Deiche weiter elbabwärts gefahren werden.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist zwar nicht beschildert, aber trotzdem sehr leicht zu finden – „immer der Elbe nach“. Selbst wenn man die Abschnitte die etwas weiter vom Ufer verlaufen nicht auf Anhieb findet, wirklich verfahren kann man sich nicht.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Route ist größtenteils asphaltiert oder gepflastert, es gibt aber immer wieder fein geschotterte Abschnitte. Am <.v bounds="9.897939,53.543927,9.914757,53.545029" lon={9.907512} lat={53.54472} dir="forward" ref="FR8">Flaschenhals Övelgönne</.v> muss immer geschoben werden, auf anderen Stücken bei schönem Wetter ebenfalls. Nur am frühen Morgen oder späten Abend ist eine unterbrechungsfreie Fahrt möglich. Zu allen anderen Zeiten: steige ab, bevor es eng wird und sei exzellent zu Anderen!</p>

    <h4>Meinung</h4>
    <p>Wer es gemütlich mag oder neu in Hamburg ist, kann sich die Tour genauer ansehen. Wer vor allem Rad fahren möchte, sollte die Route frühestens ab <.v bounds="9.859689,53.54551,9.870871,53.549437" lon={9.863218} lat={53.547249} dir="forward" ref="FR8">Teufelsbrück</.v> benutzen. Von Altona bietet sich die <.m bounds="9.923566,53.547241,9.936934,53.54851">Holländische Reihe</.m>, <.m bounds="9.87914,53.547219,9.92627,53.550039">Bernadottestraße</.m>, <.m bounds="9.861326,53.546057,9.881644,53.548536">Elbchaussee</.m> als alternative Führung an. Für Rennräder ist die Tour völlig ungeeignet.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
