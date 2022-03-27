defmodule Data.Article.Blog.VersuchsradwegHallerstrasse do
  use Article.Default

  def created_at(), do: ~D[2021-05-19]

  def title(), do: "Versuchsradweg Hallerstraße"

  def start(), do: ~d[2021-05-26]
  def stop(), do: ~d[2021-06-02]

  def type(), do: :intent

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
        renderer: 1,
        group: "article",
        direction: :backward,
        from: "",
        to: "",
        parent_ref: __MODULE__,
        text: "Hallerstraße Richtung Westen",
        videos: [
          {"2021-06-19-veloroute6/GX011884", "00:00:02.002", :end},
          {"2021-06-19-veloroute6/GX011885", :start, "00:00:13.447"}
        ]
      }
    ]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>In der vierspuren Hallerstraße gibt es keine Radwege. Der Radverkehr muss mit den Autos bei Tempo 50 mitschwimmen.</p>
    <h4>Planung</h4> <p>Es soll ein „Pop-Up-<.ref>Radfahrstreifen</.ref>“ mit mindestens 2,0m Breite eingerichtet werden. An den Kreuzungen sind jeweils Aufstelltaschen für <.ref>indirektes Linksabbiegen</.ref> vorgesehen. An der <.m bounds="9.982145,53.572095,9.985895,53.573649" lon="9.9835139" lat="53.5725139" dir="forward">Einmündung der Parkallee</.m> wird Radfahrenden Linksabbiegen nur über die KFZ-Spur angeboten. Die Bushaltestelle an dieser Stelle bleibt unverändert erhalten, sodass der Radfahrstreifen unterbrochen werden muss. Der Radverkehr muss bei haltenden Bussen dann über die KFZ-Spur ausweichen.</p> <p>Ziel des Versuchs ist es Erkenntnisse zu erhalten, die bei einem zukünftigen Umbau hilfreich sind.</p>
    <h4>Quelle</h4> <ul>
    <li><.a href="https://lsbg.hamburg.de/contentblob/15068826/1788039429d56062d616de171dc47922/data/hallerstrasse-temporaerer-radfahrstreifen.pdf">Infoschreiben des LSBG</.a></li>
    <li><.a href="https://lsbg.hamburg.de/contentblob/15068828/81a50c1734756d0860feaf426cd3536e/data/hallerstrasse-pop-up-bikelane-abgestimmte-planung.pdf">Lageplan</.a></li>
    </ul>
    """
  end
end
