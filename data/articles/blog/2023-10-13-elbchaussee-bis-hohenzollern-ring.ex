defmodule Data.Article.Blog.ElbchausseeBisHohenzollernRing do
  use Article.Default

  def title(), do: "Elbchaussee (Rathaus Altona bis Hohenzollernring)"

  def summary(),
    do:
      "Meist gepflasterte „Kopenhagener Radwege“ unterschiedlicher Breiten. An Bushaltestellen wird der Radweg unterbrochen."

  def type(), do: :planned

  def tags(), do: []
  def start(), do: ~d[2025Q2]
  def stop(), do: ~d[2025Q2]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "elbchaussee",
        direction: :forward,
        from: "Altona",
        to: "Blankenese",
        parent_ref: __MODULE__,
        text: "Elbchaussee nach Blankenese",
        videos: [
          {"2022-10-02-elbchausse-hafen-whburg/GX014786", "00:00:54.054", "00:01:02.529"},
          {"2023-03-26-bicibus-elbchausee/GX015280", "00:00:19.520", :end},
          {"2023-03-26-bicibus-elbchausee/GX015281", :start, "00:01:01.261"},
          {"2022-10-02-elbchausse-hafen-whburg/GX014786", "00:04:35.442", :end},
          {"2022-10-02-elbchausse-hafen-whburg/GX024786", :seamless, :end},
          {"2022-10-02-elbchausse-hafen-whburg/GX014787", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "elbchaussee",
        direction: :backward,
        from: "Blankenese",
        to: "Altona",
        parent_ref: __MODULE__,
        text: "Elbchaussee nach Altona",
        videos: [
          {"2022-10-02-elbchausse-hafen-whburg/GX014793", "00:00:02.002", :end},
          {"2022-10-02-elbchausse-hafen-whburg/GX014794", :start, "00:03:09.489"},
          {"2022-10-02-elbchausse-hafen-whburg/GX014795", :start, "00:01:19.646"},
          {"2023-03-26-bicibus-elbchausee/GX015281", "00:01:31.224", :end},
          {"2022-10-02-elbchausse-hafen-whburg/GX014795", "00:03:44.758", "00:04:30.550"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Erläuterungsbericht", "September 2023",
       "https://lsbg.hamburg.de/resource/blob/688802/1a273a14e89ce5bb8859e734054e6abd/elbchaussee-hohenzollernring-bis-betty-levi-passage-abstimmungsunterlage-bericht-data.pdf"},
      {"Karte", "September 2023",
       "https://lsbg.hamburg.de/resource/blob/688804/da207925899c0d88b45586aa5ec5fb7d/elbchaussee-hohenzollernring-bis-betty-levi-passage-abstimmungsunterlage-plan-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es gibt keine Radwege. Es muss auf überbreiten Fahrspuren im <.ref>Mischverkehr</.ref> gefahren werden.</p>

    <h4>Planung</h4>
    <p>Es sollen meist 2,0m breite <.ref>Kopenhagener Radwege</.ref> mit Pflastersteinen gebaut werden.</p>

    <p>An Bushaltestellen wird der Radweg jeweils unterbrochen und mittels kurzer Rampe auf Fahrbahnniveau abgesenkt. Dies ist auch an Ampeln zum Queren der Elbchaussee vorgesehen. An einmündenden Nebenstraßen ist der Radweg dagegen durchgängig.</p>

    <p>Wo KFZ-Parkplätze rechts des Radwegs sind wird nur ein <.ref>Radfahrstreifen</.ref> aufgemalt.</p>

    <p>In den <.v bounds="9.91395,53.544147,9.922393,53.549613" lon={9.916718} lat={53.545874} dir="forward" ref={@ref}>Hohenzollernring</.v> darf künftig auch <.ref name="abbiegen">indirekt links abgebogen</.ref> werden.</p>

    <h4>Meinung</h4>
    <p>Der Radweg ist gut. Unverständlich ist, warum wieder auf minderwertiges Pflaster gesetzt wird, wenn in anderen Abschnitten bereits besser befahrbarer Asphalt verbaut wurde. Die zahlreichen Rampen an denen die Oberfläche wechselt sind dann besonders unkomfortabel.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
