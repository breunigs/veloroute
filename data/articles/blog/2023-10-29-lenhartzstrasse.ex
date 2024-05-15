defmodule Data.Article.Blog.Lenhartzstrasse do
  use Article.Default

  def title(), do: "Lenhartzstraße"

  def summary(),
    do:
      "2,5m breite Radfahrstreifen. Die Kreuzungen am Ende der Lenhartzstraße bleiben unverändert."

  def start(), do: ~d[2024-04-15]
  def stop(), do: ~d[2024-08-19]
  def construction_site_id_hh(), do: [633_180]

  def type(), do: :construction

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
      {"Baustelleninfo", "Mai 2024",
       "https://lsbg.hamburg.de/resource/blob/870276/93cc721c84dd2e23c26da1c8a3152556/lenhartzstrasse-anliegerinformation-mai-2024-data.pdf"},
      # {"Baustelleninfo", "April 2024",
      #  "https://web.archive.org/web/20240410103735if_/https://lsbg.hamburg.de/resource/blob/709148/86901df50a6ccfd506602ee3bade870b/lenhartzstrasse-adhoc-massnahme-radverkehr-april-2024-data.pdf"},
      {"Erläuterungsbericht", "Oktober 2023",
       "https://lsbg.hamburg.de/resource/blob/784244/18d5141d9cf92cce755d2d6f80351856/lenhartzstrasse-abgestimmte-planung-bericht-data.pdf"},
      {"Lageplan", "Oktober  2023",
       "https://lsbg.hamburg.de/resource/blob/784246/e548d9cfe13af6184fe8b46b98989f5d/lenhartzstrasse-abgestimmte-planung-plan-data.pdf"}
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
