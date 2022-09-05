defmodule Data.Article.Blog.KreuzungGrandwegGrelckstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-3-kreuzung-grandweg-grelckstrasse"
  def created_at(), do: ~D[2019-06-22]
  def updated_at(), do: ~D[2022-09-05]

  def title(), do: "Kreuzung Grandweg / Grelckstraße (Veloroute 3)"

  def start(), do: ~d[2022-04-25]
  def stop(), do: ~d[2022-12-23]
  def construction_site_id_hh(), do: [36805]

  def type(), do: :construction

  def tags(), do: ["3"]

  def links(_assigns) do
    [
      {"Unterlagen 2. Entwurf",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1007021"}
    ]
  end

  def summary(),
    do:
      "Süden: Radfahrstreifen. Norden: Schutzstreifen. Osten: Protected-Bike-Lane. Westen: Radfahrstreifen."

  def text(assigns) do
    ~H"""
    <h4>Stand November 2021</h4>
    <p>Der zweite Entwurf wurde veröffentlicht. Dank Bemühungen des <.a href="https://radentscheid-hamburg.de/">Radentscheid Hamburgs</.a> ist die neue Planung deutlich radfreundlicher. Der Artikel wurde entsprechend angepasst.</p>

    <h4>Alter Zustand</h4>
    <p>Folgt man der Veloroute, so wird man jeweils vor der Kreuzung auf, schmale und unebene <.ref>Hochbordradwege</.ref> aufgeleitet. Von dort quert man über die Fußfurt. Entlang der Hauptstraße sind die Wege ähnlich.</p>

    <h4>Planung</h4>
    <p>Prinzipiell ist vorgesehen, die Hochbordradwege zu entfernen. Stattdessen soll der Radverkehr auf dem Asphalt fahren, wobei die genaue Umsetzung in den Knotenarmen unterscheidet:</p>

    <ul>
      <li><.m bounds="9.957951,53.598645,9.959097,53.599204" lon="9.958601" lat="53.598715" dir="forward" ref="3">Grandweg</.m>: je 2,0m breite <.ref>Radfahrstreifen</.ref>.</li>
      <li><.m bounds="9.95781,53.599145,9.95919,53.599873" lon="9.958878" lat="53.599246" dir="forward" ref="3">Behrmannplatz</.m>: Beidseitig <.ref>Schutzstreifen</.ref> mit rund 1,65m Breite.</li>
      <li><.m bounds="9.957088,53.598811,9.958146,53.599419">Julius-Vossler-Straße</.m>: Auf der Nordseite wird der Radverkehr durch den Haltebereich des Busses gelenkt. Eine Vorbeifahrt ist aber möglich, ohne sich in den Autoverkehr einordnen zu müssen. Auf der Südseite ist ein 2,0m breiter Radfahrstreifen geplant.</li>
      <li><.m bounds="9.958889,53.598907,9.959885,53.599542">Vogt-Wells-Straße</.m>: 2,25m breite <.ref>Protected Bike Lane</.ref></li>
    </ul>

    <p>Am Behrmannplatz wird auch eine neue StadtRAD Station geplant. Der freie Rechtsabbieger hier entfällt ebenfalls, sodass dort Grünanlagen mit Sitzbänken angelegt werden.</p>

    <p>Für Markttage soll eine Umleitung über <.m bounds="9.953348,53.597249,9.959495,53.598853">Erlenstraße</.m> und <.m bounds="9.951013,53.598543,9.953348,53.601698" lon="9.951843" lat="53.600166" dir="forward" ref="FR10">Oddernskamp</.m> ausgeschildert werden. Diese Abschnitte werden in dieser Maßnahme aber nicht umgebaut.</p>

    <h4>Meinung</h4>
    <p>Leider fehlt der Lageplan, sodass eine Beurteilung schwierig ist. Im 1. Entwurf waren entlang der Veloroute nur Schutzstreifen vorgesehen; in der Hauptstraße <.ref>Radfahrstreifen in Mittellage</.ref>. Im Vergleich dazu erhält der Radverkehr im 2. Entwurf deutlich mehr Platz, auch wenn es nicht überall für abgetrennte Wege reichte. Durch den Entfall des freien Rechtsabbiegers gewinnt die Natur sogar Fläche, was bei Starkregen wichtig für die Versickerung ist.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
