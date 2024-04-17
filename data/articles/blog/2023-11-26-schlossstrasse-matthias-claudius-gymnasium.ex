defmodule Data.Article.Blog.SchlossstrasseMatthiasClaudiusGymnasium do
  use Article.Default

  def title(), do: "Schloßstraße (Höhe Matthias-Claudius-Gymnasium)"

  def summary(),
    do:
      "Breiter Radweg statt Parkplatz nachdem es zu vielen Beinahe-Unfällen durch unachtsames Ausparken kam"

  def start(), do: ~d[2024-07]
  def stop(), do: ~d[2024-08]

  def type(), do: :planned

  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "schlossstrasse",
        direction: :forward,
        from: "Wandsbeker Bahnhofsstraße",
        to: "Wandsbeker Marktstraße",
        parent_ref: __MODULE__,
        text: "Schloßstraße Richtung Innenstadt",
        historic: %{
          "9813a9c7694f90e2845f59ce77accdd5" => ~d[2023-11]
        },
        videos: [
          {"2023-11-25-random/GX016693", "00:00:06.440", :end},
          {"2023-11-25-random/GX016694", "00:00:01.902", :end},
          {"2023-11-25-random/GX016695", :start, "00:00:01.735"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Erläuterung und Entwurf", "November 2023",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1019856"},
      {"Gerichtsurteil zum Parkplatz", "Juli 2023",
       "https://web.archive.org/web/20240315013959if_/https://justiz.hamburg.de/resource/blob/684078/d5f4bda3fb37c8b1752772f5b41286e8/5-k-4862-19-urteil-vom-11-07-2023-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radweg wird nahe an der Zufahrt von KFZ-Parkplätzen geführt. Da die Autos immer größer wurden, reichte der Platz nicht mehr aus und der Radweg wurde illegal zum Ausparken genutzt. Es kam zu häufigen Beinahe-Unfällen, weil beim Ausparken zusätzlich nicht ordentlich geschaut wurde.</p>

    <h4>Planung</h4>
    <p>Anstelle des KFZ-Parkens (13 Stellplätze) kommt Fahrrad-Parken (86 Stellplätze). Der Radweg erhält von 2,2m Standardbreite bis 4,5m Überbreite, damit genug Platz für die Feuerwehr ist. Der Gehweg wird mit 3,6m bis 2,2m ebenfalls breiter.</p>

    <h4>Meinung</h4>
    <p>Die kleinräumige Planung ist ein Vorgriff auf die Umgestaltung der Schloßstraße. Das man mit dem Fahrrad sicher zur Schule kommt sollte selbstverständlich sein. Es ist daher gut, dass Sofortmaßnahmen ergriffen wurden und zeitnah ein Teilumbau die Situation verdeutlicht und verbessert.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
