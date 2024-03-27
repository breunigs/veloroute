defmodule Data.Article.Blog.Lenhartzstrasse do
  use Article.Default

  def title(), do: "Lenhartzstraße"

  def summary(),
    do:
      "2,5m breite Radfahrstreifen. Die Kreuzungen am Ende der Lenhartzstraße bleiben unverändert."

  def start(), do: ~d[2024-04-15]
  def stop(), do: ~d[2024-08-19]
  def construction_site_id_hh(), do: [633_180]

  def type(), do: :planned

  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "a",
        direction: :forward,
        from: "Eppendorfer Baum",
        to: "Eppendorfer Marktplatz",
        parent_ref: __MODULE__,
        text: "Lenhartzstraße → Schottmüllerstraße → Eppendorfer Marktplatz",
        videos: [
          {"2023-10-29-lenhart/GX016635", :start, :end},
          {"2023-10-29-lenhart/GX016636", :start, "00:00:23.018"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "a",
        direction: :backward,
        from: "Eppendorfer Marktplatz",
        to: "Eppendorfer Baum",
        parent_ref: __MODULE__,
        text: "Eppendorfer Marktplatz → Schottmüllerstraße → Lenhartzstraße",
        videos: [
          {"2023-10-29-lenhart/GX016638", "00:00:09.007", :end},
          {"2023-10-29-lenhart/GX016639", :start, :end},
          {"2023-10-29-lenhart/GX016640", :start, :end},
          {"2023-10-29-lenhart/GX016641", :start, "00:00:09.341"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Erläuterungsbericht", "Oktober 2023",
       "https://lsbg.hamburg.de/resource/blob/690802/63d51859243af0d35bdd70d7304273de/lenhartzstrasse-abgestimmte-planung-bericht-data.pdf"},
      {"Lageplan", "Oktober  2023",
       "https://lsbg.hamburg.de/resource/blob/690804/5a4c4e69d27c599c0a7b97fea9a7978a/lenhartzstrasse-abgestimmte-planung-plan-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Für den Radverkehr sind rund 1,0m breite <.ref>Hochbordradwege</.ref> vorhanden. Auf der <.ref>Fahrbahn</.ref> fahren ist auch möglich.</p>

    <h4>Planung</h4>
    <p>Außerhalb der Kreuzungen soll je ein Fahrstreifen ausschließlich dem Radverkehr gewidmet werden. Die benutzbare Breite beträgt damit rund 2,50m – der Rest wird für Markierung und Seitenabstände zu parkenden Autos benötigt.</p>

    <p>Die alten Radwege werden zu Fußwegen, Grünflächen oder Fahrradparken. An den Seitenstraßen ist jeweils <.ref>indirektes Linksabbiegen</.ref> vorgesehen.</p>

    <h4>Meinung</h4>
    <p>Es ist eine ad-hoc Maßnahme – der Aufwand soll so gering wie möglich bleiben. Daher fallen die Kreuzungen leider raus, auch wenn diese ebenfalls dringenden Verbesserungsbedarf haben. Immerhin erhält man so zeitnah eine Überholmöglichkeit von langsameren Radlern. Dank breiteren Gehwegen und ordentlichem Fahrradparken mittels Anlehnbügel gewinnt auch der Fußverkehr.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
