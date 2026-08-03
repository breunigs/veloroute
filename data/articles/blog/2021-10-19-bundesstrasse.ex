defmodule Data.Article.Blog.Bundesstrasse do
  use Article.Default

  def title(), do: "Bundesstraße (Verbindungsbahn bis Rentzelstraße)"

  def updated_at(), do: ~D[2026-08-03]

  def summary(), do: "Bundesstraße soll zur Fahrradstraße mit KFZ-Einbahnstraße umgebaut werden."

  def type(), do: :planned
  def start(), do: ~d[2027]

  def tags(), do: ["Bezirksroute B", "Eimsbüttel"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "Bundesstraße",
        direction: :forward,
        from: "An der Verbindungsbahn",
        to: "Eimsbütteler Brücke",
        parent_ref: __MODULE__,
        text: "Bundesstraße Richtung Eimsbüttel",
        historic: %{
          "09582019222d914380cd3078bf48bc27" => ~d[2026-02],
          "2ea2188564c085aa74bdf83d40a7da57" => ~d[2022-05]
        },
        videos: [
          {"2026-02-15-eims/GX018767", "00:00:01.101", "00:00:35.041"},
          {"2026-02-15-eims/GX018768", :start, "00:00:37.526"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "Bundesstraße",
        direction: :backward,
        from: "Eimsbütteler Brücke",
        to: "Grindelallee",
        parent_ref: __MODULE__,
        text: "Bundesstraße Richtung Dammtor",
        historic: %{
          "594fc686c6ee9f337226d35eb4a77cce" => ~d[2026-02],
          "add77092e4a4f95b8816f17167574b43" => ~d[2022-05]
        },
        videos: [
          {"2026-02-15-eims/GX018765", "00:02:08.067", "00:02:48.922"},
          {"2026-02-15-eims/GX018766", :start, :end}
        ]
      }
    ]

  def map_image do
    {name(),
     [
       {"melchior + wittpohl", "https://mplusw.de/kontakt-anfrage/"},
       {"Bezirksamt Eimsbüttel – Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/bezirksamt-eimsbuettel/ihr-bezirksamt/fachamt-management-des-oeffentlichen-raumes-58482"}
     ]}
  end

  def links(_assigns) do
    [
      {"Zeitungsartikel zu möglichem Bautermin", ~d[2025-12],
       "https://www.abendblatt.de/hamburg/eimsbuettel/article410655652/eimsbuettel-2026-tanzclub-unter-der-a7-neue-radrouten-diese-projekte-sind-geplant-2.html#:~:text=Baustart%20soll%20im%20Sommer%2FHerbst%202026%20sein%2E"},
      {"Geplanter Bautermine", "November 2023",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/to020.asp?TOLFDNR=1030471"},
      {"Unterlagen des 1. Entwurfs",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1007009"},
      {"Unterlagen des 2. Entwurfs", ~d[2026-07],
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1011898"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Beidseitig gibt es <.ref>Hochbordradwege</.ref> mit 0,8m bis 1,5m Breite. Wer mag, darf auch auf der <.ref>Fahrbahn</.ref> radeln.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die Bundesstraße soll zu einer Fahrradstraße („Anlieger frei“) umgebaut werden. Gleichzeitig wird sie <.v bounds="9.977069,53.564439,9.981689,53.566484" lon={9.979515} lat={53.565638} dir="backward" ref={Bundesstrasse}>ab der Tankstelle</.v> für den KFZ-Verkehr zur Einbahnstraße Richtung Dammtor. <.v bounds="9.980331,53.56376,9.984305,53.565212" lon={9.982919} lat={53.5642} dir="backward" ref={Radroute2}>An der Verbindungsbahn</.v> wird der frei werdende Platz für eine <.ref>Protected-Bike-Lane</.ref> benutzt.</p>

    <p>Die Fahrbahn wird künftig 5,00m breit sein. Am <.v bounds="9.978744,53.563928,9.98174,53.566308" lon={9.980621} lat={53.565247} dir="forward" ref={Bundesstrasse}>Durchschnitt</.v> wird die Fahrbahn auf 4,00m eingeengt. Die alten Hochbordradwege werden den Gehwegen zugeschlagen.</p>

    <h4>Meinung</h4>
    <p>Die KFZ-Einbahnstraße ist eine Verbesserung gegenüber dem ersten Entwurf und dürfte den Schleichverkehr reduzieren. Dank der Trennung zum KFZ-Verkehr an der Verbindungsbahn wird diese Stelle angenehmer zu befahren.</p>

    <p>Anders als im ersten Entwurf behält man die Schrägparkplätze. Man verringert damit die Verkehrssicherheit für den Radverkehr, um den Autofahrern mehr Bequemlichkeit zu ermöglichen. Die Schuld liegt hier in den Vorgaben der Politik. Das Planungsbüro hat noch das Beste herausgeholt, um den Anwohnerwünschen zu entsprechen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>

    """
  end
end
