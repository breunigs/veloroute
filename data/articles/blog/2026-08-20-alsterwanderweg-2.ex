defmodule Data.Article.Blog.Alsterwanderweg2 do
  use Article.Default

  def title(),
    do: "Querung Alster – Alte Landstraße ↔ Friedrich-Kirsten-Straße (Bezirksroute W8)"

  def summary(),
    do:
      "Längere, flachere Rampen statt Schotterweg und Treppen entlang dieser Nord-Süd-Querung über die Alster"

  def type(), do: :planned

  def tags(), do: ["br-wandsbek-w8"]

  def links(_assigns) do
    [
      {"Erster Entwurf, Pläne und Erläuterungen", ~d[2026-08],
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1025826"}
    ]
  end

  def map_image do
    {name(),
     [
       {"Bezirksamt Wandsbek, Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/wandsbek/ihr-bezirksamt/aufgaben-und-struktur/dezernat-wirtschaft-bauen-umwelt-75138"}
     ]}
  end

  def point_of_interest(), do: %{lon: 10.074714, lat: 53.6456697, zoom: 15}

  def text(assigns) do
    ~H"""
    <h4>Aktueller Zustand</h4>
    <p>Auf der <.v bounds="10.074072,53.644909,10.076136,53.646424" lon={10.074973} lat={53.645381} dir="forward" ref={BrWandsbekW8}>Nordseite</.v> ist eine Treppe. Man muss absteigen und schieben.</p>
    <p>Auf der <.v bounds="10.07594,53.642453,10.078527,53.643965" lon={10.076781} lat={53.643541} dir="backward" ref={BrWandsbekW8}>Südseite</.v> ist ein unbefestigter aber noch fahrbarer Waldweg.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Beide Seiten sollen eine längere, flachere Rampe erhalten. Sie wird mit Sinussteinen und Betonpflastersteinen befestigt.</p>

    <h4>Meinung</h4>
    <p>Besser als bisher, die Sinussteine verhindern aber eine angenehme Fahrt. Teilweise sind sie wegen der starken Steigung und Baumerhalt nachvollziehbar.</p>

    <p>Auf der Nordseite führt man „Wirtschaftlichkeit“ gegen eine längergezogene Rampe an. Warum dürfen Rad- und Fuß nichts kosten? Bei Autoprojekten geizt Hamburg ja auch nicht.</p>

    <p>Ebenfalls fehlt eine durchgängige Befestigung, damit die <.a ref={BrWandsbekW8}>Bezirksroute W8</.a> auch bei Regen gut befahrbar bleibt. Naturschutz an der Alster und Radroute beißen sich hier.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
