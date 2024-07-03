defmodule Data.Article.Blog.Rugenbarg do
  use Article.Default

  def title(), do: "Rugenbarg"
  def updated_at(), do: ~D[2024-04-19]

  def summary(),
    do:
      "Alter Hochbordradweg und Gehweg sollen stellenweise gemeinsamer Geh- und Radweg werden. Teils werden die Wege asphaltiert, teils nur neu gepflastert."

  def type(), do: :planned
  def start(), do: ~d[2024-06-17]
  def stop(), do: ~d[2025-02-02]

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
          "dfeed2a8404a5ff7860e0a09f85602ed" => ~d[2024-04],
          "82d98ceb61a76408c42af36ede61789e" => ~d[2022-05]
        },
        end_action: :reverse,
        videos: [
          {"2024-04-08-fr9/GX017137", :start, :end},
          {"2024-04-08-fr9/GX017138", :start, :end},
          {"2024-04-08-fr9/GX017139", :start, :end},
          {"2024-04-08-fr9/GX017140", :start, "00:00:00.801"},
          {"2024-04-08-fr9/GX017130", "00:00:01.668", :end},
          {"2024-04-08-fr9/GX017131", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "rugenbarg",
        direction: :forward,
        from: "Osdorfer Landstraße",
        to: "Luruper Haupstraße",
        parent_ref: __MODULE__,
        text: "Rugenbarg Richtung Lurup",
        historic: %{
          "30676ba51625b0425e6ff4a97d0bd8ef" => ~d[2024-04]
        },
        end_action: :reverse,
        videos: [
          {"2024-04-08-fr9/GX017132", :start, "00:00:11.378"},
          {"2024-04-08-fr9/GX017134", "00:00:01.768", :end},
          {"2024-04-08-fr9/GX017135", :start, :end},
          {"2024-04-08-fr9/GX017136", :start, :end}
        ]
      }
    ]

  def point_of_interest(), do: %{lon: 9.861213, lat: 53.583693, zoom: 15}

  def links(_assigns) do
    [
      {"Baustelleninfo", ~d[2024-07],
       "https://lsbg.hamburg.de/resource/blob/894318/2de461be657cf38d1497056f9aaa125d/rugenbarg-instandsetzung-juli-2024-data.pdf"},
      # {"Baustelleninfo", "Juni 2024",
      #  "https://lsbg.hamburg.de/resource/blob/894318/e61d43df0f42467c63c3f53ced8a055f/rugenbarg-instandsetzung-juni-2024-data.pdf"},
      {"Ausschreibung Umbau (neu gepflasterete Rad/Gehwege)", "April 2024",
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/api/external/deeplink/subproject/8371e4ff-1dc3-4992-97f8-a28693df5884"},
      {"Ausschreibung Umbau (Fahrbahn + asphaltierte Rad/Gehwege)", "März 2024",
       "https://web.archive.org/web/20240324080847/https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/eva/supplierportal/fhh/subproject/483b9729-4d0c-4e54-8dcc-35811e4810b7/details"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Entlang des Rugenbarg sind meist <.ref>Hochbordradwege</.ref> vorhanden. Teilweise sind nur <.v bounds="9.847928,53.577365,9.854245,53.580686" lon={9.852155} lat={53.579339} dir="backward" ref={@ref}>gemeinsame Geh- und Radwege ausgeschildert</.v>. Häufig sind die Radwege nur rund einen Meter breit. Die Oberfläche wechselt häufig und ist uneben.</p>

    <h4>Planung</h4>
    <p>Alle Rad- und Gehwege werden erneuert. Teils wird neu gepflastert, teils auf ganzer Wegbreite asphaltiert. Zusätzlich wird stellenweise die getrennte Führung aufgehoben und stattdessen ein gemeinsamer Rad- und Gehweg ausgeschildert.</p>

    <h4>Meinung</h4>
    <p>Der Rugenbarg ist eine durch den Autoverkehr laute und unangenehme Straße. Entsprechend wird er gemieden, woran die Planung auch nichts ändert. Nimmt man das erstmal so hin, ist ein geteilter Geh- und Radweg vielleicht kein kompletter Fehlgriff.</p>

    <p>Unklar bleibt, warum Geh- und Radweg nur teilweise zusammengelegt werden. Der Radweg ist auf der gesamten Länge zu schmal, der Fußweg ebenfalls häufig. Auch Asphalt und Pflaster wechseln oft und ohne erkennbaren Grund.</p>

    <p>Im Gesamteindruck entsteht ein Flickwerk – aber immerhin mit vorerst ebener Oberfläche.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
