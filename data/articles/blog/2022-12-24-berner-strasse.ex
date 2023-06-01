defmodule Data.Article.Blog.BernerStrasse do
  use Article.Default

  def title(),
    do: "Berner Straße / Fasanenweg / Berner Brücke"

  def summary(),
    do:
      "Bis auf eine Ausnahme durchgängige Radfahrstreifen. 2,0m Breite im nördlichen Teil, 1,85m im südlichen."

  def start(), do: ~d[2023-01-09]
  def stop(), do: ~d[2024-12]

  def type(), do: :construction
  def tags(), do: ["br-wandsbek-w3"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "detour",
        direction: :backward,
        from: "Bargteheider Straße",
        to: "Kriegkamp",
        parent_ref: __MODULE__,
        text: "Umleitung Richtung Norden",
        videos: [
          {"2022-12-24-berner-strasse/GX015032", :start, :end},
          {"2022-12-24-berner-strasse/GX015033", :start, "00:01:11.038"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "detour",
        direction: :forward,
        from: "Kriegkamp",
        to: "Bargteheider Straße",
        parent_ref: __MODULE__,
        text: "Umleitung Richtung Süden",
        videos: [
          {"2022-12-24-berner-strasse/GX015043", :start, "00:00:49.550"},
          {"2022-12-24-berner-strasse/GX015043", "00:01:06.199", :end},
          {"2022-12-24-berner-strasse/GX015044", :start, "00:00:28.356"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Baustelleninfo", "Mai 2023",
       "https://lsbg.hamburg.de/resource/blob/678556/da451f10619d0149e0251897a78fa124/fasanenweg-berner-strasse-anliegerinformation-mai-2023-data.pdf"},
      {"Pressemitteilung zum Baustart", "Januar 2023",
       "https://www.hamburg.de/bvm/medien/16807636/2023-01-02-bvm-grundinstandsetzung-berner-strasse/"},
      {"Erläuterungsbericht und Lagepläne/Karten", "Januar 2023",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1018072"},
      {"Planänderungen", "Juli 2022",
       "https://www.buergerschaft-hh.de/parldok/dokument/80212/sanierung_des_strassenzugs_berner_strasse_fasanenweg_berner_bruecke_von_alter_zollweg_bis_kriegkamp.pdf"},
      {"Erläuterungsbericht",
       "https://lsbg.hamburg.de/resource/blob/634094/8d1ea707073392348346dad78f633afa/berner-strasse-fasanenweg-alter-zollweg-bis-kriegkamp-abgestimmte-planung-bericht-data.pdf"},
      {"Lagepläne",
       "https://lsbg.hamburg.de/resource/blob/634098/c26b9422430444ced684d1de72af5655/berner-strasse-fasanenweg-alter-zollweg-bis-kriegkamp-abgestimmte-planung-plaene-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Im <.v bounds="10.141255,53.620216,10.149968,53.628467" lon={10.142348} lat={53.628048} dir="forward" ref={@ref}>nördlichen Teil</.v> sind schmale, holprige <.ref>Hochbordradwege</.ref> vorhanden. Die spitzen Randsteine an Straßeneinmündungen sind eine Unfallgefahr. Ab dem <.v bounds="10.147667,53.614058,10.15469,53.621595" lon={10.149331} lat={53.620078} dir="forward" ref={@ref}>Bargkoppelweg</.v> muss der Radverkehr im <.ref>Mischverkehr</.ref> auf der Fahrbahn fahren, allerdings fehlt eine Überleitung vom Radweg.</p>

    <h4>Planung</h4>
    <p>Entlang des Straßenzugs in Richtung Süden sind zunächst 2,0m breite <.ref>Radfahrstreifen</.ref> vorgesehen, teilweise mit aufgeklebten Bordsteinen als Abtrennung zur KFZ-Spur. Ab der Einmündung <.v bounds="10.145684,53.617513,10.154186,53.623448"  lon={10.149331} lat={53.620078} dir="forward" ref={@ref}>Bargkoppelweg</.v> werden sie auf 1,6m Mindestbreite reduziert. Um die Einmündung <.v bounds="10.146817,53.616344,10.15532,53.622279" lon={10.149834} lat={53.619234} dir="forward" ref={@ref}>Greifenberger Straße</.v> ist ein 1,4m breiter <.ref>Schutzstreifen</.ref> geplant. Im Anschluss folgt wieder ein Radfahrstreifen mit rund 1,85m Breite.</p>

    <p>An der Kreuzung mit dem <.v bounds="10.138302,53.624498,10.146837,53.63036" lon={10.141882} lat={53.628606} dir="forward" ref={@ref}>Kriegkamp</.v> ist nur <.ref>indirektes Linksabbiegen</.ref> vorgesehen. Im Kriegkamp selbst gibt es Schutzstreifen-Stummel um die Führung zu verdeutlichen.</p>

    <p>Die Mittelinsel am <.v bounds="10.140456,53.623775,10.148991,53.629636" lon={10.143491} lat={53.62739} dir="forward" ref={@ref}>Berner Stieg</.v> wird für den Radverkehr in alle Richtungen durchlässig. Für den Fußverkehr wird eine Ampel gebaut.</p>

    <p>Am <.v bounds="10.141312,53.622929,10.149847,53.62879" lon={10.144684} lat={53.626329} dir="forward" ref={@ref}>Dompfaffenweg</.v> ist <.ref>direktes Linksabbiegen</.ref> vorgesehen; am <.v bounds="10.142194,53.621159,10.150729,53.627021" lon={10.145696} lat={53.624298} dir="forward" ref={@ref}>Schierenberg</.v> geht beides; <.v bounds="10.143802,53.619713,10.152337,53.625575" lon={10.147253} lat={53.622221} dir="forward" ref={@ref}>Im Rühmt</.v> wieder direktes.</p>

    <p>Linksabbiegen in die <.v bounds="10.144749,53.618222,10.153284,53.624083" lon={10.148755} lat={53.620768} dir="forward" ref={@ref}>Polziner Straße</.v> ist nicht möglich; dafür aber in den <.v bounds="10.144749,53.618222,10.153284,53.624083" lon={10.149081} lat={53.620303} dir="forward" ref={@ref}>Bargkoppelweg</.v> mithilfe einer Aufstelltasche neben der Fußampel.</p>

    <p>Am <.v bounds="10.148276,53.613831,10.156811,53.619692" lon={10.152065} lat={53.616128} dir="forward" ref={@ref}>Redderblock</.v> führt der Radfahrstreifen durch die Bushaltestelle. Eine Vorbeifahrt ist nur durch Einordnen auf der KFZ-Spur möglich.</p>

    <p>Alte Radwege werden den Fußwegen zugeschlagen. Stellenweise werden weitere Bäume gepflanzt.</p>

    <h4>Meinung</h4>
    <p>Im Vergleich zu vorher ein Schritt nach vorne. Es ist unverständlich, warum man die Radfahrstreifen an der Greifenberger Straße unterbricht, statt mittels Ampel oder Einbahnstraßenregelung sichere Wege herzustellen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
