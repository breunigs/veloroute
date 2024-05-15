defmodule Data.Article.Blog.Vierlandenstrasse do
  use Article.Default

  def title(), do: "Vierlandenstrasse (Bergedorfer Straße bis Sander Damm)"

  def summary(),
    do: "Protected-Bike-Lane geplant, allerdings mit Lücken für Bushalt und Parkplätze."

  def type(), do: :planned
  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "x",
        direction: :forward,
        from: "Bergedorfer Straße",
        to: "Sander Damm",
        parent_ref: __MODULE__,
        text: "Vierlandenstraße nach Süden",
        historic: %{
          "bedd0c93c6c0547314a2ef9e47e35911" => ~d[2024-05]
        },
        end_action: :reverse,
        videos: [
          {"2024-05-14-vr8/GX017551", "00:00:11.612", :end},
          {"2024-05-14-vr8/GX017552", :start, "00:00:01.034"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "x",
        direction: :backward,
        from: "Sander Damm",
        to: "Bergedorfer Straße",
        parent_ref: __MODULE__,
        text: "Vierlandenstraße nach Norden",
        historic: %{
          "02f0e898f3e9494d5b1a6de9c90245d3" => ~d[2024-05]
        },
        videos: [
          {"2024-05-14-vr8/GX017552", "00:00:01.034", :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Erläuterungsbericht", "November 2022",
       "https://lsbg.hamburg.de/resource/blob/784350/e330e5f33d02f024c6f3830eec583351/vierlandenstrasse-bergedorfer-strasse-bis-sander-damm-abgestimmte-planung-bericht-data.pdf"},
      {"Lageplan/Karte", "November 2022",
       "https://lsbg.hamburg.de/resource/blob/784352/d3bc556137842d89b18bbd52a3b9489f/vierlandenstrasse-bergedorfer-strasse-bis-sander-damm-abgestimmte-planung-plan-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Im Abschnitt stehen beidseitig <.ref>Hochbordradwege</.ref> zur Verfügung.</p>

    <h4>Planung</h4>
    <p>Es sollen beidseitig <.ref>Radfahrstreifen</.ref> mit rund 2,0m Breite eingerichtet werden, die stellenweise durch 30cm breite Randsteine vom KFZ-Verkehr abgetrennt sind (<.ref>Protected-Bike-Lane</.ref>). Wegen Bushaltestellen, Einfahrten und Einmündungen sind die Randsteine nicht durchgängig. Busse halten auf dem Radfahrstreifen.</p>

    <p>Zum Linksabbiegen in die <.m bounds="10.208368,53.485606,10.210725,53.48649">Dietrich-Schreyge-Straße</.m> und die <.m bounds="10.209448,53.48514,10.211806,53.486024">Rektor-Ritter-Straße</.m> sind Verkehrsinseln in der Straßenmitte vorgesehen, sodass man in zwei Schritten abbiegen kann. An den anderen Einmündungen werden keine Querungshilfen eingerichtet.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
