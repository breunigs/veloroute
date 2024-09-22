defmodule Data.Article.Blog.Steinstrasse do
  use Article.Default

  def title(), do: "Steinstraße"

  def summary(),
    do:
      "Beidseitig 2m breite Hochbordradwege. Straße wird zur Allee mit deutlich schmalerer Fahrbahn. Aufenthaltsqualität nach Umbau ähnlich zur Mönckebergstraße."

  def type(), do: :planned
  def start(), do: ~d[2026Q1]
  def stop(), do: ~d[2027Q1]

  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "x",
        direction: :forward,
        from: "Steintorwall",
        to: "Nikolaibrücke",
        parent_ref: __MODULE__,
        text: "Steinstraße Richtung Rathaus",
        historic: %{
          "2dc4456bddbc1156d01a66c352ca9b51" => ~d[2024-04]
        },
        videos: [
          {"2024-04-06-fr4/GX017069", :start, :end},
          {"2024-04-06-fr4/GX017070", :start, :end},
          {"2024-04-06-fr4/GX017071", :start, :end},
          {"2024-04-06-fr4/GX017072", :start, :end},
          {"2024-04-06-fr4/GX017073", :start, "00:00:06.705"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "x",
        direction: :backward,
        from: "Große Reichenstraße",
        to: "Steintorwall",
        parent_ref: __MODULE__,
        text: "Steinstraße Richtung Hauptbahnhof",
        historic: %{
          "ba209aa9004c948379c68c4359e9e415" => ~d[2024-04]
        },
        videos: [
          {"2022-04-02-velo9/GX013398", "00:00:01.568", "00:00:07.808"},
          {"2024-04-06-fr4/GX017043", "00:00:01.869", :end},
          {"2024-04-06-fr4/GX017044", :start, "00:00:10.408"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Infoseite zum Umbau Kontorhausviertel",
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/mitte/themen/planen-bauen-wohnen/verkehr/neugestaltung-kontorhausviertel-948242"},
      {"fertiger Entwurf – Erläuterungen", ~d[2024-09],
       "https://lsbg.hamburg.de/resource/blob/965880/8e303c3728d0c2ba8b8b33d571e1856a/steinstrasse-abgestimmte-planung-bericht-data.pdf"},
      {"fertiger Entwurf – Karte", ~d[2024-09],
       "https://lsbg.hamburg.de/resource/blob/965882/7d4aa9dc95460f8563d2e018e6cd8068/steinstrasse-abgestimmte-planung-plan-data.pdf"},
      {"1. Entwurf – Erläuterungen", "April 2024",
       "https://lsbg.hamburg.de/resource/blob/900826/732687281e2c951fa184c52798a373ec/steinstrasse-abstimmungsunterlage-bericht-data.pdf"},
      {"1. Entwurf – Karte", "April 2024",
       "https://lsbg.hamburg.de/resource/blob/900848/6a69f3e95247e433c2d30342c70cbe65/steinstrasse-abstimmungsunterlage-plan-data.pdf"},
      {"Bürgerbeteiligung Domachse (abgeschlossen)", "2023",
       "https://domachse.beteiligung.hamburg/"},
      {"Pressemitteilung Umgestaltung Burchhardplatz", "2021",
       "https://web.archive.org/web/20240621091318/https://www.hamburg.de/pressearchiv-fhh/15445552/2021-09-28-bsw-umgestaltung-borchardplatz/"}
    ]
  end

  @attrib {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
  def map_image do
    #   Data.MapImage.new(__MODULE__, @attrib, {
    #     %{lat: 53.550402066, lon: 9.997257860},
    #     %{lat: 53.550316565, lon: 10.005445512},
    #     %{lat: 53.549315626, lon: 10.005408415},
    #     %{lat: 53.549401127, lon: 9.997220763}
    #   })
    Data.MapImage.new(__MODULE__, @attrib, 2, {
      %{lat: 53.550448520, lon: 9.997032567},
      %{lat: 53.550367867, lon: 10.005353293},
      %{lat: 53.549448049, lon: 10.005319435},
      %{lat: 53.549528702, lon: 9.996998710}
    })
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Steinstraße bietet wenig Aufenthaltsqualität und trennt <.m bounds="9.995062,53.549706,10.006546,53.553806">Mönckeberg-</.m> vom <.m bounds="9.995678,53.547211,10.006259,53.550753">Kontorhausviertel</.m>.</p>

    <p>Es sind teils temporäre <.ref>Radfahrstreifen</.ref> eingerichtet, die durch Schwellen vom zahlreichen Busverkehr getrennt werden. Es gibt auch Abschnitte wo sich Bus und Rad die Fahrspur teilen. Die Ampeln sind nicht auf den Radverkehr abgestimmt.</p>

    <p>Vor einigen Jahren war die Steinstraße auch für private KFZ freigegeben. Dies wurde zusammen mit der <.a name="2021-01-16-moenckebergstrasse">Modernisierung der U-Bahn Haltestelle Mönckebergstraße</.a> provisorisch geändert.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Für den Radverkehr sind beidseitig je 2,0m breite <.ref>Hochbordradwege</.ref> geplant. Sie verlaufen jeweils rechts der zahlreichen neuen Bäume, die die Steinstraße zur Allee machen. Wer möchte, kann auch weiterhin auf der <.ref>Fahrbahn</.ref> radeln.</p>

    <p>Die Steinstraße bleibt für den privaten KFZ-Durchgangsverkehr gesperrt. Die <.ref>Fahrbahn</.ref> wird mit 6,5m deutlich schmaler als heute. Zusammen mit Tempo-30 soll das Queren zu Fuß an fast jeder Stelle möglich werden. Die freigewordenen Flächen werden für Bäume, Gehwege und Außengastronomie/Sondernutzung verwendet.</p>

    <p>In direkter Umgebung sind weitere Umbauten geplant, unter anderem die <.v bounds="9.993025,53.545554,9.999412,53.552667" lon={9.996055} lat={53.549949} dir="forward" ref="10" highlight="Bergstraße,Schmiedestraße,Alter Fischmarkt,Brandstwiete,Bei St. Annen,Kornhausbrücke,Osakaallee">Domachse</.v>, der <.m bounds="9.999047,53.548118,10.004069,53.550488" highlight="Burchardplatz,Burchardstraße,Mohlenhofstraße">Burchardplatz mit anliegenden Straßen</.m>, die <.m bounds="10.001163,53.549612,10.00633,53.550942">Bugenhagenstraße</.m> und die <.v bounds="10.003409,53.548706,10.008734,53.551419" lon={10.004787} lat={53.550068} dir="forward" ref={@ref} highlight="Steinstraße,Lange Mühren,Johanniswall,Steintorwall,Altmannbrücke,Klosterwall">Kreuzungen am neu gebauten Johann-Kontor</.v>. Die Planungen dazu sind teils im Anfangsstadium oder warten auf politische Beschlüsse. Die „Anschlüsse“ der Steinstraße passen daher stellenweise nicht, was bis zum fertigen Entwurf korrigiert werden soll.</p>

    <h4>Meinung</h4>
    <p>Die Steinstraße war unangenehm. Daran änderten auch provisorischen Maßnahmen nichts, die mit dem Umbau U-Mönckebergstraße kamen. Mit der Planung wird das deutlich besser – der Aufenthalt wird dann eine ähnliche Qualität haben wie in der Mönckebergstraße.</p>

    <p>Da man dem Radverkehr durchgehend eigene Wege gibt, könnte die Fahrt sogar angenehmer werden als auf der Mönckebergstraße. Damit sich der Radverkehr hierher verlagert, müssten aber auch alle Zufahrten angepasst werden. Das ist vorerst unwahrscheinlich. Dennoch sollte sich die Situation in der Altstadt entspannen, da sich Bus-, Rad- und Fußverkehr besser verteilen können.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
