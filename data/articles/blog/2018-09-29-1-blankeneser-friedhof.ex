defmodule Data.Article.Blog.BlankeneserFriedhof do
  use Article.Default

  def name(), do: "#{created_at()}-1-blankeneser-friedhof"
  def updated_at(), do: ~D[2026-07-10]

  def title(), do: "Friedhof Blankenese (Radroute 1)"
  def icon(), do: :nocargo

  def summary(),
    do: "Friedhofsdurchfahrt soll getrennter Rad- und Fußweg werden"

  def point_of_interest(), do: %{lon: 9.80137, lat: 53.57296, zoom: 17}

  def start(), do: ~d[2026-09]
  def stop(), do: ~d[2027Q1]

  def type(), do: :planned

  def tags(), do: ["radroute-1", "1", "a15.1"]

  def map_image do
    {name(),
     [
       {"Bezirksamt Altona – Fachamt öffentlicher Raum",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/altona/bezirksamt/dezernat-wirtschaft-bauen-umwelt-50986"}
     ]}
  end

  def links(_assigns) do
    [
      {"Planungsunterlagen", ~d[2026-07],
       "https://fragdenstaat.de/anfrage/radroute-1-a015-1-am-sorgfeld/#nachricht-1133247"},
      {"Präsentation u.a. auch zum Sorgfeld", ~d[2022-03],
       "https://sitzungsdienst-altona.hamburg.de/bi/to020.asp?TOLFDNR=1037758"},
      {"Zeitungsartikel",
       "https://www.abendblatt.de/hamburg/article234200157/stadtplanung-abendblatt-serie-altona-hamburg-stadtentwicklung-bauvorhaben-planung-ottensen.html"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p><.v bounds="9.798126,53.57198,9.80416,53.575655" lon={9.800573} lat={53.573668} dir="backward" ref={Radroute1}>Im Friedhof</.v> teilen sich Rad- und Fuß einen gemeinsamen, rund 3m breiten Weg.</p>

    <p>An der <.v bounds="9.798126,53.57198,9.80416,53.575655" lon={9.801372} lat={53.57296} dir="backward" ref={Radroute1}>Ein-</.v> und <.v bounds="9.798126,53.57198,9.80416,53.575655" lon={9.799609} lat={53.574511} dir="backward" ref={Radroute1}>Ausfahrt</.v> stehen jeweils enge Drängelgitter. Mit Anhänger oder Lastenrad durchzukommen ist schwierig.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der Weg soll auf 2,45m Gehweg und 3,0m Radweg verbreitert werden. An den Verbindungswegen zwischen beiden Friedhofsseiten wird der Weg aufgepflastert.</p>

    <p>An den Zufahrten werden Poller aufgestellt, die Drängelgitter entfallen. Der Anschluss an die weiterführenden <.ref>Fahrbahnen</.ref> erfolgt ebenerdig.</p>

    <h4>Meinung</h4>
    <p>Eine gute Planung, die seit Jahren fertig ist. Wenn sie nur endlich umgesetzt würde…</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
