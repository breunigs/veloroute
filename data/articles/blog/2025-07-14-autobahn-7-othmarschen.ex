defmodule Data.Article.Blog.Autobahn7Othmarschen do
  use Article.Default

  def title(), do: "A7 Anschlussstelle Othmarschen"

  def summary(),
    do:
      "Beidseitig 2,0m breite Radfahrstreifen. Planung von 2019 enthält noch ungesicherte KFZ-Rechtsabbieger und ungeschützen Radweg mittig zwischen vier KFZ-Spuren."

  def type(), do: :planned
  def tags(), do: ["deckel-altona", "radroute-concept-b"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "x",
        direction: :forward,
        from: "Lessingtunnel",
        to: "Reventlowstraße",
        parent_ref: __MODULE__,
        text: "Behringstraße nach Othmarschen",
        historic: %{
          "3aa4869bcb286a272765a7ef28a114db" => ~d[2025-02]
        },
        videos: [
          {"2025-02-12-west/GX018024", :start, "00:00:20.417"},
          {"2022-05-26-14im-13gg/GX013980", "00:00:02.002", :end},
          {"2022-05-26-14im-13gg/GX013981", :start, :end},
          {"2022-05-26-14im-13gg/GX013982", :start, :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"fertiger Entwurf – Bericht und Karten", ~d[2019-07],
       "https://fragdenstaat.de/anfrage/bab-a-7-umgestaltung-as-hh-othmarschen/#nachricht-1016120"}
    ]
  end

  def map_image do
    {name(),
     [
       {"DEGES", "https://www.deges.de/kontakt/"},
       {"ARGUS Stadt und Verkehr • Partnerschaft mbB", "https://www.argus-hh.de/kontakt-argus/"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Ursprünglich waren auf beiden Seiten <.ref>Hochbordradwege</.ref> vorhanden. Mit dem Beginn der Autobahnverbreiterung vor ein paar Jahren wurde auf der <.v bounds="9.895029,53.556442,9.900472,53.558737" lon={9.898766} lat={53.557521} dir="forward" ref={@ref}>Nordseite</.v> ein gemeinsamer Geh- und Radweg für beide Fahrtrichtungen beschildert. Die genaue Führung ändert sich je nach Baufortschritt.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>In der Planung sind beidseitig 2,0m breite <.ref>Radfahrstreifen</.ref> vorgesehen, die ohne Trennung neben meist sechs KFZ-Fahrspuren verlaufen.</p>

    <p>Die ehemalige Unterführung unter der <.m bounds="9.897045,53.556164,9.89927,53.557379">südöstlichen Ausfahrt</.m> wird künftig ebenerdig geführt und mit einer Ampel versehen. Auch die Unterführung unter der <.m bounds="9.895831,53.556841,9.900086,53.558094">Behringstraße</.m> entfällt.</p>

    <p>Der Anschluss an den Deckel Altona erfolgt über eine Ampel auf der <.m bounds="9.897648,53.556412,9.899835,53.558493">östlichen Seite</.m>. Sie führt über zwei Verkehrsinseln und enthält einen 90°-Knick. Zum Queren muss zweimal gewartet werden.</p>

    <p>In Richtung Othmarschen beginnt ab <.v bounds="9.896856,53.556384,9.901627,53.558301" lon={9.900089} lat={53.557285} dir="forward" ref={@ref}>Baurstraße</.v> bis etwa zu den Rampen ein <.ref>Radfahrstreifen in Mittellage</.ref>. Er verläuft in der Mitte von vier KFZ-Spuren.</p>

    <h4>Meinung</h4>
    <p>Ich hoffe, dass man die Radfahrstreifen mit Trennelementen zu <.ref>Protected-Bike-Lanes</.ref> aufwertet, wo dies leicht möglich ist.</p>

    <p>Der Radfahrstreifen in Mittellage ab  <.v bounds="9.896856,53.556384,9.901627,53.558301" lon={9.900089} lat={53.557285} dir="forward" ref={@ref}>Baurstraße</.v> benötigt aber dringend eine Umplanung. Den Radverkehr mitten durch vier KFZ-Spuren zu schicken ist selbst mit sinnvoller Ampelschaltung fragwürdig. Denn sie schützt nicht vor Rasern, versehentlichem Fahren bei Rot oder wenn KFZ-Stau den Radweg blockiert.</p>

    <p>Ein ähnliches Problem besteht auf der <.m bounds="9.894122,53.556033,9.897271,53.557602">anderen Seite</.m>: der Radfahrstreifen verläuft direkt neben der Autobahnauffahrt. Dort soll ein ungesicherter Rechtsabbieger erhalten bleiben. Weil LKW-Fahrer beim Abbiegen ihre Spiegel nicht prüfen, kommt es deswegen regelmäßig zu Verkehrstoten.</p>

    <p>In der Variantenuntersuchung wurden alle guten Querungsmöglichkeiten über die Behringstraße verworfen. Grund: Autoverkehr wäre nicht mehr „leistungsgerecht abwickelbar“. Übersetzt: im Auto Warten geht nicht, auf dem Rad oder zu Fuß aber schon. Typisch Hamburg.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
