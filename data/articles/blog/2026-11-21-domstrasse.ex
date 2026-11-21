defmodule Data.Article.Blog.Domstrasse do
  use Article.Default

  def title(), do: "Domstraße"

  def summary(),
    do:
      "Domstraße erhält 2m bis 2,4m breite Hochbordradwege und wird zur Allee aufgewertet. Willy-Brandt-Straße bleibt schlimm."

  def type(), do: :planned
  def start(), do: ~d[2028]
  def stop(), do: ~d[2028]

  def tracks(), do: Data.Article.Blog.Steinstrasse.tracks()

  def tags(), do: []

  def map_image do
    {name(),
     [
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"},
       {"Ingenieurpartnerschaft Diercks Schröder", "https://www.ids-hh.de/kontakt/"}
     ]}
  end

  def links(_assigns) do
    [
      {"1. Entwurf: Erläuterungen", ~d[2026-11],
       "https://lsbg.hamburg.de/resource/blob/1238252/67d505d9aaaf22de2575780b93c0b40f/domstrasse-abstimmungsunterlage-bericht-data.pdf"},
      {"1. Entwurf: Lageplan", ~d[2026-11],
       "https://lsbg.hamburg.de/resource/blob/1238256/641c0138649a001d561aa74613736978/domstrasse-abstimmungsunterlage-plan-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In der mehrspurigen Domstraße gibt es 2,5m breite Radfahrstreifen oder Busspuren, die für den Radverkehr freigegeben sind.</p>

    <p>Die Kreuzung mit der <.v bounds="9.993565,53.547928,9.996316,53.54899" lon={9.994888} lat={53.548595} dir="forward" ref={Steinstrasse} highlight="Große Reichenstraße">Großen Reichenstraße</.v> hat eine Ampel. Linksabbiegen in die <.v bounds="9.992646,53.546762,9.995624,53.548174" lon={9.993863} lat={53.547573} dir="forward" ref={Steinstrasse}>Willy-Brandt-Straße</.v> ist nur umständlich möglich und nicht korrekt ausgeschildert.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Es werden beidseitig 2,0m bis 2,4m breite <.ref>Hochbordradwege</.ref> angelegt. Diese verlaufen meist neben neuen Baumreihen, die sich fast über die ganze Domstraße erstrecken.</p>

    <p>Die 6,5m breite Fahrbahn bleibt auch für den Radverkehr geöffnet. Im <.v bounds="9.993673,53.548157,9.997943,53.549731" lon={9.99576} lat={53.54903} dir="backward" ref={Steinstrasse}>nördlichen Abschnitt</.v> ist sie hauptsächlich für den Busverkehr gedacht und teils für den privaten KFZ-Verkehr gesperrt.</p>

    <p>An der Großen Reichenstraße entfällt die Ampel. Die Radwege werden hier auf Fahrbahnniveau mittels Rampen abgeleitet.</p>

    <p>Die Querung der Willy-Brandt-Straße wird in beide Richtungen ohne Umwege möglich. Eine zusätzliche KFZ-Spur verbreitert die Querung auf 7 KFZ-Spuren.</p>

    <p>Die Gehwege werden rund 4,0 bis 4,5m breit. Auf der Westseite sind lange, durchgängige Sitzkanten geplant. Die Bushaltestellen befinden sich am <.v highlight="Schmiedestraße" bounds="9.994993,53.54852,9.997101,53.549887" lon={9.99598} lat={53.549154} dir="backward" ref={Steinstrasse}>nördlichen Ende kurz vor bzw. nach der Schmiedestraße</.v>. Am Südende ist eine Haltestelle an der <.v bounds="9.993186,53.547258,9.994666,53.548093" lon={9.99399} lat={53.547666} dir="forward" ref={Steinstrasse}>Zollenbrücke</.v>, die andere auf der <.v bounds="9.990751,53.546404,9.993411,53.547816" lon={9.992033} lat={53.54708} dir="forward" ref={BrMitte01}>Willy-Brandt-Straße Höhe Hausnummer 59</.v>.</p>

    <h4>Meinung</h4>
    <p>Die Domstraße wird zu einer Allee, behält aber den alten Namen.</p>

    <p>Leider unterbricht man die Rad- und Gehwege an der Großen Reichenstraße. Man könnte diese auch erhöht durchbauen und stattdessen die Rampen an der wartepflichtigen Nebenstraße anbringen. Das ist z.B. in der <.v bounds="10.089008,53.514044,10.094007,53.516794" lon={10.091037} lat={53.515326} dir="forward" ref={Radroute2}>Halskestraße</.v> so.</p>

    <p>Die Stadt sollte den Ausbau zur 7-spurigen Willy-Brandt-Straße nochmal überdenken. So wird die Trennung zur HafenCity eher verstärkt und die vom Volk entschiedenen Klimaziele konterkariert.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
