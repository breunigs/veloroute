defmodule Data.Article.Blog.Argentinienbruecke do
  use Article.Default

  def title(), do: "Argentinienbrücke (Radroute 11)"

  def updated_at(), do: ~D[2024-08-09]

  def start(), do: ~d[2024-09-02]
  def stop(), do: ~d[2024-09-19]
  def construction_site_id_hh(), do: [877_179]

  def summary(),
    do:
      "In Richtung Wilhelmsburg wird eine Protected-Bike-Lane angelegt, sodass der zweimalige Umweg über die Ampel entfällt."

  def type(), do: :finished

  def tags(), do: ["11"]

  def map_image do
    Data.MapImage.new(
      __MODULE__,
      [
        {"Sweco GmbH", "https://www.sweco-gmbh.de/kontakt/kontakt-verkehr-und-infrastruktur/"},
        {"Hamburg Port Authority AöR",
         "https://www.hamburg-port-authority.de/de/info-port/contact-center"}
      ],
      {
        %{lat: 53.528264747, lon: 9.973417247},
        %{lat: 53.528466845, lon: 9.977698491},
        %{lat: 53.527961601, lon: 9.977766903},
        %{lat: 53.527759504, lon: 9.973485659}
      }
    )
  end

  def links(_assigns) do
    [
      {"1. Entwurf: FragDenStaat.de Anfrage Lagepläne/Erläuterungsbericht", ~d[2024-07],
       "https://fragdenstaat.de/anfrage/lageplan-und-erlaeuterungsbericht-protected-bike-lane-argentinienbruecke/#nachricht-926054"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In <.v bounds="9.97225,53.526858,9.978837,53.529696" lon={9.973877} lat={53.527935} dir="forward" ref="11">Fahrtrichtung Wilhelmsburg</.v> muss die Straßenseite zwei mal gewechselt werden, da es auf der Südseite keinen Radweg gibt. Auch das Radeln auf der <.ref>Fahrbahn</.ref> ist verboten. Die Ampelschaltzeiten sind sehr lang, sodass hoher Zeitverlust auftritt.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die rechte KFZ-Spur wird zu einer rund 2,70m breiten <.ref>Protected-Bike-Lane</.ref> ausgebaut. Der abgetrennte Teil beginnt nach der <.v bounds="9.973744,53.527704,9.975278,53.528389" lon={9.973883} lat={53.527936} dir="forward" ref="11">Bushaltestelle „Argentinienbrücke (Fähre)“</.v> und ist bis zur <.v bounds="9.976596,53.527434,9.977856,53.528461" lon={9.977316} lat={53.528096} dir="forward" ref="11">Klütjenfelder Straße</.v> durchgängig. Die zusätzliche <.m bounds="9.974748,53.527429,9.976478,53.528471" highlight="Ellerholzbrücke">Rampe zur Ellerholzbrücke</.m> entfällt komplett.</p>

    <p>Die <.v bounds="9.972397,53.527587,9.975385,53.528612" lon={9.973594} lat={53.527945} dir="forward" ref="11" highlight="Buchheisterstraße,Reiherdamm,Ellerholzdamm">große Kreuzung vor der Argentinienbrücke</.v> wird nur geringfügig angepasst. Die Führung ist daher Fahrradfurt → gepflasterter Radweg → Wartefläche Bus/Fahrbahn → Protected-Bike-Lane. Wer nicht hinter einem haltenden Bus warten mag, muss sich in den KFZ-Verkehr einordnen.</p>

    <p>An der <.v bounds="9.976596,53.527434,9.977856,53.528461" lon={9.977316} lat={53.528096} dir="forward" ref="11">Klütjenfelder Straße</.v> ist nur Rechtsabbiegen entlang der Veloroute vorgesehen. Die Trennelemente gehen dazu mit um die Kurve und werden mit Leitbaken versehen. In <.v bounds="9.976596,53.527434,9.977856,53.528461" lon={9.977416} lat={53.528029} dir="backward" ref="11">Richtung Innenstadt</.v> verschiebt sich deswegen die Aufstellfläche in Richtung Straßenmitte. Sie erhält ebenfalls Trennelemente und wird größer.</p>

    <h4>Meinung</h4>
    <p>Endlich. Entlang der Veloroute wird die Fahrt viel angenehmer und man spart zwei Ampeln. Da ist auch die Rumpelei über das kurze Stück Hochbordradweg an der <.v bounds="9.972397,53.527587,9.975385,53.528612" lon={9.973594} lat={53.527945} dir="forward" ref="11" highlight="Buchheisterstraße,Reiherdamm,Ellerholzdamm">großen Kreuzung</.v> verziehen.</p>

    <p>Verbesserungen in Fahrtrichtung <.m bounds="9.977114,53.527063,9.983201,53.528749">Veddeler Damm</.m> gibt es keine. Der erste Entwurf beschränkt sich im Wesentlichen darauf, den Wechsel auf die <.ref>Fahrbahn</.ref> zu verhindern. Wie man jedoch fahren <em>soll</em>, muss jeder selbst herausfinden.</p>

    <h4>Links</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
