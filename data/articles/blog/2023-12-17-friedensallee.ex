defmodule Data.Article.Blog.Friedensallee do
  use Article.Default

  def title(), do: "Friedensallee"

  def summary(),
    do: "Hochbordradwege und Gehwege sollen saniert werden. Breite unverändert."

  def start(), do: ~d[2023-11-22]
  def stop(), do: ~d[2024-03-31]
  def construction_site_id_hh(), do: [599_026]

  def type(), do: :construction

  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "friedensallee",
        direction: :forward,
        from: "Barnerstraße",
        to: "Von-Sauer-Straße",
        parent_ref: __MODULE__,
        text: "Friedensallee Richtung Autobahn",
        historic: %{
          "5278e5201c8a37d11cf5feb9f650e088" => ~d[2021-09]
        },
        videos: [
          {"2021-07-15-14uhr-und-13gg/GX012231", "00:00:00.934", :end},
          {"2021-07-15-14uhr-und-13gg/GX012232", :start, "00:00:18.085"},
          {"2021-09-25-velo1-velo14-changed-routing-flottbek/GX012928", "00:00:13.847",
           "00:00:55.589"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "friedensallee",
        direction: :backward,
        from: "Von-Sauer-Straße",
        to: "Barnerstraße",
        parent_ref: __MODULE__,
        text: "Friedensallee Richtung Ottensen",
        historic: %{
          "79c419d561e0c13ab2674dde201eb42d" => ~d[2021-07]
        },
        videos: [
          {"2021-07-10-13uhr-14gg/GX012221", "00:00:06.173", :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Baustellen Info", "Dezember 2023",
       "https://www.hamburg.de/contentblob/17697784/04e0099b5305334e239d5c2c440685fc/data/anwohnerinfo-friedensallee.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die <.ref>Hochbordradwege</.ref> in der Friedensallee im Baugebiet sind häufig schmaler als ein Fahrrad. Sie werden von Baumwurzeln unterbrochen. Sie verlaufen teils in der <.ref>Dooring</.ref> Zone. Die Gehwege neben dem Radweg sind häufig zu schmal, um zu zweit nebeneinander zu gehen. Kurzum: Die Radwege sind unbenutzbar.</p>

    <h4>Vorhaben</h4>
    <p>Die „<.ref>Nebenflächen</.ref>“ sollen neue Oberflächen erhalten.</p>

    <h4>Meinung</h4>
    <p>Ohne Pläne schwer zu beurteilen. In vielen Abschnitten sollte der Hochbordradweg zu Gunsten des Fußwegs entfallen. Die Fahrbahn müsste dann entsprechend für den Radverkehr hergerichtet werden – was aber wohl nicht bei dieser Sanierung passiert.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
