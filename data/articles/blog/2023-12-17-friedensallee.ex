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
        renderer: 5,
        group: "friedensallee",
        direction: :forward,
        from: "Alma-Wartenberg-Platz",
        to: "Von-Sauer-Straße",
        parent_ref: __MODULE__,
        text: "Friedensallee Richtung Autobahn",
        historic: %{
          "3b7833aead638e9137eeed85762aadba" => ~d[2024-06],
          "5278e5201c8a37d11cf5feb9f650e088" => ~d[2021-09]
        },
        videos: [
          {"2024-06-20-14im-13gg/GX017784", "00:00:36.970", :end},
          {"2024-06-20-14im-13gg/GX017785", :start, :end},
          {"2024-06-20-14im-13gg/GX017786", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "friedensallee",
        direction: :backward,
        from: "Von-Sauer-Straße",
        to: "Alma-Wartenberg-Platz",
        parent_ref: __MODULE__,
        text: "Friedensallee Richtung Ottensen",
        historic: %{
          "39cd122cd509258f8c457e21a9df5ee3" => ~d[2024-06],
          "79c419d561e0c13ab2674dde201eb42d" => ~d[2021-07]
        },
        videos: [
          {"2024-06-18-14gg/GX017778", "00:00:06.173", :end},
          {"2024-06-18-14gg/GX017779", :start, :end},
          {"2024-06-18-14gg/GX017780", :start, :end},
          {"2024-06-18-14gg/GX017781", :start, :end},
          {"2024-06-18-14gg/GX017782", :start, "00:00:08.674"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Baustellen Info", "Dezember 2023",
       "https://web.archive.org/web/20231216170757if_/https://www.hamburg.de/contentblob/17697784/04e0099b5305334e239d5c2c440685fc/data/anwohnerinfo-friedensallee.pdf"}
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
