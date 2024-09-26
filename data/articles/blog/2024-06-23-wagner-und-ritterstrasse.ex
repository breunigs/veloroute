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

  @attrib [
    {"LSBG Hamburg – S2", "https://lsbg.hamburg.de/ueber-uns/kontakt"},
    {"SBI beratende Ingenieure für BAU-VERKEHR-VERMESSUNGS GmbH", "https://www.sbi.de/"}
  ]
  def map_image do
    [
      Data.MapImage.new(__MODULE__, @attrib, 1, {
        %{lat: 53.565586950, lon: 10.045881616},
        %{lat: 53.563909331, lon: 10.046285119},
        %{lat: 53.563832981, lon: 10.045386679},
        %{lat: 53.565510599, lon: 10.044983176}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 2, {
        %{lat: 53.566958861, lon: 10.045487381},
        %{lat: 53.565280654, lon: 10.045896767},
        %{lat: 53.565208838, lon: 10.045063834},
        %{lat: 53.566887046, lon: 10.044654449}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 3, {
        %{lat: 53.567634822, lon: 10.045133958},
        %{lat: 53.566893030, lon: 10.045371551},
        %{lat: 53.566806065, lon: 10.044601555},
        %{lat: 53.567547857, lon: 10.044363961}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 4, {
        %{lat: 53.572983125, lon: 10.038418052},
        %{lat: 53.570918803, lon: 10.040175768},
        %{lat: 53.570763313, lon: 10.039657832},
        %{lat: 53.572827636, lon: 10.037900116}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 5, {
        %{lat: 53.574170901, lon: 10.037407455},
        %{lat: 53.572273316, lon: 10.039013268},
        %{lat: 53.572119979, lon: 10.038499357},
        %{lat: 53.574017564, lon: 10.036893544}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 6, {
        %{lat: 53.575163541, lon: 10.036057531},
        %{lat: 53.573900683, lon: 10.037680393},
        %{lat: 53.573599930, lon: 10.037016640},
        %{lat: 53.574862788, lon: 10.035393778}
      })
    ]
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
