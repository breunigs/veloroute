defmodule Data.Article.Blog.Mansteinstrasse do
  use Article.Default

  def title(), do: "Mansteinstraße (Verbindung Veloroute 3 und 13)"

  def summary(),
    do:
      "Tempo-30, mehr Abstellmöglichkeiten für Fahrräder und Querungsmöglichkeiten der Straßenseite"

  def type(), do: :finished

  def start(), do: ~d[2025-03-03]
  def stop(), do: ~d[2025-09-30]
  def construction_site_id_hh(), do: [1_302_757]

  def tags(), do: ["3", "13"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "1",
        direction: :forward,
        from: "Eppendorfer Weg",
        to: "Bismarckstraße",
        parent_ref: __MODULE__,
        text: "Mansteinstraße Richtung Innenstadt",
        historic: %{
          "77a5b788a2eec908545928bdb9320a2f" => ~d[2022-04]
        },
        videos: [
          {"2022-04-23-velo3-velo12altona/GX013496", "00:00:01.401", "00:00:13.013"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Pressemitteilung zur Fertigstellung", ~d[2025-08],
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/bezirksamt-eimsbuettel/aktuelles/pressemeldungen/ruhebaenke-unter-dbaeumen-als-highlight-mansteinstrasse-puenktlich-fertig-n--1086900"},
      {"fertiger Entwurf", "April 2024",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1009212"},
      {"Geplanter Bautermine", "November 20223",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/to020.asp?TOLFDNR=1030471"},
      {"2. Entwurf", "September 2023",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1008684"},
      {"Infoseite der Stadt",
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/bezirksamt-eimsbuettel/themen/mobilitaet/mansteinstrasse-799234"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radverkehr wird im <.ref>Mischverkehr</.ref> mit den KFZ bei Tempo 50 geführt. Eng geparkte KFZ verhindern, dass man von der Fahrbahn aus die Häuser erreichen kann.</p>

    <h4>Planung</h4>
    <p>Die Straße wird zur Tempo-30-Zone umgestaltet. Hinzu kommen zwei Mittelinseln als Querungshilfen. Das KFZ-Parken wird aufgeräumt und zwischen den Bäumen werden neu Fahrradbügel aufgestellt. Auch die Bushaltestellen werden modernisiert.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
