defmodule Data.Article.Blog.VersuchsradwegHallerstrasse do
  use Article.Default

  def created_at(), do: ~D[2021-05-19]

  def title(), do: "Versuchsradweg Hallerstraße"

  def summary(),
    do: "Pop-Up-Bikelane wird in dauerhafte Radfahrstreifen umgewandelt. Änderungen gibt es kaum."

  def start(), do: ~d[2023-06]
  def stop(), do: ~d[2023-06]

  def type(), do: :finished

  def tags(), do: ["popup"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 1,
        group: "article",
        direction: :forward,
        from: "",
        to: "",
        parent_ref: __MODULE__,
        text: "Hallerstraße Richtung Osten",
        videos: [
          {"2021-06-19-veloroute6/GX011842", "00:00:18.852", "00:00:38.305"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "article",
        direction: :backward,
        from: "Rothenbaumchaussee",
        to: "Grindelberg",
        parent_ref: __MODULE__,
        text: "Hallerstraße Richtung Westen",
        historic: %{
          "936d92c42595877d0925a822fdb40837" => ~d[2021-06],
          "92018d4738876db5208b3c284e89d453" => ~d[2023-11]
        },
        videos: [
          {"2023-11-25-random/GX016709", "00:01:37.745", :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Lageplan und Erläuterung", "März 2023",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1008294"},
      {"Pressemitteilung zur Verstetigung", "Juli 2022",
       "https://www.hamburg.de/bvm/medien/16341028/2022-07-13-bvm-pop-up-bikelane-hallerstrasse/"},
      {"Testauswertung mit Erläuterungsbericht", "Juli 2022",
       "https://www.hamburg.de/contentblob/16328090/6b4b783311ea31cbe58024ac781eded6/data/endabgabe-hallerstrasse.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Sommer 2022</h4>
    <p>Der Versuch war erfolgreich. Der Radfahrstreifen soll im Frühjahr 2023 dauerhaft umgesetzt werden. Außer der Farbe sollen nur Detailänderungen geprüft werden, d.h. der Radweg bleibt vermutlich ohne Trennung vom KFZ-Verkehr.</p>

    <h4>Alter Zustand</h4> <p>In der vierspuren Hallerstraße gibt es keine Radwege. Der Radverkehr muss mit den Autos bei Tempo 50 mitschwimmen.</p>
    <h4>Planung</h4> <p>Es soll ein „Pop-Up-<.ref>Radfahrstreifen</.ref>“ mit mindestens 2,0m Breite eingerichtet werden. An den Kreuzungen sind jeweils Aufstelltaschen für <.ref>indirektes Linksabbiegen</.ref> vorgesehen. An der <.v bounds="9.982145,53.572095,9.985895,53.573649" lon={9.9835139} lat={53.5725139} dir="forward" ref={@ref}>Einmündung der Parkallee</.v> wird Radfahrenden Linksabbiegen nur über die KFZ-Spur angeboten. Die Bushaltestelle an dieser Stelle bleibt unverändert erhalten, sodass der Radfahrstreifen unterbrochen werden muss. Der Radverkehr muss bei haltenden Bussen dann über die KFZ-Spur ausweichen.</p> <p>Ziel des Versuchs ist es Erkenntnisse zu erhalten, die bei einem zukünftigen Umbau hilfreich sind.</p>
    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
