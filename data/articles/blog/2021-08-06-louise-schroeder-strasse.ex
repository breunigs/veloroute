defmodule Data.Article.Blog.LouiseSchroederStrasse do
  use Article.Default

  def created_at(), do: ~D[2021-08-06]

  def title(), do: "Louise-Schroeder-Straße"

  def summary(), do: "Planung sieht eigenständige Radwege und Erweiterung der Grünanlage vor."

  def start(), do: ~d[2022-06-01]
  def stop(), do: ~d[2024-06-28]
  def construction_site_id_hh(), do: [344_067]

  def type(), do: :finished

  def tags(), do: ["pbl", "hochbordradweg", "radfahrstreifen"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "Louise-Schroeder-Straße",
        direction: :forward,
        from: "Holstenstraße",
        to: "Große Bergstraße",
        parent_ref: __MODULE__,
        text: "Louise-Schroeder-Straße nach Altona",
        historic: %{
          "346b85f94b3d8ba92da7f2347b146fc0" => ~d[2024-07],
          "17eb593f020ef8c3573d4116518dc9cc" => ~d[2021-06]
        },
        videos: [
          {"2024-07-05-indir-links/GX010006", :start, "00:02:02.322"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "Louise-Schroeder-Straße",
        direction: :backward,
        from: "Große Bergstraße",
        to: "Holstenstraße",
        parent_ref: __MODULE__,
        text: "Louise-Schroeder-Straße nach St. Pauli",
        historic: %{
          "af05c9d9962def1253db57ae81f272f3" => ~d[2024-07],
          "ae4740e7032c06828f669fa3ac210af0" => ~d[2021-05]
        },
        videos: [
          {"2024-07-05-indir-links/GX010003", "00:00:46.446", :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Pressemitteilung", "März 2023",
       "https://www.hamburg.de/altona/pressemitteilung/17007528/umbau-louise-schroeder-strasse/"},
      {"Baustellenkoordination", "September 2022",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1013155"},
      {"Erläuterungsbericht und Lageplan",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1012655"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die <.v bounds="9.946956,53.550526,9.95614,53.552056" lon={9.95078} lat={53.550829} dir="forward" ref={@ref}>Louise-Schroeder-Straße</.v> hat beidseitig <.ref>Hochbordradwege</.ref>, die um den <.v bounds="9.945389,53.550448,9.949227,53.552019" lon={9.947638} lat={53.55132} dir="forward" ref={@ref}>kürzlich gebauten Kreisel</.v> am Bruno-Tesch-Platz jedoch in einen <.ref>Radfahrstreifen</.ref> übergehen bzw. als <.ref>Protected-Bike-Lane</.ref> starten. Die Fahrbahn hat meist 6 KFZ-Spuren (3 Fahren, 3 Parken) und zertrennt den Grünzug.</p>
    <p>Von der <.v bounds="9.952558,53.550678,9.958918,53.552125" lon={9.955992} lat={53.551712} dir="forward" ref={@ref}>Simon-von-Utrecht-Straße</.v> kommend kann der Radweg nur schlecht erreicht werden. Wer der Holstenstraße geradeaus Richtung Fischmarkt folgt muss sich durch KFZ-Parkplätze schlängeln. Auf der anschließenden Furt passieren häufig Unfälle.</p>

    <h4>Planung</h4>
    <p>Es ist vorgesehen den Straßenzug völlig neu zu gestalten. Die wesentlichen Punkte sind:</p>
    <ul>
    <li>vom Fuß- und Autoverkehr getrennte, eigenständige Radwege auf beiden Seiten. Sie werden asphaltiert und 3,0m breit.</li>
    <li>die Straße erhält fast durchgehend Grünstreifen mit Bäumen.</li>
    <li>auf der nördlichen Seite gibt es erstmals einen durchgängigen Fußweg ohne Umweg durch den Park.</li>
    <li>die Parkplätze verschwinden aus dem Nord/Süd Grünzug, sodass dieser durchgehender wirkt.</li>
    <li>es wird nur noch einen KFZ-Fahrstreifen geben.</li>
    </ul>
    <p>Alles andere fällt unter Detailarbeit. Man ermöglicht dem Radverkehr an den Nebenstraßen in jede Richtung abzubiegen. Es wird neue Anschließmöglichkeiten geben. Grünflächen sind gegen Falschparker gesichert. Es gibt mehr Querungsmöglichkeiten als vorher. Die Kurvenradien für den Radverkehr sind weit gefasst und erlauben rollendes Abbiegen. In Richtung Kreisel gehen die eigenständigen Radwege in <.ref>Protected-Bike-Lanes</.ref> über.</p>
    <p>Die Umgestaltung des beidseitigen Parks ist bereits berücksichtigt. Dies gilt ebenso für das Nobistor, das zur KFZ-Sackgasse werden soll, für Rad- und Fuß aber weiter erreichbar bleibt.</p>
    <p>Zu KFZ-Parkplätzen sind rund 90cm Sicherheitsabstand vorgesehen, dort wo <.ref>Dooring</.ref> eine Gefahr werden könnte sogar 1,3m.</p>
    <p>Die <.v bounds="9.952558,53.550678,9.958918,53.552125" lon={9.955719} lat={53.5517} dir="forward" ref={@ref}>Kreuzung mit der Holstenstraße</.v> ist nicht teil des Umbaus. Man ersetzt aber die Parkplätze durch eine Grünfläche und verändert die Führung des Radwegs um die Unfälle an dieser Stelle zu reduzieren.</p>

    <h4>Meinung</h4>
    <p>Kritik muss man bei dieser Planung mit der Lupe suchen. Offen bleibt z.B. warum man die KFZ-Spur mit 3,50m breiter als notwendig plant. Üblich sind 3,25m, was mehr Grün und vermutlich auch niedrigere Geschwindigkeiten bedeuten würde. Das erlaubt wiedrum leichteres Queren.</p>

    <p>Da es sich um den ersten Entwurf handelt, muss noch mit Änderungen gerechnet werden. Im Detail ist die Planung auch noch nicht fertig: man möchte z.B. noch mit der Stadtreinigung klären, ob das Regenwasser von den Radwegen versickern kann statt in die Kanalisation geleitet zu werden. Dafür muss im Winter aber auf Streusalz verzichtet werden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
