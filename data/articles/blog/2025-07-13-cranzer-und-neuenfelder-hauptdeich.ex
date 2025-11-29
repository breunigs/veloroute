defmodule Data.Article.Blog.CranzerUndNeuenfelderHauptdeich do
  use Article.Default

  def title(), do: "Cranzer und Neuenfelder Hauptdeich (Elbradweg)"

  def summary(),
    do:
      "Straßenseitiger Geh- und Radweg soll auf 4,0m verbreitert werden. Der wasserseitige Weg bleibt."

  def type(), do: :planned

  def tags(), do: ["e"]

  def links(_assigns) do
    [
      {"Infoseite Deicherhöhung Cranz", "https://hochwasserschutz-cnh.de/"},
      {"öffentliche Auslegung Planfeststellung", ~d[2022-09],
       "https://www.hamburg.de/politik-und-verwaltung/behoerden/bwai/themen/planfeststellungsverfahren/cranzer-neuenfelder-hd-200762"}
    ]
  end

  def map_image do
    {name(),
     [
       {"Hamburg Port Authority AöR",
        "https://www.hamburg-port-authority.de/de/info-port/contact-center"},
       {"WKC Hamburg GmbH", "https://www.wk-consult.com/kontakt"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Vom <.v bounds="9.805543,53.52548,9.813905,53.531605" lon={9.810967} lat={53.528207} dir="forward" ref={FreizeitrouteElbradwegSued}>Airbus-Werk</.v> bis zur <.v bounds="9.785382,53.532437,9.795122,53.538911" lon={9.791439} lat={53.534895} dir="forward" ref={FreizeitrouteElbradwegSued}>Este-Einmündung</.v> ist ein 1,5m breiter Gehweg vorhanden, der mittels „<.ref>Fahrrad frei</.ref>“ auch vom Radverkehr benutzt werden darf. Zusätzlich gibt es noch einen wasserseitigen Geh- und Radweg, der intuitiv kaum zu finden ist.</p>

    <p>Auch nach der <.v bounds="9.776768,53.533241,9.792778,53.540842" lon={9.790188} lat={53.53532} dir="forward" ref={FreizeitrouteElbradwegSued}>Este-Einmündung</.v> stehen zunächst beide Wege zur Wahl. Der straßenseitige Weg endet Höhe <.m bounds="9.772087,53.539707,9.776794,53.542368">Cranzer Elbdeich</.m>. Dort muss man entweder in den <.ref>Mischverkehr</.ref> mit den KFZ wechseln oder über eine Treppe auf dem wasserseitigen Weg weiterradeln.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Um den Deich erhöhen zu können werden auch die Straßen bzw. Wege angepasst.</p>

    <p>Der wasserseitige Weg bleibt in etwa wie heute erhalten. Grob auf Höhe <.m bounds="9.806364,53.528088,9.811849,53.531063">Fleetdamm</.m> ermöglicht ein neuer Deichverteidigungsweg den Wechsel vom straßenseitigen zum wasserseitigen Radweg und umgekehrt.</p>

    <p>Der straßenseitige Geh- und Radweg wird zunächst auf rund 4,0m verbreitert. Im Bereich des <.v bounds="9.805417,53.528804,9.807615,53.530745" lon={9.807071} lat={53.529743} dir="forward" ref={FreizeitrouteElbradwegSued}>Schöpfwerks</.v> und des <.v bounds="9.788432,53.533331,9.793059,53.536433" lon={9.791513} lat={53.534874} dir="forward" ref={FreizeitrouteElbradwegSued}>Sperrwerks</.v> bleiben Engstellen mit rund 3,15m.</p>

    <p>An der Einmündung <.m bounds="9.772087,53.539707,9.776794,53.542368">Cranzer Elbdeich</.m> soll auf den südlichen Geh- und Radweg gewechselt, der mit 3,15m deutlich breiter ausfällt als der nur noch 1,2m breite deichseitige Weg. Über eine Treppe ist auch der wasserseitige Weg erreichbar.</p>

    <h4>Meinung</h4>
    <p>Mit der Deicherhöhung erhält Hamburg erstmals einen sicheren, intuitiv auffbindbaren Elbradweg auf der Südseite. Leider ist nicht bekannt, wann der Umbau starten soll. Bis dahin bleibt es beim unangenehmen und schmalen Weg direkt neben rasenden Autofahrern.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
