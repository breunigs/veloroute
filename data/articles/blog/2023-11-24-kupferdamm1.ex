defmodule Data.Article.Blog.Kupferdamm1 do
  use Article.Default

  def title(), do: "Kupferdamm (Sonnenweg bis Pulverhofsweg, Bezirksroute W8)"

  def summary(),
    do:
      "Radeln im Mischverkehr bei engerer Fahrbahn; an Kreuzung mit Pulverhofsweg Radfahrstreifen"

  def updated_at(), do: ~D[2024-03-07]

  # def start(), do: ~d[2025Q2]
  # def stop(), do: ~d[2025]

  def type(), do: :planned

  def tags(), do: ["br-wandsbek-w8"]

  def links(_assigns) do
    [
      {"Bauvergabe", ~d[2026-01],
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/eva/supplierportal/fhh/subproject/ba95c6fd-bbbd-45ad-b437-be9a3e1623fd/details"},
      {"Erläuterung und Pläne 2. Entwurf", "März 2024",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1020476"},
      {"Erläuterung und Pläne 1. Entwurf", "November 2023",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1019858"}
    ]
  end

  def map_image do
    {name(),
     [
       {"wfw Nord Consult", "https://www.wfwnc.de/kontakt/kontakt/"},
       {"Bezirksamt Wandsbek, Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/wandsbek/ihr-bezirksamt/aufgaben-und-struktur/dezernat-wirtschaft-bauen-umwelt-75138"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In Richtung Süden gibt es einen heruntergekommenen <.ref>Hochbordradweg</.ref>. In der Gegenrichtung ist nur <.ref>Mischverkehr</.ref> möglich, der Straßenbelag aber genauso schlecht.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Vom <.v bounds="10.119253,53.593942,10.128368,53.599998" lon={10.121517} lat={53.595185} dir="forward" ref={BrWandsbekW8}>Kreisel</.v> bis kurz nach dem <.v bounds="10.119253,53.593942,10.128368,53.599998" lon={10.123885} lat={53.597759} dir="forward" ref={BrWandsbekW8}>Kroneweg</.v> wird mit 6,0m eine eher schmale <.ref>Fahrbahn</.ref> geplant, die man mit dem Rad im <.ref>Mischverkehr</.ref> befährt. Eine leichte S-Kurve soll das Überholen von Fahrrädern unattraktiv machen.</p>

    <p>Von dort bis nach der <.v bounds="10.119253,53.593942,10.128368,53.599998" lon={10.124782} lat={53.598419} dir="forward" ref={BrWandsbekW8} highlight="Pulverhofsweg">Kreuzung mit dem Pulverhofsweg</.v> sind 1,6m breite <.ref>Radfahrstreifen</.ref> vorgesehen.</p>

    <p>Vom Radfahrstreifen aus ist <.ref>indirektes Linksabbiegen</.ref> vorgesehen. Sofern man auf der geteilten Fahrspur bleibt, ist auch <.ref>direktes</.ref> Abbiegen möglich.</p>

    <h4>Meinung</h4>
    <p>Man bekommt ordentliche Oberflächen, neue Anschließbügel und eine eindeutige Führung entlang der Bezirksroute.</p>

    <p>Umwerfend ist die Planung aber nicht, denn dazu müsste sie den privaten KFZ-Verkehr stärker herausnehmen.</p>


    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
