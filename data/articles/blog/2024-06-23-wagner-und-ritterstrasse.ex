defmodule Data.Article.Blog.WagnerUndRitterstrasse do
  use Article.Default

  def start(), do: ~d[2024-09-26]
  def stop(), do: ~d[2024-11-03]
  def construction_site_id_hh(), do: [986_653]

  def title(),
    do: "Wagnerstraße (nördlicher Teil) und Ritterstraße (Radroute 13)"

  def summary(),
    do:
      "Asphalt wird erneuert ohne die Aufteilung der Straße zu ändern. Teilweise werden Schutzstreifen statt Radfahrstreifen neu aufgemalt."

  def type(), do: :construction

  def tags(), do: ["13"]

  def links(_assigns) do
    [
      {"Baustelleninfo", ~d[2024-09],
       "https://lsbg.hamburg.de/resource/blob/961982/611df58907101d84385d1091bc3bf051/ritterstrasse-wagnerstrasse-anliegerinformation-september-2024-data.pdf"},
      {"Ausschreibung Umbau", "Juni 2024",
       "https://web.archive.org/web/20240623081222/https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/api/external/deeplink/subproject/52a39480-2461-436d-a12c-3c44ecca0f66"}
    ]
  end

  def map_image do
    {name(),
     [
       {"LSBG Hamburg – S2", "https://lsbg.hamburg.de/ueber-uns/kontakt"},
       {"SBI beratende Ingenieure für BAU-VERKEHR-VERMESSUNGS GmbH", "https://www.sbi.de/"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Sowohl in der <.v bounds="10.033721,53.569507,10.043022,53.576491" lon={10.037461} lat={53.57369} dir="forward" ref="13" highlight="Wagnerstraße">nördlichen Wagnerstraße</.v> als auch in der <.v bounds="10.044332,53.563454,10.047625,53.567705" lon={10.044904} lat={53.566985} dir="forward" ref="13">Ritterstraße</.v> sind beidseitig schmale <.ref>Radfahrstreifen</.ref> aufgemalt, die ohne Sicherheitsabstand in der <.ref>Dooring-Zone</.ref> verlaufen.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der Asphalt soll erneuert werden. Die Aufteilung der Straße bleibt im Wesentlichen gleich. Lediglich in der <.v bounds="10.033721,53.569507,10.043022,53.576491" lon={10.037461} lat={53.57369} dir="forward" ref="13">Wagnerstraße</.v> soll ein <.ref>Schutzstreifen</.ref> statt einem <.ref>Radfahrstreifen</.ref> aufgemalt werden.</p>

    <h4>Meinung</h4>
    <p>Diese Sanierung- bzw. Erhaltungsmaßnahme ist eine reine Förderung für den Autoverkehr. Lächerlich schmale Radwege ohne Sicherheitsabstände bei Tempo 50 – nein danke. Damit die beiden Abschnitte tatsächlich eine ordentliche Radroute werden können, ist eine vollständige Umplanung wie im <.a name="2023-05-18-wagnerstrasse">Abschnitt dazwischen</.a> notwendig.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
