defmodule Data.Article.Blog.Ueberseering do
  use Article.Default

  def created_at(), do: ~D[2022-06-01]

  def title(), do: "Überseering"

  def summary(),
    do:
      "2m breite Radfahrstreifen, teils in Mittellage. Keine Trennung vom KFZ-Verkehr. Umbau nach U5."

  def type(), do: :planned

  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Überseering",
        direction: :forward,
        from: "Westarm",
        to: "Ostarm",
        parent_ref: __MODULE__,
        text: "Überseering im Uhrzeigersinn",
        videos: [
          {"2022-08-06-rsw-bad-bramstedt-rev/GX014414", :start, :end},
          {"2022-08-06-rsw-bad-bramstedt-rev/GX014415", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Überseering",
        direction: :backward,
        from: "Ostarm",
        to: "Westarm",
        parent_ref: __MODULE__,
        text: "Überseering gegen Uhrzeigersinn",
        videos: [
          {"2022-08-06-rsw-bad-bramstedt-rev/GX014417", :start, :end},
          {"2022-08-06-rsw-bad-bramstedt-rev/GX014411", :start, :end},
          {"2022-08-06-rsw-bad-bramstedt-rev/GX014412", :start, "00:00:22.506"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Erläuterungsbericht und Lageplan", "2020, fertiger Entwurf",
       "https://via-bus.hamburg.de/contentblob/16224438/ed5b3bd4c24a46b9bc237b748d716f0a/data/31-m20-ueberseering-von-jahnring-bis-hebebrandstrasse-nachtrag-zur-schlussverschickung.pdf"},
      {"Info U5 Haltestelle City Nord",
       "https://www.schneller-durch-hamburg.de/city-nord-u5-ost#uip-1"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radverkehr wird über unebene und schmale <.ref>Hochbordradwege</.ref> geführt.</p>

    <h4>Planung</h4>
    <p>Künftig wird der Radverkehr im Wesentlichen auf 2,0m breiten <.ref>Radfahrstreifen</.ref> geführt. An Bushaltestellen kann an wartenden Bussen vorbeigefahren werden, ohne auf die KFZ-Spuren ausweichen zu müssen. Jeweils rechts der Radfahrstreifen befinden sich KFZ-Parkplätze, entsprechend ist auch keine Abtrennung zum KFZ-Verkehr vorgesehen.</p>

    <p>An der <.m bounds="10.016434,53.604468,10.019204,53.605989">Einmündung der Sydneystraße</.m> sind <.ref>Radfahrstreifen in Mittellage</.ref> vorgesehen. Wer von Süden nach links in die Sydneystraße abbiegen möchte, kann zwischen <.ref>direktem</.ref> und <.ref>indirektem</.ref> Abbiegen wählen. Für alle anderen Fahrtbeziehungen ist nur <.ref>direktes</.ref> Abbiegen möglich. Das ist auch beim <.m bounds="10.020154,53.606385,10.022924,53.607906">Halifaxweg</.m> so.</p>

    <p>Gebaut werden soll nach Fertigstellung der U5 in diesem Bereich.</p>

    <h4>Meinung</h4>
    <p>Man merkt der Planung ihr Alter an. Mit 2,0m breiten und durchgängigen Radfahrstreifen muss sich die Planung eigentlich nicht verstecken. Allerdings setzt sie an Kreuzungen noch auf die unbeliebten Radfahrstreifen in Mittellage, die seit der Einigung der Stadt mit dem <.a href="https://radentscheid-hamburg.de/">Radentscheid</.a> nicht mehr neu geplant werden. Auch andere Verbesserungen wie eine Trennung vom KFZ-Verkehr wie etwa bei <.ref>geschützten Radfahrstreifen</.ref> fehlt.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
