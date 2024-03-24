defmodule Data.Article.Blog.Rugenbarg do
  use Article.Default

  def title(), do: "Rugenbarg"

  def summary(),
    do:
      "Alter Hochbordradweg und Gehweg sollen stellenweise asphaltiert und gemeinsamer Geh- und Radweg werden"

  def type(), do: :planned
  def start(), do: ~d[2024-06-17]
  def stop(), do: ~d[2024-10-13]

  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "rugenbarg",
        direction: :backward,
        from: "Luruper Haupstraße",
        to: "Osdorfer Landstraße",
        parent_ref: __MODULE__,
        text: "Rugenbarg Richtung Iserbrook",
        historic: %{
          "82d98ceb61a76408c42af36ede61789e" => ~d[2022-05]
        },
        videos: [
          {"2022-05-28-norderstedt/GX014139", :start, :end},
          {"2022-05-28-norderstedt/GX014140", :start, :end},
          {"2022-05-28-norderstedt/GX014141", :start, :end},
          {"2022-05-28-norderstedt/GX014142", :start, "00:00:15.482"}
        ]
      }
    ]

  def point_of_interest(), do: %{lon: 9.861213, lat: 53.583693, zoom: 15}

  def links(_assigns) do
    [
      {"Ausschreibung Umbau", "März 2024",
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/api/external/deeplink/subproject/483b9729-4d0c-4e54-8dcc-35811e4810b7"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Entlang des Rugenbarg sind meist <.ref>Hochbordradwege</.ref> vorhanden. Teilweise sind nur <.v bounds="9.847928,53.577365,9.854245,53.580686" lon={9.852155} lat={53.579339} dir="backward" ref={@ref}>gemeinsame Geh- und Radwege ausgeschildert</.v>. Häufig sind die Radwege nur rund einen Meter breit. Die Oberfläche wechselt häufig und ist uneben.</p>

    <h4>Planung</h4>
    <p>In einigen Abschnitten sollen der vorhandene Hochbordradweg und Gehweg zu einem gemeinsamen Geh- und Radweg ausgeschildert werden. Sie sollen asphaltiert werden.</p>

    <h4>Meinung</h4>
    <p>Der Rugenbarg ist eine durch den Autoverkehr laute und unangenehme Straße. Entsprechend wird er gemieden, woran die Planung auch nichts ändert. Nimmt man das erstmal so hin, ist ein geteilter Geh- und Radweg vielleicht kein kompletter Fehlgriff.</p>

    <p>Unverständlich bleibt, warum man die <.ref>Fahrbahn</.ref> auf gesamter Länge neu macht (<.v bounds="9.848183,53.577482,9.851216,53.579162" lon={9.849608} lat={53.578484} dir="backward" ref={@ref}>Hausnummer 24</.v> bis <.v bounds="9.870546,53.58554,9.873682,53.587273" lon={9.872221} lat={53.586261} dir="backward" ref={@ref}>Hausnummer 259</.v>), beim Radweg aber nur willkürliche Stücke ausbessert. Der Radweg ist auf gesamter Länge schlecht, und die ausgelassenen Abschnitte genauso sanierungsbedürftig.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
