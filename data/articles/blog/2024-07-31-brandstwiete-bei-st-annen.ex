defmodule Data.Article.Blog.BrandstwieteBeiStAnnen do
  use Article.Default

  def title(), do: "Brandstwiete / Bei St. Annen (Radroute 10)"

  def summary(), do: "In Ad-Hoc-Maßnahme soll Radfahrstreifen Richtung HafenCity angelegt werden."

  def type(), do: :planned
  def start(), do: ~d[2025Q3]
  def stop(), do: ~d[2025Q4]

  def tags(), do: ["10"]

  def map_image do
    Data.MapImage.new(__MODULE__, {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}, {
      %{lat: 53.547820666, lon: 9.997521945},
      %{lat: 53.543821561, lon: 9.998633909},
      %{lat: 53.543704823, lon: 9.997449633},
      %{lat: 53.547703927, lon: 9.996337669}
    })
  end

  def links(_assigns) do
    [
      {"fertiger Entwurf: Erläuterungsbericht", ~d[2024-07],
       "https://lsbg.hamburg.de/resource/blob/948888/22cf7ac69c30dee5415c13aa41ee7f7d/brandstwiete-bei-st-annen-ad-hoc-massnahme-radverkehr-abgestimmte-planung-bericht-data.pdf"},
      {"fertiger Entwurf: Karte", ~d[2024-07],
       "https://lsbg.hamburg.de/resource/blob/948892/a3cf4f2f67f17bd7f8320b3d7e6a9fd4/brandstwiete-bei-st-annen-ad-hoc-massnahme-radverkehr-abgestimmte-planung-plan-data.pdf"},
      {"Bürgerbeteiligung Domachse (abgeschlossen)", "2023",
       "https://domachse.beteiligung.hamburg/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Entlang der <.a name="alltagsroute-10">Radroute 10</.a> wird meist zusammen mit den KFZ im <.ref>Mischverkehr</.ref> bei Tempo 50 gefahren. Nur in der <.v bounds="9.995276,53.544341,9.999464,53.548604" lon={9.99728} lat={53.54671} dir="backward" ref="10" highlight="Brandstwiete">Brandstwiete Richtung Rathaus</.v> steht ein 1,5m breiter <.ref>Hochbordradweg</.ref> bereit. Die Trennung zum Gehweg ist kaum sichtbar.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Mit schnell umzusetzenden Maßnahmen soll die Situation für den Radverkehr verbessert werden.</p>

    <p>In <.v bounds="9.996619,53.543578,9.998529,53.547827" lon={9.996798} lat={53.547695} dir="forward" ref="10">Fahrtrichtung HafenCity</.v> soll ein <.ref>Radfahrstreifen</.ref> aufgemalt werden. An Stellen mit Kopfsteinpflaster werden dagegen silberne Markierungsnägel eingebaut, wie sie heute schon vor der <.v bounds="9.980623,53.542172,9.985666,53.545347" lon={9.98349} lat={53.543221} dir="forward" ref="1GR">Niederbaumbrücke</.v> Verwendung finden. An den Bushaltestellen wird der Radfahrstreifen jeweils unterbrochen. Man muss entweder hinter dem Bus warten, oder sich zum Vorbeifahren in den KFZ-Verkehr einordnen.</p>

    <p>In <.v bounds="9.996619,53.543578,9.998529,53.547827" lon={9.998074} lat={53.543818} dir="backward" ref="10">Fahrtrichtung Rathaus</.v> wird nur um die <.v bounds="9.996023,53.544216,9.999316,53.546632" lon={9.997352} lat={53.545065} dir="backward" ref="10">Wandbereiterbrücke</.v> herum ein Radfahrstreifen angelegt. Zusätzlich wird der vorhandene Hochbordradweg in der Brandstwiete auf 2,0m verbreitert und mit weißen Noppenplatten deutlicher von Gehweg und Bushaltestelle abgetrennt.</p>

    <p>Zusätzlich werden die Fahrradfurten an Kreuzungen ohne Kopfsteinpflaster rot eingefärbt und mit Aufstelltaschen zum <.ref>indirekten Linksabbiegen</.ref> versehen. An der Willy-Brandt-Straße wird durch eine Änderung der KFZ-Verkehrsführung eine Unfallstelle entschärft. Es werden weitere Radbügel aufgestellt.</p>

    <h4>Meinung</h4>
    <p>Die Niederlande empfehlen schon lange Dinge mit einfachen Mitteln auszuprobieren und zu verbessern. Paris hat bewiesen, dass das auch anderswo funktioniert. Es ist schön, dass Hamburg ebenfalls diesen Weg geht, wenn auch noch viel zu selten.</p>

    <p>An der Ad-Hoc-Maßnahme ist sonst nichts auszusetzen. Eine echte Modernisierung und besserer Schutz vorm KFZ-Verkehr dürften zusammen mit der Umplanung der gesamten „<.a href="https://domachse.beteiligung.hamburg/">Domachse</.a>“ kommen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
